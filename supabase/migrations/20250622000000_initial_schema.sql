-- LeanSpace initial schema (Phase 1)
-- Run in Supabase SQL Editor if CLI is not linked: Dashboard → SQL → New query

-- ---------------------------------------------------------------------------
-- Tables
-- ---------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS public.users (
  id           UUID PRIMARY KEY REFERENCES auth.users(id) ON DELETE CASCADE,
  email        TEXT NOT NULL UNIQUE,
  tier         TEXT NOT NULL DEFAULT 'free' CHECK (tier IN ('free', 'pro')),
  timezone     TEXT NOT NULL DEFAULT 'UTC',
  pro_since    TIMESTAMPTZ,
  pro_until    TIMESTAMPTZ,
  created_at   TIMESTAMPTZ NOT NULL DEFAULT now()
);
CREATE INDEX IF NOT EXISTS idx_users_tier ON public.users(tier);

CREATE TABLE IF NOT EXISTS public.habits (
  id                    UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id               UUID NOT NULL REFERENCES public.users(id) ON DELETE CASCADE,
  name                  TEXT NOT NULL CHECK (char_length(name) BETWEEN 1 AND 80),
  slot_index            SMALLINT NOT NULL CHECK (slot_index BETWEEN 0 AND 4),
  streak_count          INTEGER NOT NULL DEFAULT 0,
  last_completed_date   DATE,
  created_at            TIMESTAMPTZ NOT NULL DEFAULT now(),
  UNIQUE (user_id, slot_index)
);
CREATE INDEX IF NOT EXISTS idx_habits_user ON public.habits(user_id);

CREATE TABLE IF NOT EXISTS public.todos (
  id                    UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id               UUID NOT NULL REFERENCES public.users(id) ON DELETE CASCADE,
  text                  TEXT NOT NULL CHECK (char_length(text) BETWEEN 1 AND 200),
  status                TEXT NOT NULL DEFAULT 'open'
                          CHECK (status IN ('open', 'done', 'missed')),
  original_date         DATE NOT NULL,
  completed_date        DATE,
  is_carried_forward    BOOLEAN NOT NULL DEFAULT FALSE,
  created_at            TIMESTAMPTZ NOT NULL DEFAULT now()
);
CREATE INDEX IF NOT EXISTS idx_todos_user_date ON public.todos(user_id, original_date DESC);
CREATE INDEX IF NOT EXISTS idx_todos_user_status ON public.todos(user_id, status);

CREATE TABLE IF NOT EXISTS public.projects (
  id                    UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  owner_id              UUID NOT NULL REFERENCES public.users(id) ON DELETE CASCADE,
  name                  TEXT NOT NULL CHECK (char_length(name) BETWEEN 1 AND 60),
  collaborator_cap      SMALLINT NOT NULL CHECK (collaborator_cap BETWEEN 2 AND 8),
  current_invite_jti    UUID,
  created_at            TIMESTAMPTZ NOT NULL DEFAULT now()
);
CREATE INDEX IF NOT EXISTS idx_projects_owner ON public.projects(owner_id);

CREATE TABLE IF NOT EXISTS public.project_members (
  project_id  UUID NOT NULL REFERENCES public.projects(id) ON DELETE CASCADE,
  user_id     UUID NOT NULL REFERENCES public.users(id) ON DELETE CASCADE,
  joined_at   TIMESTAMPTZ NOT NULL DEFAULT now(),
  PRIMARY KEY (project_id, user_id)
);
CREATE INDEX IF NOT EXISTS idx_pm_user ON public.project_members(user_id);

CREATE TABLE IF NOT EXISTS public.daily_logs (
  id              UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  project_id      UUID NOT NULL REFERENCES public.projects(id) ON DELETE CASCADE,
  user_id         UUID NOT NULL REFERENCES public.users(id) ON DELETE CASCADE,
  done_today      TEXT CHECK (char_length(done_today) <= 500),
  blockers        TEXT CHECK (char_length(blockers) <= 500),
  plan_tomorrow   TEXT CHECK (char_length(plan_tomorrow) <= 500),
  log_date        DATE NOT NULL,
  created_at      TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_at      TIMESTAMPTZ NOT NULL DEFAULT now(),
  UNIQUE (project_id, user_id, log_date),
  CHECK (
    coalesce(done_today, '') <> '' OR
    coalesce(blockers, '') <> '' OR
    coalesce(plan_tomorrow, '') <> ''
  )
);
CREATE INDEX IF NOT EXISTS idx_logs_project_date ON public.daily_logs(project_id, log_date DESC);

