// Shared Google Play Developer API helpers for Edge Functions.

export interface PlaySubscriptionInfo {
  productId: string;
  purchaseToken: string;
  expiryTime: string;
  isActive: boolean;
}

interface ServiceAccount {
  client_email: string;
  private_key: string;
  token_uri?: string;
}

let _cachedToken: { token: string; expiresAt: number } | null = null;

function base64UrlEncode(data: Uint8Array): string {
  const str = btoa(String.fromCharCode(...data));
  return str.replace(/\+/g, "-").replace(/\//g, "_").replace(/=+$/, "");
}

async function importPrivateKey(pem: string): Promise<CryptoKey> {
  const pemContents = pem
    .replace(/-----BEGIN PRIVATE KEY-----/, "")
    .replace(/-----END PRIVATE KEY-----/, "")
    .replace(/\s/g, "");
  const binary = Uint8Array.from(atob(pemContents), (c) => c.charCodeAt(0));
  return crypto.subtle.importKey(
    "pkcs8",
    binary,
    { name: "RSASSA-PKCS1-v1_5", hash: "SHA-256" },
    false,
    ["sign"],
  );
}

async function getAccessToken(sa: ServiceAccount): Promise<string> {
  const now = Math.floor(Date.now() / 1000);
  if (_cachedToken && _cachedToken.expiresAt > now + 60) {
    return _cachedToken.token;
  }

  const header = base64UrlEncode(
    new TextEncoder().encode(JSON.stringify({ alg: "RS256", typ: "JWT" })),
  );
  const payload = base64UrlEncode(
    new TextEncoder().encode(
      JSON.stringify({
        iss: sa.client_email,
        scope: "https://www.googleapis.com/auth/androidpublisher",
        aud: sa.token_uri ?? "https://oauth2.googleapis.com/token",
        iat: now,
        exp: now + 3600,
      }),
    ),
  );

  const key = await importPrivateKey(sa.private_key);
  const signature = await crypto.subtle.sign(
    "RSASSA-PKCS1-v1_5",
    key,
    new TextEncoder().encode(`${header}.${payload}`),
  );
  const jwt = `${header}.${payload}.${base64UrlEncode(new Uint8Array(signature))}`;

  const tokenRes = await fetch(sa.token_uri ?? "https://oauth2.googleapis.com/token", {
    method: "POST",
    headers: { "Content-Type": "application/x-www-form-urlencoded" },
    body: new URLSearchParams({
      grant_type: "urn:ietf:params:oauth:grant-type:jwt-bearer",
      assertion: jwt,
    }),
  });

  if (!tokenRes.ok) {
    const err = await tokenRes.text();
    throw new Error(`Google OAuth failed: ${err}`);
  }

  const { access_token, expires_in } = await tokenRes.json();
  _cachedToken = {
    token: access_token,
    expiresAt: now + (expires_in ?? 3600),
  };

  return access_token;
}

function loadServiceAccount(): ServiceAccount {
  const raw = Deno.env.get("GOOGLE_SERVICE_ACCOUNT_JSON");
  if (!raw) throw new Error("GOOGLE_SERVICE_ACCOUNT_JSON not configured");
  return JSON.parse(raw) as ServiceAccount;
}

/**
 * Verify a subscription via purchases.subscriptionsv2.get
 * https://developers.google.com/android-publisher/api-ref/rest/v3/purchases.subscriptionsv2/get
 */
export async function verifyPlaySubscription(
  packageName: string,
  purchaseToken: string,
): Promise<PlaySubscriptionInfo | null> {
  const sa = loadServiceAccount();
  const token = await getAccessToken(sa);

  const url =
    `https://androidpublisher.googleapis.com/androidpublisher/v3/applications/${packageName}/purchases/subscriptionsv2/tokens/${encodeURIComponent(purchaseToken)}`;

  const controller = new AbortController();
  const timeoutId = setTimeout(() => controller.abort(), 10000);
  try {
    const res = await fetch(url, {
      headers: { Authorization: `Bearer ${token}` },
      signal: controller.signal,
    });
    clearTimeout(timeoutId);

    if (res.status === 404) return null;
    if (!res.ok) {
      const err = await res.text();
      throw new Error(`Play API error ${res.status}: ${err}`);
    }
    // ... rest of the response handling
  } catch (e) {
    clearTimeout(timeoutId);
    throw e;
  }

  const data = await res.json();
  const lineItem = data.lineItems?.[0];
  if (!lineItem) return null;

  const productId = lineItem.productId as string;
  const expiryTime = lineItem.expiryTime as string;
  const state = data.subscriptionState as string;

  const activeStates = new Set([
    "SUBSCRIPTION_STATE_ACTIVE",
    "SUBSCRIPTION_STATE_IN_GRACE_PERIOD",
  ]);

  return {
    productId,
    purchaseToken,
    expiryTime,
    isActive: activeStates.has(state),
  };
}
