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

# 5. Start WebSocket server (in this Debian session)
pip3 install -r ws-server/requirements.txt
python3 ws-server/server.py

# 6. Load Chrome extension
# Chrome → Extensions → Developer mode → Load unpacked → select chrome-extension/

# 7. Test
# - Open any page with text input in Chrome
# - On Android app: enter Debian LAN IP (or localhost if using adb reverse), tap Connect, tap Start Listening
# - Speak → text appears in Chrome input
```

## Key Files to Review
- `AGENTS.md` — Full project spec
- `src/main/java/com/csmlabs/voicedictation/MainActivity.java` — UI & logic
- `src/main/java/com/csmlabs/voicedictation/VoiceRecognitionService.java` — SpeechRecognizer wrapper
- `src/main/java/com/csmlabs/voicedictation/WebSocketClient.java` — OKHttp WebSocket
- `ws-server/server.py` — Python asyncio WebSocket bridge server
- `chrome-extension/content.js` — Text injection logic

## Environment Setup (Debian/Cloud)
```bash
# Android SDK paths (adjust to your installation)
export ANDROID_SDK=/path/to/android-sdk
export ANDROID_JAR=$ANDROID_SDK/platforms/android-34/android.jar
export BUILD_TOOLS=$ANDROID_SDK/build-tools/34.0.0

# Python deps for WS server
pip3 install -r ws-server/requirements.txt
```

## Current Status
- Project structure created ✓
- Android app source written ✓ (no Gradle, no AndroidX, no Kotlin)
- Chrome extension written ✓ (Manifest V3)
- Python WS server written ✓ (asyncio + websockets, no Node.js)
- **Need: OKHttp JARs in libs/ for build to succeed**
- **Need: Test on actual Android device + Chrome**