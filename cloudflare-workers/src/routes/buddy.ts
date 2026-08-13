import { Hono } from 'hono';
import type { AppEnv } from '../types';

const buddy = new Hono<AppEnv>();

buddy.get('/state', async (c) => {
  const userId = c.get('userId');
  const pair = await c.env.DB.prepare(
    'SELECT * FROM buddy_pairs WHERE user_a = ? OR user_b = ?'
  ).bind(userId, userId).first();

  if (!pair) {
    const { results } = await c.env.DB.prepare(
      "SELECT * FROM buddy_invites WHERE inviter_id = ? AND consumed_by IS NULL AND expires_at > datetime('now')"
    ).bind(userId).all();
    return c.json({ paired: false, pending_invites: results });
  }

  const buddyUserId = (pair as any).user_a === userId ? (pair as any).user_b : (pair as any).user_a;
  const buddyUser = await c.env.DB.prepare('SELECT email FROM users WHERE id = ?').bind(buddyUserId).first();

  return c.json({
    paired: true,
    pair: {
      id: (pair as any).id,
      buddy_id: buddyUserId,
      buddy_email: (buddyUser as any)?.email,
      shared_streak: (pair as any).shared_streak,
    },
  });
});

buddy.post('/invite', async (c) => {
  const userId = c.get('userId');
  const existing = await c.env.DB.prepare(
    'SELECT id FROM buddy_pairs WHERE user_a = ? OR user_b = ?'
  ).bind(userId, userId).first();
  if (existing) return c.json({ error: 'already_paired' }, 409);

  const jti = crypto.randomUUID();
  await c.env.DB.prepare(
    "INSERT INTO buddy_invites (jti, inviter_id, expires_at, created_at) VALUES (?, ?, ?, datetime('now'))"
  ).bind(jti, userId, new Date(Date.now() + 7 * 86400000).toISOString()).run();

  return c.json({ token: jti });
});

buddy.post('/accept', async (c) => {
  const userId = c.get('userId');
  const body = await c.req.json<{ token?: unknown }>();

  if (!body.token || typeof body.token !== 'string' || body.token.length > 200) {
    return c.json({ error: 'invalid_token' }, 400);
  }

  const invite = await c.env.DB.prepare(
    "SELECT * FROM buddy_invites WHERE jti = ? AND consumed_by IS NULL AND expires_at > datetime('now')"
  ).bind(body.token).first() as any;
  if (!invite) return c.json({ error: 'invalid_invite' }, 404);

  const myPair = await c.env.DB.prepare(
    'SELECT id FROM buddy_pairs WHERE user_a = ? OR user_b = ?'
  ).bind(userId, userId).first();
  if (myPair) return c.json({ error: 'already_paired' }, 409);

  const [userA, userB] = [userId, invite.inviter_id].sort();
  const pairId = crypto.randomUUID();
  await c.env.DB.prepare(
    "INSERT INTO buddy_pairs (id, user_a, user_b, created_at) VALUES (?, ?, ?, datetime('now'))"
  ).bind(pairId, userA, userB).run();
  await c.env.DB.prepare(
    'UPDATE buddy_invites SET consumed_by = ? WHERE jti = ?'
  ).bind(userId, body.token).run();

  return c.json({ ok: true, pair_id: pairId });
});

buddy.post('/nudge', async (c) => {
  const userId = c.get('userId');
  const body = await c.req.json<{ pair_id?: unknown }>();

  if (!body.pair_id || typeof body.pair_id !== 'string' || body.pair_id.length > 200) {
    return c.json({ error: 'invalid_pair_id' }, 400);
  }

  const pair = await c.env.DB.prepare(
    'SELECT * FROM buddy_pairs WHERE id = ? AND (user_a = ? OR user_b = ?)'
  ).bind(body.pair_id, userId, userId).first();
  if (!pair) return c.json({ error: 'not_found' }, 404);

  const today = new Date().toISOString().split('T')[0];
  const existing = await c.env.DB.prepare(
    "SELECT id FROM buddy_nudges WHERE pair_id = ? AND from_user = ? AND date(created_at) = ?"
  ).bind(body.pair_id, userId, today).first();
  if (existing) return c.json({ error: 'already_nudged_today' }, 429);

  await c.env.DB.prepare(
    "INSERT INTO buddy_nudges (id, pair_id, from_user, created_at) VALUES (?, ?, ?, datetime('now'))"
  ).bind(crypto.randomUUID(), body.pair_id, userId).run();

  return c.json({ ok: true });
});

buddy.post('/unpair', async (c) => {
  const userId = c.get('userId');
  await c.env.DB.prepare('DELETE FROM buddy_pairs WHERE user_a = ? OR user_b = ?').bind(userId, userId).run();
  return c.json({ ok: true });
});

export default buddy;
