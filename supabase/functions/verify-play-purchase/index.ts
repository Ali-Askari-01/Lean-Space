// Supabase Edge Function: verify Google Play purchase server-side
//
// Deploy: supabase functions deploy verify-play-purchase
// Secrets: SUPABASE_URL, SUPABASE_SERVICE_ROLE_KEY, GOOGLE_SERVICE_ACCOUNT_JSON
// Optional: PLAY_PACKAGE_NAME (default: com.leanspace.leanspace)

import { createClient } from "https://esm.sh/@supabase/supabase-js@2";
import { verifyPlaySubscription } from "../_shared/play_api.ts";

const PACKAGE_NAME =
  Deno.env.get("PLAY_PACKAGE_NAME") ?? "com.leanspace.leanspace";

const ALLOWED_ORIGINS = ["https://leanspace.app"];

function getCorsHeaders(origin: string | null): Record<string, string> {
  const corsOrigin =
    origin && ALLOWED_ORIGINS.includes(origin) ? origin : ALLOWED_ORIGINS[0];
  return {
    "Access-Control-Allow-Origin": corsOrigin,
    "Access-Control-Allow-Headers":
      "authorization, x-client-info, apikey, content-type",
    "Vary": "Origin",
  };
}

Deno.serve(async (req) => {
  const corsHeaders = getCorsHeaders(req.headers.get("Origin"));

  if (req.method === "OPTIONS") {
    return new Response("ok", { headers: corsHeaders });
  }

  try {
    const authHeader = req.headers.get("Authorization");
    if (!authHeader) {
      return new Response(JSON.stringify({ error: "unauthorized" }), {
        status: 401,
        headers: { ...corsHeaders, "Content-Type": "application/json" },
      });
    }

    const supabaseUser = createClient(
      Deno.env.get("SUPABASE_URL")!,
      Deno.env.get("SUPABASE_ANON_KEY") ??
        Deno.env.get("SUPABASE_PUBLISHABLE_KEY")!,
      { global: { headers: { Authorization: authHeader } } },
    );

    const {
      data: { user },
      error: userError,
    } = await supabaseUser.auth.getUser();

    if (userError || !user) {
      return new Response(JSON.stringify({ error: "unauthorized" }), {
        status: 401,
        headers: { ...corsHeaders, "Content-Type": "application/json" },
      });
    }

    const body = await req.json();
    const productId = body?.product_id as string | undefined;
    const purchaseToken = body?.purchase_token as string | undefined;

    if (!productId || !purchaseToken) {
      return new Response(JSON.stringify({ error: "missing_fields" }), {
        status: 400,
        headers: { ...corsHeaders, "Content-Type": "application/json" },
      });
    }

    const validProducts = new Set([
      "leanspace_pro_monthly",
      "leanspace_pro_yearly",
    ]);
    if (!validProducts.has(productId)) {
      return new Response(JSON.stringify({ error: "invalid_product" }), {
        status: 400,
        headers: { ...corsHeaders, "Content-Type": "application/json" },
      });
    }

    const playInfo = await verifyPlaySubscription(PACKAGE_NAME, purchaseToken);
    if (!playInfo || !playInfo.isActive) {
      return new Response(JSON.stringify({ error: "purchase_not_valid" }), {
        status: 402,
        headers: { ...corsHeaders, "Content-Type": "application/json" },
      });
    }

    if (playInfo.productId !== productId) {
      return new Response(JSON.stringify({ error: "product_mismatch" }), {
        status: 400,
        headers: { ...corsHeaders, "Content-Type": "application/json" },
      });
    }

    const supabaseAdmin = createClient(
      Deno.env.get("SUPABASE_URL")!,
      Deno.env.get("SUPABASE_SERVICE_ROLE_KEY")!,
    );

    // Check token hasn't been claimed by another user
    const { data: existingSub } = await supabaseAdmin
      .from("subscriptions")
      .select("user_id")
      .eq("purchase_token", purchaseToken)
      .maybeSingle();

    if (existingSub && existingSub.user_id !== user.id) {
      return new Response(
        JSON.stringify({ error: "token_already_claimed" }),
        {
          status: 409,
          headers: { ...corsHeaders, "Content-Type": "application/json" },
        },
      );
    }

    const { error: rpcError } = await supabaseAdmin.rpc(
      "verify_and_apply_play_purchase",
      {
        p_user_id: user.id,
        p_product_id: productId,
        p_purchase_token: purchaseToken,
        p_period_end: playInfo.expiryTime,
      },
    );

    if (rpcError) {
      console.error("verify_and_apply_play_purchase failed", rpcError);
      return new Response(JSON.stringify({ error: "apply_failed" }), {
        status: 500,
        headers: { ...corsHeaders, "Content-Type": "application/json" },
      });
    }

    return new Response(
      JSON.stringify({
        ok: true,
        tier: "pro",
        pro_until: playInfo.expiryTime,
      }),
      {
        status: 200,
        headers: { ...corsHeaders, "Content-Type": "application/json" },
      },
    );
  } catch (e) {
    console.error("verify-play-purchase error", e);
    return new Response(JSON.stringify({ error: "internal_error" }), {
      status: 500,
      headers: { ...corsHeaders, "Content-Type": "application/json" },
    });
  }
});
