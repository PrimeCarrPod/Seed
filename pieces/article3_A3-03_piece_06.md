# Connection_Pathways_Bidirectional — Piece 06/13
## Article A3: A3-03 — Connection Pathways Bidirectional
**Piece:** 06 of 13  
**Generated:** 2026-10-08 04:26:00 UTC

---

## CONNECTION EVOLUTION HISTORY

### Version-by-Version Connection Additions

| Version | New Connections | Description |
|---------|----------------|-------------|
| 1.0.0 | C025, C030, C012 | Bridge init, HTML load, auto-spin |
| 1.0.1 | C015 | Toggle broadcast |
| 1.0.3 | C001, C023 | Wi-Fi scan, permissions |
| 1.0.4 | C004 | GPS location |
| 1.0.8 | C010 | Camera mode |
| 1.0.9 | C026 | Trail updates |
| 1.0.13 | C002 | BT LE scan (2D) |
| 1.0.20 | C006, C013, C014 | Broadcast status, scatter/reset beacons |
| 1.0.21 | C008 | Set vehicle data |
| 1.0.22 | C009 | Set fleet mode |
| 1.0.25 | C005 | Sensor fusion orientation |
| 1.0.30 | — | Static node field (data via C001) |
| 1.0.38 | — | Wi-Fi panel (data via C001) |
| 1.0.48 | C002 (enhanced) | BT LE with 5s restart |
| 1.0.49 | C016, C017 | Trail toggle, save trail |
| 1.0.52 | C024 | Error callbacks + try/catch |
| 1.0.55 | C011 | POV offset |
| 1.0.62 | C026 (enhanced) | Trail CatmullRom |
| 1.0.63 | C016 (enhanced) | Trail wake lock |
| 1.0.64 | C006 (enhanced) | Broadcast METAR slot |
| 1.0.65 | C002, C003 | BT 5s restart cycle fixed |
| 1.0.79 | C001 (enhanced) | Wi-Fi Kalman filter |
| 1.0.81 | C027, C028 | AP positions, zone HMM |
| 1.0.86 | C003, C018, C019, C020 | BT 3D, theory mode, trajectory queries |
| 1.0.90 | C027, C028 (enhanced) | 6-algo stack integration |
| 1.0.91 | C007, C021, C022, C029 | Update system, download/ignore, SSID refresh |

---

## CONNECTION GROWTH METRICS

| Metric | v1.0.0 | v1.0.50 | v1.0.91 |
|--------|--------|---------|---------|
| Total Connections | 3 | 18 | 30 |
| Android → HTML | 1 | 10 | 13 |
| HTML → Android | 2 | 6 | 12 |
| Bidirectional | 2 | 2 | 2 |
| Radio Data Feeds | 0 | 3 | 5 |
| Positioning Feeds | 1 | 3 | 5 |
| Control Methods | 1 | 4 | 12 |

### Growth Phases
1. **Foundation (v1.0.0-1.0.4):** Bridge + Wi-Fi + GPS + Camera + Auto-spin (5 connections)
2. **Radio Expansion (v1.0.8-1.0.30):** BT LE, Broadcast, Beacons, Vehicle/Fleet (12 connections)
3. **Sensor & Trail (v1.0.25-1.0.62):** Orientation, Trail, Error handling (18 connections)
4. **Algorithm Integration (v1.0.65-1.0.90):** BT 3D, 6-algo, AP positions, Zone HMM (26 connections)
5. **Polish & Updates (v1.0.91+):** Update system, SSID refresh (30 connections)

---

## DATA FLOW PATTERNS

### Pattern 1: Periodic Push (Radio/Positioning)
```
Android Timer/Callback → JSON serialize → evaluateJavascript → HTML UI.updateXxx()
Frequency: 1-5s (Wi-Fi, GPS, BT, Orientation, Broadcast, Zone)
```

### Pattern 2: User Action Call (Control)
```
HTML Button → Bounce.method() → @JavascriptInterface → Android runOnUiThread → Action
Latency: <10ms (direct call)
```

### Pattern 3: Query-Response (Trajectory)
```
HTML → Bounce.getXxx() → @JavascriptInterface (sync) → JSON string → HTML parse
Latency: <5ms (synchronous return)
```

### Pattern 4: Event-Driven Push (Errors/Updates)
```
Android Event → JSON → evaluateJavascript → HTML UI.showError()/showUpdateMenu()
Frequency: On event only
```

---

## PIECE 06 SUMMARY
This piece documents the connection evolution history (30 connections added across 5 growth phases from v1.0.0 to v1.0.91), connection growth metrics (3→18→30), and the four data flow patterns (periodic push, user action call, query-response, event-driven push). The bridge evolved from 3 core connections to 30 specialized pathways covering all app functionality.

**Next Piece (07):** Performance Characteristics — Latency, Throughput, Reliability