# VoiceDictation — Task List

## Milestone 1: Android App (Sender) ✓
- [x] Project structure (AGENTS.md, manifest, resources)
- [x] MainActivity with UI (server IP/port, connect/disconnect, start/stop listening)
- [x] VoiceRecognitionService wrapping SpeechRecognizer
- [x] WebSocketClient using OKHttp
- [x] Build system (build.py, build.sh) — no Gradle
- [ ] **Add OKHttp + Okio JARs to libs/** (required for WebSocketClient to compile)
- [ ] Test build: `./build.sh` → produces voicedictation.apk
- [ ] Install on device: `./build.sh install`
- [ ] Verify microphone permission flow
- [ ] Verify SpeechRecognizer works (online/offline)

## Milestone 2: WebSocket Bridge Server ✓
- [x] Node.js server (ws-server/server.js)
- [x] package.json with ws dependency
- [ ] `cd ws-server && npm install`
- [ ] Test: `node server.js` → listens on ws://0.0.0.0:8765
- [ ] Verify Android can connect from LAN
- [ ] Verify Chrome extension can connect from localhost

## Milestone 3: Chrome Extension (Receiver) ✓
- [x] Manifest V3 (manifest.json)
- [x] Background service worker (background.js)
- [x] Content script (content.js) — inserts into focused input
- [x] Popup UI (popup.html, popup.js)
- [ ] Load in Chrome: Developer mode → Load unpacked → chrome-extension/
- [ ] Test: Focus any text input, send message from server → text inserts

## Milestone 4: Integration & Polish
- [ ] End-to-end test: Android → WS Server → Chrome → text input
- [ ] Handle partial results (streaming) vs final results
- [ ] Add connection status indicators
- [ ] Add reconnection logic on both sides
- [ ] Test on different networks (WiFi, hotspot)
- [ ] Optional: Add TLS (wss://) for production

## Known Issues / Blockers
- [ ] OKHttp dependency: need to download okhttp-4.12.0.jar and okio-3.5.0.jar to libs/ and add to classpath in build.py
- [ ] SpeechRecognizer requires Google app or on-device model — may not work offline on all devices
- [ ] Chrome extension needs "activeTab" permission for current tab only — consider "scripting" for all tabs