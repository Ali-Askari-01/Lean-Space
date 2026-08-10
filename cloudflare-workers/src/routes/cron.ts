import { Hono } from 'hono';
import type { AppEnv } from '../types';

const cron = new Hono<AppEnv>();

// Hourly rollover — marks missed tasks and resets broken habit streaks
cron.post('/rollover', async (c) => {
  // This endpoint should only be called by Cloudflare Cron Triggers
  // We verify using a shared secret header
  const cronSecret = (c.env as any).CRON_SECRET;
  const authHeader = c.req.header('X-Cron-Secret');
  if (!cronSecret || authHeader !== cronSecret) {
    return c.json({ error: 'unauthorized' }, 401);
  }

  const today = new Date().toISOString().split('T')[0];
  const yesterday = new Date(Date.now() - 86400000).toISOString().split('T')[0];

  // Mark all open tasks from before today as missed
  const { success: missedOk } = await c.env.DB.prepare(
    "UPDATE todos SET status = 'missed' WHERE status = 'open' AND original_date < ?"
  ).bind(today).run();

  // Reset habit streaks where last completion was before yesterday
  const { success: streaksOk } = await c.env.DB.prepare(
    'UPDATE habits SET streak_count = 0 WHERE last_completed_date IS NOT NULL AND last_completed_date < ?'
  ).bind(yesterday).run();

  // Clean up old app_opens (keep last 90 days)
  const ninetyDaysAgo = new Date(Date.now() - 90 * 86400000).toISOString();
  const { success: cleanupOk } = await c.env.DB.prepare(
    'DELETE FROM app_opens WHERE opened_at < ?'
  ).bind(ninetyDaysAgo).run();

  // Clean up expired sessions (30 days old)
  const thirtyDaysAgo = new Date(Date.now() - 30 * 86400000).toISOString();
  await c.env.DB.prepare('DELETE FROM sessions WHERE expires_at < ?').bind(thirtyDaysAgo).run();

  return c.json({
    ok: true,
    missed_tasks_updated: missedOk,
    streaks_reset: streaksOk,
    app_opens_cleaned: cleanupOk,
  });
});

export default cron;
