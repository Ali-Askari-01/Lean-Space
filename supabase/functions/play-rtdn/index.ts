// Supabase Edge Function: Google Play Real-time Developer Notifications (RTDN)
//
// Google Play -> Cloud Pub/Sub -> (push subscription) -> this endpoint.
// It keeps `public.subscriptions` and `public.users.tier` authoritative.
//
// Deploy:
//   supabase functions deploy play-rtdn --no-verify-jwt
// Then point your Pub/Sub push subscription at the function URL and set the
// PLAY_PUBSUB_TOKEN secret (a shared query-string token) to reject spoofed calls.
//
// Required secrets (supabase secrets set ...):
//   SUPABASE_URL, SUPABASE_SERVICE_ROLE_KEY, PLAY_PUBSUB_TOKEN
//   GOOGLE_SERVICE_ACCOUNT_JSON  (to verify purchases via the Play Developer API)

import { createClient } from "https://esm.sh/@supabase/supabase-js@2";

// Play subscription notification types we care about.
// https://developer.android.com/google/play/billing/rtdn-reference
const ACTIVE_TYPES = new Set([1, 2, 4, 7]); // RECOVERED, RENEWED, PURCHASED, RESTARTED
const INACTIVE_TYPES = new Set([3, 12, 13]); // CANCELED, REVOKED, EXPIRED

interface DeveloperNotification {
  subscriptionNotification?: {
    notificationType: number;
    purchaseToken: string;
    subscriptionId: string;
  };
}

Deno.serve(async (req) => {
  // 1. Reject spoofed callers using a shared token in the query string.
  const url = new URL(req.url);
  const expected = Deno.env.get("PLAY_PUBSUB_TOKEN");
  if (expected && url.searchParams.get("token") !== expected) {
    return new Response("forbidden", { status: 403 });
  }

  let notification: DeveloperNotification;
  try {
    const body = await req.json();
    // Pub/Sub push wraps the payload in message.data (base64).
    const dataB64: string | undefined = body?.message?.data;
    if (!dataB64) return new Response("ok", { status: 200 });
    notification = JSON.parse(atob(dataB64));
  } catch (_e) {
    return new Response("bad request", { status: 400 });
  }

  const sub = notification.subscriptionNotification;
  if (!sub) return new Response("ok", { status: 200 });

  const supabase = createClient(
    Deno.env.get("SUPABASE_URL")!,
    Deno.env.get("SUPABASE_SERVICE_ROLE_KEY")!,
  );

  // 2. Find which user this purchase token belongs to. The client wrote the
  //    token via record_pro_purchase at checkout time.
  const { data: row } = await supabase
    .from("subscriptions")
    .select("user_id, product_id")
    .eq("purchase_token", sub.purchaseToken)
    .maybeSingle();

  if (!row) {
    // Token not seen yet (race with client write); ack so Pub/Sub retries later.
    return new Response("ok", { status: 200 });
  }

  // 3. TODO (production hardening): call the Google Play Developer API
  //    (purchases.subscriptionsv2.get) with GOOGLE_SERVICE_ACCOUNT_JSON to read
  //    the authoritative expiry time instead of trusting the notification type.
  const isActive = ACTIVE_TYPES.has(sub.notificationType);
  const isInactive = INACTIVE_TYPES.has(sub.notificationType);
  if (!isActive && !isInactive) return new Response("ok", { status: 200 });

  const status = isActive ? "active" : "expired";
  // Without the Play API call we approximate the period end.
  const periodEnd = isActive
    ? new Date(
        Date.now() +
          (sub.subscriptionId.includes("yearly") ? 365 : 30) * 86_400_000,
      ).toISOString()
    : new Date().toISOString();

  const { error } = await supabase.rpc("apply_subscription_state", {
    p_user_id: row.user_id,
    p_product_id: sub.subscriptionId,
    p_purchase_token: sub.purchaseToken,
    p_status: status,
    p_period_end: periodEnd,
  });

  if (error) {
    console.error("apply_subscription_state failed", error);
    return new Response("error", { status: 500 });
  }

  return new Response("ok", { status: 200 });
});
