-- Daily Stitch D1 Schema — Initial tables
-- Converted from Supabase PostgreSQL to SQLite/D1 syntax

-- ============================================================================
-- TABLE: users
-- ============================================================================
CREATE TABLE IF NOT EXISTS users (
  id           TEXT PRIMARY KEY,
  email        TEXT NOT NULL UNIQUE,
  password_hash TEXT,
  google_sub   TEXT UNIQUE,
  tier         TEXT NOT NULL DEFAULT 'free' CHECK (tier IN ('free', 'pro')),
  timezone     TEXT NOT NULL DEFAULT 'UTC',
  pro_since    TEXT,
  pro_until    TEXT,
  referral_code TEXT UNIQUE,
  created_at   TEXT NOT NULL DEFAULT (datetime('now'))
);

-- ============================================================================
-- TABLE: sessions
-- ============================================================================
CREATE TABLE IF NOT EXISTS sessions (
  token      TEXT PRIMARY KEY,
  user_id    TEXT NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  created_at TEXT NOT NULL DEFAULT (datetime('now')),
  expires_at TEXT NOT NULL
);
CREATE INDEX IF NOT EXISTS idx_sessions_user ON sessions(user_id);
CREATE INDEX IF NOT EXISTS idx_sessions_expires ON sessions(expires_at);

-- ============================================================================
-- TABLE: habits
-- ============================================================================
CREATE TABLE IF NOT EXISTS habits (
  id                    TEXT PRIMARY KEY,
  user_id               TEXT NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  name                  TEXT NOT NULL CHECK (length(name) BETWEEN 1 AND 80),
  slot_index            INTEGER NOT NULL CHECK (slot_index BETWEEN 0 AND 4),
  streak_count          INTEGER NOT NULL DEFAULT 0,
  last_completed_date   TEXT,
  notes                 TEXT,
  created_at            TEXT NOT NULL DEFAULT (datetime('now'))
);
CREATE INDEX IF NOT EXISTS idx_habits_user ON habits(user_id);
CREATE UNIQUE INDEX IF NOT EXISTS idx_habits_user_slot ON habits(user_id, slot_index);

-- ============================================================================
-- TABLE: todos
-- ============================================================================
CREATE TABLE IF NOT EXISTS todos (
  id                    TEXT PRIMARY KEY,
  user_id               TEXT NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  text                  TEXT NOT NULL CHECK (length(text) BETWEEN 1 AND 500),
  status                TEXT NOT NULL DEFAULT 'open' CHECK (status IN ('open', 'done', 'missed')),
  original_date         TEXT NOT NULL,
  completed_date        TEXT,
  is_carried_forward    INTEGER NOT NULL DEFAULT 0,
  notes                 TEXT CHECK (notes IS NULL OR length(notes) <= 2000),
  priority              TEXT CHECK (priority IS NULL OR priority IN ('standard', 'vital', 'spark')),
  created_at            TEXT NOT NULL DEFAULT (datetime('now'))
);
CREATE INDEX IF NOT EXISTS idx_todos_user_date ON todos(user_id, original_date DESC);
CREATE INDEX IF NOT EXISTS idx_todos_user_status ON todos(user_id, status);
CREATE INDEX IF NOT EXISTS idx_todos_user_priority ON todos(user_id, priority) WHERE priority IS NOT NULL;

-- ============================================================================
-- TABLE: subscriptions
-- ============================================================================
CREATE TABLE IF NOT EXISTS subscriptions (
  id                   TEXT PRIMARY KEY,
  user_id              TEXT NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  product_id           TEXT NOT NULL CHECK (product_id IN ('leanspace_pro_monthly', 'leanspace_pro_yearly', 'leanspace_pro_lifetime')),
  purchase_token       TEXT,
  status               TEXT NOT NULL DEFAULT 'active' CHECK (status IN ('active', 'canceled', 'expired', 'grace', 'paused')),
  current_period_end   TEXT,
  created_at           TEXT NOT NULL DEFAULT (datetime('now')),
  updated_at           TEXT NOT NULL DEFAULT (datetime('now'))
);
CREATE INDEX IF NOT EXISTS idx_subscriptions_user ON subscriptions(user_id);
CREATE INDEX IF NOT EXISTS idx_subscriptions_token ON subscriptions(purchase_token);
CREATE UNIQUE INDEX IF NOT EXISTS idx_subscriptions_token_unique ON subscriptions(purchase_token) WHERE purchase_token IS NOT NULL;
CREATE UNIQUE INDEX IF NOT EXISTS idx_subscriptions_user_product ON subscriptions(user_id, product_id);

