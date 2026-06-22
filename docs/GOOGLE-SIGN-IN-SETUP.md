# Google Sign-In Setup (LeanSpace + Supabase)

Your **Web** client credentials go in **Supabase** (not in the Flutter app).

| Client | Where it goes |
|--------|----------------|
| Web `725587084001-c8e06tl9c5g41nbmcrhioc31rnk5k16j...` + secret | Supabase → Auth → Google provider |
| Android `725587084001-gq1f6e223rdd135grid4vm1dftdlmabf...` | Google Cloud only (package + SHA-1) |

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
- **SHA-1:** `E8:7B:AC:81:D1:44:31:BA:57:2F:99:A9:4F:8B:46:DC:53:A7:16:E6`

---

## C. Supabase Dashboard

1. **Authentication → Providers → Google** → Enable  
   - Client ID: Web client (`...c8e06tl9c5g41nbmcrhioc31rnk5k16j...`)  
   - Client Secret: Web client secret (`GOCSPX-...`)  
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
