import { Hono } from 'hono';
import type { AppEnv } from '../types';

const habits = new Hono<AppEnv>();

habits.get('/', async (c) => {
  const userId = c.get('userId');
  const { results } = await c.env.DB.prepare('SELECT * FROM habits WHERE user_id = ? ORDER BY slot_index').bind(userId).all();
  return c.json({ results });
});

habits.post('/', async (c) => {
  const userId = c.get('userId');
  const { name, slot_index, notes } = await c.req.json();

  const user = await c.env.DB.prepare('SELECT tier FROM users WHERE id = ?').bind(userId).first() as any;
  if (slot_index >= (user.tier === 'pro' ? 5 : 3)) {
    return c.json({ error: 'slot_limit_reached' }, 403);
  }

  const id = crypto.randomUUID();
  await c.env.DB.prepare(
    `INSERT INTO habits (id, user_id, name, slot_index, notes, created_at) VALUES (?, ?, ?, ?, ?, datetime('now'))`
  ).bind(id, userId, name, slot_index, notes || null).run();

  return c.json(await c.env.DB.prepare('SELECT * FROM habits WHERE id = ?').bind(id).first());
});

habits.put('/:id', async (c) => {
  const userId = c.get('userId');
  const habitId = c.req.param('id');
  const body = await c.req.json();

  const existing = await c.env.DB.prepare('SELECT * FROM habits WHERE id = ? AND user_id = ?').bind(habitId, userId).first();
  if (!existing) return c.json({ error: 'not_found' }, 404);

  await c.env.DB.prepare('UPDATE habits SET name = ?, notes = ? WHERE id = ? AND user_id = ?')
    .bind(body.name, body.notes || null, habitId, userId).run();
  return c.json(await c.env.DB.prepare('SELECT * FROM habits WHERE id = ?').bind(habitId).first());
});

habits.delete('/:id', async (c) => {
  const userId = c.get('userId');
  await c.env.DB.prepare('DELETE FROM habits WHERE id = ? AND user_id = ?').bind(c.req.param('id'), userId).run();
  return c.json({ ok: true });
});

habits.post('/:id/toggle', async (c) => {
  const userId = c.get('userId');
  const habitId = c.req.param('id');
  const habit = await c.env.DB.prepare('SELECT * FROM habits WHERE id = ? AND user_id = ?').bind(habitId, userId).first() as any;
  if (!habit) return c.json({ error: 'not_found' }, 404);

  const today = new Date().toISOString().split('T')[0];
  const yesterday = new Date(Date.now() - 86400000).toISOString().split('T')[0];
  const isUntap = habit.last_completed_date === today;

  let newStreak: number;
  let newDate: string | null;

  if (isUntap) {
    newStreak = habit.streak_count > 0 ? habit.streak_count - 1 : 0;
    newDate = newStreak > 0 ? yesterday : null;
  } else {
    newStreak = habit.last_completed_date === yesterday ? habit.streak_count + 1 : 1;
    newDate = today;
  }

  await c.env.DB.prepare('UPDATE habits SET streak_count = ?, last_completed_date = ? WHERE id = ?')
    .bind(newStreak, newDate, habitId).run();

  return c.json(await c.env.DB.prepare('SELECT * FROM habits WHERE id = ?').bind(habitId).first());
});

export default habits;