CREATE TABLE IF NOT EXISTS public.consumed_invites (
  jti          UUID PRIMARY KEY,
  project_id   UUID NOT NULL REFERENCES public.projects(id) ON DELETE CASCADE,
  consumed_by  UUID NOT NULL REFERENCES public.users(id),
  consumed_at  TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE TABLE IF NOT EXISTS public.app_opens (
  id         UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id    UUID NOT NULL REFERENCES public.users(id) ON DELETE CASCADE,
  opened_at  TIMESTAMPTZ NOT NULL DEFAULT now()
);
CREATE INDEX IF NOT EXISTS idx_app_opens_user ON public.app_opens(user_id, opened_at DESC);

-- ---------------------------------------------------------------------------
-- Triggers
-- ---------------------------------------------------------------------------

CREATE OR REPLACE FUNCTION public.handle_new_user()
RETURNS TRIGGER AS $$
BEGIN
  INSERT INTO public.users (id, email, tier, timezone)
  VALUES (NEW.id, NEW.email, 'free', 'UTC')
  ON CONFLICT (id) DO NOTHING;
  RETURN NEW;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER SET search_path = public;

DROP TRIGGER IF EXISTS on_auth_user_created ON auth.users;
CREATE TRIGGER on_auth_user_created
  AFTER INSERT ON auth.users
  FOR EACH ROW EXECUTE FUNCTION public.handle_new_user();

CREATE OR REPLACE FUNCTION public.enforce_daily_task_cap()
RETURNS TRIGGER AS $$
DECLARE
  cnt INTEGER;
BEGIN
  SELECT COUNT(*) INTO cnt
  FROM public.todos
  WHERE user_id = NEW.user_id
    AND original_date = NEW.original_date;
  IF cnt >= 5 THEN
    RAISE EXCEPTION 'daily_task_cap_exceeded';
  END IF;
  RETURN NEW;
END;
$$ LANGUAGE plpgsql SET search_path = public;

DROP TRIGGER IF EXISTS trg_enforce_daily_task_cap ON public.todos;
CREATE TRIGGER trg_enforce_daily_task_cap
  BEFORE INSERT ON public.todos
  FOR EACH ROW EXECUTE FUNCTION public.enforce_daily_task_cap();

-- Rollover for one user (called on app launch until scheduled cron is deployed)
CREATE OR REPLACE FUNCTION public.perform_rollover_for_user(p_user_id UUID)
RETURNS void
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = public
AS $$
DECLARE
  v_tz TEXT;
  v_today DATE;
BEGIN
  IF auth.uid() IS NULL OR p_user_id <> auth.uid() THEN
    RAISE EXCEPTION 'unauthorized';
  END IF;

  SELECT timezone INTO v_tz FROM public.users WHERE id = p_user_id;
  IF v_tz IS NULL THEN
    RETURN;
  END IF;

  v_today := (now() AT TIME ZONE v_tz)::date;

  UPDATE public.todos
  SET status = 'missed'
  WHERE user_id = p_user_id
    AND status = 'open'
    AND original_date < v_today;

  UPDATE public.habits
  SET streak_count = 0
  WHERE user_id = p_user_id
    AND (
      last_completed_date IS NULL
      OR last_completed_date < (v_today - INTERVAL '1 day')::date
    );
END;
$$;

GRANT EXECUTE ON FUNCTION public.perform_rollover_for_user(UUID) TO authenticated;

-- ---------------------------------------------------------------------------
-- RLS (tier-gated policies deferred — no pricing in v1 build pass)
-- ---------------------------------------------------------------------------

ALTER TABLE public.users ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.habits ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.todos ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.projects ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.project_members ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.daily_logs ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.consumed_invites ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.app_opens ENABLE ROW LEVEL SECURITY;

DROP POLICY IF EXISTS users_select_self ON public.users;
CREATE POLICY users_select_self ON public.users
  FOR SELECT USING (id = auth.uid());

DROP POLICY IF EXISTS users_update_self ON public.users;
CREATE POLICY users_update_self ON public.users
  FOR UPDATE
  USING (id = auth.uid())
  WITH CHECK (id = auth.uid());

DROP POLICY IF EXISTS habits_owner_all ON public.habits;
CREATE POLICY habits_owner_all ON public.habits
  FOR ALL
  USING (user_id = auth.uid())
  WITH CHECK (user_id = auth.uid());

DROP POLICY IF EXISTS todos_owner_all ON public.todos;
CREATE POLICY todos_owner_all ON public.todos
  FOR ALL
  USING (user_id = auth.uid())
  WITH CHECK (user_id = auth.uid());

DROP POLICY IF EXISTS projects_member_select ON public.projects;
CREATE POLICY projects_member_select ON public.projects
  FOR SELECT USING (
    id IN (SELECT project_id FROM public.project_members WHERE user_id = auth.uid())
  );

DROP POLICY IF EXISTS projects_owner_create ON public.projects;
CREATE POLICY projects_owner_create ON public.projects
  FOR INSERT WITH CHECK (
    owner_id = auth.uid()
    AND collaborator_cap BETWEEN 2 AND 8
  );

DROP POLICY IF EXISTS projects_owner_update ON public.projects;
CREATE POLICY projects_owner_update ON public.projects
  FOR UPDATE
  USING (owner_id = auth.uid())
  WITH CHECK (owner_id = auth.uid());

DROP POLICY IF EXISTS projects_owner_delete ON public.projects;
CREATE POLICY projects_owner_delete ON public.projects
  FOR DELETE USING (owner_id = auth.uid());

DROP POLICY IF EXISTS pm_member_select ON public.project_members;
CREATE POLICY pm_member_select ON public.project_members
  FOR SELECT USING (
    project_id IN (SELECT project_id FROM public.project_members WHERE user_id = auth.uid())
  );

DROP POLICY IF EXISTS pm_self_or_owner_delete ON public.project_members;
CREATE POLICY pm_self_or_owner_delete ON public.project_members
  FOR DELETE USING (
    user_id = auth.uid()
    OR project_id IN (SELECT id FROM public.projects WHERE owner_id = auth.uid())
  );

-- Owner can add themselves when creating a project (Phase 3)
DROP POLICY IF EXISTS pm_owner_insert_self ON public.project_members;
CREATE POLICY pm_owner_insert_self ON public.project_members
  FOR INSERT WITH CHECK (
    user_id = auth.uid()
    AND project_id IN (SELECT id FROM public.projects WHERE owner_id = auth.uid())
  );

DROP POLICY IF EXISTS logs_member_select ON public.daily_logs;
CREATE POLICY logs_member_select ON public.daily_logs
  FOR SELECT USING (
    project_id IN (SELECT project_id FROM public.project_members WHERE user_id = auth.uid())
  );

DROP POLICY IF EXISTS logs_self_write ON public.daily_logs;
CREATE POLICY logs_self_write ON public.daily_logs
  FOR INSERT WITH CHECK (
    user_id = auth.uid()
    AND project_id IN (SELECT project_id FROM public.project_members WHERE user_id = auth.uid())
  );

DROP POLICY IF EXISTS logs_self_update ON public.daily_logs;
CREATE POLICY logs_self_update ON public.daily_logs
  FOR UPDATE
  USING (user_id = auth.uid())
  WITH CHECK (user_id = auth.uid());

DROP POLICY IF EXISTS logs_self_delete ON public.daily_logs;
CREATE POLICY logs_self_delete ON public.daily_logs
  FOR DELETE USING (user_id = auth.uid());

DROP POLICY IF EXISTS app_opens_self_insert ON public.app_opens;
CREATE POLICY app_opens_self_insert ON public.app_opens
  FOR INSERT WITH CHECK (user_id = auth.uid());

DROP POLICY IF EXISTS app_opens_self_select ON public.app_opens;
CREATE POLICY app_opens_self_select ON public.app_opens
  FOR SELECT USING (user_id = auth.uid());
