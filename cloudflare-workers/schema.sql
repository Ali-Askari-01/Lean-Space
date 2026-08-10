-- Daily Stitch D1 Database Schema
-- SQLite equivalent of Supabase PostgreSQL schema

-- SESSIONS TABLE (replaces Supabase auth sessions)
CREATE TABLE IF NOT EXISTS sessions (
  token TEXT PRIMARY KEY,
  user_id TEXT NOT NULL,
  created_at TEXT NOT NULL DEFAULT (datetime('now')),
  expires_at TEXT NOT NULL
);
CREATE INDEX IF NOT EXISTS idx_sessions_token ON sessions(token);
CREATE INDEX IF NOT EXISTS idx_sessions_expires ON sessions(expires_at);

-- USERS TABLE
CREATE TABLE IF NOT EXISTS users (
  id TEXT PRIMARY KEY,
  email TEXT NOT NULL UNIQUE,
  password_hash TEXT,
  tier TEXT NOT NULL DEFAULT 'free' CHECK (tier IN ('free', 'pro')),
  timezone TEXT NOT NULL DEFAULT 'UTC',
  pro_since TEXT,
  pro_until TEXT,
  referral_code TEXT UNIQUE,
  google_sub TEXT UNIQUE,
  created_at TEXT NOT NULL DEFAULT (datetime('now'))
);
CREATE INDEX IF NOT EXISTS idx_users_tier ON users(tier);
CREATE INDEX IF NOT EXISTS idx_users_email ON users(email);
CREATE INDEX IF NOT EXISTS idx_users_referral ON users(referral_code);

-- HABITS TABLE
CREATE TABLE IF NOT EXISTS habits (
  id TEXT PRIMARY KEY,
  user_id TEXT NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  name TEXT NOT NULL CHECK (length(name) BETWEEN 1 AND 80),
  slot_index INTEGER NOT NULL CHECK (slot_index BETWEEN 0 AND 4),
  streak_count INTEGER NOT NULL DEFAULT 0,
  last_completed_date TEXT,
  notes TEXT CHECK (notes IS NULL OR length(notes) <= 2000),
  created_at TEXT NOT NULL DEFAULT (datetime('now')),
  UNIQUE (user_id, slot_index)
);
CREATE INDEX IF NOT EXISTS idx_habits_user ON habits(user_id);

-- TODOS TABLE
CREATE TABLE IF NOT EXISTS todos (
  id TEXT PRIMARY KEY,
  user_id TEXT NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  text TEXT NOT NULL CHECK (length(text) BETWEEN 1 AND 500),
  status TEXT NOT NULL DEFAULT 'open' CHECK (status IN ('open', 'done', 'missed')),
  original_date TEXT NOT NULL,
  completed_date TEXT,
  is_carried_forward INTEGER NOT NULL DEFAULT 0,
  notes TEXT CHECK (notes IS NULL OR length(notes) <= 2000),
  priority TEXT CHECK (priority IS NULL OR priority IN ('standard', 'vital', 'spark')),
  created_at TEXT NOT NULL DEFAULT (datetime('now'))
);
CREATE INDEX IF NOT EXISTS idx_todos_user_date ON todos(user_id, original_date DESC);
CREATE INDEX IF NOT EXISTS idx_todos_user_status ON todos(user_id, status);
CREATE INDEX IF NOT EXISTS idx_todos_user_priority ON todos(user_id, priority) WHERE priority IS NOT NULL;

-- PROJECTS TABLE
CREATE TABLE IF NOT EXISTS projects (
  id TEXT PRIMARY KEY,
  owner_id TEXT NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  name TEXT NOT NULL CHECK (length(name) BETWEEN 1 AND 60),
  collaborator_cap INTEGER NOT NULL DEFAULT 4 CHECK (collaborator_cap BETWEEN 2 AND 8),
  current_invite_jti TEXT,
  created_at TEXT NOT NULL DEFAULT (datetime('now'))
);
CREATE INDEX IF NOT EXISTS idx_projects_owner ON projects(owner_id);

-- PROJECT_MEMBERS TABLE
CREATE TABLE IF NOT EXISTS project_members (
  project_id TEXT NOT NULL REFERENCES projects(id) ON DELETE CASCADE,
  user_id TEXT NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  joined_at TEXT NOT NULL DEFAULT (datetime('now')),
  PRIMARY KEY (project_id, user_id)
);
CREATE INDEX IF NOT EXISTS idx_pm_user ON project_members(user_id);

-- DAILY_LOGS TABLE
CREATE TABLE IF NOT EXISTS daily_logs (
  id TEXT PRIMARY KEY,
  project_id TEXT NOT NULL REFERENCES projects(id) ON DELETE CASCADE,
  user_id TEXT NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  done_today TEXT CHECK (done_today IS NULL OR length(done_today) <= 500),
  blockers TEXT CHECK (blockers IS NULL OR length(blockers) <= 500),
  plan_tomorrow TEXT CHECK (plan_tomorrow IS NULL OR length(plan_tomorrow) <= 500),
  log_date TEXT NOT NULL,
  created_at TEXT NOT NULL DEFAULT (datetime('now')),
  updated_at TEXT NOT NULL DEFAULT (datetime('now')),
  UNIQUE (project_id, user_id, log_date)
);
CREATE INDEX IF NOT EXISTS idx_logs_project_date ON daily_logs(project_id, log_date DESC);

