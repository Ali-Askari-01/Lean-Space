# Getting Started — Run LeanSpace on Your Phone

Quick path from zero to `flutter run` on a physical Android device (no Android Studio IDE).

---

## 1. One-time machine setup

### Already done on this machine
- Flutter project at `leanspace/`
- Dependencies wired (Riverpod, go_router, http, flutter_secure_storage)
- Batch 1.1 placeholder screens and routes
- OpenJDK 17 + Android SDK (CLI) installed
- `flutter doctor` — Android toolchain should be green

### Set permanently (Windows Environment Variables)

| Variable | Value |
|---|---|
| `JAVA_HOME` | `C:\Program Files\Microsoft\jdk-17.0.19.10-hotspot` |
| `ANDROID_HOME` | `%LOCALAPPDATA%\Android\Sdk` |
| `Path` (append) | `%ANDROID_HOME%\platform-tools` |

Restart Cursor/terminal after changing these.

### Windows desktop (optional)

LeanSpace targets Android first. To build for Windows (`flutter build windows`):

1. Enable the desktop target (once):
   ```powershell
   flutter config --enable-windows-desktop
   ```
2. Install **Visual Studio 2022 Community** with the **Desktop development with C++** workload (~8–15 GB):
   ```powershell
   winget install Microsoft.VisualStudio.2022.Community --override "--wait --passive --add Microsoft.VisualStudio.Workload.NativeDesktop --includeRecommended"
   ```
   Or download from [visualstudio.microsoft.com](https://visualstudio.microsoft.com/downloads/).
3. Verify: `flutter doctor -v` — the Visual Studio line should be green.

### Android Gradle troubleshooting

If `flutter build` fails with corrupted Gradle cache (`metadata.bin`, lock timeouts):

```powershell
cd leanspace
powershell -ExecutionPolicy Bypass -File scripts/clean_build_env.ps1
powershell -ExecutionPolicy Bypass -File scripts/build_apk.ps1 -Clean
```

Run **one** build at a time — parallel `flutter run` / `gradlew` processes corrupt the Gradle 9.1 cache.

### You still need

## 2. Phone setup (USB)

1. On your Android phone: **Settings → About phone** → tap **Build number** 7 times (enables Developer options).
2. **Settings → Developer options** → enable **USB debugging**.
3. Connect phone to PC via USB cable.
4. On phone, tap **Allow** when prompted for USB debugging.
5. Verify: `adb devices` — should show your device as `device` (not `unauthorized`).

**Wireless debugging (optional later):** Android 11+ supports pairing over Wi‑Fi in Developer options. USB is simpler to start.

---

## 3. Environment config

1. Deploy your Cloudflare Worker (see `cloudflare-workers/README.md`).
2. Copy `leanspace/env.json.example` to `leanspace/env.json`.
3. Edit `leanspace/env.json` with your Worker URL and Google OAuth client ID:

```json
{
  "API_BASE_URL": "https://daily-stitch-api.your-subdomain.workers.dev",
  "GOOGLE_CLIENT_ID": "your-google-client-id.apps.googleusercontent.com"
}
```

`env.json` is gitignored — never commit it.

---

## 4. Run the app

```powershell
cd leanspace
flutter pub get
flutter run
```

Flutter will detect your connected phone. First build takes several minutes; later builds use hot reload.

**Hot reload:** save a Dart file while `flutter run` is active — press `r` in the terminal for manual reload.

---

## 5. What you should see

- If `env.json` has placeholders → **Setup required** screen with instructions.
- If the Worker is configured but you're logged out → **Auth** screen (sign in / sign up).
- After auth → **My Day** tab with bottom nav to **Our Space**, settings icon top-right.

---

## 6. Next implementation step

Once the app runs on your phone, proceed to **Batch 1.2** in `execution/12-BATCH-EXECUTION-PLAN.md`:

- Apply D1 migrations (`cloudflare-workers/README.md`)
- Run D1 schema verification (`operations/07-TEST-PLAN.md` §2)

Check off items in `execution/00-IMPLEMENTATION-READINESS.md` as you go.
