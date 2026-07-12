-- =============================================================================
-- Migration: Restrict profile updates and set dynamic streak freeze limit
-- =============================================================================

-- 1. Restrict authenticated users from directly altering billing/subscription columns
REVOKE UPDATE ON public.users FROM authenticated, anon;
GRANT UPDATE (email, timezone) ON public.users TO authenticated;

-- 2. Modify use_streak_freeze function to enforce tier-based limit
CREATE OR REPLACE FUNCTION public.use_streak_freeze(p_date DATE)
RETURNS void
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = public
AS $$
DECLARE
  v_uid    UUID := auth.uid();
  v_tz     TEXT;
  v_tier   TEXT;
  v_today  DATE;
  v_month  DATE;
  v_uses   INTEGER;
  v_limit  INTEGER;
  v_missed INTEGER;
BEGIN
  IF v_uid IS NULL THEN
    RAISE EXCEPTION 'unauthorized';
  END IF;

  SELECT timezone, tier INTO v_tz, v_tier FROM public.users WHERE id = v_uid;
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

  v_limit := CASE WHEN v_tier = 'pro' THEN 2 ELSE 1 END;

  IF v_uses >= v_limit THEN
    RAISE EXCEPTION 'freeze_limit_reached';
  END IF;

  INSERT INTO public.streak_freeze_uses (user_id, frozen_date)
  VALUES (v_uid, p_date)
  ON CONFLICT (user_id, frozen_date) DO NOTHING;
END;
$$;

GRANT EXECUTE ON FUNCTION public.use_streak_freeze(DATE) TO authenticated;
