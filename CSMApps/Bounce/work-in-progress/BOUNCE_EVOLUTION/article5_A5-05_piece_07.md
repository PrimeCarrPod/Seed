# Best_Practices_AntiPatterns_Catalog — Piece 07/13
## Article A5: A5-05 — Best Practices AntiPatterns Catalog
**Piece:** 07 of 13  
**Generated:** 2026-10-08 05:07:19 UTC

---
# HTML/JS Anti-Patterns (CP009-CP014)

## Article A5: A5-05 — Best_Practices_AntiPatterns_Catalog
**Piece:** 07 of 13  
**Generated:** 2026-10-08 05:09:32 UTC

---

# CP009: Not Disposing Three.js Geometries/Materials
**Category:** HTML/JS | **Type:** Anti-Pattern
**Observed:** v1.0.49-v1.0.53 | **Evidence:** Memory leak → crash
**Impact:** App crashes | **Versions Affected:** 1.0.49-1.0.53
**Fix:** geometry.dispose() + material.dispose() (BP016)

### Failure Mode
- Rebuilding scene on each position update
- Old geometries/materials accumulate in GPU memory
- WebView hits memory limit → crash → app restart
- User loses trail data

### Root Cause
Assumption that JavaScript GC handles GPU resources. It doesn't.

---

# CP010: Trail Recording Without Speed Threshold
**Category:** Android | **Type:** Anti-Pattern
**Observed:** v1.0.49-v1.0.55 | **Evidence:** Records stationary points
**Impact:** Noisy trail | **Versions Affected:** 1.0.49-1.0.55
**Fix:** Only record when speed > 1mph

### Implementation
```java
// BAD - records every location update
trail.add(location);

// GOOD - speed threshold
float speed = location.getSpeed(); // m/s
if (speed > 0.447) { // > 1 mph
    trail.add(location);
}
```

### Why It Matters
- GPS jitter creates fake movement when stationary
- Bloats trail data with noise
- Degrades trilateration accuracy

---

# CP011: CDN Links for Three.js/Chart.js
**Category:** HTML/JS | **Type:** Anti-Pattern
**Observed:** Multiple versions | **Evidence:** Fails offline
**Impact:** No 3D rendering | **Fix:** Local assets mandatory (BP014)

### Failure Mode
- App launched without internet → white screen
- CDN rate limiting → failed loads
- Version drift → breaking API changes

---

# CP012: No Error Handling on JS Bridge Calls
**Category:** HTML/JS | **Type:** Anti-Pattern
**Observed:** v1.0.0-v1.0.51 | **Evidence:** Silent failures
**Impact:** Debugging hell | **Versions Affected:** 1.0.0-1.0.51
**Fix:** try/catch + window.onerror (BP015)

### Failure Mode
```javascript
// BAD - no error handling
AndroidBridge.sendPosition(x, y, z); // Fails silently if bridge not ready

// GOOD - wrapped
try { AndroidBridge.sendPosition(x, y, z); } 
catch (e) { console.error('Bridge error:', e); }
```

### Root Cause
WebView JavaScript bridge not initialized when HTML loads.

---

# CP013: Rebuilding Trail Geometry Every Frame
**Category:** HTML/JS | **Type:** Anti-Pattern
**Observed:** v1.0.49-v1.0.61 | **Evidence:** Performance kill
**Impact:** Low FPS | **Versions Affected:** 1.0.49-1.0.61
**Fix:** Rebuild every 5 frames

### Performance Data
| Rebuild Frequency | FPS (2000 pts) | CPU % |
|-------------------|----------------|-------|
| Every frame       | 15-20          | 95%   |
| Every 2 frames    | 30-35          | 70%   |
| Every 5 frames    | 55-60          | 35%   |
| Every 10 frames   | 60             | 25%   |

---

# CP014: Unbounded Trail Point Array
**Category:** HTML/JS | **Type:** Anti-Pattern
**Observed:** v1.0.49-v1.0.61 | **Evidence:** Memory growth
**Impact:** OOM crash | **Versions Affected:** 1.0.49-1.0.61
**Fix:** 2000pt FIFO cap (BP017)

### Failure Mode
```javascript
// BAD - unbounded growth
trailPoints.push(newPoint); // Never removes old points
// After 1 hour driving: 100,000+ points → crash
```

---

*Next Piece: Architecture Anti-Patterns (CP015-CP020)*
