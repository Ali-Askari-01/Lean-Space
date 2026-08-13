-- Rate limiting table for server-side rate limiting
CREATE TABLE IF NOT EXISTS rate_limits (
  id TEXT PRIMARY KEY,
  key TEXT NOT NULL,
  identifier TEXT NOT NULL,
  created_at TEXT NOT NULL DEFAULT (datetime('now'))
);
CREATE INDEX IF NOT EXISTS idx_rate_limits_lookup ON rate_limits(key, identifier, created_at);
CREATE INDEX IF NOT EXISTS idx_rate_limits_cleanup ON rate_limits(created_at);
