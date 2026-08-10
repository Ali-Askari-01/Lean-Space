import { Hono } from 'hono';
import { cors } from 'hono/cors';
import { getSession } from './auth';

import authRoutes from './routes/auth';
import habitsRoutes from './routes/habits';
import todosRoutes from './routes/todos';
import streakFreezesRoutes from './routes/streak_freezes';
import referralsRoutes from './routes/referrals';
import subscriptionsRoutes from './routes/subscriptions';
import buddyRoutes from './routes/buddy';
import accountRoutes from './routes/account';
import webhooksRoutes from './routes/webhooks';
import cronRoutes from './routes/cron';

export interface Env {
  DB: D1Database;
  GOOGLE_CLIENT_ID: string;
  PLAY_PUBSUB_TOKEN: string;
  APP_NAME: string;
  ALLOWED_ORIGINS: string;
  PLAY_PACKAGE_NAME: string;
  CRON_SECRET?: string;
}

type Variables = {
  userId: string;
};

const app = new Hono<{ Bindings: Env; Variables: Variables }>();

// CORS middleware with allowlist
app.use('*', cors({
  origin: (origin, c) => {
    const allowed = (c.env.ALLOWED_ORIGINS || '').split(',').map((s: string) => s.trim());
    if (allowed.includes('*') || allowed.includes(origin)) {
      return origin;
    }
    return allowed[0] || null;
  },
  allowMethods: ['GET', 'POST', 'PUT', 'DELETE', 'OPTIONS'],
  allowHeaders: ['Authorization', 'Content-Type'],
  maxAge: 86400,
}));

// Health check (public)
app.get('/health', (c) => c.json({ ok: true, timestamp: new Date().toISOString() }));

// Auth middleware for protected routes
app.use('/api/*', async (c, next) => {
  // Skip auth for public auth routes
  const path = new URL(c.req.url).pathname;
  const publicAuthPaths = ['/api/auth/signup', '/api/auth/signin', '/api/auth/google'];
  if (publicAuthPaths.includes(path)) {
    return next();
  }

  const authHeader = c.req.header('Authorization');
  if (!authHeader?.startsWith('Bearer ')) {
    return c.json({ error: 'unauthorized' }, 401);
  }

  const session = await getSession(c.env, authHeader.slice(7));
  if (!session) {
    return c.json({ error: 'invalid_session' }, 401);
  }

  c.set('userId', session.userId);
  return next();
});

// Mount route modules
app.route('/api/auth', authRoutes);
app.route('/api/habits', habitsRoutes);
app.route('/api/todos', todosRoutes);
app.route('/api/streak-freezes', streakFreezesRoutes);
app.route('/api/referrals', referralsRoutes);
app.route('/api/subscription', subscriptionsRoutes);
app.route('/api/buddy', buddyRoutes);
app.route('/api/account', accountRoutes);
app.route('/webhook', webhooksRoutes);
app.route('/cron', cronRoutes);

// Global error handler
app.onError((err, c) => {
  console.error('Unhandled error:', err);
  return c.json({ error: 'internal_error', message: err.message }, 500);
});

// 404 handler
app.notFound((c) => c.json({ error: 'not_found' }, 404));

export default app;
