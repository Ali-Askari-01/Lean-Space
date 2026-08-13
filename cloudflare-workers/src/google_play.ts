interface GooglePlayConfig {
  serviceAccountJson: string;
  packageName: string;
}

export interface VerificationResult {
  isValid: boolean;
  expiryTime?: string;
  isLifetime?: boolean;
  cancelReason?: string;
  error?: string;
}

let cachedAccessToken: string | null = null;
let tokenExpiresAt = 0;

function base64Url(input: string | ArrayBuffer): string {
  const bytes = typeof input === 'string'
    ? new TextEncoder().encode(input)
    : new Uint8Array(input);
  let binary = '';
  for (const byte of bytes) binary += String.fromCharCode(byte);
  return btoa(binary).replace(/=/g, '').replace(/\+/g, '-').replace(/\//g, '_');
}

function pemToArrayBuffer(pem: string): ArrayBuffer {
  const base64 = pem
    .replace(/-----BEGIN PRIVATE KEY-----/g, '')
    .replace(/-----END PRIVATE KEY-----/g, '')
    .replace(/\s/g, '');
  const binary = atob(base64);
  const bytes = new Uint8Array(binary.length);
  for (let i = 0; i < binary.length; i++) bytes[i] = binary.charCodeAt(i);
  return bytes.buffer;
}

async function getAccessToken(config: GooglePlayConfig): Promise<string | null> {
  if (cachedAccessToken && Date.now() < tokenExpiresAt - 60000) {
    return cachedAccessToken;
  }

  try {
    const serviceAccount = JSON.parse(config.serviceAccountJson);
    const now = Math.floor(Date.now() / 1000);
    const header = { alg: 'RS256', typ: 'JWT' };
    const payload = {
      iss: serviceAccount.client_email,
      scope: 'https://www.googleapis.com/auth/androidpublisher',
      aud: 'https://oauth2.googleapis.com/token',
      iat: now,
      exp: now + 3600,
    };

    const message = `${base64Url(JSON.stringify(header))}.${base64Url(JSON.stringify(payload))}`;
    const privateKey = await crypto.subtle.importKey(
      'pkcs8',
      pemToArrayBuffer(serviceAccount.private_key),
      { name: 'RSASSA-PKCS1-v1_5', hash: 'SHA-256' },
      false,
      ['sign']
    );

    const signature = await crypto.subtle.sign(
      'RSASSA-PKCS1-v1_5',
      privateKey,
      new TextEncoder().encode(message)
    );
    const jwt = `${message}.${base64Url(signature)}`;

    const tokenResponse = await fetch('https://oauth2.googleapis.com/token', {
      method: 'POST',
      headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
      body: new URLSearchParams({
        grant_type: 'urn:ietf:params:oauth:grant-type:jwt-bearer',
        assertion: jwt,
      }),
    });

    if (!tokenResponse.ok) {
      console.error('Failed to get Google Play access token:', tokenResponse.status);
      return null;
    }

    const tokenData = await tokenResponse.json() as { access_token?: string; expires_in?: number };
    if (!tokenData.access_token || !tokenData.expires_in) return null;

    cachedAccessToken = tokenData.access_token;
    tokenExpiresAt = Date.now() + tokenData.expires_in * 1000;
    return cachedAccessToken;
  } catch (e) {
    console.error('Error getting Google Play access token:', e instanceof Error ? e.message : String(e));
    return null;
  }
}

const isLifetimeProduct = (productId: string) => productId.endsWith('_lifetime');

export async function verifyPurchase(
  config: GooglePlayConfig,
  productId: string,
  purchaseToken: string
): Promise<VerificationResult> {
  if (!config.serviceAccountJson) {
    return { isValid: false, error: 'service_account_not_configured' };
  }

  const accessToken = await getAccessToken(config);
  if (!accessToken) {
    return { isValid: false, error: 'failed_to_get_access_token' };
  }

  const encodedPackage = encodeURIComponent(config.packageName);
  const encodedProduct = encodeURIComponent(productId);
  const encodedToken = encodeURIComponent(purchaseToken);
  const url = isLifetimeProduct(productId)
    ? `https://androidpublisher.googleapis.com/androidpublisher/v3/applications/${encodedPackage}/purchases/products/${encodedProduct}/tokens/${encodedToken}`
    : `https://androidpublisher.googleapis.com/androidpublisher/v3/applications/${encodedPackage}/purchases/subscriptions/${encodedProduct}/tokens/${encodedToken}`;

  const response = await fetch(url, {
    headers: { Authorization: `Bearer ${accessToken}` },
  });

  if (!response.ok) {
    console.error('Google Play API error:', response.status);
    return { isValid: false, error: `api_error_${response.status}` };
  }

  const data = await response.json() as any;

  if (isLifetimeProduct(productId)) {
    return {
      isValid: data.purchaseState === 0,
      isLifetime: data.purchaseState === 0,
    };
  }

  const expiryTime = new Date(Number(data.expiryTimeMillis));
  return {
    isValid: Number.isFinite(expiryTime.getTime()) && expiryTime > new Date(),
    expiryTime: expiryTime.toISOString(),
    cancelReason: data.cancelReason || undefined,
  };
}

export async function acknowledgePurchase(
  config: GooglePlayConfig,
  productId: string,
  purchaseToken: string
): Promise<boolean> {
  const accessToken = await getAccessToken(config);
  if (!accessToken) return false;

  const encodedPackage = encodeURIComponent(config.packageName);
  const encodedProduct = encodeURIComponent(productId);
  const encodedToken = encodeURIComponent(purchaseToken);
  const url = isLifetimeProduct(productId)
    ? `https://androidpublisher.googleapis.com/androidpublisher/v3/applications/${encodedPackage}/purchases/products/${encodedProduct}/tokens/${encodedToken}:acknowledge`
    : `https://androidpublisher.googleapis.com/androidpublisher/v3/applications/${encodedPackage}/purchases/subscriptions/${encodedProduct}/tokens/${encodedToken}:acknowledge`;

  try {
    const response = await fetch(url, {
      method: 'POST',
      headers: {
        Authorization: `Bearer ${accessToken}`,
        'Content-Type': 'application/json',
      },
      body: JSON.stringify({ developerPayload: '' }),
    });
    return response.ok;
  } catch (e) {
    console.error('Google Play acknowledge error:', e instanceof Error ? e.message : String(e));
    return false;
  }
}
