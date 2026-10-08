# Refinement_Existing_Parts_Prioritized — Piece 06/13
## Article A3: A3-10 — Refinement Existing Parts Prioritized
**Piece:** 06 of 13  
**Generated:** 2026-10-08 16:41:24 UTC

---

# Section 10: Refinement of Existing Parts — JS Bridge & Error Handling (RF018, RF019)

## 6.1 RF018 — JS Bridge Namespace Organization (P1, Low Effort)

**Component:** `MainActivity.java` (JavaScriptInterface methods) + `bounce.html` bridge calls  
**Issue:** 30+ bridge methods in flat namespace — naming collisions, no discoverability  
**Current State:** All methods on `window.Bounce` or `window.Android`  
**Proposed Refinement:** Group into logical namespaces with TypeScript definitions  

### Current Flat Namespace (30+ methods):
```javascript
// Current: window.Bounce.*
Bounce.startScan()
Bounce.stopScan()
Bounce.getPosition()
Bounce.setTrailColor()
Bounce.exportTrail()
Bounce.setBloomStrength()
Bounce.getZone()
Bounce.calibrateAP()
Bounce.requestPermission()
// ... 20 more
```

### Proposed Namespaced Architecture:
```javascript
// modules/positioning/bridge.js
window.Bounce = {
  // Radio/Scanning namespace
  radio: {
    scan: {
      start: () => bridge('radio.scan.start'),
      stop: () => bridge('radio.scan.stop'),
      configure: (config) => bridge('radio.scan.configure', config),
      onResults: (callback) => eventBus.on('radio.scan.results', callback)
    },
    rtt: {
      range: (bssids) => bridge('radio.rtt.range', bssids),
      onRanges: (callback) => eventBus.on('radio.rtt.ranges', callback)
    },
    ble: {
      startScan: (filters) => bridge('radio.ble.startScan', filters),
      stopScan: () => bridge('radio.ble.stopScan'),
      onAdvertisement: (callback) => eventBus.on('radio.ble.advertisement', callback)
    },
    wifiAware: {
      publish: (config) => bridge('radio.aware.publish', config),
      subscribe: (config) => bridge('radio.aware.subscribe', config),
      onMessage: (callback) => eventBus.on('radio.aware.message', callback)
    }
  },
  
  // Visualization namespace
  viz: {
    trail: {
      setColor: (color) => bridge('viz.trail.color', color),
      setTension: (t) => bridge('viz.trail.tension', t),
      export: (format) => bridge('viz.trail.export', format),
      clear: () => bridge('viz.trail.clear')
    },
    bloom: {
      setStrength: (s) => bridge('viz.bloom.strength', s),
      setEnabled: (enabled) => bridge('viz.bloom.enabled', enabled)
    },
    theme: {
      set: (theme) => bridge('viz.theme.set', theme),
      get: () => bridge('viz.theme.get')
    },
    camera: {
      setMode: (mode) => bridge('viz.camera.mode', mode),
      focus: (target) => bridge('viz.camera.focus', target)
    }
  },
  
  // Navigation/Positioning namespace
  nav: {
    position: {
      get: () => bridge('nav.position.get'),
      onUpdate: (callback) => eventBus.on('nav.position.update', callback),
      setAlgorithm: (algo) => bridge('nav.position.algorithm', algo)
    },
    zone: {
      getCurrent: () => bridge('nav.zone.current'),
      getHistory: () => bridge('nav.zone.history'),
      onTransition: (callback) => eventBus.on('nav.zone.transition', callback)
    },
    calibration: {
      start: () => bridge('nav.calibration.start'),
      stop: () => bridge('nav.calibration.stop'),
      getAPPositions: () => bridge('nav.calibration.apPositions')
    }
  },
  
  // System namespace
  sys: {
    permissions: {
      request: (perms) => bridge('sys.permissions.request', perms),
      status: (perm) => bridge('sys.permissions.status', perm),
      onChange: (callback) => eventBus.on('sys.permissions.change', callback)
    },
    storage: {
      export: (format) => bridge('sys.storage.export', format),
      import: (data) => bridge('sys.storage.import', data),
      clear: () => bridge('sys.storage.clear')
    },
    diagnostics: {
      getLogs: () => bridge('sys.diagnostics.logs'),
      getMetrics: () => bridge('sys.diagnostics.metrics'),
      runSelfTest: () => bridge('sys.diagnostics.selftest')
    }
  }
};

// Internal bridge function
function bridge(method, ...args) {
  return new Promise((resolve, reject) => {
    const id = ++bridge.idCounter;
    bridge.pending.set(id, { resolve, reject });
    window.Android.postMessage(JSON.stringify({ id, method, args }));
  });
}
bridge.idCounter = 0;
bridge.pending = new Map();

// Android side: MainActivity.handleMessage(JSON)
```

