# Building Daily Stitch for Google Play Store

This guide walks you through generating the release AAB and preparing all store assets.

## Prerequisites Checklist

- [ ] Flutter SDK installed (`flutter --version`)
- [ ] Android SDK / Android Studio installed
- [ ] JDK 17 installed (required for Android Gradle Plugin 8.9.1)
- [ ] Supabase project configured with production keys

## Step 1: Create Environment Configuration

```bash
cd leanspace
cp env.json.example env.json
```

Edit `env.json` with your Supabase credentials:

```json
{
  "SUPABASE_URL": "https://your-project-ref.supabase.co",
  "SUPABASE_PUBLISHABLE_KEY": "sb_publishable_xxx",
  "SUPABASE_ANON_KEY": "your-jwt-anon-key-here"
}
```

## Step 2: Generate Upload Keystore

This keystore is used to sign your app for the Play Store. **Generate it once and store it securely.**

```bash
keytool -genkey -v \
  -keystore ~/keystores/lean-space.jks \
  -keyalg RSA \
  -keysize 2048 \
  -validity 10000 \
  -alias leanspace
```

**Important:**
- Store the keystore file in a secure location (not in the repo)
- Remember the passwords you set
- Add the keystore path and passwords to your password manager

## Step 3: Configure Signing

Edit `android/key.properties`:

```properties
storePassword=your-actual-store-password
keyPassword=your-actual-key-password
keyAlias=leanspace
storeFile=C:/Users/YOUR_USERNAME/keystores/lean-space.jks
```

**Note:** Use forward slashes (`/`) in the path, not backslashes.

## Step 4: Build the Release AAB

```bash
cd leanspace
.\scripts\build_release.ps1
```

Or manually:

```bash
flutter pub get
flutter build appbundle --release --dart-define-from-file=env.json
```

**Output:** `build/app/outputs/bundle/release/app-release.aab`

## Step 5: Store Assets

All store assets are in `docs/store-assets/`:

| Asset | File | Dimensions |
|-------|------|------------|
| App Icon | `app-icon-512.png` | 512×512 px |
| Feature Graphic | `feature-graphic-1024x500.png` | 1024×500 px |
| Screenshots | `screenshot-*.png` | 1080×1920 px minimum |

### Capturing Screenshots

Run the app on a device/emulator and capture screens:

```bash
# Run with all features unlocked for clean screenshots
flutter run --release --dart-define=UNLOCK_ALL_FEATURES=true

# Or build and install APK
flutter build apk --release --dart-define-from-file=env.json
adb install build/app/outputs/flutter-apk/app-release.apk

# Capture screenshots
adb shell screencap -p /sdcard/screenshot_today.png
adb pull /sdcard/screenshot_today.png docs/store-assets/
```

**Recommended screenshots to capture:**
1. Today screen (main task list)
2. Progress/History screen
3. Add Task screen
4. Medals/Achievements screen
5. Settings screen

## Step 6: Privacy Policy URL

Your privacy policy is hosted via GitHub Pages:

**URL:** `https://<your-github-username>.github.io/Lean-Space/privacy-policy.html`

To enable GitHub Pages:
1. Go to your repo Settings → Pages
2. Source: Deploy from branch `main` → `/docs` folder
3. Save and wait for deployment (usually 1-2 minutes)

## Step 7: Upload to Google Play Console

1. Go to [Google Play Console](https://play.google.com/console)
2. Select your app (or create it with package name `com.leanspace.leanspace`)
3. Go to Release → Production → Create new release
4. Upload `app-release.aab`
5. Complete the store listing with:
   - App name: "Daily Stitch"
   - Short description (80 chars max)
   - Full description (4000 chars max)
   - Screenshots from `docs/store-assets/`
   - Feature graphic from `docs/store-assets/`
   - App icon from `docs/store-assets/`
   - Privacy policy URL (from Step 6)

## Troubleshooting

### "No JDK 17 found"
Install Eclipse Temurin 17:
```bash
# Using scoop (Windows)
scoop install temurin17-jdk

# Or download from: https://adoptium.net/
```

### "Missing env.json"
Copy the example and fill in your keys:
```bash
cp env.json.example env.json
```

### "Missing key.properties"
Follow Step 3 above.

### Build fails with signing error
Verify your keystore path and passwords in `key.properties`.

## File Locations Reference

| File | Purpose |
|------|---------|
| `leanspace/env.json` | Supabase credentials (gitignored) |
| `leanspace/android/key.properties` | Keystore config (gitignored) |
| `leanspace/android/app/build.gradle.kts` | Build configuration |
| `docs/store-assets/` | Play Store assets |
| `docs/privacy-policy.html` | Privacy policy (hosted via GitHub Pages) |
| `docs/terms.html` | Terms of service (hosted via GitHub Pages) |
