# LeanSpace Mobile Build + Authentication Implementation Plan

## Purpose

This is an execution plan for making the Flutter Android app build, install, run on a physical phone, and support working email/password and Google sign-in. It is written for a low-level coding model: execute each phase in order, stop at failed checkpoints, record the exact error, and do not skip verification.

The plan is based on two independent audits of the current repository. Audit 1 covered Flutter, Android, Gradle, SDK, dependency, manifest, signing, and device-run paths. Audit 2 covered configuration, API reachability, email auth, Google auth, session handling, Worker routes, and runtime trust boundaries. A final cross-check compared both audits against the existing security audit artifact and the actual local toolchain.

## Current state and confirmed evidence

### Confirmed good

- `flutter analyze --no-pub --no-fatal-infos` completed with `No issues found`.
- Dart SDK is 3.12.2 and Flutter is the stable SDK recorded by the project.
- Android SDK is installed at `C:\Android\Sdk`; platforms 30, 34, 35, and 36 are present.
- NDK `28.2.13676358` is installed.
- JDK 17 is available at `C:\Users\DELL\scoop\apps\temurin17-jdk\current`.
- `applicationId`, Kotlin package, and `google-services.json` package are `com.leanspace.leanspace`.
- The Web Google client ID is consistently used by the Flutter environment, Worker configuration, and `google-services.json`.
- Session tokens are stored with `flutter_secure_storage`, not ordinary preferences.
- Worker SQL uses bound parameters in the reviewed routes and protected API routes derive identity from the validated session.

### Confirmed blockers or high-risk gaps

1. The Android build never reaches compilation because the Gradle 8.14 wrapper cache contains an incomplete `.part` download and a locked `gradle-8.14-all.zip` access path. The wrapper waited 120 seconds for exclusive access and failed. This is the first blocker to remove.
2. Gradle failed both from the default cache and an explicit project-local cache when network/DNS was restricted. A complete wrapper distribution must be downloaded once with working network access, using one Gradle process only.
3. The configured API health endpoint could not be reached from the audit environment. Until `/health` responds, both email auth and the Worker half of Google auth are unverified and may fail regardless of Flutter correctness.
4. `GETTING-STARTED.md` tells the user to run `flutter run` without `--dart-define-from-file=env.json`, while the app requires `API_BASE_URL` and `GOOGLE_CLIENT_ID`. Standardize every run/build instruction.
5. Google setup documentation says the Android package is `com.leanspace`, but the real package is `com.leanspace.leanspace`. Google Cloud must contain the exact package plus the SHA-1 for every build variant.
6. Debug and release signing fingerprints are different. The current local debug SHA-1 and release keystore SHA-1 must both be registered in the correct Google Cloud Android OAuth client.
7. Release signing is configured through `android/key.properties`; the file exists locally, but the release build has not been verified. Debug APK and release APK must be tested separately because Google sign-in uses different certificates.
8. The Worker has no password-reset flow. This does not prevent current email sign-in, but it is an authentication completeness gap and must be explicitly accepted or implemented before launch.
9. The Worker URL, production environment, D1 migrations, and required secrets have not been dynamically verified in this audit. Documentation and `wrangler.toml` are not proof of deployment.
10. Non-English ARB files are missing four newer paywall keys. Static analysis currently passes, but locale generation and runtime localization need a separate check after any `pub get`/gen-l10n operation.
11. The repository has extensive pre-existing modifications. Do not reset, clean, stage, or overwrite unrelated work. Work only on the requested implementation files and preserve the current changes.

## Non-negotiable execution rules

1. Work from `C:\Users\DELL\Desktop\todo and habit tracker\Lean-Space`.
2. Run Flutter commands from `leanspace`.
3. Run Worker commands from `cloudflare-workers`.
4. Use JDK 17, not JDK 25, for Android/Gradle.
5. Use one build process at a time. Do not run Flutter and Gradle builds in parallel.
6. Never delete a Gradle cache while a Java/Gradle process is running.
7. Do not rotate, print, commit, or paste secrets. Redact tokens, passwords, service-account JSON, and full private URLs in logs.
8. Do not deploy migrations or Worker code until local checks pass and the deployment target is confirmed.
9. Do not declare authentication fixed because a screen opens. A successful test must reach the real API, create a session, call `/api/auth/me`, survive an app restart, and sign out.
10. After every fix, rerun the checkpoint for that phase before moving on.