### Android Side Refactoring:
```java
// MainActivity.java - grouped handlers
private final Map<String, BiConsumer<JSONArray, Callback>> handlers = Map.ofEntries(
  // radio.scan
  entry("radio.scan.start", this::handleScanStart),
  entry("radio.scan.stop", this::handleScanStop),
  entry("radio.scan.configure", this::handleScanConfigure),
  // radio.rtt
  entry("radio.rtt.range", this::handleRttRange),
  // viz.trail
  entry("viz.trail.color", this::handleTrailColor),
  entry("viz.trail.export", this::handleTrailExport),
  // nav.position
  entry("nav.position.get", this::handlePositionGet),
  entry("nav.position.algorithm", this::handlePositionAlgorithm),
  // sys.permissions
  entry("sys.permissions.request", this::handlePermissionRequest)
  // ... etc
);
```

### TypeScript Definitions (for IDE support):
```typescript
// types/bounce-bridge.d.ts
declare namespace Bounce {
  namespace radio {
    namespace scan {
      function start(): Promise<void>;
      function stop(): Promise<void>;
      function configure(config: ScanConfig): Promise<void>;
      function onResults(cb: (results: ScanResult[]) => void): () => void;
    }
    // ... etc
  }
  namespace viz { /* ... */ }
  namespace nav { /* ... */ }
  namespace sys { /* ... */ }
}
interface Window { Bounce: typeof Bounce; }
```

### Target: v1.0.94 | Status: Planned | Master List Ref: —

---

## 6.2 RF019 — Centralized Error Handling (P1, Low Effort)

**Component:** `bounce.html` (scattered try/catch) + `MainActivity.java` (uncaught exceptions)  
**Issue:** Inconsistent error handling — silent failures, no user feedback, no diagnostics  
**Current State:** Ad-hoc `try { } catch (e) { console.log(e) }` in 20+ locations  
**Proposed Refinement:** Central `ErrorReporter` class with user-facing toasts, logging, telemetry  

