# Runtime WebView/Three.js Errors (E012, E016, E028, E029)

## Article A6: A6-06 — Repeated_Errors_Catalog_Solutions
**Piece:** 08 of 13  
**Generated:** 2026-10-08 05:28:00 UTC

---

# E012: OutOfMemoryError: WebGL context lost
**Type:** Runtime | **First:** v1.0.49 | **Last:** v1.0.53 | **Frequency:** Trail recording
**Root Cause:** Three.js geometry/material not disposed on scene rebuild
**Solution:** Add geometry.dispose() + material.dispose() on rebuild
**Worked:** Yes | **Fixed In:** v1.0.54 | **Time Lost:** High
**Notes:** GPU-safe disposal pattern - JS GC doesn't clean GPU memory

### Reproduction
```javascript
// Rebuilding trail geometry every position update
function updateTrail() {
    scene.remove(trailMesh);
    trailGeometry = new THREE.BufferGeometry();  // New geometry
    trailGeometry.setAttribute('position', new Float32BufferAttribute(points, 3));
    trailMesh = new THREE.Line(trailGeometry, trailMaterial);
    scene.add(trailMesh);
    // OLD geometry/material LEAKED - GPU memory not freed!
}
```
After ~1000 updates: `WebGL context lost` → WebView crashes → App restarts

### Root Cause Detail
Three.js BufferGeometry and Material objects hold GPU resources (vertex buffers, textures, shader programs). JavaScript garbage collector only manages JS heap memory, NOT GPU memory. Without explicit `.dispose()`, GPU memory accumulates until WebGL context is lost.

### Fix Implementation
```javascript
// Track all disposable objects
const disposableObjects = new Set();

function createTrailMesh(points) {
    // Dispose old
    disposableObjects.forEach(obj => {
        if (obj.geometry) obj.geometry.dispose();
        if (obj.material) {
            Array.isArray(obj.material) 
                ? obj.material.forEach(m => m.dispose())
                : obj.material.dispose();
        }
    });
    disposableObjects.clear();
    
    // Create new
    const geometry = new THREE.BufferGeometry();
    geometry.setAttribute('position', new Float32BufferAttribute(points, 3));
    const material = new THREE.LineBasicMaterial({ color: 0x00ff00 });
    
    const mesh = new THREE.Line(geometry, material);
    disposableObjects.add({ geometry, material, mesh });
    
    scene.add(mesh);
    return mesh;
}
```

### Prevention
- ALWAYS dispose geometry and material before creating new ones
- Track disposable objects in a Set/Array
- Call dispose() in reverse order of creation
- Test with Chrome DevTools: `chrome://gpu` and memory profiler

---

# E016: WebView JavaScript bridge silent failures
**Type:** Runtime | **First:** v1.0.0 | **Last:** v1.0.51 | **Frequency:** Frequent
**Root Cause:** No try/catch on evaluateJavascript calls
**Solution:** Add try/catch + window.onerror handler
**Worked:** Yes | **Fixed In:** v1.0.52 | **Time Lost:** High
**Notes:** HTML try/catch wrapper mandatory - bridge not ready on load

### Reproduction
```java
// Android side
webView.evaluateJavascript("window.updatePosition(" + x + "," + y + ")", null);
// If bridge not ready: fails silently, no crash, no callback

// JavaScript side
function updatePosition(x, y) {
    AndroidBridge.sendPosition(x, y);  // Fails if AndroidBridge not injected
}
```

### Root Cause Detail
WebView JavaScript bridge (`@JavascriptInterface`) is injected after page load. Early calls fail silently. JavaScript errors in WebView don't propagate to Android logcat by default.

### Fix Implementation
```java
// Android: Safe bridge call wrapper
public void safeBridgeCall(String method, Object... args) {
    String js = buildJsCall(method, args);
    webView.evaluateJavascript(js, value -> {
        // Handle result if needed
    });
}

// JavaScript: Global error handler
window.onerror = function(msg, url, line, col, error) {
    console.error('JS Error:', msg, 'at', url, ':', line);
    if (typeof AndroidBridge !== 'undefined') {
        AndroidBridge.reportError(msg + ' at ' + url + ':' + line);
    }
    return true;  // Prevent default handling
};

// JavaScript: Safe bridge call wrapper
function safeBridgeCall(method, ...args) {
    try {
        if (typeof AndroidBridge !== 'undefined' && AndroidBridge[method]) {
            return AndroidBridge[method](...args);
        }
    } catch (e) {
        console.error('Bridge call failed:', method, e);
    }
    return null;
}
```

### Prevention
- Always wrap bridge calls in try/catch
- Set window.onerror early in HTML head
- Report JS errors to Android for logging
- Check bridge existence before calling

---

# E028: CatmullRomCurve3 trail jagged at low points
**Type:** Runtime | **First:** v1.0.62 | **Last:** v1.0.91 | **Frequency:** Few
**Root Cause:** < 4 points for spline interpolation
**Solution:** Minimum 4 points for CatmullRom
**Worked:** Yes | **Fixed In:** v1.0.62 | **Time Lost:** Low
**Notes:** Need 4+ points for Catmull-Rom spline to work correctly

### Reproduction
```javascript
// With only 2-3 points
const curve = new THREE.CatmullRomCurve3(points);
// Result: jagged, incorrect interpolation
```

### Root Cause Detail
Catmull-Rom spline requires at least 4 control points to compute tangents. With fewer points, the algorithm produces degenerate/incorrect curves.

### Fix Implementation
```javascript
function createSmoothTrail(points) {
    if (points.length < 4) {
        // Fallback: simple line segments
        return new THREE.Line(
            new THREE.BufferGeometry().setFromPoints(points),
            new THREE.LineBasicMaterial({ color: 0x00ff00 })
        );
    }
    
    // Catmull-Rom with 4+ points
    const curve = new THREE.CatmullRomCurve3(points);
    const geometry = new THREE.TubeGeometry(curve, 100, 0.5, 8, false);
    return new THREE.Mesh(geometry, material);
}
```

---

# E029: UnrealBloomPass too bright on mobile
**Type:** Runtime | **First:** v1.0.50 | **Last:** v1.0.91 | **Frequency:** Mobile devices
**Root Cause:** HDR bloom strength too high for mobile GPUs
**Solution:** Reduce strength to 0.5-0.8 on mobile
**Worked:** Yes | **Fixed In:** v1.0.50 | **Time Lost:** Medium
**Notes:** Configurable via Android - detect mobile and adjust

### Reproduction
```javascript
// Desktop: looks good
const bloom = new UnrealBloomPass(new THREE.Vector2(w, h), 1.5, 0.4, 0.85);

// Mobile: blown out highlights, poor performance
```

### Root Cause Detail
Mobile GPUs have lower precision and different tone mapping. High bloom strength causes over-saturation and performance issues.

### Fix Implementation
```javascript
// Detect mobile
const isMobile = /Android|iPhone|iPad/.test(navigator.userAgent);

const bloom = new UnrealBloomPass(
    new THREE.Vector2(w, h),
    isMobile ? 0.6 : 1.5,   // strength
    isMobile ? 0.3 : 0.4,   // radius
    isMobile ? 0.7 : 0.85   // threshold
);

// Or receive from Android
window.AndroidBridge = {
    setBloomStrength: (strength) => { bloom.strength = strength; }
};
```

---

*Next Piece: Runtime GPS/Trail Errors (E013, E017, E018)*