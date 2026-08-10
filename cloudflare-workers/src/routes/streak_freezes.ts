import { Hono } from 'hono';
import type { AppEnv } from '../types';

const streakFreezes = new Hono<AppEnv>();

streakFreezes.get('/', async (c) => {
  const userId = c.get('userId');
  const { results } = await c.env.DB.prepare(
    'SELECT frozen_date FROM streak_freeze_uses WHERE user_id = ?'
  ).bind(userId).all();
  return c.json({ results });
});

streakFreezes.get('/count', async (c) => {
  const userId = c.get('userId');
  const monthStart = new Date();
  monthStart.setDate(1);
  const monthStartStr = monthStart.toISOString().split('T')[0];

  const { count } = await c.env.DB.prepare(
    'SELECT COUNT(*) as count FROM streak_freeze_uses WHERE user_id = ? AND frozen_date >= ?'
  ).bind(userId, monthStartStr).first() as any;

  const user = await c.env.DB.prepare('SELECT tier FROM users WHERE id = ?').bind(userId).first() as any;
  const limit = user.tier === 'pro' ? 2 : 1;

  return c.json({ count, limit, remaining: Math.max(0, limit - count) });
});

streakFreezes.post('/use', async (c) => {
  const userId = c.get('userId');
  const { frozen_date } = await c.req.json();

  if (!frozen_date) return c.json({ error: 'missing_frozen_date' }, 400);

  // Validate the date is in the past
  const freezeDate = new Date(frozen_date);
  const today = new Date();
  today.setHours(0, 0, 0, 0);
  if (freezeDate >= today) return c.json({ error: 'freeze_future_date' }, 400);

  // Check user hasn't exceeded monthly limit
  const monthStart = new Date();
  monthStart.setDate(1);
  const monthStartStr = monthStart.toISOString().split('T')[0];

  const { count } = await c.env.DB.prepare(
    'SELECT COUNT(*) as count FROM streak_freeze_uses WHERE user_id = ? AND frozen_date >= ?'
  ).bind(userId, monthStartStr).first() as any;

  const user = await c.env.DB.prepare('SELECT tier FROM users WHERE id = ?').bind(userId).first() as any;
  const limit = user.tier === 'pro' ? 2 : 1;

  if (count >= limit) return c.json({ error: 'freeze_limit_reached' }, 429);

  // Check there are missed tasks on that date
  const { count: missedCount } = await c.env.DB.prepare(
    "SELECT COUNT(*) as count FROM todos WHERE user_id = ? AND original_date = ? AND status = 'missed'"
  ).bind(userId, frozen_date).first() as any;

  if (missedCount === 0) return c.json({ error: 'no_missed_tasks' }, 400);

  await c.env.DB.prepare(
    "INSERT INTO streak_freeze_uses (id, user_id, frozen_date, created_at) VALUES (?, ?, ?, datetime('now'))"
  ).bind(crypto.randomUUID(), userId, frozen_date).run();

  return c.json({ ok: true, frozen_date });
});

export default streakFreezes;
