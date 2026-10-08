# Connection_Pathways_Bidirectional — Piece 03/13
## Article A3: A3-03 — Connection Pathways Bidirectional
**Piece:** 03 of 13  
**Generated:** 2026-10-08 04:26:00 UTC

---

## HTML → ANDROID: BEACON & PHYSICS CONTROL (C013-C014)

### C013: Scatter Beacons
- **HTML Call:** `Bounce.scatterBeacons()`
- **Android Method:** `MainActivity.scatterBeacons()`
- **Data Format:** Void
- **Trigger:** SCATTER button
- **First Version:** 1.0.20 | **Last Version:** 1.0.91
- **Reliability:** High
- **Notes:** Randomizes beacon positions

### C014: Reset Beacons
- **HTML Call:** `Bounce.resetBeacons()`
- **Android Method:** `MainActivity.resetBeacons()`
- **Data Format:** Void
- **Trigger:** Circle formation button
- **First Version:** 1.0.20 | **Last Version:** 1.0.91
- **Reliability:** High
- **Notes:** Delayed circle formation (2s delay)

---

## HTML → ANDROID: RADIO CONTROL (C015-C016)

### C015: Toggle Broadcast
- **HTML Call:** `Bounce.toggleBroadcast()`
- **Android Method:** `MainActivity.toggleBroadcast()`
- **Data Format:** Boolean
- **Trigger:** BROADCAST button
- **First Version:** 1.0.1 | **Last Version:** 1.0.91
- **Reliability:** Medium
- **Notes:** Start/stop P2P, multi-method fallback (v1.0.14)

### C016: Toggle Trail
- **HTML Call:** `Bounce.toggleTrail()`
- **Android Method:** `MainActivity.toggleTrail()`
- **Data Format:** Boolean
- **Trigger:** TRAIL button
- **First Version:** 1.0.49 | **Last Version:** 1.0.91
- **Reliability:** High
- **Notes:** Record GPS trail, wake lock management (v1.0.63)

---

## HTML → ANDROID: DATA ACTIONS (C017-C018)

### C017: Save Trail
- **HTML Call:** `Bounce.saveTrail()`
- **Android Method:** `MainActivity.saveTrail()`
- **Data Format:** Void
- **Trigger:** SAVE button
- **First Version:** 1.0.49 | **Last Version:** 1.0.91
- **Reliability:** High
- **Notes:** Blob download of trail data

### C018: Set Theory Mode
- **HTML Call:** `Bounce.setTheoryMode(enabled)`
- **Android Method:** `MainActivity.setTheoryMode()`
- **Data Format:** Boolean
- **Trigger:** THEORY button
- **First Version:** 1.0.86 | **Last Version:** 1.0.91
- **Reliability:** High
- **Notes:** Ghost trajectories toggle

---

## HTML → ANDROID: TRAJECTORY QUERIES (C019-C020)

### C019: Get Trajectory
- **HTML Call:** `Bounce.getTrajectory(addr)`
- **Android Method:** `MainActivity.getTrajectory()`
- **Data Format:** JSON array — trajectory points
- **Trigger:** JS call (per-device history)
- **First Version:** 1.0.86 | **Last Version:** 1.0.91
- **Reliability:** High
- **Notes:** Per-device trajectory history

### C020: Get All Devices
- **HTML Call:** `Bounce.getAllDevices()`
- **Android Method:** `MainActivity.getAllDevices()`
- **Data Format:** JSON array — all BT devices
- **Trigger:** JS call
- **First Version:** 1.0.86 | **Last Version:** 1.0.91
- **Reliability:** High
- **Notes:** All active devices for theory mode

---

## PIECE 03 SUMMARY
This piece covers beacon/physics control (scatter/reset), radio control (broadcast/toggle with multi-method fallback), data actions (save trail, theory mode), and trajectory queries (per-device and all devices). These connections enable the interactive 3D visualization features — beacon physics, broadcast control, trail recording, and Bluetooth 3D spatial tracking with history.

**Next Piece (04):** HTML → Android — Update Actions (Download/Ignore) + Connection Reliability Analysis