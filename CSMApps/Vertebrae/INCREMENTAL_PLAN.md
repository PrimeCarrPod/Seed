# Vertebrae Incremental Version Plan

## Current State
All components created but monolithic - crashes on launch. Need incremental builds.

## Components Already Created

### Models
- `KilosSession` - Session data model with Parcelable
- `SessionGroup` - Group model with color, sessions list
- `InterSessionMessage` - Message types (TEXT, COMMAND, FILE_TRANSFER, HEARTBEAT, etc.)
- `SessionHeartbeat` - Heartbeat payload
- `WindowState` - Window position/size/focus
- `FileTransfer` - File transfer tracking

### Services
- `SessionManagerService` - Session lifecycle, reconnection logic
- `HeartbeatService` - 15s interval browser-mimicking heartbeats
- `FloatingWindowService` - SYSTEM_ALERT_WINDOW with drag/resize
- `InterSessionServer` - Local socket server for inter-session comms

### Network
- `KilosWebSocketClient` - OkHttp WebSocket to kilo.ai
- `WebSocketManager` - Multi-session WebSocket management

### Communication
- `SessionCommunicator` - Client for inter-session server

### Storage
- `SessionStorageManager` - JSON persistence for sessions/groups/files

### UI
- `MainActivity` - Session list, groups, FAB to add sessions
- `SplashActivity` - Permission flow, sequential service startup
- Layouts: activity_main, activity_splash, floating_window, item_session, item_group_chip
- Terminal HTML/JS assets with ANSI support

### System
- `VertebraeApplication` - Initialization (now minimal)
- `BootReceiver` - Auto-start on boot
- Manifest with all permissions/services

---

## Incremental Version Plan

### v0.1 - "Foundation" (Current Target)
**Goal**: App launches, shows WebView with local terminal.html
- Minimal MainActivity with WebView
- Load file:///android_asset/html/terminal.html
- No services, no WebSocket, no persistence
- Just verify WebView + JS bridge works

### v0.2 - "Session List"
**Goal**: Create/manage sessions in UI
- RecyclerView with session cards
- FAB to add session (input dialog for ses_xxxxxxx)
- SessionGroup tabs (horizontal)
- Sessions stored in memory only

### v0.3 - "Floating Window"
**Goal**: Tap session → opens floating WebView window
- SYSTEM_ALERT_WINDOW permission flow
- FloatingWindowService with WebView
- Drag/resize/close controls
- Each session gets own window

### v0.4 - "WebSocket Connection"
**Goal**: WebView connects to kilo.ai via WebSocket
- KilosWebSocketClient connects to wss://app.kilo.ai/cloud/chat?sessionId=...
- Browser-mimicking headers (User-Agent, Origin, Cookie)
- WebSocket heartbeats (ping/pong + custom heartbeat)
- Connection status in UI

### v0.5 - "Heartbeat Service"
**Goal**: Background heartbeats keep sessions alive
- HeartbeatService with 15s timer
- Sends both ping and custom heartbeat JSON
- Survives app backgrounding
- Auto-reconnect on failure

### v0.6 - "Persistence"
**Goal**: Sessions survive app restart
- SessionStorageManager JSON persistence
- Load sessions on app start
- Save window positions
- Settings persistence

### v0.7 - "Inter-Session Comms"
**Goal**: Sessions talk to each other locally
- InterSessionServer (local socket)
- SessionCommunicator client
- Text, commands, file transfers between sessions
- Broadcast to group

### v1.0 - "Production"
**Goal**: Full feature integration + polish
- BootReceiver auto-start
- All services foreground with notifications
- Session groups with colors
- File transfer UI
- Settings screen
- Export/import sessions
- ProGuard/R8 optimization

---

## Build Strategy
Each version:
1. Builds on previous (no rewrites)
2. Single feature added
3. APK tested before next
4. Commit tagged per version