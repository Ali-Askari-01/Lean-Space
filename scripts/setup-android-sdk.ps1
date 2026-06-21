# Installs Android SDK command-line tools (no Android Studio IDE).
# Run once in PowerShell: powershell -ExecutionPolicy Bypass -File scripts/setup-android-sdk.ps1

$ErrorActionPreference = "Stop"
$sdkRoot = "$env:LOCALAPPDATA\Android\Sdk"
$cmdlineZip = "$env:TEMP\cmdline-tools-full.zip"
$cmdlineUrl = "https://dl.google.com/android/repository/commandlinetools-win-11076708_latest.zip"

Write-Host "Installing Android SDK to $sdkRoot ..."

New-Item -ItemType Directory -Force -Path "$sdkRoot\cmdline-tools" | Out-Null

if (-not (Test-Path $cmdlineZip) -or (Get-Item $cmdlineZip).Length -lt 50MB) {
  Write-Host "Downloading command-line tools (~146 MB)..."
  curl.exe -L -o $cmdlineZip $cmdlineUrl
}

$size = (Get-Item $cmdlineZip).Length
if ($size -lt 50MB) {
  throw "Download looks incomplete ($size bytes). Check your network and retry."
}

$extractDir = "$env:TEMP\android-cmdline"
if (Test-Path $extractDir) { Remove-Item $extractDir -Recurse -Force }
Expand-Archive -Path $cmdlineZip -DestinationPath $extractDir -Force

$sourceTools = Get-ChildItem $extractDir -Recurse -Directory -Filter "cmdline-tools" | Select-Object -First 1
if (-not $sourceTools) {
  throw "Could not find cmdline-tools folder inside the downloaded archive."
}

if (Test-Path "$sdkRoot\cmdline-tools\latest") {
  Remove-Item "$sdkRoot\cmdline-tools\latest" -Recurse -Force
}
Move-Item $sourceTools.FullName "$sdkRoot\cmdline-tools\latest"

$env:ANDROID_HOME = $sdkRoot
$env:Path = "$sdkRoot\cmdline-tools\latest\bin;$sdkRoot\platform-tools;$env:Path"

Write-Host "Installing platform-tools, build-tools, and Android 36 platform..."
& "$sdkRoot\cmdline-tools\latest\bin\sdkmanager.bat" --sdk_root=$sdkRoot `
  "platform-tools" "platforms;android-36" "build-tools;35.0.0" "build-tools;28.0.3" "cmdline-tools;latest"

Write-Host "Accepting licenses..."
$yes = 1..100 | ForEach-Object { 'y' }
$yes | & "$sdkRoot\cmdline-tools\latest\bin\sdkmanager.bat" --sdk_root=$sdkRoot --licenses

flutter config --android-sdk $sdkRoot

Write-Host ""
Write-Host "Done. Add these to your user environment variables (System Properties -> Environment):"
Write-Host "  ANDROID_HOME = $sdkRoot"
Write-Host "  Path += $sdkRoot\platform-tools"
Write-Host "  Path += $sdkRoot\cmdline-tools\latest\bin"
Write-Host ""
Write-Host "Then run: flutter doctor --android-licenses"
Write-Host "Connect phone via USB and run: adb devices"
