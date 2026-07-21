// Supabase Edge Function: scheduled rollover for active users
//
// Deploy: supabase functions deploy rollover-cron
// Schedule: Run hourly via pg_cron or Supabase dashboard
// Secrets: SUPABASE_URL, SUPABASE_SERVICE_ROLE_KEY

import { createClient } from "https://esm.sh/@supabase/supabase-js@2";

Deno.serve(async (_req) => {
  const supabase = createClient(
    Deno.env.get("SUPABASE_URL")!,
    Deno.env.get("SUPABASE_SERVICE_ROLE_KEY")!,
  );

  // Get users who opened the app in the last 7 days
  const sevenDaysAgo = new Date();
  sevenDaysAgo.setDate(sevenDaysAgo.getDate() - 7);

  const { data: activeUsers, error: queryError } = await supabase
    .from("app_opens")
    .select("user_id")
    .gte("created_at", sevenDaysAgo.toISOString())
    .order("created_at", { ascending: false });

  if (queryError) {
    console.error("Failed to query active users:", queryError);
    return new Response(
      JSON.stringify({ error: "query_failed" }),
      { status: 500, headers: { "Content-Type": "application/json" } },
    );
  }

  // Deduplicate user IDs
  const uniqueUserIds = [
    ...new Set(activeUsers?.map((r) => r.user_id) ?? []),
  ];

  let successCount = 0;
  let failCount = 0;

  // Run rollover for each active user
  for (const userId of uniqueUserIds) {
    try {
      const { error } = await supabase.rpc("perform_rollover_for_user", {
        p_user_id: userId,
      });
      if (error) {
        console.error(`Rollover failed for user ${userId}:`, error);
        failCount++;
      } else {
        successCount++;
      }
    } catch (e) {
      console.error(`Rollover exception for user ${userId}:`, e);
      failCount++;
    }
  }

  // Also clean up old app_opens records (> 90 days)
  const ninetyDaysAgo = new Date();
  ninetyDaysAgo.setDate(ninetyDaysAgo.getDate() - 90);

  const { error: cleanupError } = await supabase
    .from("app_opens")
    .delete()
    .lt("created_at", ninetyDaysAgo.toISOString());

  if (cleanupError) {
    console.error("Cleanup of old app_opens failed:", cleanupError);
  }

  return new Response(
    JSON.stringify({
      ok: true,
      users_processed: uniqueUserIds.length,
      success: successCount,
      failed: failCount,
    }),
    { status: 200, headers: { "Content-Type": "application/json" } },
  );
});
