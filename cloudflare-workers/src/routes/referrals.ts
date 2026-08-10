import { Hono } from 'hono';
import type { Env } from '../index';
import type { AppEnv } from '../types';

const referrals = new Hono<AppEnv>();

referrals.get('/stats', async (c) => {
  const userId = c.get('userId');
  const user = await c.env.DB.prepare('SELECT referral_code FROM users WHERE id = ?').bind(userId).first() as any;
  const { count } = await c.env.DB.prepare(
    'SELECT COUNT(*) as count FROM referrals WHERE referrer_id = ?'
  ).bind(userId).first() as any;
  const { results: rewards } = await c.env.DB.prepare(
    'SELECT referrals_count, granted_at FROM referral_rewards WHERE user_id = ?'
  ).bind(userId).all();

  const milestone = 5;
  const progress = count % milestone;

  return c.json({
    code: user.referral_code,
    referral_count: count,
    milestone,
    progress,
    rewards_earned: rewards.length,
    next_reward_at: ((Math.floor(count / milestone)) + 1) * milestone,
  });
});

referrals.get('/code', async (c) => {
  const userId = c.get('userId');
  const user = await c.env.DB.prepare('SELECT referral_code FROM users WHERE id = ?').bind(userId).first() as any;
  return c.json({ code: user?.referral_code });
});

referrals.post('/apply', async (c) => {
  const userId = c.get('userId');
  const { code } = await c.req.json();

  if (!code || code.trim().length < 4) return c.json({ error: 'invalid_code' }, 400);

  const referrer = await c.env.DB.prepare('SELECT id FROM users WHERE referral_code = ?').bind(code.trim().toUpperCase()).first();
  if (!referrer) return c.json({ error: 'invalid_code' }, 400);
  if (referrer.id === userId) return c.json({ error: 'self_referral' }, 400);

  const existing = await c.env.DB.prepare('SELECT id FROM referrals WHERE referee_id = ?').bind(userId).first();
  if (existing) return c.json({ error: 'already_referred' }, 409);

  await c.env.DB.prepare(
    "INSERT INTO referrals (id, referrer_id, referee_id, created_at) VALUES (?, ?, ?, datetime('now'))"
  ).bind(crypto.randomUUID(), referrer.id as string, userId).run();

  const { count: refCount } = await c.env.DB.prepare(
    'SELECT COUNT(*) as count FROM referrals WHERE referrer_id = ?'
  ).bind(referrer.id).first() as any;

  if (refCount > 0 && refCount % 5 === 0) {
    await grantReferralReward(c.env, referrer.id as string, refCount);
  }

  return c.json({ ok: true });
});

async function grantReferralReward(env: Env, referrerId: string, count: number): Promise<void> {
  const existing = await env.DB.prepare('SELECT id FROM referral_rewards WHERE user_id = ? AND referrals_count = ?')
    .bind(referrerId, count).first();
  if (existing) return;

  const proUntil = new Date();
  proUntil.setMonth(proUntil.getMonth() + 1);

  await env.DB.prepare(
    "INSERT INTO referral_rewards (id, user_id, referrals_count, granted_at) VALUES (?, ?, ?, datetime('now'))"
  ).bind(crypto.randomUUID(), referrerId, count).run();

  await env.DB.prepare(
    "UPDATE users SET tier = 'pro', pro_since = COALESCE(pro_since, datetime('now')), pro_until = ? WHERE id = ?"
  ).bind(proUntil.toISOString(), referrerId).run();
}

export default referrals;
