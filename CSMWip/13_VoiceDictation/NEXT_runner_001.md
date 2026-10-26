# NEXT_runner_001 — VoiceDictation Next Session

## Quick Start
```bash
cd /workspace/app/CSMWip/13_VoiceDictation

# 1. Verify environment
cat AGENTS.md | head -50

# 2. Download OKHttp JARs (required for build)
mkdir -p libs
cd libs
wget -q https://repo1.maven.org/maven2/com/squareup/okhttp3/okhttp/4.12.0/okhttp-4.12.0.jar
wget -q https://repo1.maven.org/maven2/com/squareup/okio/okio/3.5.0/okio-3.5.0.jar
cd ..

# 3. Build APK
./build.sh

# 4. Install on Android (device/emulator connected via adb)
./build.sh install

# 5. Start WebSocket server (on Windows host)
cd ws-server && npm install && node server.js

# 6. Load Chrome extension
# Chrome → Extensions → Developer mode → Load unpacked → select chrome-extension/

# 7. Test
# - Open any page with text input in Chrome on Windows
# - On Android app: enter Windows LAN IP, tap Connect, tap Start Listening
# - Speak → text appears in Chrome input
```

## Key Files to Review
- `AGENTS.md` — Full project spec
- `src/main/java/com/csmlabs/voicedictation/MainActivity.java` — UI & logic
- `src/main/java/com/csmlabs/voicedictation/VoiceRecognitionService.java` — SpeechRecognizer wrapper
- `src/main/java/com/csmlabs/voicedictation/WebSocketClient.java` — OKHttp WebSocket
- `ws-server/server.js` — Bridge server
- `chrome-extension/content.js` — Text injection logic

## Environment Setup (Windows Host)
```powershell
# Set Android SDK paths (adjust to your installation)
$env:ANDROID_SDK = "C:\Users\<user>\AppData\Local\Android\Sdk"
$env:ANDROID_JAR = "$env:ANDROID_SDK\platforms\android-34\android.jar"
$env:BUILD_TOOLS = "$env:ANDROID_SDK\build-tools\34.0.0"
```

## Current Status
- Project structure created ✓
- Android app source written ✓
- Chrome extension written ✓
- WS server written ✓
- **Need: OKHttp JARs in libs/ for build to succeed**
- **Need: Test on actual Android device + Windows Chrome**