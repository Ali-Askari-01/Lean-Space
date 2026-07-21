-- Fix TOCTOU in accept_buddy_invite: add advisory lock
CREATE OR REPLACE FUNCTION public.accept_buddy_invite(p_token TEXT)
RETURNS JSONB
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = public
AS $$
DECLARE
  v_uid UUID := auth.uid();
  v_invite RECORD;
  v_pair RECORD;
BEGIN
  IF v_uid IS NULL THEN
    RAISE EXCEPTION 'unauthorized';
  END IF;

  -- Advisory lock prevents concurrent pairing for the same user
  PERFORM pg_advisory_xact_lock(hashtext('buddy_pair_' || v_uid::text));

  SELECT * INTO v_invite
  FROM public.buddy_invites
  WHERE token = p_token
    AND consumed_by IS NULL
    AND expires_at > now()
  FOR UPDATE;

  IF v_invite IS NULL THEN
    RAISE EXCEPTION 'invalid_or_expired_invite';
  END IF;

  IF v_invite.inviter_id = v_uid THEN
    RAISE EXCEPTION 'cannot_invite_yourself';
  END IF;

  -- Check inviter is not already paired
  IF EXISTS (
    SELECT 1 FROM public.buddy_pairs
    WHERE user_a = v_invite.inviter_id OR user_b = v_invite.inviter_id
  ) THEN
    RAISE EXCEPTION 'inviter_already_paired';
  END IF;

  -- Check user is not already paired
  IF EXISTS (
    SELECT 1 FROM public.buddy_pairs
    WHERE user_a = v_uid OR user_b = v_uid
  ) THEN
    RAISE EXCEPTION 'already_paired';
  END IF;

  INSERT INTO public.buddy_pairs (user_a, user_b)
  VALUES (v_invite.inviter_id, v_uid)
  ON CONFLICT DO NOTHING;

  UPDATE public.buddy_invites
    SET consumed_by = v_uid
  WHERE id = v_invite.id;

  SELECT * INTO v_pair
  FROM public.buddy_pairs
  WHERE (user_a = v_invite.inviter_id OR user_b = v_invite.inviter_id)
    AND (user_a = v_uid OR user_b = v_uid)
  LIMIT 1;

  RETURN jsonb_build_object('paired', true, 'pair_id', v_pair.id);
END;
$$;

-- Fix TOCTOU in send_buddy_nudge: use advisory lock inside the function
-- (expression-based UNIQUE constraints are not supported on all PG versions)
CREATE OR REPLACE FUNCTION public.send_buddy_nudge(p_pair_id UUID)
RETURNS JSONB
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = public
AS $$
DECLARE
  v_uid UUID := auth.uid();
  v_pair RECORD;
  v_today DATE;
  v_exists BOOLEAN;
BEGIN
  IF v_uid IS NULL THEN
    RAISE EXCEPTION 'unauthorized';
  END IF;

  -- Advisory lock prevents concurrent nudge requests from bypassing daily limit
  PERFORM pg_advisory_xact_lock(hashtext('buddy_nudge_' || v_uid::text));

  SELECT * INTO v_pair
  FROM public.buddy_pairs
  WHERE id = p_pair_id
    AND (user_a = v_uid OR user_b = v_uid);

  IF v_pair IS NULL THEN
    RAISE EXCEPTION 'pair_not_found';
  END IF;

  v_today := (now() AT TIME ZONE 'UTC')::date;

  SELECT EXISTS(
    SELECT 1 FROM public.buddy_nudges
    WHERE pair_id = p_pair_id
      AND from_user = v_uid
      AND (created_at AT TIME ZONE 'UTC')::date = v_today
  ) INTO v_exists;

  IF v_exists THEN
    RAISE EXCEPTION 'already_nudged_today';
  END IF;

  INSERT INTO public.buddy_nudges (pair_id, from_user)
  VALUES (p_pair_id, v_uid);

  RETURN jsonb_build_object('nudged', true);
END;
$$;

-- Fix TOCTOU in use_streak_freeze: add advisory lock
CREATE OR REPLACE FUNCTION public.use_streak_freeze(p_frozen_date DATE)
RETURNS JSONB
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = public
AS $$
DECLARE
  v_uid UUID := auth.uid();
  v_tier TEXT;
  v_limit INTEGER;
  v_uses INTEGER;
  v_month_start DATE;
BEGIN
  IF v_uid IS NULL THEN
    RAISE EXCEPTION 'unauthorized';
  END IF;

  -- Advisory lock prevents concurrent freeze requests from exceeding limit
  PERFORM pg_advisory_xact_lock(hashtext('streak_freeze_' || v_uid::text));

  SELECT tier INTO v_tier FROM public.users WHERE id = v_uid;
  v_limit := CASE WHEN v_tier = 'pro' THEN 2 ELSE 1 END;

  v_month_start := date_trunc('month', CURRENT_DATE)::date;

  SELECT COUNT(*)::INTEGER INTO v_uses
  FROM public.streak_freeze_uses
  WHERE user_id = v_uid
    AND frozen_date >= v_month_start;

  IF v_uses >= v_limit THEN
    RAISE EXCEPTION 'monthly_freeze_limit_reached';
  END IF;

  IF p_frozen_date >= CURRENT_DATE THEN
    RAISE EXCEPTION 'can_only_freeze_past_days';
  END IF;

  INSERT INTO public.streak_freeze_uses (user_id, frozen_date)
  VALUES (v_uid, p_frozen_date)
  ON CONFLICT (user_id, frozen_date) DO NOTHING;

  IF NOT FOUND THEN
    RAISE EXCEPTION 'date_already_frozen';
  END IF;

  RETURN jsonb_build_object('frozen', true, 'remaining', v_limit - v_uses - 1);
END;
$$;
