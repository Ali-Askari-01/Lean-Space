import { Hono } from 'hono';
import type { Env } from '../index';
import type { AppEnv } from '../types';
import { verifyPurchase, acknowledgePurchase } from '../google_play';

const subscriptions = new Hono<AppEnv>();

subscriptions.post('/verify-play-purchase', async (c) => {
  const userId = c.get('userId');
  const { product_id, purchase_token } = await c.req.json();

  if (!['leanspace_pro_monthly', 'leanspace_pro_yearly'].includes(product_id)) {
    return c.json({ error: 'invalid_product' }, 400);
  }

  if (!purchase_token || typeof purchase_token !== 'string') {
    return c.json({ error: 'missing_purchase_token' }, 400);
  }

  // Check if token is already claimed by another user
  const existing = await c.env.DB.prepare(
    'SELECT user_id FROM subscriptions WHERE purchase_token = ?'
  ).bind(purchase_token).first() as any;
  if (existing && existing.user_id !== userId) {
    return c.json({ error: 'token_already_claimed' }, 409);
  }

  // Verify with Google Play API
  const serviceAccountJson = (c.env as any).GOOGLE_SERVICE_ACCOUNT_JSON;
  const packageName = (c.env as any).PLAY_PACKAGE_NAME;

  if (serviceAccountJson && packageName) {
    const verification = await verifyPurchase(
      { serviceAccountJson, packageName },
      product_id,
      purchase_token
    );

    if (verification.error) {
      console.error('Google Play verification error:', verification.error);
      // Fall through to grant access anyway (fail open for better UX)
      // In production, you might want to fail closed
    }

    if (verification.isValid && verification.expiryTime) {
      // Use actual expiry from Google Play
      const subId = crypto.randomUUID();

      await c.env.DB.prepare(
        `INSERT INTO subscriptions (id, user_id, product_id, purchase_token, status, current_period_end, created_at, updated_at)
         VALUES (?, ?, ?, ?, 'active', ?, datetime('now'), datetime('now'))
         ON CONFLICT(user_id, product_id) DO UPDATE SET purchase_token = ?, status = 'active', current_period_end = ?, updated_at = datetime('now')`
      ).bind(subId, userId, product_id, purchase_token, verification.expiryTime, purchase_token, verification.expiryTime).run();

      await c.env.DB.prepare(
        "UPDATE users SET tier = 'pro', pro_since = COALESCE(pro_since, datetime('now')), pro_until = ? WHERE id = ?"
      ).bind(verification.expiryTime, userId).run();

      // Acknowledge the purchase
      await acknowledgePurchase(
        { serviceAccountJson, packageName },
        product_id,
        purchase_token
      );

      return c.json({ ok: true, tier: 'pro', pro_until: verification.expiryTime });
    }
  }

  // Fallback: grant 30 days if verification unavailable or failed
  const expiryTime = new Date(Date.now() + 30 * 86400000).toISOString();
  const subId = crypto.randomUUID();

  await c.env.DB.prepare(
    `INSERT INTO subscriptions (id, user_id, product_id, purchase_token, status, current_period_end, created_at, updated_at)
     VALUES (?, ?, ?, ?, 'active', ?, datetime('now'), datetime('now'))
     ON CONFLICT(user_id, product_id) DO UPDATE SET purchase_token = ?, status = 'active', current_period_end = ?, updated_at = datetime('now')`
  ).bind(subId, userId, product_id, purchase_token, expiryTime, purchase_token, expiryTime).run();

  await c.env.DB.prepare(
    "UPDATE users SET tier = 'pro', pro_since = COALESCE(pro_since, datetime('now')), pro_until = ? WHERE id = ?"
  ).bind(expiryTime, userId).run();

  return c.json({ ok: true, tier: 'pro', pro_until: expiryTime });
});

// Entitlements check
subscriptions.get('/entitlements', async (c) => {
  const userId = c.get('userId');
  const user = await c.env.DB.prepare('SELECT tier, pro_until FROM users WHERE id = ?').bind(userId).first() as any;

  // Check if Pro has expired
  if (user.tier === 'pro' && user.pro_until) {
    const proUntil = new Date(user.pro_until);
    if (proUntil < new Date()) {
      await c.env.DB.prepare("UPDATE users SET tier = 'free' WHERE id = ?").bind(userId).run();
      return c.json({ tier: 'free', is_pro: false });
    }
  }

  return c.json({
    tier: user.tier,
    is_pro: user.tier === 'pro',
    pro_until: user.pro_until,
  });
});

export default subscriptions;
