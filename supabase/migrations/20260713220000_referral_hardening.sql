-- =============================================================================
-- Referral anti-abuse: referee validation + referrer monthly reward cap
-- =============================================================================

CREATE OR REPLACE FUNCTION public.apply_referral_code(p_code TEXT)
RETURNS JSONB
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = public
AS $$
DECLARE
  v_uid UUID := auth.uid();
  v_code TEXT;
  v_referrer_id UUID;
  v_created_at TIMESTAMPTZ;
  v_completed_todos INTEGER;
BEGIN
  IF v_uid IS NULL THEN
    RAISE EXCEPTION 'unauthorized';
  END IF;

  v_code := upper(trim(p_code));
  IF v_code = '' OR length(v_code) < 4 THEN
    RAISE EXCEPTION 'invalid_referral_code';
  END IF;

  IF EXISTS (SELECT 1 FROM public.referrals WHERE referee_id = v_uid) THEN
    RETURN jsonb_build_object('status', 'already_referred');
  END IF;

  -- Referee must be established: account > 24h OR at least 1 completed todo
  SELECT created_at INTO v_created_at FROM public.users WHERE id = v_uid;
  SELECT COUNT(*)::INTEGER INTO v_completed_todos
  FROM public.todos
  WHERE user_id = v_uid AND status = 'done';

  IF v_created_at IS NULL THEN
    RAISE EXCEPTION 'user_not_found';
  END IF;

  IF v_created_at > now() - INTERVAL '24 hours' AND v_completed_todos < 1 THEN
    RAISE EXCEPTION 'referee_not_eligible';
  END IF;

  SELECT id INTO v_referrer_id
  FROM public.users
  WHERE referral_code = v_code;

  IF v_referrer_id IS NULL THEN
    RAISE EXCEPTION 'referral_code_not_found';
  END IF;

  IF v_referrer_id = v_uid THEN
    RAISE EXCEPTION 'cannot_refer_yourself';
  END IF;

  INSERT INTO public.referrals (referrer_id, referee_id)
  VALUES (v_referrer_id, v_uid);

  PERFORM public._check_and_grant_referral_reward(v_referrer_id);

  RETURN jsonb_build_object('status', 'applied', 'referrer_id', v_referrer_id);
END;
$$;

-- Cap referrer rewards: max 2 free months granted per calendar month
CREATE OR REPLACE FUNCTION public._check_and_grant_referral_reward(p_referrer_id UUID)
RETURNS void
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = public
AS $$
DECLARE
  v_count INTEGER;
  v_milestone INTEGER := 5;
  v_rewards_this_month INTEGER;
BEGIN
  SELECT COUNT(*)::INTEGER INTO v_count
  FROM public.referrals
  WHERE referrer_id = p_referrer_id;

  IF v_count < v_milestone THEN
    RETURN;
  END IF;

  IF v_count % v_milestone != 0 THEN
    RETURN;
  END IF;

  IF EXISTS (
    SELECT 1 FROM public.referral_rewards
    WHERE user_id = p_referrer_id AND referrals_count = v_count
  ) THEN
    RETURN;
  END IF;

  SELECT COUNT(*)::INTEGER INTO v_rewards_this_month
  FROM public.referral_rewards
  WHERE user_id = p_referrer_id
    AND granted_at >= date_trunc('month', now());

  IF v_rewards_this_month >= 2 THEN
    RETURN;
  END IF;

  INSERT INTO public.referral_rewards (user_id, referrals_count)
  VALUES (p_referrer_id, v_count);

  UPDATE public.users
    SET tier = 'pro',
        pro_since = COALESCE(pro_since, now()),
        pro_until = GREATEST(COALESCE(pro_until, now()), now()) + INTERVAL '1 month'
  WHERE id = p_referrer_id;
END;
$$;
