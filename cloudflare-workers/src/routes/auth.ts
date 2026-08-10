import { Hono } from 'hono';
import type { Env } from '../index';
import type { AppEnv } from '../types';
import { hashPassword, verifyPassword, needsUpgrade, upgradeHashIfNeeded } from '../password';
import { createSession, getSession, deleteSession } from '../auth';

const auth = new Hono<AppEnv>();

// Public routes

auth.post('/signup', async (c) => {
  try {
    const { email, password, referral_code } = await c.req.json<{ email: string; password: string; referral_code?: string }>();

    if (!email || !/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email)) {
      return c.json({ error: 'invalid_email' }, 400);
    }
    if (!password || password.length < 8) {
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
    const msg = e instanceof Error ? e.message : String(e);
    return c.json({ error: 'signup_failed', message: msg }, 500);
  }
});

auth.post('/signin', async (c) => {
  try {
    const { email, password } = await c.req.json<{ email: string; password: string }>();

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
    const msg = e instanceof Error ? e.message : String(e);
    return c.json({ error: 'signin_failed', message: msg }, 500);
  }
});

auth.post('/google', async (c) => {
  try {
    const { idToken, referral_code } = await c.req.json<{ idToken: string; referral_code?: string }>();

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
    const msg = e instanceof Error ? e.message : String(e);
    return c.json({ error: 'google_auth_failed', message: msg }, 500);
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
  let code = '';
  for (let i = 0; i < 8; i++) code += chars.charAt(Math.floor(Math.random() * chars.length));
  return code;
}

async function verifyGoogleToken(env: Env, idToken: string): Promise<{ sub: string; email: string } | null> {
  try {
    const response = await fetch(`https://oauth2.googleapis.com/tokeninfo?id_token=${idToken}`);
    if (!response.ok) return null;
    const payload = await response.json() as any;
    const aud = payload.aud;
    if (aud !== env.GOOGLE_CLIENT_ID) return null;
    return { sub: payload.sub, email: payload.email };
  } catch {
    return null;
  }
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
