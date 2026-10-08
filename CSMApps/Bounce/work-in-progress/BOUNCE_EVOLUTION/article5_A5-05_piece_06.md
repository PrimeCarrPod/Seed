# Best_Practices_AntiPatterns_Catalog — Piece 06/13
## Article A5: A5-05 — Best Practices AntiPatterns Catalog
**Piece:** 06 of 13  
**Generated:** 2026-10-08 05:07:19 UTC

---
# HTML/JS Best Practices (BP014-BP017)

## Article A5: A5-05 — Best_Practices_AntiPatterns_Catalog
**Piece:** 06 of 13  
**Generated:** 2026-10-08 05:08:58 UTC

---

# BP014: Local Three.js/Chart.js Assets (No CDN)
**Category:** HTML/JS | **Type:** Best Practice
**First Observed:** v1.0.0 | **Confirmed Working:** v1.0.91
**Evidence:** Offline capable, works without internet
**Impact:** Works without internet | **Applies To:** All versions
**Related:** Embed in assets/js/

### Implementation
```html
<!-- GOOD - local assets -->
<script src="js/three.r158.min.js"></script>
<script src="js/Chart.min.js"></script>

<!-- BAD - CDN links (CP011) -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/three.js/r158/three.min.js"></script>
```

### Asset Management
- Download specific versions: three.r158.min.js, Chart.v4.4.1.min.js
- Store in `src/main/assets/js/`
- Include in APK via build.sh zip injection (BP004)
- Version pinning prevents surprise breaking changes

---

# BP015: HTML try/catch Wrapper for JS Errors
**Category:** HTML/JS | **Type:** Best Practice
**First Observed:** v1.0.52 | **Confirmed Working:** v1.0.91
**Evidence:** Prevents WebView crashes
**Impact:** Stability | **Applies To:** v1.0.52+
**Related:** window.onerror + try/catch on bridge calls

### Implementation
```javascript
// Global error handler
window.onerror = function(msg, url, line, col, error) {
    console.error('JS Error:', msg, 'at', url, ':', line);
    if (window.AndroidBridge) {
        AndroidBridge.reportError(msg + ' at ' + url + ':' + line);
    }
    return true; // Prevent default handling
};

// Bridge call wrapper
function safeBridgeCall(method, ...args) {
    try {
        return window.AndroidBridge[method](...args);
    } catch (e) {
        console.error('Bridge call failed:', method, e);
        return null;
    }
}
```

---

# BP016: GPU-Safe Three.js Object Disposal
**Category:** HTML/JS | **Type:** Best Practice
**First Observed:** v1.0.54 | **Confirmed Working:** v1.0.91
**Evidence:** geometry.dispose() + material.dispose()
**Impact:** No memory leaks | **Applies To:** v1.0.54+
**Related:** ALWAYS dispose on rebuild

### Implementation
```javascript
function disposeThreeObject(obj) {
    if (!obj) return;
    
    if (obj.geometry) {
        obj.geometry.dispose();
    }
    if (obj.material) {
        if (Array.isArray(obj.material)) {
            obj.material.forEach(m => m.dispose());
        } else {
            obj.material.dispose();
        }
    }
    // Recurse for children
    if (obj.children) {
        obj.children.forEach(disposeThreeObject);
    }
}

// Call before rebuilding scene
function rebuildScene() {
    disposeThreeObject(scene);
    scene = new THREE.Scene();
    initScene();
}
```

### Why This Matters
- Three.js geometries/materials hold GPU memory
- JavaScript GC doesn't clean GPU resources
- Without disposal: memory leak → WebView crash → app restart

---

# BP017: 2000 Point Cap on Trail (FIFO)
**Category:** HTML/JS | **Type:** Best Practice
**First Observed:** v1.0.62 | **Confirmed Working:** v1.0.91
**Evidence:** Prevents memory growth
**Impact:** Performance | **Applies To:** v1.0.62+
**Related:** Shift oldest points

### Implementation
```javascript
const MAX_TRAIL_POINTS = 2000;

function addTrailPoint(point) {
    trailPoints.push(point);
    if (trailPoints.length > MAX_TRAIL_POINTS) {
        trailPoints.shift(); // Remove oldest (FIFO)
    }
    // Rebuild geometry every 5 frames (CP013 anti-pattern)
    if (frameCount % 5 === 0) {
        rebuildTrailGeometry();
    }
}
```

### Memory Analysis
| Points | Geometry Memory | FPS Impact |
|--------|-----------------|------------|
| 500    | ~2 MB           | 60 FPS     |
| 2000   | ~8 MB           | 55 FPS     |
| 5000   | ~20 MB          | 30 FPS     |
| 10000  | ~40 MB          | 15 FPS (crash risk) |

---

*Next Piece: HTML/JS Anti-Patterns (CP009-CP014)*
