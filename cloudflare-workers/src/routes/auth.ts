import { Hono } from 'hono';
import type { Env } from '../index';
import type { AppEnv } from '../types';
import { hashPassword, verifyPassword, needsUpgrade, upgradeHashIfNeeded } from '../password';
import { createSession, deleteSession, verifyGoogleToken } from '../auth';
import { checkRateLimit, getRateLimitConfig, getClientIdentifier } from '../rate_limit';

const auth = new Hono<AppEnv>();

// Public routes

auth.post('/signup', async (c) => {
  try {
    // Rate limit check
    const clientIp = getClientIdentifier(c);
    const rlConfig = getRateLimitConfig('auth:signup')!;
    const rl = await checkRateLimit(c.env.DB, 'auth:signup', clientIp, rlConfig);
    if (!rl.allowed) {
      return c.json({ error: 'rate_limited', retry_after_ms: rl.retryAfterMs }, 429);
    }

    const { email, password, referral_code } = await c.req.json<{ email: string; password: string; referral_code?: string }>();

    if (!email || typeof email !== 'string' || email.length > 254) {
      return c.json({ error: 'invalid_email' }, 400);
    }
    // Stronger email validation
    const emailRegex = /^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$/;
    if (!emailRegex.test(email)) {
      return c.json({ error: 'invalid_email' }, 400);
    }
    if (!password || typeof password !== 'string' || password.length < 8 || password.length > 128) {
      return c.json({ error: 'password_too_short' }, 400);
    }

    const existing = await c.env.DB.prepare('SELECT id FROM users WHERE email = ?').bind(email).first();
    if (existing) {
      return c.json({ error: 'email_already_exists' }, 409);
    }

    const passwordHash = await hashPassword(password);
    const userId = crypto.randomUUID();
    const userReferralCode = generateReferralCode();

    await c.env.DB.prepare(
      `INSERT INTO users (id, email, password_hash, tier, timezone, referral_code, created_at)
       VALUES (?, ?, ?, 'free', 'UTC', ?, datetime('now'))`
    ).bind(userId, email, passwordHash, userReferralCode).run();

    // Apply referral if code was provided
    if (referral_code && referral_code.trim().length >= 4) {
      try {
        await applyReferralCode(c.env, userId, referral_code.trim());
      } catch (_) {
        // Best-effort — don't fail signup on referral error
      }
    }

    const sessionToken = await createSession(c.env, userId);

    return c.json({
      session_token: sessionToken,
      user: { id: userId, email, tier: 'free', timezone: 'UTC' },
    });
  } catch (e) {
    console.error('Signup failed:', e);
    return c.json({ error: 'signup_failed' }, 500);
  }
});

auth.post('/signin', async (c) => {
  try {
    // Rate limit check
    const clientIp = getClientIdentifier(c);
    const rlConfig = getRateLimitConfig('auth:signin')!;
    const rl = await checkRateLimit(c.env.DB, 'auth:signin', clientIp, rlConfig);
    if (!rl.allowed) {
      return c.json({ error: 'rate_limited', retry_after_ms: rl.retryAfterMs }, 429);
    }

    const { email, password } = await c.req.json<{ email: string; password: string }>();

    if (!email || typeof email !== 'string' || !password || typeof password !== 'string') {
      return c.json({ error: 'invalid_credentials' }, 401);
    }

    const user = await c.env.DB.prepare('SELECT * FROM users WHERE email = ?').bind(email).first() as any;
    if (!user) return c.json({ error: 'invalid_credentials' }, 401);
    if (!user.password_hash) return c.json({ error: 'use_google_signin' }, 401);

    const valid = await verifyPassword(password, user.password_hash);
    if (!valid) return c.json({ error: 'invalid_credentials' }, 401);

    // Upgrade hash if using legacy format
    const newHash = await upgradeHashIfNeeded(password, user.password_hash);
    if (newHash) {
      await c.env.DB.prepare('UPDATE users SET password_hash = ? WHERE id = ?').bind(newHash, user.id).run();
    }

    const sessionToken = await createSession(c.env, user.id);
    return c.json({
      session_token: sessionToken,
      user: { id: user.id, email: user.email, tier: user.tier, timezone: user.timezone },
    });
  } catch (e) {
    console.error('Signin failed:', e);
    return c.json({ error: 'signin_failed' }, 500);
  }
});

