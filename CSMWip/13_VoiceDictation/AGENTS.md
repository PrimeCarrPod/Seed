# AGENTS.md — CSMWip/13_VoiceDictation

## Project: VoiceDictation — Android Voice → Chrome Text Input

**Type**: Android app (sender) + Chrome Extension (receiver) + WebSocket Bridge (Python)
**Target API**: 34 (Android 14)
**Min API**: 21 (Android 5.0)
**Build System**: Custom (javac + aapt2 + d8 + zipalign + apksigner) — same as 05_BOUNCE
**Runtime**: Pure command-line tools in Debian — no Gradle, no AndroidX, no Kotlin, no Node.js

## Architecture Overview

```
┌─────────────┐     WebSocket      ┌──────────────┐     WebSocket      ┌─────────────────┐
│  Android    │ ◄─────────────────► │  WS Server   │ ◄─────────────────► │  Chrome Ext     │
│  (Sender)   │   (LAN, ws://)      │  (Debian)    │   (localhost)      │  (Receiver)     │
└─────────────┘                     └──────────────┘                     └─────────────────┘
   │                                                                    │
   ▼                                                                    ▼
SpeechRecognizer                                                Content Script
API (offline/online)                                           injects into
                                                                  focused input
```

## Project Structure
```
13_VoiceDictation/
├── AGENTS.md                    # This file
├── memory/                      # Daily notes
├── TODO.md                      # Task list
├── build.sh                     # Build entry point
├── build.py                     # Python build (preferred)
├── src/
│   └── main/java/com/csmlabs/voicedictation/
│       ├── MainActivity.java           # UI: connect, start/stop listening
│       ├── VoiceRecognitionService.java # SpeechRecognizer wrapper
│       ├── WebSocketClient.java        # OKHttp WebSocket client
│       └── Config.java                 # Server URL, constants
├── res/
│   ├── values/strings.xml
│   ├── layout/activity_main.xml
│   ├── drawable/ic_mic.xml
│   └── xml/network_security_config.xml
├── AndroidManifest.xml
├── debug.keystore
├── chrome-extension/              # Chrome extension (receiver)
│   ├── manifest.json
│   ├── content.js
│   ├── background.js
│   └── popup.html
├── ws-server/                     # WebSocket bridge (Python, runs in Debian)
│   ├── server.py                  # asyncio + websockets server
│   └── requirements.txt           # Python deps: websockets>=12.0
├── NEXT_runner_001.md
└── RESUME_SESSION_VOICEDICTATION.md
```

## Build Commands
```bash
# From project root
./build.sh              # Full build → voicedictation.apk
./build.py              # Python version (better error handling)
./build.sh clean        # Clean build artifacts
./build.sh install      # Build + adb install -r
```

## Environment Variables (required)
```bash
export ANDROID_SDK=/path/to/android-sdk
export ANDROID_JAR=$ANDROID_SDK/platforms/android-34/android.jar
export BUILD_TOOLS=$ANDROID_SDK/build-tools/34.0.0
```

## Java Conventions
- **Package**: `com.csmlabs.voicedictation`
- **Source/Target**: 1.8
- **Deps**: OKHttp for WebSocket (bundled as .jar in libs/)
- **No AndroidX** — framework classes only
- **No Kotlin** — Java only

## Key Components

### Android App (Sender)
1. **MainActivity** — Connect to WS server, start/stop voice recognition, show status
2. **VoiceRecognitionService** — Wraps `SpeechRecognizer`, handles partial/final results
3. **WebSocketClient** — OKHttp WebSocket connection with auto-reconnect
4. **Permissions**: `RECORD_AUDIO`, `INTERNET`, `ACCESS_NETWORK_STATE`

### Chrome Extension (Receiver) — Manifest V3
1. **background.js** — WebSocket client to local WS server, manages connection state
2. **content.js** — Injected into all pages, finds focused editable element, inserts text
3. **manifest.json** — Permissions: `activeTab`, `scripting`

### WebSocket Server (Bridge) — Python (asyncio + websockets)
- Runs in Debian: `python3 ws-server/server.py`
- Install deps: `pip3 install -r ws-server/requirements.txt`
- Listens on `ws://0.0.0.0:8765` (LAN) and `ws://localhost:8765` (local)
- Relays messages from Android clients to Chrome extension clients
- Simple protocol: `{type: "text", payload: "recognized words"}`

## Testing Flow
1. Start WS server in Debian: `pip3 install -r ws-server/requirements.txt && python3 ws-server/server.py`
2. Install APK on Android: `./build.sh install`
3. Load Chrome extension (Developer mode → Load unpacked → `chrome-extension/`)
4. Open any page with text input in Chrome (on same machine or LAN)
5. On Android app: enter Debian LAN IP, tap Connect, tap Mic to start dictation
6. Speak → text appears in focused Chrome input

## Session Resume
```bash
cd CSMWip/13_VoiceDictation
cat NEXT_runner_001.md
cat RESUME_SESSION_VOICEDICTATION.md
git status
./build.sh  # verify build works
```