## Phase 0 — Freeze evidence and isolate the work

### 0.1 Record baseline

Run and save the output locally, without committing generated logs:

```powershell
cd "C:\Users\DELL\Desktop\todo and habit tracker\Lean-Space"
git status --short --branch
git rev-parse HEAD
cd leanspace
$env:JAVA_HOME = "C:\Users\DELL\scoop\apps\temurin17-jdk\current"
$env:ANDROID_HOME = "C:\Android\Sdk"
$env:DART_SUPPRESS_ANALYTICS = "true"
java -version
flutter --version
flutter doctor -v
adb devices -l
flutter analyze --no-pub --no-fatal-infos
```

If `adb devices` does not show a row with state `device`, fix USB debugging/authorization before testing the app. `unauthorized`, `offline`, or an empty list is a device setup failure, not an app failure.

### 0.2 Create a safe diagnostic worktree/branch

If a branch is permitted, create a branch named `codex/mobile-build-auth-fix`. If not, keep the current branch and make no unrelated edits. Do not use `git reset --hard` or `git checkout --`.

### 0.3 Validate local configuration without printing values

```powershell
cd leanspace
Test-Path env.json
Test-Path android\key.properties
Test-Path android\app\google-services.json
Get-Content env.json | ConvertFrom-Json | ForEach-Object {
  $_.PSObject.Properties | ForEach-Object { "$($_.Name)=<configured>" }
}
```

Required result: all three files exist locally; `env.json` has non-placeholder values; `key.properties` points to an existing keystore; `google-services.json` has the exact Android package.

## Phase 1 — Repair the Android/Gradle build bootstrap

### 1.1 Stop competing processes safely

```powershell
Get-Process java,dart,gradle -ErrorAction SilentlyContinue |
  Select-Object Id,ProcessName,Path
```

If an old build is active, stop only the stale build process after confirming it is not a user-needed session. Never remove a lock file while a process owns it.

### 1.2 Select a writable Gradle home

Use one explicit path for all commands in this phase:

```powershell
$env:GRADLE_USER_HOME = "C:\Users\DELL\.gradle"
$env:JAVA_HOME = "C:\Users\DELL\scoop\apps\temurin17-jdk\current"
```

If this path is denied, use a project-local path such as `C:\Users\DELL\Desktop\todo and habit tracker\Lean-Space\.gradle-local`, not `C:\.gradle` and not a shared temporary cache.

### 1.3 Resolve the stale wrapper download

Inspect the wrapper directory first:

```powershell
$d = Join-Path $env:GRADLE_USER_HOME "wrapper\dists\gradle-8.14-all"
Get-ChildItem $d -Recurse -Force -ErrorAction SilentlyContinue |
  Select-Object FullName,Length,LastWriteTime
```

The current evidence shows `gradle-8.14-all.zip.part` and a lock file, which means the prior download was interrupted. After confirming no Gradle/Java build is running, remove only the contents of the specific hash directory for this wrapper distribution, then rerun:

```powershell
cd leanspace\android
.\gradlew.bat --version --no-daemon
```

Allow the wrapper download to finish. Do not cancel it. If DNS or network fails, fix the machine network/proxy/VPN or download the exact Gradle 8.14 distribution through an approved network path; do not change the project version merely to avoid the download.

### 1.4 Verify the toolchain before project compilation

```powershell
.\gradlew.bat --version --no-daemon
```

Acceptance criteria:

- Gradle reports 8.14.
- JVM is JDK 17.
- The command exits 0.
- No lock timeout, permission error, DNS error, or partial-download message appears.

### 1.5 Check project version compatibility

The project currently pins AGP 8.11.1, Kotlin 2.2.20, Gradle 8.14, Java 17, Flutter stable, compile/target SDK from Flutter, and NDK 28.2.13676358. Do not downgrade or upgrade blindly. Run:

