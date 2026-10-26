# RESUME_SESSION_VOICEDICTATION

## Session Context
**Project**: VoiceDictation — Android voice → Chrome text input  
**Location**: `/workspace/app/CSMWip/13_VoiceDictation`  
**Architecture**: Android app (sender) + Python WS bridge (Debian) + Chrome Ext (receiver)  
**Constraints**: No Gradle, no AndroidX, no Kotlin, no Node.js — pure command-line tools

## What's Done
- Project structure per CSMWip convention (AGENTS.md, TODO.md, build.py, build.sh)
- Android app: MainActivity, VoiceRecognitionService, WebSocketClient, Config
- Chrome Extension (MV3): background.js, content.js, popup.html, manifest.json
- WebSocket Bridge: ws-server/server.py (Python asyncio + websockets)
- No-Gradle build system matching 05_BOUNCE pattern

## Immediate Next Steps
1. **Download OKHttp JARs** (blocking build):
   ```bash
   mkdir -p libs
   cd libs
   wget https://repo1.maven.org/maven2/com/squareup/okhttp3/okhttp/4.12.0/okhttp-4.12.0.jar
   wget https://repo1.maven.org/maven2/com/squareup/okio/okio/3.5.0/okio-3.5.0.jar
   cd ..
   ```
   Then update `build.py` classpath to include `libs/*.jar` (already done)

2. **Build & Install**:
   ```bash
   export ANDROID_SDK=/path/to/sdk
   export ANDROID_JAR=$ANDROID_SDK/platforms/android-34/android.jar
   export BUILD_TOOLS=$ANDROID_SDK/build-tools/34.0.0
   ./build.sh install
   ```

3. **Run Bridge Server** (in Debian):
   ```bash
   pip3 install -r ws-server/requirements.txt
   python3 ws-server/server.py
   ```

4. **Load Chrome Extension**: Developer mode → Load unpacked → `chrome-extension/`

5. **Test End-to-End**: Android app → WS server → Chrome input

## Key Technical Decisions
- **SpeechRecognizer API**: Uses Android's built-in (requires Google app or on-device model)
- **WebSocket**: OKHttp on Android, `websockets` library on Python, native WebSocket in Chrome Ext
- **Protocol**: JSON `{type:"text", payload:"..."}` from Android → broadcast to Chrome clients
- **Text Injection**: Content script finds `document.activeElement` if editable, inserts at cursor
- **Network**: LAN (ws://) for Android→Server, localhost for Server→Chrome Ext
- **No Node.js**: Python server runs entirely in this Debian environment

## Files to Modify Next
- `build.py` — verify `libs/*.jar` classpath inclusion works
- `WebSocketClient.java` — handle reconnection, ping/pong
- `VoiceRecognitionService.java` — tune SpeechRecognizer params (language, punctuation)
- `content.js` — improve contenteditable support, handle special keys
- `ws-server/server.py` — add TLS support (wss://) for production if needed

## Testing Checklist
- [ ] APK builds without errors
- [ ] App installs on Android (API 21+)
- [ ] Mic permission granted
- [ ] Connects to WS server (shows "Connected")
- [ ] SpeechRecognizer starts (shows "Listening…")
- [ ] Partial results appear in app UI
- [ ] Final result sent via WebSocket
- [ ] Chrome extension receives message
- [ ] Text inserted into focused `<input>`, `<textarea>`, `contenteditable`
- [ ] Reconnection works after network hiccup
- [ ] Python server handles multiple concurrent clients