auth.post('/google', async (c) => {
  try {
    // Rate limit check
    const clientIp = getClientIdentifier(c);
    const rlConfig = getRateLimitConfig('auth:google')!;
    const rl = await checkRateLimit(c.env.DB, 'auth:google', clientIp, rlConfig);
    if (!rl.allowed) {
      return c.json({ error: 'rate_limited', retry_after_ms: rl.retryAfterMs }, 429);
    }

    const body = await c.req.json<{ idToken?: string; id_token?: string; referral_code?: string }>();
    const idToken = body.idToken ?? body.id_token;
    const referral_code = body.referral_code;
    if (!idToken) return c.json({ error: 'missing_id_token' }, 400);

    const googleUser = await verifyGoogleToken(c.env, idToken);
    if (!googleUser) return c.json({ error: 'invalid_google_token' }, 401);

    let user = await c.env.DB.prepare('SELECT * FROM users WHERE google_sub = ?').bind(googleUser.sub).first();

    if (!user) {
      user = await c.env.DB.prepare('SELECT * FROM users WHERE email = ?').bind(googleUser.email).first();
      if (user) {
        await c.env.DB.prepare('UPDATE users SET google_sub = ? WHERE id = ?').bind(googleUser.sub, user.id).run();
      } else {
        const userId = crypto.randomUUID();
        const code = generateReferralCode();
        await c.env.DB.prepare(
          `INSERT INTO users (id, email, google_sub, tier, timezone, referral_code, created_at)
           VALUES (?, ?, ?, 'free', 'UTC', ?, datetime('now'))`
        ).bind(userId, googleUser.email, googleUser.sub, code).run();
        user = await c.env.DB.prepare('SELECT * FROM users WHERE id = ?').bind(userId).first();
      }
    }

    // Apply referral if code was provided
    if (referral_code && referral_code.trim().length >= 4 && user) {
      try {
        await applyReferralCode(c.env, user.id as string, referral_code.trim());
      } catch (_) {
        // Best-effort
      }
    }

    const sessionToken = await createSession(c.env, user!.id as string);
    return c.json({
      session_token: sessionToken,
      user: { id: user!.id, email: user!.email, tier: user!.tier, timezone: user!.timezone },
    });
  } catch (e) {
    console.error('Google auth failed:', e);
    return c.json({ error: 'google_auth_failed' }, 500);
  }
});

// Protected routes (require auth middleware on parent router)

auth.get('/me', async (c) => {
  const userId = c.get('userId');
  const user = await c.env.DB.prepare(
    'SELECT id, email, tier, timezone, pro_since, pro_until, referral_code FROM users WHERE id = ?'
  ).bind(userId).first();
  return c.json(user);
});

auth.post('/signout', async (c) => {
  const authHeader = c.req.header('Authorization');
  if (authHeader?.startsWith('Bearer ')) {
    await deleteSession(c.env, authHeader.slice(7));
  }
  return c.json({ ok: true });
});

// ============================================================================
// Helpers
// ============================================================================

function generateReferralCode(): string {
  const chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
  const bytes = new Uint8Array(8);
  crypto.getRandomValues(bytes);
  let code = '';
  for (let i = 0; i < 8; i++) code += chars.charAt(bytes[i] % chars.length);
  return code;
}

async function applyReferralCode(env: Env, userId: string, code: string): Promise<void> {
  const upperCode = code.toUpperCase().trim();
  if (upperCode.length < 4) return;

  const existing = await env.DB.prepare('SELECT id FROM referrals WHERE referee_id = ?').bind(userId).first();
  if (existing) return;

  const referrer = await env.DB.prepare('SELECT id FROM users WHERE referral_code = ?').bind(upperCode).first();
  if (!referrer || referrer.id === userId) return;

  await env.DB.prepare(
    "INSERT INTO referrals (id, referrer_id, referee_id, created_at) VALUES (?, ?, ?, datetime('now'))"
  ).bind(crypto.randomUUID(), referrer.id as string, userId).run();

  const { count } = await env.DB.prepare('SELECT COUNT(*) as count FROM referrals WHERE referrer_id = ?').bind(referrer.id).first() as any;
  if (count > 0 && count % 5 === 0) {
    await grantReferralReward(env, referrer.id as string, count);
  }
}

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

export default auth;
