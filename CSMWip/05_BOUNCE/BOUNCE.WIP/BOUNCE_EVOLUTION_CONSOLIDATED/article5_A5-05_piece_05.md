# Best_Practices_AntiPatterns_Catalog — Piece 05/13
## Article A5: A5-05 — Best Practices AntiPatterns Catalog
**Piece:** 05 of 13  
**Generated:** 2026-10-08 05:07:19 UTC

---
# Android Anti-Patterns (CP004-CP008)

## Article A5: A5-05 — Best_Practices_AntiPatterns_Catalog
**Piece:** 05 of 13  
**Generated:** 2026-10-08 05:08:25 UTC

---

# CP004: API33 NEARBY_WIFI_DEVICES Without neverForLocation
**Category:** Android | **Type:** Anti-Pattern
**Observed:** v1.0.80-v1.0.85 | **Evidence:** Permission denied, scan fails
**Impact:** Scan fails | **Versions Affected:** 1.0.80-1.0.85
**Fix:** Add flag or revert to v1.0.3 pattern (BP006)

### Failure Mode
```xml
<!-- BAD - missing neverForLocation flag -->
<uses-permission android:name="android.permission.NEARBY_WIFI_DEVICES" />

<!-- GOOD - with flag for non-location use -->
<uses-permission android:name="android.permission.NEARBY_WIFI_DEVICES" 
    android:usesPermissionFlags="neverForLocation" />
```

### Root Cause
Android 13+ requires explicit declaration that Wi-Fi scanning isn't for location tracking.

---

# CP005: Bluetooth Scan Without Restart Cycle
**Category:** Android | **Type:** Anti-Pattern
**Observed:** v1.0.48-v1.0.64 | **Evidence:** Scan dies after ~10s
**Impact:** No BLE data | **Versions Affected:** 1.0.48-1.0.64
**Fix:** 5s restart cycle mandatory (BP008)

### Failure Mode
- Start scan → works for ~10 seconds → silently stops
- No callback, no error, just stops reporting devices
- Required manual restart to resume

### Root Cause
Android Bluetooth stack has internal scan timeout; periodic restart keeps it alive.

---

# CP006: Wake Lock Always Held
**Category:** Android | **Type:** Anti-Pattern
**Observed:** v1.0.63 | **Evidence:** Battery drain, user complaints
**Impact:** Battery drain | **Versions Affected:** 1.0.63
**Fix:** Conditional acquire/release (BP010)

### Failure Mode
```java
// BAD - acquired at startup, never released
wakeLock.acquire(); // in onCreate()
```

### Impact
- 15-20% battery drain per hour
- App flagged by battery optimization
- User uninstalls

---

# CP007: Single-Method Wi-Fi Direct Broadcast
**Category:** Android | **Type:** Anti-Pattern
**Observed:** v1.0.13 | **Evidence:** Fails on some API levels
**Impact:** Unreliable | **Versions Affected:** 1.0.13
**Fix:** Multi-method fallback required (BP011)

### Failure Mode
Using only `WifiP2pManager.Builder` fails on API 23-28 where the class doesn't exist.

---

# CP008: Array Index Typo in EKF Initialization (CRITICAL)
**Category:** Android | **Type:** Anti-Pattern
**Observed:** v1.0.90-v1.0.91 | **Evidence:** x[2]=0; x[2]=0; should be x[3]=0
**Impact:** Broken velocity tracking | **Versions Affected:** 1.0.90-1.0.91
**Fix:** ALWAYS verify array indices (P0-01)

### The Bug
```java
// PositionEKF.java:38 - BROKEN
x[0] = 0;  // x position
x[1] = 0;  // y position
x[2] = 0;  // vx velocity
x[2] = 0;  // BUG: should be x[3] = 0; // vy velocity
```

### Consequences
- vy (Y velocity) never initialized → remains garbage
- Kalman filter produces wrong position estimates
- Trilateration/particle filter fed bad velocity data
- Fixed in v1.0.92 (pre-built APK exists)

### Prevention
- Code review for array initializations
- Unit tests for EKF with known inputs
- Static analysis for duplicate array indices

---

*Next Piece: HTML/JS Best Practices (BP014-BP017)*