-- ============================================================================
-- TABLE: streak_freeze_uses
-- ============================================================================
CREATE TABLE IF NOT EXISTS streak_freeze_uses (
  id           TEXT PRIMARY KEY,
  user_id      TEXT NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  frozen_date  TEXT NOT NULL,
  created_at   TEXT NOT NULL DEFAULT (datetime('now'))
);
CREATE INDEX IF NOT EXISTS idx_streak_freeze_user ON streak_freeze_uses(user_id);
CREATE UNIQUE INDEX IF NOT EXISTS idx_streak_freeze_user_date ON streak_freeze_uses(user_id, frozen_date);

-- ============================================================================
-- TABLE: buddy_pairs
-- ============================================================================
CREATE TABLE IF NOT EXISTS buddy_pairs (
  id                      TEXT PRIMARY KEY,
  user_a                  TEXT NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  user_b                  TEXT NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  shared_streak           INTEGER NOT NULL DEFAULT 0,
  last_both_perfect_date  TEXT,
  created_at              TEXT NOT NULL DEFAULT (datetime('now')),
  CHECK (user_a < user_b),
  UNIQUE (user_a, user_b)
);
CREATE INDEX IF NOT EXISTS idx_buddy_pairs_users ON buddy_pairs(user_a, user_b);

-- ============================================================================
-- TABLE: buddy_invites
-- ============================================================================
CREATE TABLE IF NOT EXISTS buddy_invites (
  jti          TEXT PRIMARY KEY,
  inviter_id   TEXT NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  consumed_by  TEXT REFERENCES users(id) ON DELETE CASCADE,
  expires_at   TEXT NOT NULL,
  created_at   TEXT NOT NULL DEFAULT (datetime('now'))
);
CREATE INDEX IF NOT EXISTS idx_buddy_invites_inviter ON buddy_invites(inviter_id);

-- ============================================================================
-- TABLE: buddy_nudges
-- ============================================================================
CREATE TABLE IF NOT EXISTS buddy_nudges (
  id          TEXT PRIMARY KEY,
  pair_id     TEXT NOT NULL REFERENCES buddy_pairs(id) ON DELETE CASCADE,
  from_user   TEXT NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  created_at  TEXT NOT NULL DEFAULT (datetime('now'))
);
CREATE INDEX IF NOT EXISTS idx_buddy_nudges_pair ON buddy_nudges(pair_id, created_at DESC);

-- ============================================================================
-- TABLE: referrals
-- ============================================================================
CREATE TABLE IF NOT EXISTS referrals (
  id           TEXT PRIMARY KEY,
  referrer_id  TEXT NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  referee_id   TEXT NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  created_at   TEXT NOT NULL DEFAULT (datetime('now')),
  UNIQUE (referee_id)
);
CREATE INDEX IF NOT EXISTS idx_referrals_referrer ON referrals(referrer_id);

-- ============================================================================
-- TABLE: referral_rewards
-- ============================================================================
CREATE TABLE IF NOT EXISTS referral_rewards (
  id               TEXT PRIMARY KEY,
  user_id          TEXT NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  referrals_count  INTEGER NOT NULL,
  granted_at       TEXT NOT NULL DEFAULT (datetime('now')),
  UNIQUE (user_id, referrals_count)
);
CREATE INDEX IF NOT EXISTS idx_referral_rewards_user ON referral_rewards(user_id);

-- ============================================================================
-- TABLE: app_opens
-- ============================================================================
CREATE TABLE IF NOT EXISTS app_opens (
  id         TEXT PRIMARY KEY,
  user_id    TEXT NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  opened_at  TEXT NOT NULL DEFAULT (datetime('now'))
);
CREATE INDEX IF NOT EXISTS idx_app_opens_user ON app_opens(user_id, opened_at DESC);

-- ============================================================================
-- Helper: updated_at trigger function
-- ============================================================================
CREATE TRIGGER IF NOT EXISTS trg_set_subscriptions_updated_at
  BEFORE UPDATE ON subscriptions
  FOR EACH ROW
  WHEN OLD.updated_at = NEW.updated_at
  BEGIN
    UPDATE subscriptions SET updated_at = datetime('now') WHERE id = NEW.id;
  END;
