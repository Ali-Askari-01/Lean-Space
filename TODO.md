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

## 6. Run Tests

```bash
cd leanspace
flutter test
```

---

## 7. Host Privacy Policy

Google Play requires a Privacy Policy URL. Options:
- GitHub Pages (free): create `docs/privacy-policy.html` and deploy
- Or any static hosting

Then add the URL to:
- Play Store listing → Privacy Policy field
- App Settings screen (link)

---

## 8. Create Missing Scripts (Optional)

These are referenced in docs but don't exist:
- `scripts/clean_build_env.ps1` — or remove the reference from `docs/GETTING-STARTED.md`
- `scripts/build_apk.ps1` — or remove the reference
- `scripts/seed.sh` — or remove the reference from `docs/LAUNCH-CHECKLIST.md`

---

## 9. Add AdMob (Deferred to v1.1)

When ready:
1. Add `google_mobile_ads` to `pubspec.yaml`
2. Create a bottom banner widget for free users
3. Gate on `EntitlementNotifier.isPro` to hide for Pro users

---

## 10. Final Pre-Launch Checklist

- [ ] All 5 new migrations applied to production Supabase
- [ ] All 4 Edge Functions deployed
- [ ] Pub/Sub uses `X-PubSub-Token` header
- [ ] Sentry DSN configured
- [ ] `rollover-cron` scheduled (hourly)
- [ ] `flutter test` passes
- [ ] Privacy Policy URL live and linked
- [ ] `feature_flags.dart` has `unlockAllFeatures = false` ✓ (already done)
- [ ] `feature_flags.dart` has `enableSubscriptions = true` ✓ (already done)
- [ ] No `Bloom Tracker` strings remain in the app
- [ ] Support email is `support@leanspace.app` everywhere
- [ ] Build a release APK and test on a real device

---

## 11. Formally Defer "Our Space" (Phase 3)

Update these docs to mark Phase 3 as deferred to v1.1:
- `execution/05-TICKETS.md`
- `execution/06-RISKS.md`

---

## 12. Decide Final Product Name

The app currently uses:
- **LeanSpace** in docs and support email
- **Daily Stitch** in `MaterialApp.title` (`main.dart:201`)
- **LeanSpace** in notification channels

Pick one and update `main.dart:201` line: `title: 'Daily Stitch'` → your final name.

---

Good luck with the launch!
