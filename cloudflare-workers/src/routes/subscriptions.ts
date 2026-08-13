import { Hono } from 'hono';
import type { Context } from 'hono';
import type { AppEnv } from '../types';
import { acknowledgePurchase, verifyPurchase } from '../google_play';
import { checkRateLimit, getRateLimitConfig, getClientIdentifier } from '../rate_limit';

const subscriptions = new Hono<AppEnv>();

const PRODUCTS = [
  'leanspace_pro_monthly',
  'leanspace_pro_yearly',
  'leanspace_pro_lifetime',
];

subscriptions.post('/verify-play-purchase', async (c) => {
  const userId = c.get('userId');

  // Rate limit check
  const clientIp = getClientIdentifier(c);
  const rlConfig = getRateLimitConfig('subscription:verify')!;
  const rl = await checkRateLimit(c.env.DB, 'subscription:verify', clientIp, rlConfig);
  if (!rl.allowed) {
    return c.json({ error: 'rate_limited', retry_after_ms: rl.retryAfterMs }, 429);
  }

  const body = await c.req.json<{
    product_id?: string;
    purchase_token?: string;
  }>();

  if (!body.product_id || !PRODUCTS.includes(body.product_id)) {
    return c.json({ error: 'invalid_product' }, 400);
  }
  if (!body.purchase_token || typeof body.purchase_token !== 'string' || body.purchase_token.length > 2000) {
    return c.json({ error: 'missing_purchase_token' }, 400);
  }

  const existing = await c.env.DB.prepare(
    'SELECT user_id FROM subscriptions WHERE purchase_token = ?'
  ).bind(body.purchase_token).first() as { user_id?: string } | null;
  if (existing?.user_id && existing.user_id !== userId) {
    return c.json({ error: 'token_already_claimed' }, 409);
  }

  const serviceAccountJson = c.env.GOOGLE_SERVICE_ACCOUNT_JSON;
  const packageName = c.env.PLAY_PACKAGE_NAME;
  if (!serviceAccountJson || !packageName) {
    return c.json({ error: 'billing_not_configured' }, 503);
  }

  const verification = await verifyPurchase(
    { serviceAccountJson, packageName },
    body.product_id,
    body.purchase_token
  );
  if (!verification.isValid) {
    return c.json({ error: verification.error ?? 'purchase_not_valid' }, 402);
  }

  const proUntil = verification.isLifetime
    ? '9999-12-31T23:59:59.000Z'
    : verification.expiryTime;
  if (!proUntil) {
    return c.json({ error: 'missing_purchase_expiry' }, 502);
  }

  const subId = crypto.randomUUID();
  await c.env.DB.batch([
    c.env.DB.prepare(
      `INSERT INTO subscriptions (id, user_id, platform, product_id, purchase_token, status, current_period_end, created_at, updated_at)
       VALUES (?, ?, 'google_play', ?, ?, 'active', ?, datetime('now'), datetime('now'))
       ON CONFLICT(user_id, product_id) DO UPDATE SET
         platform = 'google_play',
         purchase_token = excluded.purchase_token,
         status = 'active',
         current_period_end = excluded.current_period_end,
         updated_at = datetime('now')`
    ).bind(subId, userId, body.product_id, body.purchase_token, proUntil),
    c.env.DB.prepare(
      "UPDATE users SET tier = 'pro', pro_since = COALESCE(pro_since, datetime('now')), pro_until = ? WHERE id = ?"
    ).bind(proUntil, userId),
  ]);

  await acknowledgePurchase({ serviceAccountJson, packageName }, body.product_id, body.purchase_token);
  return c.json({ ok: true, tier: 'pro', pro_until: proUntil });
});

async function getEntitlement(c: Context<AppEnv>) {
  const userId = c.get('userId');
  const user = await c.env.DB.prepare(
    'SELECT tier, pro_until FROM users WHERE id = ?'
  ).bind(userId).first() as { tier?: string; pro_until?: string } | null;

  if (!user) return c.json({ error: 'not_found' }, 404);

  if (user.tier === 'pro' && user.pro_until && new Date(user.pro_until) < new Date()) {
    const active = await c.env.DB.prepare(
      "SELECT current_period_end FROM subscriptions WHERE user_id = ? AND status = 'active' AND current_period_end > ? ORDER BY current_period_end DESC LIMIT 1"
    ).bind(userId, new Date().toISOString()).first() as { current_period_end?: string } | null;

    if (active?.current_period_end) {
      await c.env.DB.prepare('UPDATE users SET pro_until = ? WHERE id = ?')
        .bind(active.current_period_end, userId).run();
      return c.json({ tier: 'pro', is_pro: true, pro_until: active.current_period_end });
    }

    await c.env.DB.prepare("UPDATE users SET tier = 'free', pro_until = NULL WHERE id = ?")
      .bind(userId).run();
    return c.json({ tier: 'free', is_pro: false });
  }

  return c.json({
    tier: user.tier ?? 'free',
    is_pro: user.tier === 'pro',
    pro_until: user.pro_until,
  });
}

subscriptions.get('/', getEntitlement);
subscriptions.get('/entitlements', getEntitlement);

export default subscriptions;
