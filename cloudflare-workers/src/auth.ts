// Authentication module for Daily Stitch
// Handles Google ID token verification and session management

interface GoogleTokenPayload {
  sub: string;
  email: string;
  email_verified: boolean;
  aud?: string;
  iss?: string;
  exp?: string | number;
  name?: string;
  picture?: string;
}

interface Session {
  userId: string;
  token: string;
  createdAt: number;
}

interface Env {
  DB: D1Database;
  GOOGLE_CLIENT_ID: string;
}

export async function verifyGoogleToken(env: Env, idToken: string): Promise<GoogleTokenPayload | null> {
  try {
    if (!idToken || idToken.length > 4096) {
      console.error('Google token: invalid length', idToken?.length);
      return null;
    }

    const response = await fetch('https://oauth2.googleapis.com/tokeninfo', {
      method: 'POST',
      headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
      body: new URLSearchParams({ id_token: idToken }),
    });
    
    if (!response.ok) {
      const text = await response.text().catch(() => '');
      console.error('Google tokeninfo HTTP error:', response.status, text);
      return null;
    }
    
    const payload = await response.json() as GoogleTokenPayload;
    
    if (payload.aud !== env.GOOGLE_CLIENT_ID) {
      console.error('Google token aud mismatch:', {
        token_aud: payload.aud,
        expected: env.GOOGLE_CLIENT_ID,
        email: payload.email,
      });
      return null;
    }
    if (payload.email_verified !== true && String(payload.email_verified) !== 'true') {
      console.error('Google token email not verified:', payload.email, payload.email_verified);
      return null;
    }
    if (payload.iss && !['accounts.google.com', 'https://accounts.google.com'].includes(payload.iss)) {
      console.error('Google token bad issuer:', payload.iss);
      return null;
    }
    if (payload.exp && Number(payload.exp) * 1000 <= Date.now()) {
      console.error('Google token expired:', payload.exp);
      return null;
    }
    
    return payload;
  } catch (e) {
    console.error('Google token verification failed:', e instanceof Error ? e.message : String(e));
    return null;
  }
}

export async function createSession(env: Env, userId: string): Promise<string> {
  const token = crypto.randomUUID();
  const expiresAt = new Date(Date.now() + 30 * 24 * 60 * 60 * 1000).toISOString();

  await env.DB.prepare(
    "INSERT INTO sessions (token, user_id, expires_at) VALUES (?, ?, ?)"
  ).bind(token, userId, expiresAt).run();

  return token;
}

export async function getSession(env: Env, token: string): Promise<Session | null> {
  const row = await env.DB.prepare(
    "SELECT * FROM sessions WHERE token = ? AND expires_at > ?"
  ).bind(token, new Date().toISOString()).first() as any;

  if (!row) {
    return null;
  }
  
  return {
    userId: row.user_id,
    token: row.token,
    createdAt: new Date(row.created_at).getTime(),
  };
}

export async function deleteSession(env: Env, token: string): Promise<void> {
  await env.DB.prepare("DELETE FROM sessions WHERE token = ?").bind(token).run();
}
