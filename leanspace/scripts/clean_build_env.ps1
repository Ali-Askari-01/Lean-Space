# Reset Gradle/Flutter build caches before a clean Android build.
# Run from repo root or anywhere; resolves paths relative to this script.

$ErrorActionPreference = "Stop"
$projectRoot = Resolve-Path (Join-Path $PSScriptRoot "..")

Write-Host "Stopping stray build processes..."
Get-Process java, dart -ErrorAction SilentlyContinue | Stop-Process -Force -ErrorAction SilentlyContinue

Write-Host "Stopping Gradle daemons..."
$gradlew = Join-Path $projectRoot "android\gradlew.bat"
if (Test-Path $gradlew) {
    & $gradlew --stop 2>&1 | Out-Null
}

Write-Host "Cleaning Flutter project..."
Push-Location $projectRoot
try {
    flutter clean
    Remove-Item -Recurse -Force "android\.gradle", "build" -ErrorAction SilentlyContinue
}
finally {
    Pop-Location
}

Write-Host "Clearing corrupted Gradle 9.1 caches..."
$gradleCaches = Join-Path $env:USERPROFILE ".gradle\caches\9.1.0"
foreach ($dir in @("transforms", "kotlin-dsl")) {
    $path = Join-Path $gradleCaches $dir
    if (Test-Path $path) {
        Remove-Item -Recurse -Force $path -ErrorAction SilentlyContinue
        Write-Host "  Removed $path"
    }
}

# Cursor sandbox redirects GRADLE_USER_HOME here; partial deletes corrupt immutable workspaces.
$sandboxGradle = Join-Path $env:LOCALAPPDATA "Temp\cursor-sandbox-cache"
if (Test-Path $sandboxGradle) {
    Remove-Item -Recurse -Force $sandboxGradle -ErrorAction SilentlyContinue
    Write-Host "  Removed cursor-sandbox-cache (Gradle redirect)"
}

Write-Host "Done. Run a single build: flutter build apk --debug --dart-define-from-file=env.json"
