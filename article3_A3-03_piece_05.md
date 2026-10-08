# Connection_Pathways_Bidirectional — Piece 05/13
## Article A3: A3-03 — Connection Pathways Bidirectional
**Piece:** 05 of 13  
**Generated:** 2026-10-08 04:26:00 UTC

---

## BRIDGE IMPLEMENTATION — ANDROID SIDE

### BounceBridge Class (MainActivity Inner Class)
```java
public class BounceBridge {
    private final MainActivity activity;
    
    public BounceBridge(MainActivity activity) {
        this.activity = activity;
    }
    
    // HTML → Android: Vehicle & Fleet
    @JavascriptInterface
    public void setVehicleData(String json) { ... }
    
    @JavascriptInterface
    public void setFleetMode(String json) { ... }
    
    // HTML → Android: Camera
    @JavascriptInterface
    public void setCameraMode(String mode) { ... }
    
    @JavascriptInterface
    public void setPovOffset(int delta) { ... }
    
    @JavascriptInterface
    public void setAutoSpin(boolean enabled) { ... }
    
    // HTML → Android: Beacons
    @JavascriptInterface
    public void scatterBeacons() { ... }
    
    @JavascriptInterface
    public void resetBeacons() { ... }
    
    // HTML → Android: Radio
    @JavascriptInterface
    public void toggleBroadcast() { ... }
    
    // HTML → Android: Trail
    @JavascriptInterface
    public void toggleTrail() { ... }
    
    @JavascriptInterface
    public void saveTrail() { ... }
    
    // HTML → Android: Theory Mode
    @JavascriptInterface
    public void setTheoryMode(boolean enabled) { ... }
    
    // HTML → Android: Queries (return JSON)
    @JavascriptInterface
    public String getTrajectory(String addr) { ... }
    
    @JavascriptInterface
    public String getAllDevices() { ... }
    
    // HTML → Android: Updates
    @JavascriptInterface
    public void downloadUpdate() { ... }
    
    @JavascriptInterface
    public void ignoreUpdate() { ... }
    
    @JavascriptInterface
    public void refreshBroadcastSSID() { ... }
}
```

### Thread Safety
- **All @JavascriptInterface methods** run on WebView thread (not UI thread)
- **UI updates** wrapped in `runOnUiThread()`:
```java
@JavascriptInterface
public void setCameraMode(final String mode) {
    runOnUiThread(() -> activity.setCameraMode(mode));
}
```
- **Query methods** (getTrajectory, getAllDevices) return JSON string synchronously

---

## BRIDGE IMPLEMENTATION — HTML SIDE

### Bounce Object (Injected by Android)
```javascript
// window.Bounce automatically available after addJavascriptInterface
// All methods map 1:1 to Android @JavascriptInterface

// Safe bridge call wrapper (BP015)
function safeBridgeCall(method, ...args) {
    try {
        return window.Bounce[method](...args);
    } catch (e) {
        console.error('Bridge call failed:', method, e);
        UI.showError('Bridge error: ' + e.message);
        return null;
    }
}

// Usage throughout bounce.html
safeBridgeCall('setVehicleData', vehicleJson);
safeBridgeCall('toggleBroadcast');
const trajectory = safeBridgeCall('getTrajectory', addr);
```

### Android → HTML Push Functions
```javascript
// Called by Android via evaluateJavascript
window.UI = {
    updateWifiList: function(json) { ... },
    updateBtList: function(json) { ... },
    updateBt3D: function(json) { ... },
    updateLocation: function(json) { ... },
    updateOrientation: function(json) { ... },
    updateBroadcastStatus: function(json) { ... },
    showUpdateMenu: function(json) { ... },
    handlePermissionResult: function(json) { ... },
    showError: function(message) { ... },
    updateTrail: function(json) { ... },
    updateApPositions: function(json) { ... },
    updateZoneDisplay: function(json) { ... }
};
```

---

## ERROR HANDLING ARCHITECTURE

### Global Error Handler (HTML)
```javascript
window.onerror = function(msg, url, line, col, error) {
    console.error('Global error:', msg, 'at', url, ':', line);
    UI.showError(msg);  // Display in HUD toast
    return true;  // Prevent default browser handler
};

// Promise rejection handler
window.addEventListener('unhandledrejection', function(event) {
    console.error('Unhandled promise rejection:', event.reason);
    UI.showError('Promise error: ' + event.reason);
});
```

### Android Side Error Push
```java
// MainActivity.onError()
private void pushError(String error) {
    String json = new Gson().toJson(new ErrorMessage(error));
    webView.evaluateJavascript("javascript:UI.showError(" + json + ")", null);
}

// ErrorMessage class
static class ErrorMessage {
    String type = "error";
    long timestamp = System.currentTimeMillis();
    String message;
    ErrorMessage(String msg) { this.message = msg; }
}
```

---

## PIECE 05 SUMMARY
This piece covers the Android-side BounceBridge class (21 @JavascriptInterface methods with thread safety via runOnUiThread), HTML-side safe bridge call wrapper (try/catch + window.onerror), UI namespace for Android→HTML pushes, and the error handling architecture (global handlers on both sides). The bridge is now robust with comprehensive error handling.

**Next Piece (06):** Connection Evolution History — Version by Version