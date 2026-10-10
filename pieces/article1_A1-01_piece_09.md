# HTML_Aspects_ThreeJS_Visualization — Piece 09/13
## Article A1: A1-01 — HTML Aspects ThreeJS Visualization
**Piece:** 09 of 13  
**Generated:** 2026-10-08 04:00:49 UTC

---

## ERROR HANDLING ARCHITECTURE (v1.0.52 → v1.0.91)

### HTML Try/Catch Wrapper (Critical Best Practice — BP015)
- **First Version:** 1.0.52 | **Last Version:** 1.0.91
- **Problem:** WebView crashes on JS bridge errors (E016)
- **Solution:** Wrap ALL bridge calls in try/catch + global window.onerror

### Implementation
```javascript
// Global error handler
window.onerror = function(msg, url, line, col, error) {
  console.error('Global error:', msg, 'at', url, ':', line);
  UI.showError(msg); // Display in HUD
  return true; // Prevent default browser handler
};

// Bridge call wrapper
function safeBridgeCall(method, ...args) {
  try {
    return Bounce[method](...args);
  } catch (e) {
    console.error('Bridge call failed:', method, e);
    UI.showError('Bridge error: ' + e.message);
    return null;
  }
}

// Usage everywhere
safeBridgeCall('setVehicleData', data);
safeBridgeCall('toggleBroadcast');
safeBridgeCall('getTrajectory', addr);
```

### Error Display in HUD
- **Component:** UI.showError(message)
- **Display:** Toast-style notification in top center
- **Duration:** 5 seconds auto-dismiss
- **Queue:** Multiple errors queued, shown sequentially

---

## WEBVIEW JAVASCRIPT BRIDGE STABILITY

### Bridge Architecture (v1.0.0 → v1.0.91)
- **Android Side:** `@JavascriptInterface` annotated methods in MainActivity
- **HTML Side:** `window.Bounce` object injected via `addJavascriptInterface`
- **Communication:** Bidirectional — Android pushes, HTML pulls

### Android → HTML (Push)
```java
// MainActivity.java
webView.evaluateJavascript(
  "javascript:UI.updateWifiList(" + json + ")", 
  null
);
```

### HTML → Android (Pull/Call)
```javascript
// bounce.html
Bounce.setVehicleData(data); // @JavascriptInterface
Bounce.getTrajectory(addr);  // Returns JSON string
```

### Bridge Reliability Improvements
| Version | Improvement |
|---------|-------------|
| 1.0.0 | Basic addJavascriptInterface |
| 1.0.52 | HTML try/catch wrapper (BP015) |
| 1.0.91 | Comprehensive error handling |

---

## PERFORMANCE MONITORING

### FPS Monitoring (Built-in)
```javascript
let lastTime = performance.now();
let frames = 0;
function measureFPS() {
  frames++;
  const now = performance.now();
  if (now - lastTime >= 1000) {
    console.log('FPS:', frames);
    frames = 0;
    lastTime = now;
  }
  requestAnimationFrame(measureFPS);
}
```

### Memory Leak Prevention (BP016, CP009)
- **Rule:** ALWAYS dispose Three.js geometries & materials
- **Pattern:** `geometry.dispose(); material.dispose();`
- **Trail:** 2000pt FIFO cap (BP017, CP014)
- **Rebuild:** Every 5 frames (adaptive in v1.0.94+)

---

## PIECE 09 SUMMARY
This piece covers the error handling architecture that stabilized the WebView: global `window.onerror` handler, `safeBridgeCall()` wrapper for all Android↔HTML communication, HUD error display, and the bridge architecture itself. Also documents performance monitoring (FPS) and the critical GPU-safe disposal pattern that eliminated OOM crashes (E012). This is the stability foundation.

**Next Piece (10):** Asset Management — Local Three.js/Chart.js + Offline Capability