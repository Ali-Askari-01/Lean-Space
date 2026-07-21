-- Prevent same purchase token from being claimed by multiple users
CREATE UNIQUE INDEX IF NOT EXISTS idx_subscriptions_token_unique
  ON public.subscriptions(purchase_token)
  WHERE purchase_token IS NOT NULL;

-- Add CHECK constraint on product_id
ALTER TABLE public.subscriptions
  ADD CONSTRAINT chk_subscriptions_product_id
  CHECK (product_id IN ('leanspace_pro_monthly', 'leanspace_pro_yearly'));
