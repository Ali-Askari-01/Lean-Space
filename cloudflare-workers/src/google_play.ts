// Google Play Developer API v2 verification
// Uses service account to verify subscriptions

interface GooglePlayConfig {
  serviceAccountJson: string;
  packageName: string;
}

interface VerificationResult {
  isValid: boolean;
  expiryTime?: string;
  cancelReason?: string;
  error?: string;
}

// Cache for access tokens (valid for 1 hour)
let cachedAccessToken: string | null = null;
let tokenExpiresAt: number = 0;

async function getAccessToken(config: GooglePlayConfig): Promise<string | null> {
  // Return cached token if still valid
  if (cachedAccessToken && Date.now() < tokenExpiresAt - 60000) {
    return cachedAccessToken;
  }

  try {
    const serviceAccount = JSON.parse(config.serviceAccountJson);

    // Create JWT for OAuth2
    const now = Math.floor(Date.now() / 1000);
    const header = { alg: 'RS256', typ: 'JWT' };
    const payload = {
      iss: serviceAccount.client_email,
      scope: 'https://www.googleapis.com/auth/androidpublisher',
      aud: 'https://oauth2.googleapis.com/token',
      iat: now,
      exp: now + 3600,
    };

    // Sign JWT (simplified - in production use proper JWT library)
    const encoder = new TextEncoder();
    const headerBase64 = btoa(JSON.stringify(header)).replace(/=/g, '').replace(/\+/g, '-').replace(/\//g, '_');
    const payloadBase64 = btoa(JSON.stringify(payload)).replace(/=/g, '').replace(/\+/g, '-').replace(/\//g, '_');
    const message = `${headerBase64}.${payloadBase64}`;

    // Import private key for signing
    const privateKey = await crypto.subtle.importKey(
      'pkcs8',
      encoder.encode(serviceAccount.private_key),
      { name: 'RSASSA-PKCS1-v1_5', hash: 'SHA-256' },
      false,
      ['sign']
    );

    const signature = await crypto.subtle.sign('RSASSA-PKCS1-v1_5', privateKey, encoder.encode(message));
    const signatureBase64 = btoa(String.fromCharCode(...new Uint8Array(signature)))
      .replace(/=/g, '')
      .replace(/\+/g, '-')
      .replace(/\//g, '_');

    const jwt = `${message}.${signatureBase64}`;

    // Exchange JWT for access token
    const tokenResponse = await fetch('https://oauth2.googleapis.com/token', {
      method: 'POST',
      headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
      body: new URLSearchParams({
        grant_type: 'urn:ietf:params:oauth:grant-type:jwt-bearer',
        assertion: jwt,
      }),
    });

    if (!tokenResponse.ok) {
      console.error('Failed to get access token:', await tokenResponse.text());
      return null;
    }

    const tokenData = await tokenResponse.json() as any;
    cachedAccessToken = tokenData.access_token;
    tokenExpiresAt = Date.now() + (tokenData.expires_in * 1000);

    return cachedAccessToken;
  } catch (e) {
    console.error('Error getting access token:', e);
    return null;
  }
}

export async function verifyPurchase(
  env: GooglePlayConfig,
  productId: string,
  purchaseToken: string
): Promise<VerificationResult> {
  if (!env.serviceAccountJson) {
    return { isValid: false, error: 'service_account_not_configured' };
  }

  try {
    const accessToken = await getAccessToken(env);
    if (!accessToken) {
      return { isValid: false, error: 'failed_to_get_access_token' };
    }

    // Map product ID to subscription ID
    const subscriptionId = productId;

    // Call Google Play Developer API v3
    const url = `https://androidpublisher.googleapis.com/androidpublisher/v3/applications/${env.packageName}/purchases/subscriptions/${subscriptionId}/tokens/${purchaseToken}`;

    const response = await fetch(url, {
      headers: { Authorization: `Bearer ${accessToken}` },
    });

    if (!response.ok) {
      const errorText = await response.text();
      console.error('Google Play API error:', response.status, errorText);
      return { isValid: false, error: `api_error_${response.status}` };
    }

    const data = await response.json() as any;

    // Check if subscription is active
    const expiryTime = new Date(parseInt(data.expiryTimeMillis));
    const now = new Date();
    const isValid = expiryTime > now;

    return {
      isValid,
      expiryTime: expiryTime.toISOString(),
      cancelReason: data.cancelReason || undefined,
    };
  } catch (e) {
    console.error('Verification error:', e);
    return { isValid: false, error: 'verification_failed' };
  }
}

export async function acknowledgePurchase(
  env: GooglePlayConfig,
  productId: string,
  purchaseToken: string
): Promise<boolean> {
  if (!env.serviceAccountJson) {
    return false;
  }

  try {
    const accessToken = await getAccessToken(env);
    if (!accessToken) {
      return false;
    }

    const subscriptionId = productId;
    const url = `https://androidpublisher.googleapis.com/androidpublisher/v3/applications/${env.packageName}/purchases/subscriptions/${subscriptionId}/tokens/${purchaseToken}:acknowledge`;

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
    console.error('Acknowledge error:', e);
    return false;
  }
}
