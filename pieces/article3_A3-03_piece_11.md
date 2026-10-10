# Connection_Pathways_Bidirectional — Piece 11/13
## Article A3: A3-03 — Connection Pathways Bidirectional
**Piece:** 11 of 13  
**Generated:** 2026-10-08 04:26:00 UTC

---

## FUTURE BRIDGE EVOLUTION

### 1. Namespace Refactoring (RF018, Target v1.0.94)
```javascript
// Current: Flat namespace (30+ methods on window.Bounce)
Bounce.setVehicleData()
Bounce.setCameraMode()
Bounce.getTrajectory()

// Future: Organized namespaces
Bounce.radio.setVehicleData()
Bounce.radio.toggleBroadcast()
Bounce.viz.setCameraMode()
Bounce.viz.setPovOffset()
Bounce.nav.getTrajectory()
Bounce.nav.getAllDevices()
Bounce.system.downloadUpdate()
Bounce.system.refreshBroadcastSSID()
```

### 2. Async/Promise Bridge (Target v1.0.95)
```javascript
// Current: Synchronous return (blocks WebView thread)
const trajectory = Bounce.getTrajectory(addr);

// Future: Promise-based
const trajectory = await Bounce.nav.getTrajectory(addr);

// Android side: async with callback
@JavascriptInterface
public void getTrajectoryAsync(String addr, String callbackId) {
    runOnUiThread(() -> {
        String json = getTrajectorySync(addr);
        webView.evaluateJavascript(
            "Bounce._resolveCallback('" + callbackId + "', " + json + ")", 
            null
        );
    });
}
```

### 3. Event-Driven Architecture (Target v1.0.95)
```javascript
// Current: Polling via evaluateJavascript pushes
// Future: Event emitter pattern
Bounce.on('wifiUpdate', (data) => { ... });
Bounce.on('bt3dUpdate', (data) => { ... });
Bounce.on('zoneChange', (zone) => { ... });

// Android side: event bus
eventBus.post(new WifiUpdateEvent(results));
// HTML side: receives via single evaluateJavascript batch
```

### 4. WebSocket Bridge (Target v1.0.96+)
```java
// For high-frequency data (orientation 10Hz, trail)
// Replace evaluateJavascript with WebSocket
WebSocketServer wsServer = new WebSocketServer(8080) {
    @Override
    public void onMessage(WebSocket conn, String msg) {
        // Handle HTML→Android calls
    }
    
    public void broadcast(String channel, Object data) {
        // Push to all connected HTML clients
    }
};
```

**Benefits:** 10x lower latency, binary frames, bidirectional streaming, no evaluateJavascript overhead

---

## BRIDGE VERSIONING STRATEGY

### API Version Header
```java
// Android → HTML: Include version in every push
{
  "bridgeVersion": "2.0",
  "type": "wifiUpdate",
  "data": [...]
}

// HTML → Android: Include version in every call
Bounce.call("setVehicleData", data, { version: "2.0" });
```

### Compatibility Matrix
| Bridge Version | Android Min | HTML Min | Breaking Changes |
|----------------|-------------|----------|------------------|
| 1.0 | 1.0.0 | 1.0.0 | Baseline |
| 2.0 | 1.0.94 | 1.0.94 | Namespaces, async |
| 3.0 | 1.0.96 | 1.0.96 | WebSocket, events |

### Migration Path
1. **v1.0.94:** Dual support — old flat + new namespaced
2. **v1.0.95:** Deprecate flat, async optional
3. **v1.0.96:** Remove flat, WebSocket primary

---

## PIECE 11 SUMMARY
This piece outlines the future bridge evolution: namespace refactoring (RF018, organizing 30 methods into radio/viz/nav/system), async/Promise bridge (non-blocking WebView thread), event-driven architecture (single batched push instead of 8 separate evaluateJavascript calls), and WebSocket bridge (10x latency reduction for high-frequency feeds). Versioning strategy with compatibility matrix and 3-version migration path ensures smooth transitions.

**Next Piece (12):** Cross-Reference Matrix — Connections to All Sections