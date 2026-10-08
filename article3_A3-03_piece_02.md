# Connection_Pathways_Bidirectional — Piece 02/13
## Article A3: A3-03 — Connection Pathways Bidirectional
**Piece:** 02 of 13  
**Generated:** 2026-10-08 04:26:00 UTC

---

## ANDROID → HTML: SYSTEM & ALGORITHM DATA (C006-C008, C023-C024, C027-C028)

### C006: Broadcast Status
- **Android Method:** `onBroadcastStatus(status)`
- **HTML Function:** `UI.updateBroadcastStatus(data)`
- **Data Format:** JSON — slot, ssid, active
- **Trigger:** SSID broadcast change (every 5.1s)
- **First Version:** 1.0.20 | **Last Version:** 1.0.91
- **Reliability:** Medium
- **Notes:** 4-slot rotation, slot timing drift fixed v1.0.20

### C007: Update Available
- **Android Method:** `onUpdateAvailable(version)`
- **HTML Function:** `UI.showUpdateMenu(version)`
- **Data Format:** JSON — version, url
- **Trigger:** Update check complete
- **First Version:** 1.0.91 | **Last Version:** 1.0.91
- **Reliability:** High
- **Notes:** Manual update UI, auto-check removed v1.0.93

### C023: Permission Results
- **Android Method:** `onPermissionResult(granted)`
- **HTML Function:** `UI.handlePermissionResult()`
- **Data Format:** Boolean array
- **Trigger:** Permission request callback
- **First Version:** 1.0.3 | **Last Version:** 1.0.91
- **Reliability:** High
- **Notes:** Runtime perms, proven v1.0.3 pattern (v1.0.45)

### C024: Error Callbacks
- **Android Method:** `onError(error)`
- **HTML Function:** `UI.showError(error)`
- **Data Format:** String — error message
- **Trigger:** Error callback
- **First Version:** 1.0.52 | **Last Version:** 1.0.91
- **Reliability:** Medium
- **Notes:** Error display, HTML try/catch wrapper (v1.0.52)

### C027: AP Position Updates
- **Android Method:** `onApPositionUpdate(aps)`
- **HTML Function:** `UI.updateApPositions(data)`
- **Data Format:** JSON array — AP positions
- **Trigger:** Trilateration/EKF update
- **First Version:** 1.0.90 | **Last Version:** 1.0.91
- **Reliability:** Medium
- **Notes:** Position algorithms, AP position learning pending

### C028: Zone Updates
- **Android Method:** `onZoneUpdate(zone)`
- **HTML Function:** `UI.updateZoneDisplay(data)`
- **Data Format:** JSON — zone classification
- **Trigger:** Zone HMM update
- **First Version:** 1.0.90 | **Last Version:** 1.0.91
- **Reliability:** Medium
- **Notes:** IMMEDIATE/NEAR/FAR, hysteresis prevents flutter (v1.0.90)

---

## HTML → ANDROID: VEHICLE & FLEET CONTROL (C008-C009)

### C008: Set Vehicle Data
- **HTML Call:** `Bounce.setVehicleData(data)`
- **Android Method:** `MainActivity.setVehicleData()`
- **Data Format:** JSON — plate, originKey, fleet, make, color
- **Trigger:** +VEHICLE button
- **First Version:** 1.0.21 | **Last Version:** 1.0.91
- **Reliability:** High
- **Notes:** Vehicle configuration

### C009: Set Fleet Mode
- **HTML Call:** `Bounce.setFleetMode(data)`
- **Android Method:** `MainActivity.setFleetMode()`
- **Data Format:** JSON — enabled, key
- **Trigger:** +FLEET button
- **First Version:** 1.0.22 | **Last Version:** 1.0.91
- **Reliability:** High
- **Notes:** Fleet toggle

---

## HTML → ANDROID: CAMERA CONTROL (C010-C012)

### C010: Set Camera Mode
- **HTML Call:** `Bounce.setCameraMode(mode)`
- **Android Method:** `MainActivity.setCameraMode()`
- **Data Format:** String — orbit|fly|pov
- **Trigger:** Camera mode buttons
- **First Version:** 1.0.8 | **Last Version:** 1.0.91
- **Reliability:** High
- **Notes:** Three modes (Orbit/FLY/POV)

### C011: Set POV Offset
- **HTML Call:** `Bounce.setPovOffset(delta)`
- **Android Method:** `MainActivity.setPovOffset()`
- **Data Format:** Integer — ±10
- **Trigger:** POV zoom buttons
- **First Version:** 1.0.55 | **Last Version:** 1.0.91
- **Reliability:** High
- **Notes:** Chase distance adjustment

### C012: Set Auto Spin
- **HTML Call:** `Bounce.setAutoSpin(enabled)`
- **Android Method:** `MainActivity.setAutoSpin()`
- **Data Format:** Boolean
- **Trigger:** SPIN button
- **First Version:** 1.0.0 | **Last Version:** 1.0.91
- **Reliability:** High
- **Notes:** Auto-rotate toggle

---

## PIECE 02 SUMMARY
This piece covers the remaining Android→HTML connections (broadcast status, update available, permission results, errors, AP positions, zone classification) and the first 5 HTML→Android control connections (vehicle data, fleet mode, camera mode, POV offset, auto-spin). These represent system status feeds and core camera/vehicle controls.

**Next Piece (03):** HTML → Android — Beacon Control, Broadcast, Trail, Theory Mode, Trajectory