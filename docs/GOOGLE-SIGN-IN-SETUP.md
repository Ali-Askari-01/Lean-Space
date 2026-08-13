# Google Sign-In Setup (LeanSpace + Cloudflare Worker)

Your **Web** client ID goes in both the **Cloudflare Worker** environment and the **Flutter** `env.json`.

| Client | Where it goes |
|--------|----------------|
| Web `YOUR_WEB_CLIENT_ID` | Worker `wrangler.toml` → `GOOGLE_CLIENT_ID` var + Flutter `env.json` |
| Android `YOUR_ANDROID_CLIENT_ID` | Google Cloud only (package + SHA-1) |

**Never commit secrets to git.** Use Wrangler secrets for sensitive values.

---

## A. Google Cloud Console — Web client

1. [Google Cloud Console](https://console.cloud.google.com/) → **APIs & Services → Credentials**
2. Open your **Web application** client (the one with the secret)

### Authorized JavaScript origins

Add:

```
https://daily-stitch-api.your-subdomain.workers.dev
```

(Optional for local web testing later: `http://localhost:8787`)

> JavaScript origins are **only for the Web client**. The Android client form does **not** use them.

### Authorized redirect URIs

No redirect URIs needed — the Worker verifies ID tokens directly via Google's tokeninfo endpoint.

---

## B. Google Cloud Console — Android client

- **Package name:** `com.leanspace`
- **SHA-1:** `YOUR_SHA1_FINGERPRINT`

---

## C. Cloudflare Worker Configuration

1. Set the `GOOGLE_CLIENT_ID` variable in `wrangler.toml`:
   ```toml
   [vars]
   GOOGLE_CLIENT_ID = "YOUR_WEB_CLIENT_ID.apps.googleusercontent.com"
   ```

2. Deploy the Worker:
   ```bash
   cd cloudflare-workers
   npx wrangler deploy
   ```

3. Create `leanspace/env.json` with your Worker URL and client ID:
   ```json
   {
     "API_BASE_URL": "https://daily-stitch-api.your-subdomain.workers.dev",
     "GOOGLE_CLIENT_ID": "YOUR_WEB_CLIENT_ID.apps.googleusercontent.com"
   }
   ```

---

## D. Rebuild app

```powershell
cd leanspace
flutter build apk --debug --dart-define-from-file=env.json
adb install -r build\app\outputs\flutter-apk\app-debug.apk
```

---

## Troubleshooting

| Problem | Fix |
|--------|-----|
| `invalid_google_token` in app | Verify `GOOGLE_CLIENT_ID` in `wrangler.toml` matches your Web client ID |
| `missing_id_token` error | Ensure Google Sign-In `serverClientId` matches the Web client ID |
| `redirect_uri_mismatch` | Not applicable — Worker verifies tokens directly |
| Wrong credentials in Worker | Use **Web** client ID, not Android client ID |
