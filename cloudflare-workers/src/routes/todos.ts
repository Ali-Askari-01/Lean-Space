import { Hono } from 'hono';
import type { AppEnv } from '../types';

const todos = new Hono<AppEnv>();

todos.get('/today', async (c) => {
  const userId = c.get('userId');
  const today = new Date().toISOString().split('T')[0];
  const { results } = await c.env.DB.prepare(
    'SELECT * FROM todos WHERE user_id = ? AND original_date = ? ORDER BY created_at'
  ).bind(userId, today).all();
  return c.json({ results });
});

todos.get('/streak', async (c) => {
  const userId = c.get('userId');
  const cutoff = new Date(Date.now() - 365 * 86400000).toISOString().split('T')[0];
  const { results } = await c.env.DB.prepare(
    'SELECT * FROM todos WHERE user_id = ? AND original_date >= ? ORDER BY original_date DESC'
  ).bind(userId, cutoff).all();
  return c.json({ results });
});

todos.get('/left-behind', async (c) => {
  const userId = c.get('userId');
  const { results } = await c.env.DB.prepare(
    "SELECT * FROM todos WHERE user_id = ? AND status = 'missed' ORDER BY original_date DESC"
  ).bind(userId).all();
  return c.json({ results });
});

todos.post('/', async (c) => {
  const userId = c.get('userId');
  const { text, notes, priority, is_carried_forward } = await c.req.json();
  const today = new Date().toISOString().split('T')[0];

  const { count } = await c.env.DB.prepare(
    'SELECT COUNT(*) as count FROM todos WHERE user_id = ? AND original_date = ?'
  ).bind(userId, today).first() as any;
  if (count >= 5) return c.json({ error: 'daily_task_cap' }, 429);

  const id = crypto.randomUUID();
  await c.env.DB.prepare(
    `INSERT INTO todos (id, user_id, text, status, original_date, is_carried_forward, notes, priority, created_at)
     VALUES (?, ?, ?, 'open', ?, ?, ?, ?, datetime('now'))`
  ).bind(id, userId, text, today, is_carried_forward ? 1 : 0, notes || null, priority || null).run();

  return c.json(await c.env.DB.prepare('SELECT * FROM todos WHERE id = ?').bind(id).first());
});

todos.post('/:id/complete', async (c) => {
  const userId = c.get('userId');
  const today = new Date().toISOString().split('T')[0];
  const taskId = c.req.param('id');

  await c.env.DB.prepare(
    "UPDATE todos SET status = 'done', completed_date = ? WHERE id = ? AND user_id = ?"
  ).bind(today, taskId, userId).run();

  return c.json(await c.env.DB.prepare('SELECT * FROM todos WHERE id = ?').bind(taskId).first());
});

todos.put('/:id', async (c) => {
  const userId = c.get('userId');
  const taskId = c.req.param('id');
  const { text, notes, priority } = await c.req.json();

  const existing = await c.env.DB.prepare('SELECT * FROM todos WHERE id = ? AND user_id = ?').bind(taskId, userId).first();
  if (!existing) return c.json({ error: 'not_found' }, 404);

  await c.env.DB.prepare('UPDATE todos SET text = ?, notes = ?, priority = ? WHERE id = ? AND user_id = ?')
    .bind(text, notes || null, priority || null, taskId, userId).run();

  return c.json(await c.env.DB.prepare('SELECT * FROM todos WHERE id = ?').bind(taskId).first());
});

todos.delete('/:id', async (c) => {
  const userId = c.get('userId');
  await c.env.DB.prepare('DELETE FROM todos WHERE id = ? AND user_id = ?').bind(c.req.param('id'), userId).run();
  return c.json({ ok: true });
});

export default todos;
