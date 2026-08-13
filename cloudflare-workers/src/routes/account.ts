import { Hono } from 'hono';
import type { AppEnv } from '../types';

const account = new Hono<AppEnv>();

account.delete('/', async (c) => {
  const userId = c.get('userId');
  const authHeader = c.req.header('Authorization');
  const sessionToken = authHeader?.startsWith('Bearer ') ? authHeader.slice(7) : null;

  await c.env.DB.batch([
    c.env.DB.prepare('DELETE FROM buddy_nudges WHERE from_user = ?').bind(userId),
    c.env.DB.prepare('DELETE FROM buddy_pairs WHERE user_a = ? OR user_b = ?').bind(userId, userId),
    c.env.DB.prepare('DELETE FROM buddy_invites WHERE inviter_id = ? OR consumed_by = ?').bind(userId, userId),
    c.env.DB.prepare('DELETE FROM referrals WHERE referrer_id = ? OR referee_id = ?').bind(userId, userId),
    c.env.DB.prepare('DELETE FROM referral_rewards WHERE user_id = ?').bind(userId),
    c.env.DB.prepare('DELETE FROM streak_freeze_uses WHERE user_id = ?').bind(userId),
    c.env.DB.prepare('DELETE FROM todos WHERE user_id = ?').bind(userId),
    c.env.DB.prepare('DELETE FROM habits WHERE user_id = ?').bind(userId),
    c.env.DB.prepare('DELETE FROM subscriptions WHERE user_id = ?').bind(userId),
    c.env.DB.prepare('DELETE FROM app_opens WHERE user_id = ?').bind(userId),
    c.env.DB.prepare('DELETE FROM sessions WHERE user_id = ?').bind(userId),
    c.env.DB.prepare('DELETE FROM users WHERE id = ?').bind(userId),
    ...(sessionToken
      ? [c.env.DB.prepare('DELETE FROM sessions WHERE token = ?').bind(sessionToken)]
      : []),
  ]);

  return c.json({ ok: true });
});

// Update user profile
account.put('/me', async (c) => {
  const userId = c.get('userId');
  const body = await c.req.json<{ timezone?: string; email?: string }>();

  const updates: string[] = [];
  const values: (string | number)[] = [];

  if (body.timezone !== undefined) {
    const tz = body.timezone;
    if (typeof tz !== 'string' || tz.length === 0 || tz.length > 80) {
      return c.json({ error: 'invalid_timezone' }, 400);
    }
    updates.push('timezone = ?');
    values.push(tz);
  }
  if (body.email !== undefined) {
    const email = body.email;
    if (typeof email !== 'string' || !/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email) || email.length > 254) {
      return c.json({ error: 'invalid_email' }, 400);
    }
    // Check email uniqueness
    const existing = await c.env.DB.prepare('SELECT id FROM users WHERE email = ? AND id != ?').bind(email, userId).first();
    if (existing) {
      return c.json({ error: 'email_already_exists' }, 409);
    }
    updates.push('email = ?');
    values.push(email);
  }

  if (updates.length > 0) {
    values.push(userId);
    await c.env.DB.prepare(`UPDATE users SET ${updates.join(', ')} WHERE id = ?`).bind(...values).run();
  }

  return c.json(await c.env.DB.prepare(
    'SELECT id, email, tier, timezone, pro_since, pro_until, referral_code FROM users WHERE id = ?'
  ).bind(userId).first());
});

export default account;
