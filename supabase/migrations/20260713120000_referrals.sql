-- Referral program: invite 5 friends → 1 free month of Pro
-- Launch promo for the first month.

-- ---------------------------------------------------------------------------
-- Schema
-- ---------------------------------------------------------------------------

ALTER TABLE public.users
  ADD COLUMN IF NOT EXISTS referral_code TEXT UNIQUE;

CREATE TABLE IF NOT EXISTS public.referrals (
  id           UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  referrer_id  UUID NOT NULL REFERENCES public.users(id) ON DELETE CASCADE,
  referee_id   UUID NOT NULL REFERENCES public.users(id) ON DELETE CASCADE,
  created_at   TIMESTAMPTZ NOT NULL DEFAULT now(),
  UNIQUE (referee_id)
);

CREATE INDEX IF NOT EXISTS idx_referrals_referrer
  ON public.referrals(referrer_id);

CREATE TABLE IF NOT EXISTS public.referral_rewards (
  id               UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id          UUID NOT NULL REFERENCES public.users(id) ON DELETE CASCADE,
  referrals_count  INTEGER NOT NULL,
  granted_at       TIMESTAMPTZ NOT NULL DEFAULT now(),
  UNIQUE (user_id, referrals_count)
);

ALTER TABLE public.referrals ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.referral_rewards ENABLE ROW LEVEL SECURITY;

DROP POLICY IF EXISTS referrals_select_involved ON public.referrals;
CREATE POLICY referrals_select_involved ON public.referrals
  FOR SELECT USING (referrer_id = auth.uid() OR referee_id = auth.uid());

DROP POLICY IF EXISTS referral_rewards_select_self ON public.referral_rewards;
CREATE POLICY referral_rewards_select_self ON public.referral_rewards
  FOR SELECT USING (user_id = auth.uid());

-- ---------------------------------------------------------------------------
-- Helpers
-- ---------------------------------------------------------------------------

CREATE OR REPLACE FUNCTION public._generate_referral_code()
RETURNS TEXT
LANGUAGE plpgsql
AS $$
DECLARE
  v_code TEXT;
  v_tries INTEGER := 0;
BEGIN
  LOOP
    v_code := upper(substr(replace(gen_random_uuid()::text, '-', ''), 1, 8));
    EXIT WHEN NOT EXISTS (
      SELECT 1 FROM public.users WHERE referral_code = v_code
    );
    v_tries := v_tries + 1;
    IF v_tries > 20 THEN
      RAISE EXCEPTION 'could_not_generate_referral_code';
    END IF;
  END LOOP;
  RETURN v_code;
END;
$$;

CREATE OR REPLACE FUNCTION public.grant_promotional_pro(p_days INTEGER DEFAULT 30)
RETURNS void
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = public
AS $$
DECLARE
  v_uid UUID := auth.uid();
  v_until TIMESTAMPTZ;
BEGIN
  IF v_uid IS NULL THEN
    RAISE EXCEPTION 'unauthorized';
  END IF;

  SELECT GREATEST(COALESCE(pro_until, now()), now()) + make_interval(days => p_days)
    INTO v_until
  FROM public.users
  WHERE id = v_uid;

  UPDATE public.users
    SET tier = 'pro',
        pro_since = COALESCE(pro_since, now()),
        pro_until = v_until
  WHERE id = v_uid;
END;
$$;

GRANT EXECUTE ON FUNCTION public.grant_promotional_pro(INTEGER) TO authenticated;

CREATE OR REPLACE FUNCTION public.get_my_referral_code()
RETURNS TEXT
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = public
AS $$
DECLARE
  v_uid UUID := auth.uid();
  v_code TEXT;
BEGIN
  IF v_uid IS NULL THEN
    RAISE EXCEPTION 'unauthorized';
  END IF;

  SELECT referral_code INTO v_code FROM public.users WHERE id = v_uid;
  IF v_code IS NOT NULL THEN
    RETURN v_code;
  END IF;

  v_code := public._generate_referral_code();
  UPDATE public.users SET referral_code = v_code WHERE id = v_uid;
  RETURN v_code;
END;
$$;

GRANT EXECUTE ON FUNCTION public.get_my_referral_code() TO authenticated;

CREATE OR REPLACE FUNCTION public._check_and_grant_referral_reward(p_referrer_id UUID)
RETURNS void
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = public
AS $$
DECLARE
  v_count INTEGER;
  v_milestone INTEGER := 5;
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

  INSERT INTO public.referral_rewards (user_id, referrals_count)
  VALUES (p_referrer_id, v_count);

  UPDATE public.users
    SET tier = 'pro',
        pro_since = COALESCE(pro_since, now()),
        pro_until = GREATEST(COALESCE(pro_until, now()), now()) + INTERVAL '1 month'
  WHERE id = p_referrer_id;
END;
$$;

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

GRANT EXECUTE ON FUNCTION public.apply_referral_code(TEXT) TO authenticated;

CREATE OR REPLACE FUNCTION public.get_referral_stats()
RETURNS JSONB
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = public
AS $$
DECLARE
  v_uid UUID := auth.uid();
  v_code TEXT;
  v_count INTEGER;
  v_milestone INTEGER := 5;
  v_rewards INTEGER;
  v_progress INTEGER;
BEGIN
  IF v_uid IS NULL THEN
    RAISE EXCEPTION 'unauthorized';
  END IF;

  v_code := public.get_my_referral_code();

  SELECT COUNT(*)::INTEGER INTO v_count
  FROM public.referrals
  WHERE referrer_id = v_uid;

  SELECT COUNT(*)::INTEGER INTO v_rewards
  FROM public.referral_rewards
  WHERE user_id = v_uid;

  v_progress := v_count % v_milestone;

  RETURN jsonb_build_object(
    'code', v_code,
    'referral_count', v_count,
    'milestone', v_milestone,
    'progress', v_progress,
    'rewards_earned', v_rewards,
    'next_reward_at', ((v_count / v_milestone) + 1) * v_milestone
  );
END;
$$;

GRANT EXECUTE ON FUNCTION public.get_referral_stats() TO authenticated;
