// Authentication module for Daily Stitch
// Handles Google ID token verification and session management

interface GoogleTokenPayload {
  sub: string;
  email: string;
  email_verified: boolean;
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
    const response = await fetch(`https://oauth2.googleapis.com/tokeninfo?id_token=${idToken}`);
    
    if (!response.ok) {
      return null;
    }
    
    const payload = await response.json() as GoogleTokenPayload;
    
    const aud = (payload as any).aud;
    if (aud !== env.GOOGLE_CLIENT_ID) {
      return null;
    }
    
    return payload;
  } catch (e) {
    console.error('Google token verification failed:', e);
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
    "SELECT * FROM sessions WHERE token = ? AND expires_at > datetime('now')"
  ).bind(token).first() as any;

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
