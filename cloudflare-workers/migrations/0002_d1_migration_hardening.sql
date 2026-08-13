-- Align already-applied D1 databases with the Worker contract after the
-- Supabase-to-D1 migration. Do not edit 0001 once it may have been applied.

ALTER TABLE subscriptions ADD COLUMN platform TEXT NOT NULL DEFAULT 'google_play';

CREATE UNIQUE INDEX IF NOT EXISTS idx_subscriptions_user_product
  ON subscriptions(user_id, product_id);

CREATE UNIQUE INDEX IF NOT EXISTS idx_subscriptions_token_unique
  ON subscriptions(purchase_token)
  WHERE purchase_token IS NOT NULL;

CREATE TRIGGER IF NOT EXISTS trg_daily_task_cap_insert
  BEFORE INSERT ON todos
  FOR EACH ROW
  WHEN (
    SELECT COUNT(*)
    FROM todos
    WHERE user_id = NEW.user_id
      AND original_date = NEW.original_date
  ) >= 5
  BEGIN
    SELECT RAISE(ABORT, 'daily_task_cap');
  END;
