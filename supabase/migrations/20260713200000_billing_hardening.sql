-- =============================================================================
-- Billing hardening: revoke client-callable tier mutations
-- =============================================================================

-- Lock down webhook-only helper
REVOKE ALL ON FUNCTION public.apply_subscription_state(UUID, TEXT, TEXT, TEXT, TIMESTAMPTZ)
  FROM PUBLIC, authenticated, anon;

-- Revoke client purchase recording — tier changes only via Edge Functions (service_role)
REVOKE EXECUTE ON FUNCTION public.record_pro_purchase(TEXT, TEXT) FROM authenticated;

-- Revoke self-service promotional Pro grant
REVOKE EXECUTE ON FUNCTION public.grant_promotional_pro(INTEGER) FROM authenticated;

-- Replace record_pro_purchase with a stub that always rejects client calls
CREATE OR REPLACE FUNCTION public.record_pro_purchase(
  p_product_id   TEXT,
  p_purchase_token TEXT
)
RETURNS void
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = public
AS $$
BEGIN
  RAISE EXCEPTION 'use_verify_play_purchase';
END;
$$;

-- Server-only helper for verified purchases (called by Edge Functions via service_role)
CREATE OR REPLACE FUNCTION public.verify_and_apply_play_purchase(
  p_user_id        UUID,
  p_product_id     TEXT,
  p_purchase_token TEXT,
  p_period_end     TIMESTAMPTZ
)
RETURNS void
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = public
AS $$
BEGIN
  IF p_user_id IS NULL OR p_purchase_token IS NULL OR p_purchase_token = '' THEN
    RAISE EXCEPTION 'invalid_purchase';
  END IF;

  INSERT INTO public.subscriptions
    (user_id, platform, product_id, purchase_token, status, current_period_end)
  VALUES
    (p_user_id, 'google_play', p_product_id, p_purchase_token, 'active', p_period_end)
  ON CONFLICT (user_id, product_id) DO UPDATE
    SET purchase_token = EXCLUDED.purchase_token,
        status = 'active',
        current_period_end = EXCLUDED.current_period_end,
        updated_at = now();

  UPDATE public.users
    SET tier = 'pro',
        pro_since = COALESCE(pro_since, now()),
        pro_until = p_period_end
  WHERE id = p_user_id;
END;
$$;

REVOKE ALL ON FUNCTION public.verify_and_apply_play_purchase(UUID, TEXT, TEXT, TIMESTAMPTZ)
  FROM PUBLIC, authenticated, anon;
