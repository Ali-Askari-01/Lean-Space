// Rate limiting middleware for Cloudflare Workers using D1
// Uses a sliding window approach stored in D1

interface RateLimitConfig {
  windowMs: number;
  maxRequests: number;
}

const RATE_LIMITS: Record<string, RateLimitConfig> = {
  'auth:signup': { windowMs: 60 * 60 * 1000, maxRequests: 5 },      // 5 per hour
  'auth:signin': { windowMs: 15 * 60 * 1000, maxRequests: 10 },     // 10 per 15 min
  'auth:google': { windowMs: 15 * 60 * 1000, maxRequests: 10 },     // 10 per 15 min
  'referral:apply': { windowMs: 60 * 60 * 1000, maxRequests: 5 },   // 5 per hour
  'subscription:verify': { windowMs: 60 * 1000, maxRequests: 5 },   // 5 per minute
};

export function getRateLimitConfig(key: string): RateLimitConfig | null {
  return RATE_LIMITS[key] ?? null;
}

/**
 * Check and record a rate limit hit. Returns true if allowed, false if rate limited.
 * Uses IP-based keying when available, falls back to a generic key.
 */
export async function checkRateLimit(
  db: D1Database,
  key: string,
  identifier: string,
  config: RateLimitConfig
): Promise<{ allowed: boolean; remaining: number; retryAfterMs: number }> {
  const windowStart = new Date(Date.now() - config.windowMs).toISOString();

  // Clean up old entries (best-effort, no error if fails)
  await db.prepare(
    'DELETE FROM rate_limits WHERE key = ? AND created_at < ?'
  ).bind(key, windowStart).run().catch(() => {});

  // Count recent requests
  const row = await db.prepare(
    'SELECT COUNT(*) as count FROM rate_limits WHERE key = ? AND identifier = ? AND created_at > ?'
  ).bind(key, identifier, windowStart).first() as { count: number } | null;

  const count = row?.count ?? 0;
  const remaining = Math.max(0, config.maxRequests - count - 1);

  if (count >= config.maxRequests) {
    // Find the oldest entry to calculate retry-after
    const oldest = await db.prepare(
      'SELECT created_at FROM rate_limits WHERE key = ? AND identifier = ? AND created_at > ? ORDER BY created_at ASC LIMIT 1'
    ).bind(key, identifier, windowStart).first() as { created_at: string } | null;

    const retryAfterMs = oldest
      ? new Date(oldest.created_at).getTime() + config.windowMs - Date.now()
      : config.windowMs;

    return { allowed: false, remaining: 0, retryAfterMs: Math.max(0, retryAfterMs) };
  }

  // Record this request
  await db.prepare(
    "INSERT INTO rate_limits (id, key, identifier, created_at) VALUES (?, ?, ?, datetime('now'))"
  ).bind(crypto.randomUUID(), key, identifier).run();

  return { allowed: true, remaining, retryAfterMs: 0 };
}

/**
 * Get client identifier from request (IP-based or fallback)
 */
export function getClientIdentifier(c: { req: { header: (name: string) => string | undefined } }): string {
  // Cloudflare provides the connecting IP via CF-Connecting-IP
  return c.req.header('CF-Connecting-IP')
    || c.req.header('X-Forwarded-For')?.split(',')[0]?.trim()
    || c.req.header('X-Real-IP')
    || 'unknown';
}
