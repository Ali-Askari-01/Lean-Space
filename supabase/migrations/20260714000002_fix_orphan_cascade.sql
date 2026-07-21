-- Fix missing ON DELETE CASCADE on consumed_invites.consumed_by
ALTER TABLE public.consumed_invites
  DROP CONSTRAINT IF EXISTS consumed_invites_consumed_by_fkey,
  ADD CONSTRAINT consumed_invites_consumed_by_fkey
    FOREIGN KEY (consumed_by) REFERENCES public.users(id) ON DELETE CASCADE;

-- Fix missing ON DELETE CASCADE on buddy_invites.consumed_by
ALTER TABLE public.buddy_invites
  DROP CONSTRAINT IF EXISTS buddy_invites_consumed_by_fkey,
  ADD CONSTRAINT buddy_invites_consumed_by_fkey
    FOREIGN KEY (consumed_by) REFERENCES public.users(id) ON DELETE CASCADE;

-- Disable RLS on consumed_invites (only accessed by service_role)
ALTER TABLE public.consumed_invites DISABLE ROW LEVEL SECURITY;

-- Add missing index on consumed_invites.project_id
CREATE INDEX IF NOT EXISTS idx_consumed_invites_project
  ON public.consumed_invites(project_id);

-- Revoke _generate_referral_code from PUBLIC/anon (internal helper)
REVOKE ALL ON FUNCTION public._generate_referral_code()
  FROM PUBLIC, authenticated, anon;