```powershell
cd ..
flutter pub get
flutter build apk --debug --dart-define-from-file=env.json -v
```

If Gradle now reaches configuration and reports a version incompatibility:

1. Capture the exact first `FAILURE` and `Caused by` block.
2. Compare `leanspace/android` with a fresh project generated by the same Flutter SDK.
3. Align AGP/Gradle/Kotlin to the generated template or to the exact compatibility requirement in the error.
4. Change only the minimum version/configuration required.
5. Rerun `gradlew --version`, then the debug build.

Do not edit `compileSdk`, `targetSdk`, `minSdk`, or NDK until the error specifically identifies that setting.

### 1.6 Debug APK acceptance gate

The phase is complete only when all commands exit 0:

```powershell
cd leanspace
flutter analyze --no-pub --no-fatal-infos
flutter test --no-pub
flutter build apk --debug --dart-define-from-file=env.json
Test-Path build\app\outputs\flutter-apk\app-debug.apk
adb install -r build\app\outputs\flutter-apk\app-debug.apk
adb shell monkey -p com.leanspace.leanspace 1
```

If installation fails, classify the error as device/ADB, signature conflict, minSdk/device API mismatch, storage, or APK packaging. Do not change Dart code for an ADB error.

## Phase 2 — Make runtime configuration deterministic

### 2.1 Standardize commands and documentation

Update all run/build instructions so they use the same configuration mechanism:

```powershell
flutter run --dart-define-from-file=env.json
flutter build apk --debug --dart-define-from-file=env.json
flutter build apk --release --dart-define-from-file=env.json
flutter build appbundle --release --dart-define-from-file=env.json
```

Remove contradictory instructions that say plain `flutter run` is sufficient. Keep `env.json.example` placeholder-only and keep real `env.json` ignored.

### 2.2 Validate URL and Worker reachability from the same machine

Use the actual configured URL without printing it into the plan or logs:

```powershell
$cfg = Get-Content env.json | ConvertFrom-Json
$base = $cfg.API_BASE_URL.TrimEnd('/')
try {
  $r = Invoke-WebRequest "$base/health" -UseBasicParsing -TimeoutSec 20
  $r.StatusCode
  $r.Content
} catch {
  $_.Exception.Message
}
```

Required result: HTTPS connection succeeds and JSON contains `ok: true`.

If it fails, check in this order:

1. DNS resolution for the Worker host.
2. TLS certificate and system clock.
3. Worker deployment/environment and hostname.
4. Worker route `/health`.
5. Cloudflare account/zone status and deployment logs.
6. Local firewall, proxy, VPN, or DNS filtering.

Do not debug email or Google sign-in until `/health` succeeds.

### 2.3 Verify production D1 and Worker secrets

Using the authorized Cloudflare account and the intended environment only, verify names and bindings without printing values:

- `DB` binding points to the intended D1 database.
- Ordered migrations `0001`, `0002`, and `0003` are applied.
- `GOOGLE_CLIENT_ID` is the Web client ID.
- `PLAY_PACKAGE_NAME` is `com.leanspace.leanspace`.
- `CRON_SECRET` exists and cron rejects requests when it is absent/wrong.
- `PLAY_PUBSUB_TOKEN` exists and the webhook rejects requests when it is absent/wrong.
- `GOOGLE_SERVICE_ACCOUNT_JSON` exists only as a Worker secret and has Google Play Android Publisher access.

Do not put service-account JSON, cron tokens, or Pub/Sub tokens in Flutter or `wrangler.toml`.

## Phase 3 — Fix and prove email/password authentication

### 3.1 Backend contract checks

Test against local/staging or the approved deployed Worker with disposable accounts:

| Case | Expected result |
|---|---|
| Valid signup | 2xx, session token, user object |
| Duplicate signup | Stable 409/error code; no second account |
| Invalid email | 400; no database write |
| Password under 8 chars | 400; no database write |
| Password over max length | 400; no database write |
| Valid signin | 2xx, new session token |
| Wrong password | 401; no token |
| Unknown email | 401; no token |
| Google-only account using password | Clear `use_google_signin` response |
| `/api/auth/me` without token | 401 |
| `/api/auth/me` with malformed/expired token | 401 |
| Signout | 2xx; token no longer works |
| Malformed JSON | 4xx, not an internal stack/error leak |
| Repeated auth attempts | 429 after configured limit |