### ErrorReporter Implementation:
```javascript
// modules/core/errorReporter.js
class ErrorReporter {
  constructor() {
    this.handlers = [];
    this.context = {};
    this.sessionId = crypto.randomUUID();
    this.installGlobalHandlers();
  }
  
  installGlobalHandlers() {
    // Uncaught JS errors
    window.addEventListener('error', (e) => {
      this.report(e.error || new Error(e.message), {
        type: 'uncaught',
        filename: e.filename,
        lineno: e.lineno,
        colno: e.colno
      });
    });
    
    // Unhandled promise rejections
    window.addEventListener('unhandledrejection', (e) => {
      this.report(e.reason, { type: 'unhandled_rejection' });
      e.preventDefault(); // Prevent default browser behavior
    });
    
    // Android bridge errors
    window.addEventListener('message', (e) => {
      if (e.data?.type === 'error') {
        this.report(new Error(e.data.message), { 
          type: 'bridge', 
          code: e.data.code,
          method: e.data.method 
        });
      }
    });
  }
  
  setContext(context) {
    this.context = { ...this.context, ...context };
  }
  
  report(error, metadata = {}) {
    const report = {
      id: crypto.randomUUID(),
      timestamp: Date.now(),
      sessionId: this.sessionId,
      message: error.message || String(error),
      stack: error.stack,
      name: error.name,
      context: { ...this.context, ...metadata },
      userAgent: navigator.userAgent,
      url: window.location.href
    };
    
    // 1. Local storage (persist across sessions)
    this.persist(report);
    
    // 2. Send to Android for system logs
    this.sendToAndroid(report);
    
    // 3. User-facing notification (non-blocking)
    this.notifyUser(report);
    
    // 4. Custom handlers (analytics, Sentry, etc.)
    this.handlers.forEach(h => h(report));
    
    return report.id;
  }
  
  persist(report) {
    const logs = JSON.parse(localStorage.getItem('error_logs') || '[]');
    logs.unshift(report);
    if (logs.length > 100) logs.pop();
    localStorage.setItem('error_logs', JSON.stringify(logs));
  }
  
  sendToAndroid(report) {
    if (window.Android?.postMessage) {
      window.Android.postMessage(JSON.stringify({
        type: 'error_report',
        payload: report
      }));
    }
  }
  
  notifyUser(report) {
    // Only notify for user-actionable errors
    const userFacing = [
      'permission_denied',
      'bluetooth_off',
      'location_disabled',
      'storage_full',
      'network_error'
    ];
    
    if (userFacing.some(code => report.context.code === code)) {
      eventBus.emit('ui.toast', {
        message: this.getUserMessage(report.context.code),
        type: 'error',
        duration: 5000,
        action: this.getUserAction(report.context.code)
      });
    }
  }
  
  getUserMessage(code) {
    const messages = {
      permission_denied: 'Permission required for positioning. Enable in settings.',
      bluetooth_off: 'Bluetooth is off. Turn on for device detection.',
      location_disabled: 'Location access needed for indoor positioning.',
      storage_full: 'Storage full. Export and clear old trails.',
      network_error: 'Network error. Check connection and retry.'
    };
    return messages[code] || 'An error occurred. Check logs for details.';
  }
  
  getUserAction(code) {
    const actions = {
      permission_denied: { label: 'Open Settings', action: () => Bounce.sys.permissions.request(['location', 'bluetooth']) },
      bluetooth_off: { label: 'Enable BT', action: () => Bounce.radio.ble.startScan() },
      location_disabled: { label: 'Enable GPS', action: () => Bounce.sys.permissions.request(['location']) }
    };
    return actions[code];
  }
  
  onError(handler) {
    this.handlers.push(handler);
    return () => this.handlers = this.handlers.filter(h => h !== handler);
  }
  
  getLogs() {
    return JSON.parse(localStorage.getItem('error_logs') || '[]');
  }
  
  clearLogs() {
    localStorage.removeItem('error_logs');
  }
}

// Singleton
window.ErrorReporter = new ErrorReporter();
export default window.ErrorReporter;
```

### Usage Throughout Codebase:
```javascript
// Before (scattered):
try {
  await Bounce.radio.scan.start();
} catch (e) {
  console.log(e); // Silent, no user feedback
}

// After (consistent):
try {
  await Bounce.radio.scan.start();
} catch (e) {
  ErrorReporter.report(e, { code: 'scan_start_failed', component: 'radio' });
  // User gets toast, Android gets log, stored locally
}

// Async wrapper for convenience
export async function safeAsync(promise, context = {}) {
  try {
    return await promise;
  } catch (e) {
    ErrorReporter.report(e, context);
    throw e; // Re-throw for caller handling
  }
}
```

### Android Side Error Collection:
```java
// MainActivity.java - receive error reports
@JavascriptInterface
public void postMessage(String json) {
  try {
    JSONObject msg = new JSONObject(json);
    if ("error_report".equals(msg.optString("type"))) {
      JSONObject payload = msg.getJSONObject("payload");
      Log.e("BOUNCE_JS", payload.toString(2));
      // Forward to Crashlytics/Firebase if configured
      // Store in local DB for diagnostics export
    }
  } catch (JSONException e) {
    Log.e("BOUNCE", "Failed to parse JS message", e);
  }
}
```

### Target: v1.0.94 | Status: Planned | Master List Ref: —

---

*End of Piece 06/13*