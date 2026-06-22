-- Streak freeze + Accountability Buddy MVP

-- ---------------------------------------------------------------------------
-- Streak freeze
-- ---------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS public.streak_freeze_uses (
  id           UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id      UUID NOT NULL REFERENCES public.users(id) ON DELETE CASCADE,
  frozen_date  DATE NOT NULL,
  created_at   TIMESTAMPTZ NOT NULL DEFAULT now(),
  UNIQUE (user_id, frozen_date)
);
CREATE INDEX IF NOT EXISTS idx_streak_freeze_user ON public.streak_freeze_uses(user_id);

ALTER TABLE public.streak_freeze_uses ENABLE ROW LEVEL SECURITY;

DROP POLICY IF EXISTS streak_freeze_select_self ON public.streak_freeze_uses;
CREATE POLICY streak_freeze_select_self ON public.streak_freeze_uses
  FOR SELECT USING (user_id = auth.uid());

-- Writes only via RPC.

CREATE OR REPLACE FUNCTION public.use_streak_freeze(p_date DATE)
RETURNS void
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = public
AS $$
DECLARE
  v_uid    UUID := auth.uid();
  v_tz     TEXT;
  v_today  DATE;
  v_month  DATE;
  v_uses   INTEGER;
  v_missed INTEGER;
BEGIN
  IF v_uid IS NULL THEN
    RAISE EXCEPTION 'unauthorized';
  END IF;

  SELECT timezone INTO v_tz FROM public.users WHERE id = v_uid;
  IF v_tz IS NULL THEN
    RAISE EXCEPTION 'user_not_found';
  END IF;

  v_today := (now() AT TIME ZONE v_tz)::date;
  v_month := date_trunc('month', v_today)::date;

  IF p_date >= v_today THEN
    RAISE EXCEPTION 'freeze_future_date';
  END IF;

  SELECT COUNT(*) INTO v_missed
  FROM public.todos
  WHERE user_id = v_uid
    AND original_date = p_date
    AND status = 'missed';

  IF v_missed = 0 THEN
    RAISE EXCEPTION 'no_missed_tasks';
  END IF;

  SELECT COUNT(*) INTO v_uses
  FROM public.streak_freeze_uses
  WHERE user_id = v_uid
    AND date_trunc('month', frozen_date)::date = v_month;

  IF v_uses >= 1 THEN
    RAISE EXCEPTION 'freeze_limit_reached';
  END IF;

  INSERT INTO public.streak_freeze_uses (user_id, frozen_date)
  VALUES (v_uid, p_date)
  ON CONFLICT (user_id, frozen_date) DO NOTHING;
END;
$$;

GRANT EXECUTE ON FUNCTION public.use_streak_freeze(DATE) TO authenticated;

-- ---------------------------------------------------------------------------
-- Buddy tables
-- ---------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS public.buddy_pairs (
  id                      UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_a                  UUID NOT NULL REFERENCES public.users(id) ON DELETE CASCADE,
  user_b                  UUID NOT NULL REFERENCES public.users(id) ON DELETE CASCADE,
  shared_streak           INTEGER NOT NULL DEFAULT 0,
  last_both_perfect_date  DATE,
  created_at              TIMESTAMPTZ NOT NULL DEFAULT now(),
  CHECK (user_a < user_b),
  UNIQUE (user_a, user_b)
);
CREATE INDEX IF NOT EXISTS idx_buddy_pairs_users ON public.buddy_pairs(user_a, user_b);

CREATE TABLE IF NOT EXISTS public.buddy_invites (
  jti          UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  inviter_id   UUID NOT NULL REFERENCES public.users(id) ON DELETE CASCADE,
  consumed_by  UUID REFERENCES public.users(id),
  expires_at   TIMESTAMPTZ NOT NULL,
  created_at   TIMESTAMPTZ NOT NULL DEFAULT now()
);
CREATE INDEX IF NOT EXISTS idx_buddy_invites_inviter ON public.buddy_invites(inviter_id);

CREATE TABLE IF NOT EXISTS public.buddy_nudges (
  id          UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  pair_id     UUID NOT NULL REFERENCES public.buddy_pairs(id) ON DELETE CASCADE,
  from_user   UUID NOT NULL REFERENCES public.users(id) ON DELETE CASCADE,
  created_at  TIMESTAMPTZ NOT NULL DEFAULT now()
);
CREATE INDEX IF NOT EXISTS idx_buddy_nudges_pair ON public.buddy_nudges(pair_id, created_at DESC);

ALTER TABLE public.buddy_pairs ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.buddy_invites ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.buddy_nudges ENABLE ROW LEVEL SECURITY;

DROP POLICY IF EXISTS buddy_pairs_select ON public.buddy_pairs;
CREATE POLICY buddy_pairs_select ON public.buddy_pairs
  FOR SELECT USING (user_a = auth.uid() OR user_b = auth.uid());

DROP POLICY IF EXISTS buddy_invites_select_inviter ON public.buddy_invites;
CREATE POLICY buddy_invites_select_inviter ON public.buddy_invites
  FOR SELECT USING (inviter_id = auth.uid());