-- CONSUMED_INVITES TABLE
CREATE TABLE IF NOT EXISTS consumed_invites (
  jti TEXT PRIMARY KEY,
  project_id TEXT NOT NULL REFERENCES projects(id) ON DELETE CASCADE,
  consumed_by TEXT NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  consumed_at TEXT NOT NULL DEFAULT (datetime('now'))
);
CREATE INDEX IF NOT EXISTS idx_consumed_invites_project ON consumed_invites(project_id);

-- APP_OPENS TABLE
CREATE TABLE IF NOT EXISTS app_opens (
  id TEXT PRIMARY KEY,
  user_id TEXT NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  opened_at TEXT NOT NULL DEFAULT (datetime('now'))
);
CREATE INDEX IF NOT EXISTS idx_app_opens_user ON app_opens(user_id, opened_at DESC);
CREATE INDEX IF NOT EXISTS idx_app_opens_created ON app_opens(opened_at DESC);

-- SUBSCRIPTIONS TABLE
CREATE TABLE IF NOT EXISTS subscriptions (
  id TEXT PRIMARY KEY,
  user_id TEXT NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  platform TEXT NOT NULL DEFAULT 'google_play' CHECK (platform IN ('google_play', 'app_store')),
  product_id TEXT NOT NULL CHECK (product_id IN ('daily_stitch_pro_monthly', 'daily_stitch_pro_yearly')),
  purchase_token TEXT,
  status TEXT NOT NULL DEFAULT 'active' CHECK (status IN ('active', 'canceled', 'expired', 'grace', 'paused')),
  current_period_end TEXT,
  created_at TEXT NOT NULL DEFAULT (datetime('now')),
  updated_at TEXT NOT NULL DEFAULT (datetime('now')),
  UNIQUE (user_id, product_id)
);
CREATE INDEX IF NOT EXISTS idx_subscriptions_user ON subscriptions(user_id);
CREATE INDEX IF NOT EXISTS idx_subscriptions_token ON subscriptions(purchase_token);
CREATE UNIQUE INDEX IF NOT EXISTS idx_subscriptions_token_unique ON subscriptions(purchase_token) WHERE purchase_token IS NOT NULL;

-- STREAK_FREEZE_USES TABLE
CREATE TABLE IF NOT EXISTS streak_freeze_uses (
  id TEXT PRIMARY KEY,
  user_id TEXT NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  frozen_date TEXT NOT NULL,
  created_at TEXT NOT NULL DEFAULT (datetime('now')),
  UNIQUE (user_id, frozen_date)
);
CREATE INDEX IF NOT EXISTS idx_streak_freeze_user ON streak_freeze_uses(user_id);

-- BUDDY_PAIRS TABLE
CREATE TABLE IF NOT EXISTS buddy_pairs (
  id TEXT PRIMARY KEY,
  user_a TEXT NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  user_b TEXT NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  shared_streak INTEGER NOT NULL DEFAULT 0,
  last_both_perfect_date TEXT,
  created_at TEXT NOT NULL DEFAULT (datetime('now')),
  CHECK (user_a < user_b),
  UNIQUE (user_a, user_b)
);
CREATE INDEX IF NOT EXISTS idx_buddy_pairs_users ON buddy_pairs(user_a, user_b);

-- BUDDY_INVITES TABLE
CREATE TABLE IF NOT EXISTS buddy_invites (
  jti TEXT PRIMARY KEY,
  inviter_id TEXT NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  consumed_by TEXT REFERENCES users(id) ON DELETE CASCADE,
  expires_at TEXT NOT NULL,
  created_at TEXT NOT NULL DEFAULT (datetime('now'))
);
CREATE INDEX IF NOT EXISTS idx_buddy_invites_inviter ON buddy_invites(inviter_id);

-- BUDDY_NUDGES TABLE
CREATE TABLE IF NOT EXISTS buddy_nudges (
  id TEXT PRIMARY KEY,
  pair_id TEXT NOT NULL REFERENCES buddy_pairs(id) ON DELETE CASCADE,
  from_user TEXT NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  created_at TEXT NOT NULL DEFAULT (datetime('now'))
);
CREATE INDEX IF NOT EXISTS idx_buddy_nudges_pair ON buddy_nudges(pair_id, created_at DESC);

-- REFERRALS TABLE
CREATE TABLE IF NOT EXISTS referrals (
  id TEXT PRIMARY KEY,
  referrer_id TEXT NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  referee_id TEXT NOT NULL REFERENCES users(id) ON DELETE CASCADE UNIQUE,
  created_at TEXT NOT NULL DEFAULT (datetime('now'))
);
CREATE INDEX IF NOT EXISTS idx_referrals_referrer ON referrals(referrer_id);

-- REFERRAL_REWARDS TABLE
CREATE TABLE IF NOT EXISTS referral_rewards (
  id TEXT PRIMARY KEY,
  user_id TEXT NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  referrals_count INTEGER NOT NULL,
  granted_at TEXT NOT NULL DEFAULT (datetime('now')),
  UNIQUE (user_id, referrals_count)
);
