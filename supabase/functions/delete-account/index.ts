// Supabase Edge Function: delete authenticated user's account and data
//
// Deploy: supabase functions deploy delete-account
// Secrets: SUPABASE_URL, SUPABASE_SERVICE_ROLE_KEY

import { createClient } from "https://esm.sh/@supabase/supabase-js@2";

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

  if (req.method !== "POST") {
    return new Response(JSON.stringify({ error: "method_not_allowed" }), {
      status: 405,
      headers: { ...corsHeaders, "Content-Type": "application/json" },
    });
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

    const supabaseAdmin = createClient(
      Deno.env.get("SUPABASE_URL")!,
      Deno.env.get("SUPABASE_SERVICE_ROLE_KEY")!,
    );

    // Check for projects where user is owner AND has collaborators
    const { data: ownedProjects } = await supabaseAdmin
      .from("projects")
      .select("id, name")
      .eq("owner_id", user.id);

    if (ownedProjects && ownedProjects.length > 0) {
      for (const project of ownedProjects) {
        const { data: members } = await supabaseAdmin
          .from("project_members")
          .select("user_id")
          .eq("project_id", project.id)
          .neq("user_id", user.id);

        if (members && members.length > 0) {
          return new Response(
            JSON.stringify({
              error: "shared_projects_exist",
              projects: ownedProjects.map((p) => p.name),
            }),
            {
              status: 409,
              headers: { ...corsHeaders, "Content-Type": "application/json" },
            },
          );
        }
      }
    }

    // Delete auth user first — if this fails, data is still intact
    const { error: deleteAuthError } = await supabaseAdmin.auth.admin.deleteUser(
      user.id,
    );

    if (deleteAuthError) {
      console.error("delete auth user failed", deleteAuthError);
      return new Response(JSON.stringify({ error: "delete_failed" }), {
        status: 500,
        headers: { ...corsHeaders, "Content-Type": "application/json" },
      });
    }

    // Then delete public profile (cascades to habits, todos, referrals, etc.)
    const { error: deleteProfileError } = await supabaseAdmin
      .from("users")
      .delete()
      .eq("id", user.id);

    if (deleteProfileError) {
      console.error("delete users row failed", deleteProfileError);
      return new Response(JSON.stringify({ error: "delete_failed" }), {
        status: 500,
        headers: { ...corsHeaders, "Content-Type": "application/json" },
      });
    }

    return new Response(JSON.stringify({ ok: true }), {
      status: 200,
      headers: { ...corsHeaders, "Content-Type": "application/json" },
    });
  } catch (e) {
    console.error("delete-account error", e);
    return new Response(JSON.stringify({ error: "internal_error" }), {
      status: 500,
      headers: { ...corsHeaders, "Content-Type": "application/json" },
    });
  }
});
