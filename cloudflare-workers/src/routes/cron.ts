import { Hono } from 'hono';
import type { AppEnv } from '../types';
import { timingSafeEqual } from '../crypto_utils';

const cron = new Hono<AppEnv>();

export async function runRollover(env: AppEnv['Bindings']) {
  const today = new Date().toISOString().split('T')[0];
  const yesterday = new Date(Date.now() - 86400000).toISOString().split('T')[0];

  await env.DB.batch([
    env.DB.prepare(
      "UPDATE todos SET status = 'missed' WHERE status = 'open' AND original_date < ?"
    ).bind(today),
    env.DB.prepare(
      'UPDATE habits SET streak_count = 0 WHERE last_completed_date IS NOT NULL AND last_completed_date < ?'
    ).bind(yesterday),
    env.DB.prepare('DELETE FROM app_opens WHERE opened_at < ?')
      .bind(new Date(Date.now() - 90 * 86400000).toISOString()),
    env.DB.prepare("DELETE FROM sessions WHERE expires_at <= datetime('now')"),
  ]);
}

cron.post('/rollover', async (c) => {
  const cronSecret = c.env.CRON_SECRET;
  // Fail closed: reject if CRON_SECRET is not configured
  if (!cronSecret) {
    console.error('CRON_SECRET not configured — rejecting cron request');
    return c.json({ error: 'unauthorized' }, 401);
  }

  const authHeader = c.req.header('X-Cron-Secret');
  if (!authHeader || !timingSafeEqual(authHeader, cronSecret)) {
    return c.json({ error: 'unauthorized' }, 401);
  }

  await runRollover(c.env);
  return c.json({ ok: true, rollover_complete: true });
});

export default cron;
