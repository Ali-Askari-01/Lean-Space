import { Hono } from 'hono';
import type { Env } from '../index';
import type { AppEnv } from '../types';

const webhooks = new Hono<AppEnv>();

// Google Play RTDN webhook
webhooks.post('/play-rtdn', async (c) => {
  const token = c.req.header('X-PubSub-Token');
  if (!token || token !== (c.env as any).PLAY_PUBSUB_TOKEN) {
    return c.json({ error: 'unauthorized' }, 401);
  }

  let notification: any;
  try {
    const body = await c.req.json();
    const dataB64: string | undefined = body?.message?.data;
    if (!dataB64) return c.json({ ok: true });
    notification = JSON.parse(atob(dataB64));
  } catch {
    return c.json({ error: 'bad_request' }, 400);
  }

  const sub = notification.subscriptionNotification;
  if (!sub) return c.json({ ok: true });

  const purchaseToken = sub.purchaseToken;
  if (!purchaseToken) return c.json({ ok: true });

  // Find which user this purchase token belongs to
  const row = await c.env.DB.prepare(
    'SELECT user_id, product_id FROM subscriptions WHERE purchase_token = ?'
  ).bind(purchaseToken).first() as any;
  if (!row) return c.json({ ok: true });

  const ACTIVE_TYPES = [1, 2, 4, 7]; // RECOVERED, RENEWED, PURCHASED, RESTARTED
  const INACTIVE_TYPES = [3, 12, 13]; // CANCELED, REVOKED, EXPIRED

  const isActive = ACTIVE_TYPES.includes(sub.notificationType);
  const isInactive = INACTIVE_TYPES.includes(sub.notificationType);
  if (!isActive && !isInactive) return c.json({ ok: true });

  const status = isActive ? 'active' : 'expired';

  // Update subscription
  await c.env.DB.prepare(
    "UPDATE subscriptions SET status = ?, updated_at = datetime('now') WHERE id = ?"
  ).bind(status, row.id).run();

  // If inactive, downgrade user
  if (!isActive) {
    await c.env.DB.prepare("UPDATE users SET tier = 'free' WHERE id = ?").bind(row.user_id).run();
  }

  return c.json({ ok: true });
});

export default webhooks;
