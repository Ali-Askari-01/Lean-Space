-- LeanSpace subscriptions (freemium Pro)
-- Run in Supabase SQL Editor or via the CLI.

-- ---------------------------------------------------------------------------
-- Table: subscriptions
-- ---------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS public.subscriptions (
  id                   UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id              UUID NOT NULL REFERENCES public.users(id) ON DELETE CASCADE,
  platform             TEXT NOT NULL DEFAULT 'google_play'
                         CHECK (platform IN ('google_play', 'app_store')),
  product_id           TEXT NOT NULL,
  purchase_token       TEXT,
  status               TEXT NOT NULL DEFAULT 'active'
                         CHECK (status IN ('active', 'canceled', 'expired', 'grace', 'paused')),
  current_period_end   TIMESTAMPTZ,
  created_at           TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_at           TIMESTAMPTZ NOT NULL DEFAULT now(),
  UNIQUE (user_id, product_id)
);
CREATE INDEX IF NOT EXISTS idx_subscriptions_user ON public.subscriptions(user_id);
CREATE INDEX IF NOT EXISTS idx_subscriptions_token ON public.subscriptions(purchase_token);

ALTER TABLE public.subscriptions ENABLE ROW LEVEL SECURITY;

-- Users may read their own subscription rows. Writes happen via SECURITY
-- DEFINER functions / the server webhook only (no direct client writes).
DROP POLICY IF EXISTS subscriptions_select_self ON public.subscriptions;
CREATE POLICY subscriptions_select_self ON public.subscriptions
  FOR SELECT USING (user_id = auth.uid());

-- ---------------------------------------------------------------------------
-- RPC: record_pro_purchase
-- Called by the client right after a successful Play Billing purchase so the
-- user gets Pro immediately. The Play RTDN webhook (server) remains the
-- source of truth and will reconcile status/expiry on the next event.
-- ---------------------------------------------------------------------------

CREATE OR REPLACE FUNCTION public.record_pro_purchase(
  p_product_id   TEXT,
  p_purchase_token TEXT
)
RETURNS void
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = public
AS $$
DECLARE
  v_uid    UUID := auth.uid();
  v_period INTERVAL;
BEGIN
  IF v_uid IS NULL THEN
    RAISE EXCEPTION 'unauthorized';
  END IF;

  v_period := CASE
    WHEN p_product_id ILIKE '%yearly%' THEN INTERVAL '1 year'
    ELSE INTERVAL '1 month'
  END;

  INSERT INTO public.subscriptions
    (user_id, platform, product_id, purchase_token, status, current_period_end)
  VALUES
    (v_uid, 'google_play', p_product_id, p_purchase_token, 'active', now() + v_period)
  ON CONFLICT (user_id, product_id) DO UPDATE
    SET purchase_token = EXCLUDED.purchase_token,
        status = 'active',
        current_period_end = now() + v_period,
        updated_at = now();

  UPDATE public.users
    SET tier = 'pro',
        pro_since = COALESCE(pro_since, now()),
        pro_until = now() + v_period
  WHERE id = v_uid;
END;
$$;

GRANT EXECUTE ON FUNCTION public.record_pro_purchase(TEXT, TEXT) TO authenticated;

-- ---------------------------------------------------------------------------
-- Helper for the webhook (service role): set a user's tier from a verified
-- Play notification. Not exposed to the anon/authenticated roles.
-- ---------------------------------------------------------------------------

CREATE OR REPLACE FUNCTION public.apply_subscription_state(
  p_user_id       UUID,
  p_product_id    TEXT,
  p_purchase_token TEXT,
  p_status        TEXT,
  p_period_end    TIMESTAMPTZ
)
RETURNS void
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = public
AS $$
BEGIN
  INSERT INTO public.subscriptions
    (user_id, platform, product_id, purchase_token, status, current_period_end)
  VALUES
    (p_user_id, 'google_play', p_product_id, p_purchase_token, p_status, p_period_end)
  ON CONFLICT (user_id, product_id) DO UPDATE
    SET purchase_token = EXCLUDED.purchase_token,
        status = EXCLUDED.status,
        current_period_end = EXCLUDED.current_period_end,
        updated_at = now();

  UPDATE public.users
    SET tier = CASE WHEN p_status = 'active' THEN 'pro' ELSE 'free' END,
        pro_until = p_period_end
  WHERE id = p_user_id;
END;
$$;
