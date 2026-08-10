import { Hono } from 'hono';
import type { AppEnv } from '../types';

const account = new Hono<AppEnv>();

account.delete('/', async (c) => {
  const userId = c.get('userId');

  // Delete all user data (cascades handle most via FK ON DELETE CASCADE)
  // But we explicitly clean up to be safe
  const tables = [
    'habits',
    'todos',
    'subscriptions',
    'streak_freeze_uses',
    'buddy_nudges',
    'referrals',
    'referral_rewards',
    'app_opens',
    'sessions',
  ];

  for (const table of tables) {
    await c.env.DB.prepare(`DELETE FROM ${table} WHERE user_id = ?`).bind(userId).run();
  }

  // Delete buddy pairs where user is involved
  await c.env.DB.prepare('DELETE FROM buddy_pairs WHERE user_a = ? OR user_b = ?').bind(userId, userId).run();
  // Delete buddy invites where user is inviter
  await c.env.DB.prepare('DELETE FROM buddy_invites WHERE inviter_id = ?').bind(userId).run();
  // Delete consumed invites
  await c.env.DB.prepare('DELETE FROM buddy_invites WHERE consumed_by = ?').bind(userId).run();
  // Delete buddy nudges where user is from_user (already handled by user_id delete)

  // Finally delete the user itself
  await c.env.DB.prepare('DELETE FROM users WHERE id = ?').bind(userId).run();

  // Sign out
  const authHeader = c.req.header('Authorization');
  if (authHeader?.startsWith('Bearer ')) {
    const token = authHeader.slice(7);
    await c.env.DB.prepare('DELETE FROM sessions WHERE token = ?').bind(token).run();
  }

  return c.json({ ok: true });
});

// Update user profile
account.put('/me', async (c) => {
  const userId = c.get('userId');
  const { timezone, email } = await c.req.json();

  const updates: string[] = [];
  const values: any[] = [];

  if (timezone) {
    updates.push('timezone = ?');
    values.push(timezone);
  }
  if (email) {
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
