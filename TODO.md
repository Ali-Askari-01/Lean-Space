# TODO — Things You Need To Do

Everything below requires **your action** — things I cannot do from the codebase.

---

## 1. Apply New Migrations to Supabase

Run these in order against your Supabase project (SQL Editor or CLI):

```
20260714000000_purchase_token_unique.sql
20260714000001_text_length_constraints.sql
20260714000002_fix_orphan_cascade.sql
20260714000003_buddy_toctou_fixes.sql
20260714000004_updated_at_and_triggers.sql
```

**Verify** this returns `false`:
```sql
SELECT has_function_privilege('authenticated', 'grant_promotional_pro(integer)', 'execute');
```

---

## 2. Deploy Edge Functions

```bash
supabase functions deploy delete-account
supabase functions deploy verify-play-purchase
supabase functions deploy play-rtdn
supabase functions deploy rollover-cron
```

---

## 3. Update Pub/Sub Push Configuration

In Google Cloud Console, update your Pub/Sub push subscription:
- Remove `?token=PLAY_PUBSUB_TOKEN` from the URL
- Add a custom header: `X-PubSub-Token: PLAY_PUBSUB_TOKEN`

---

## 4. Set Up Sentry

1. Go to [sentry.io](https://sentry.io) and create a project (platform: Flutter)
2. Copy your DSN
3. Build with: `flutter build apk --dart-define=SENTRY_DSN=your_dsn_here`

---

## 5. Schedule rollover-cron

In Supabase Dashboard → Edge Functions → Schedules:
- Create a schedule for `rollover-cron`
- Frequency: **every hour** (`0 * * * *`)

This also serves as a heartbeat to keep your Supabase project from auto-pausing.

---

## 6. Host Privacy Policy

Google Play requires a Privacy Policy URL. Options:
- GitHub Pages (free): create `docs/privacy-policy.html` and deploy
- Or any static hosting

Then add the URL to:
- Play Store listing → Privacy Policy field
- App Settings screen (link)

---

## 7. Add AdMob (Deferred to v1.1)

When ready:
1. Add `google_mobile_ads` to `pubspec.yaml`
2. Create a bottom banner widget for free users
3. Gate on `EntitlementNotifier.isPro` to hide for Pro users

---

## 8. Final Pre-Launch Checklist

- [ ] All 5 new migrations applied to production Supabase
- [ ] All 4 Edge Functions deployed
- [ ] Pub/Sub uses `X-PubSub-Token` header
- [ ] `rollover-cron` scheduled (hourly)
- [x] `flutter test` passes ✓ (35/35 tests pass)
- [x] Privacy Policy hosted at `docs/privacy-policy.html` ✓ (deploy via GitHub Pages)
- [x] Terms of Service hosted at `docs/terms.html` ✓ (deploy via GitHub Pages)
- [x] `feature_flags.dart` has `unlockAllFeatures = false` ✓
- [x] `feature_flags.dart` has `enableSubscriptions = true` ✓
- [x] No `Bloom Tracker` strings remain in the app ✓ (replaced with "Daily Stitch")
- [x] Support email is `support@leanspace.app` everywhere ✓
- [x] Debug APK builds successfully ✓ (`build/app/outputs/flutter-apk/app-debug.apk`)
- [ ] Build a **release** APK and test on a real device

---

## Completed (no longer needed)

- ~~Create Missing Scripts~~ — `clean_build_env.ps1` and `build_apk.ps1` already exist
- ~~Formally Defer "Our Space" (Phase 3)~~ — Done in `execution/05-TICKETS.md` and `execution/06-RISKS.md`
- ~~Decide Final Product Name~~ — Standardized to **Daily Stitch** (`AppConstants.appName`)
- ~~Set Up Sentry~~ — Removed `sentry_flutter` (incompatible with Kotlin 2.2.20). Re-add post-launch when plugin updates.
- ~~Host Privacy Policy~~ — Created `docs/privacy-policy.html` and `docs/terms.html`. Enable GitHub Pages (Settings → Pages → `/docs` folder).

---

Good luck with the launch!