If signup succeeds but signin fails, inspect the D1 row for the disposable user: email normalization, password hash presence/format, and whether the Worker is connected to the same database/environment used by the app.

### 3.2 Client session checks

Review and, if needed, harden `leanspace/lib/services/api_client.dart`:

1. `setSessionToken` must reject missing/non-string/empty session tokens.
2. If `/api/auth/me` fails after storing a token, delete the token and emit signed-out state; do not leave a poisoned session.
3. `init()` must clear expired/invalid tokens and leave the app on `/auth`.
4. A 401 from any protected request must clear the local session exactly once and redirect safely.
5. Signout must be idempotent when the network is offline.
6. Request timeout and malformed JSON errors must become stable user-facing error codes.
7. Email should be trimmed and normalized consistently between signup, signin, and account lookup.

Add unit tests for token persistence, invalid-token cleanup, 401 behavior, malformed API responses, timeout behavior, and signout.

### 3.3 Client UI checks

On the phone, verify:

1. App opens to onboarding/auth when no session exists.
2. Sign-up validation works with keyboard and small screens.
3. Valid signup reaches My Day without a restart.
4. Force-close and reopen preserves the session.
5. Sign out returns to auth and cannot reopen protected screens with back navigation.
6. Wrong credentials show a useful localized message and do not spin forever.
7. Offline/API-down state shows retryable feedback rather than a blank page.

## Phase 4 — Fix and prove Google sign-in

### 4.1 Google Cloud identity matrix

There must be one explicit table maintained outside secrets:

| Build | Package | Certificate | Google configuration |
|---|---|---|---|
| Debug APK | `com.leanspace.leanspace` | local debug SHA-1 | Android OAuth client |
| Local release APK | `com.leanspace.leanspace` | release keystore SHA-1 | Android OAuth client |
| Play-distributed build | `com.leanspace.leanspace` | Play App Signing SHA-1 | Android OAuth client |
| Server token audience | n/a | n/a | Web OAuth client ID |

Register every required SHA-1 under the exact package. Correct the documentation typo from `com.leanspace` to `com.leanspace.leanspace`.

### 4.2 Verify local fingerprints

```powershell
keytool -list -v -keystore "$env:USERPROFILE\.android\debug.keystore" -storepass android -alias androiddebugkey
keytool -list -v -keystore <release-keystore-path> -storepass <password> -alias <alias>
```

Never place passwords in command history or commit them. Compare only the SHA-1 values with Google Cloud.

### 4.3 Verify Flutter Google client configuration

The intended design is:

- `GoogleSignIn(serverClientId: <Web client ID>)` in Flutter.
- Android package/certificate registration in Google Cloud.
- Worker verifies the received ID token audience against the same Web client ID.
- Worker validates token response status, issuer, expiry, subject, email, and verified email.

Do not replace the Web client ID with the Android client ID in `env.json` or Worker configuration. Do not add a fake redirect URI to the Worker; this flow sends an ID token to the Worker rather than exchanging an authorization code.

### 4.4 Device test matrix

Run the debug APK first:

1. Clear app data: `adb shell pm clear com.leanspace.leanspace`.
2. Launch with valid `env.json` defines.
3. Tap Continue with Google.
4. Select a real test Google account.
5. Confirm account returns to the app.
6. Confirm Worker returns 2xx and `/api/auth/me` succeeds.
7. Force-close/reopen and confirm the session remains.
8. Sign out and repeat with a second disposable account.
9. Repeat the same matrix using a release APK.

Classify failures by exact symptom:

- `DEVELOPER_ERROR` / status 10: package or SHA-1 registration mismatch.
- Account picker opens then returns no account: device Play Services/account issue or client initialization.
- `no_id_token`: wrong/missing Web `serverClientId` or Google configuration.
- `invalid_google_token`: Worker audience mismatch, wrong Worker environment, expired token, or tokeninfo failure.
- Network error: Worker URL/DNS/TLS/connectivity.
- Session created but app stays on auth: client token storage/router refresh issue.