DROP POLICY IF EXISTS buddy_nudges_select_pair ON public.buddy_nudges;
CREATE POLICY buddy_nudges_select_pair ON public.buddy_nudges
  FOR SELECT USING (
    pair_id IN (
      SELECT id FROM public.buddy_pairs
      WHERE user_a = auth.uid() OR user_b = auth.uid()
    )
  );

-- Buddy can read partner email (display only).
DROP POLICY IF EXISTS users_select_buddy ON public.users;
CREATE POLICY users_select_buddy ON public.users
  FOR SELECT USING (
    id = auth.uid()
    OR id IN (
      SELECT user_b FROM public.buddy_pairs WHERE user_a = auth.uid()
      UNION
      SELECT user_a FROM public.buddy_pairs WHERE user_b = auth.uid()
    )
  );

-- ---------------------------------------------------------------------------
-- Helpers
-- ---------------------------------------------------------------------------

CREATE OR REPLACE FUNCTION public.user_had_perfect_chain_day(
  p_user_id UUID,
  p_date    DATE
)
RETURNS BOOLEAN
LANGUAGE sql
STABLE
SECURITY DEFINER
SET search_path = public
AS $$
  SELECT CASE
    WHEN NOT EXISTS (
      SELECT 1 FROM public.todos
      WHERE user_id = p_user_id AND original_date = p_date
    ) THEN FALSE
    WHEN EXISTS (
      SELECT 1 FROM public.todos
      WHERE user_id = p_user_id AND original_date = p_date AND status = 'missed'
    ) THEN FALSE
    WHEN EXISTS (
      SELECT 1 FROM public.todos
      WHERE user_id = p_user_id AND original_date = p_date AND status = 'done'
    ) THEN TRUE
    ELSE FALSE
  END;
$$;

CREATE OR REPLACE FUNCTION public.refresh_buddy_streak()
RETURNS void
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = public
AS $$
DECLARE
  v_uid       UUID := auth.uid();
  v_pair      public.buddy_pairs%ROWTYPE;
  v_buddy     UUID;
  v_yesterday DATE;
  v_tz        TEXT;
BEGIN
  IF v_uid IS NULL THEN RETURN; END IF;

  SELECT * INTO v_pair FROM public.buddy_pairs
  WHERE user_a = v_uid OR user_b = v_uid
  LIMIT 1;

  IF NOT FOUND THEN RETURN; END IF;

  v_buddy := CASE WHEN v_pair.user_a = v_uid THEN v_pair.user_b ELSE v_pair.user_a END;

  SELECT timezone INTO v_tz FROM public.users WHERE id = v_uid;
  v_yesterday := ((now() AT TIME ZONE COALESCE(v_tz, 'UTC'))::date - 1);

  IF public.user_had_perfect_chain_day(v_uid, v_yesterday)
     AND public.user_had_perfect_chain_day(v_buddy, v_yesterday) THEN
    IF v_pair.last_both_perfect_date IS NULL OR v_pair.last_both_perfect_date < v_yesterday THEN
      UPDATE public.buddy_pairs
      SET shared_streak = shared_streak + 1,
          last_both_perfect_date = v_yesterday
      WHERE id = v_pair.id;
    END IF;
  END IF;
END;
$$;

GRANT EXECUTE ON FUNCTION public.refresh_buddy_streak() TO authenticated;

CREATE OR REPLACE FUNCTION public.get_buddy_state()
RETURNS JSON
LANGUAGE plpgsql
STABLE
SECURITY DEFINER
SET search_path = public
AS $$
DECLARE
  v_uid       UUID := auth.uid();
  v_pair      public.buddy_pairs%ROWTYPE;
  v_buddy     UUID;
  v_email     TEXT;
  v_yesterday DATE;
  v_tz        TEXT;
  v_self_ok   BOOLEAN;
  v_buddy_ok  BOOLEAN;
  v_buddy_missed_yesterday BOOLEAN;
BEGIN
  IF v_uid IS NULL THEN
    RETURN json_build_object('paired', false);
  END IF;

  SELECT * INTO v_pair FROM public.buddy_pairs
  WHERE user_a = v_uid OR user_b = v_uid
  LIMIT 1;

  IF NOT FOUND THEN
    RETURN json_build_object('paired', false);
  END IF;

  v_buddy := CASE WHEN v_pair.user_a = v_uid THEN v_pair.user_b ELSE v_pair.user_a END;
  SELECT email INTO v_email FROM public.users WHERE id = v_buddy;

  SELECT timezone INTO v_tz FROM public.users WHERE id = v_uid;
  v_yesterday := ((now() AT TIME ZONE COALESCE(v_tz, 'UTC'))::date - 1);

  v_self_ok := public.user_had_perfect_chain_day(v_uid, v_yesterday);
  v_buddy_ok := public.user_had_perfect_chain_day(v_buddy, v_yesterday);

  SELECT EXISTS (
    SELECT 1 FROM public.todos
    WHERE user_id = v_buddy
      AND original_date = v_yesterday
      AND status = 'missed'
  ) INTO v_buddy_missed_yesterday;

  RETURN json_build_object(
    'paired', true,
    'pair_id', v_pair.id,
    'buddy_id', v_buddy,
    'buddy_email', v_email,
    'shared_streak', v_pair.shared_streak,
    'you_perfect_yesterday', v_self_ok,
    'buddy_perfect_yesterday', v_buddy_ok,
    'buddy_missed_yesterday', v_buddy_missed_yesterday
  );
