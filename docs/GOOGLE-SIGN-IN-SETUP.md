# Google Sign-In Setup (LeanSpace + Supabase)

Your **Web** client credentials go in **Supabase** (not in the Flutter app).

| Client | Where it goes |
|--------|----------------|
| Web `YOUR_WEB_CLIENT_ID` + secret | Supabase → Auth → Google provider |
| Android `YOUR_ANDROID_CLIENT_ID` | Google Cloud only (package + SHA-1) |

**Never commit the Client Secret to git.** Paste it only in the Supabase dashboard.

---

## A. Google Cloud Console — Web client

1. [Google Cloud Console](https://console.cloud.google.com/) → **APIs & Services → Credentials**
2. Open your **Web application** client (the one with the secret)

### Authorized JavaScript origins

Add:

```
https://qjtdoedjjqlxfasnpspj.supabase.co
```

(Optional for local web testing later: `http://localhost`)

> JavaScript origins are **only for the Web client**. The Android client form does **not** use them.

### Authorized redirect URIs

Add **exactly**:

```
https://qjtdoedjjqlxfasnpspj.supabase.co/auth/v1/callback
```

---

## B. Google Cloud Console — Android client

- **Package name:** `com.leanspace`
- **SHA-1:** `YOUR_SHA1_FINGERPRINT`

---

## C. Supabase Dashboard

1. **Authentication → Providers → Google** → Enable  
   - Client ID: Web client (`YOUR_WEB_CLIENT_ID`)
   - Client Secret: Web client secret (`YOUR_CLIENT_SECRET`)
2. **Authentication → URL Configuration → Redirect URLs** → add:  
   `com.leanspace://login-callback`

### Fix email sign-up rate limit

If you see **"email rate limit exceeded"**:

1. **Authentication → Providers → Email** → turn **off** “Confirm email” (instant sign-up while testing)  
2. Wait ~1 hour for Supabase’s email rate limit to reset, **or** use **Continue with Google**  
3. Optional: **Authentication → Rate Limits** — increase limits on paid plans

### Run profile fix migration (once)

In SQL Editor, run:

`supabase/migrations/20250622100000_users_self_insert.sql`

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
| `email rate limit exceeded` | Wait 1h, disable confirm email, or use Google |
| Google works, email doesn't | Rate limit or email confirmation — see above |
| `redirect_uri_mismatch` | Check Web redirect URI + Supabase redirect URLs |
| Wrong credentials in Supabase | Use **Web** ID/secret, not Android client ID |