### 4.5 Backend Google hardening tests

Add tests for:

- Missing ID token.
- Oversized token.
- Invalid token.
- Expired token.
- Wrong audience.
- Wrong issuer.
- Unverified email.
- Valid token for existing Google account.
- Valid token matching an existing email account.
- Repeated valid login creating valid independent sessions.
- No token or Google response details leaked in user-facing errors or logs.

If the Worker depends on Google `tokeninfo`, add a timeout and stable error handling. Do not log full tokens or full Google responses.

## Phase 5 — Release signing and release build

### 5.1 Validate signing configuration

Confirm:

- `android/key.properties` is ignored and not tracked.
- Store file exists.
- Alias and passwords work.
- Release package remains `com.leanspace.leanspace`.
- Version code/version name are incremented for every installable release.

### 5.2 Build and install release APK

```powershell
cd leanspace
flutter clean
flutter pub get
flutter build apk --release --dart-define-from-file=env.json
adb install -r build\app\outputs\flutter-apk\app-release.apk
```

Test cold start, API access, email login, Google login, signout, notifications, widget/deep links, and process restart. R8/minification must not remove Google Sign-In, billing, notification, or widget classes.

### 5.3 Build AAB

```powershell
flutter build appbundle --release --dart-define-from-file=env.json
Test-Path build\app\outputs\bundle\release\app-release.aab
```

Use Play internal testing before production. Add the Play App Signing SHA-1 to Google Cloud before testing Google sign-in from Play.

## Phase 6 — Regression and loophole audit

### 6.1 Repeat Audit 1

Re-run:

- `flutter analyze`
- `flutter test`
- debug APK build/install
- release APK build/install
- AAB build
- Gradle wrapper version
- `adb devices`
- manifest/package/signing checks
- environment placeholder checks
- no tracked secrets check

Every original Audit 1 finding must have a status: fixed, verified not a blocker, or blocked by external access. No finding may be silently dropped.

### 6.2 Repeat Audit 2

Re-run:

- Worker `/health`
- signup/signin/signout/me
- invalid and expired session behavior
- Google debug and release sign-in
- Worker audience/issuer/expiry validation
- API-down/offline behavior
- D1 migration and required secret verification
- rate-limit checks
- account deletion/session invalidation
- cross-user authorization tests with two disposable users

### 6.3 Cross-audit closure table

Create a table with these columns before declaring completion:

| Finding from Audit 1/2 | Evidence before | Change/test | Evidence after | Status |
|---|---|---|---|---|

Completion requires every row to be `closed` or explicitly `blocked` with the owner/action needed. “Looks fixed” is not an acceptable status.

## Recommended implementation order

1. Repair Gradle cache/wrapper and prove `gradlew --version`.
2. Run clean debug APK build/install.
3. Standardize `env.json` build/run commands.
4. Verify Worker `/health` and deployment/D1/secrets.
5. Verify email signup/signin/me/signout with disposable accounts.
6. Harden client session rollback/error handling and add tests.
7. Register exact debug/release/Play SHA-1 values and fix Google docs.
8. Verify Google sign-in on debug APK.
9. Verify Google sign-in on release APK and Play internal track.
10. Fix localization key drift and run generated-locale checks.
11. Run the complete two-audit regression matrix.
12. Only then publish or hand off the build.

## Definition of done

The app is ready for device use only when:

- Debug and release APKs build from a clean checkout with JDK 17.
- APK installs and launches on the target phone.
- `flutter analyze` and `flutter test` pass.
- The app starts with valid external configuration and gives a clear setup error when configuration is missing.
- `/health` is reachable from the same phone/network.
- Email signup, signin, session persistence, invalid-session recovery, and signout pass.
- Google sign-in passes with debug, release, and Play signing certificates as applicable.
- The Worker receives and validates the correct Web audience.
- No auth token, password, service-account credential, or webhook secret is shipped in the client.
- Required D1 migrations and Worker secrets are verified in the actual target environment.
- Every finding from both audits is closed or explicitly documented as externally blocked.