END;
$$;

GRANT EXECUTE ON FUNCTION public.get_buddy_state() TO authenticated;

CREATE OR REPLACE FUNCTION public.create_buddy_invite()
RETURNS UUID
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = public
AS $$
DECLARE
  v_uid UUID := auth.uid();
  v_jti UUID;
BEGIN
  IF v_uid IS NULL THEN RAISE EXCEPTION 'unauthorized'; END IF;

  IF EXISTS (
    SELECT 1 FROM public.buddy_pairs
    WHERE user_a = v_uid OR user_b = v_uid
  ) THEN
    RAISE EXCEPTION 'already_paired';
  END IF;

  v_jti := gen_random_uuid();
  INSERT INTO public.buddy_invites (jti, inviter_id, expires_at)
  VALUES (v_jti, v_uid, now() + INTERVAL '7 days');
  RETURN v_jti;
END;
$$;

GRANT EXECUTE ON FUNCTION public.create_buddy_invite() TO authenticated;

CREATE OR REPLACE FUNCTION public.accept_buddy_invite(p_jti UUID)
RETURNS void
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = public
AS $$
DECLARE
  v_uid      UUID := auth.uid();
  v_invite   public.buddy_invites%ROWTYPE;
  v_a        UUID;
  v_b        UUID;
BEGIN
  IF v_uid IS NULL THEN RAISE EXCEPTION 'unauthorized'; END IF;

  SELECT * INTO v_invite FROM public.buddy_invites WHERE jti = p_jti FOR UPDATE;
  IF NOT FOUND THEN RAISE EXCEPTION 'invite_not_found'; END IF;
  IF v_invite.consumed_by IS NOT NULL THEN RAISE EXCEPTION 'invite_used'; END IF;
  IF v_invite.expires_at < now() THEN RAISE EXCEPTION 'invite_expired'; END IF;
  IF v_invite.inviter_id = v_uid THEN RAISE EXCEPTION 'cannot_pair_self'; END IF;

  IF EXISTS (
    SELECT 1 FROM public.buddy_pairs
    WHERE user_a = v_uid OR user_b = v_uid
       OR user_a = v_invite.inviter_id OR user_b = v_invite.inviter_id
  ) THEN
    RAISE EXCEPTION 'already_paired';
  END IF;

  IF v_invite.inviter_id < v_uid THEN
    v_a := v_invite.inviter_id;
    v_b := v_uid;
  ELSE
    v_a := v_uid;
    v_b := v_invite.inviter_id;
  END IF;

  INSERT INTO public.buddy_pairs (user_a, user_b)
  VALUES (v_a, v_b);

  UPDATE public.buddy_invites
  SET consumed_by = v_uid
  WHERE jti = p_jti;
END;
$$;

GRANT EXECUTE ON FUNCTION public.accept_buddy_invite(UUID) TO authenticated;

CREATE OR REPLACE FUNCTION public.unpair_buddy()
RETURNS void
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = public
AS $$
DECLARE
  v_uid UUID := auth.uid();
BEGIN
  IF v_uid IS NULL THEN RAISE EXCEPTION 'unauthorized'; END IF;
  DELETE FROM public.buddy_pairs
  WHERE user_a = v_uid OR user_b = v_uid;
END;
$$;

GRANT EXECUTE ON FUNCTION public.unpair_buddy() TO authenticated;

CREATE OR REPLACE FUNCTION public.send_buddy_nudge()
RETURNS void
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = public
AS $$
DECLARE
  v_uid   UUID := auth.uid();
  v_pair  public.buddy_pairs%ROWTYPE;
  v_today DATE;
  v_tz    TEXT;
BEGIN
  IF v_uid IS NULL THEN RAISE EXCEPTION 'unauthorized'; END IF;

  SELECT * INTO v_pair FROM public.buddy_pairs
  WHERE user_a = v_uid OR user_b = v_uid
  LIMIT 1;
  IF NOT FOUND THEN RAISE EXCEPTION 'not_paired'; END IF;

  SELECT timezone INTO v_tz FROM public.users WHERE id = v_uid;
  v_today := (now() AT TIME ZONE COALESCE(v_tz, 'UTC'))::date;

  IF EXISTS (
    SELECT 1 FROM public.buddy_nudges
    WHERE pair_id = v_pair.id
      AND from_user = v_uid
      AND (created_at AT TIME ZONE COALESCE(v_tz, 'UTC'))::date = v_today
  ) THEN
    RAISE EXCEPTION 'nudge_limit';
  END IF;

  INSERT INTO public.buddy_nudges (pair_id, from_user)
  VALUES (v_pair.id, v_uid);
END;
$$;

GRANT EXECUTE ON FUNCTION public.send_buddy_nudge() TO authenticated;
