# Working_Features_Versions_History — Piece 11/13
## Article A9: A9-09 — Working Features Versions History
**Piece:** 11 of 13  
**Generated:** 2026-10-08 15:28:33 UTC

---

# Limitations, Technical Debt & Known Issues

## 11.1 Critical Bugs (Fixed & Open)

### FIXED: EKF vy Initialization (v1.0.92)
- **File**: `PositionEKF.java:38`
- **Bug**: `x[2]=0; x[2]=0;` (vx set twice, vy uninitialized)
- **Fix**: `x[2]=0; x[3]=0;` (vx=0, vy=0)
- **Impact**: EKF velocity estimates garbage; position still usable via measurement update
- **Status**: Fixed in v1.0.92 (pre-built APK at `CSMWip/05_BOUNCE/BOUNCE.WIP/v92/out/Bounce-v1.0.92.apk`)

### OPEN: BLE Scan Death (Mitigated, Not Fixed)
- **Root cause**: Android `BluetoothLeScanner` stops callbacks after ~30-60s
- **Mitigation**: 5-second restart cycle (v1.0.65)
- **True fix**: Requires `ForegroundService` with `FOREGROUND_SERVICE_DATA_SYNC` (Android 14+)

### OPEN: RTT Ranging Stub (P0-02)
- **File**: `WifiRttRanging.java`
- **Status**: Boilerplate only; no integration
- **Blocker**: Hardware support limited (Pixel 3+, some Samsung)

---

## 11.2 Technical Debt Catalog

| ID | Component | Debt Description | Severity | Effort |
|----|-----------|------------------|----------|--------|
| TD-01 | build.sh | No incremental builds; full recompile every run | Medium | 2 days |
| TD-02 | build.sh | SDK paths hardcoded; no auto-detection | Medium | 1 day |
| TD-03 | MainActivity | 1,416 lines — exceeds single-file maintainability | High | 5 days |
| TD-04 | Algorithms | No unit tests for any positioning algorithm | High | 10 days |
| TD-05 | bounce.html | Three.js r128 pinned; r150+ breaking changes | Medium | 3 days |
| TD-06 | Permissions | Manual implementation; no helper library | Low | 2 days |
| TD-07 | Keystore | Debug only; no release keystore management | Medium | 1 day |
| TD-08 | CI/CD | No automated build/test pipeline | High | 3 days |
| TD-09 | AP Position | Random init; no SLAM/joint estimation | High | 10 days |
| TD-10 | Fusion | Equal weights; no confidence-based fusion | Medium | 5 days |
| TD-11 | Metrics | Heuristic metrics; no validation | Low | 3 days |
| TD-12 | Wake Lock | PARTIAL_WAKE_LOCK only; no foreground service | Medium | 2 days |

---

## 11.3 Performance Bottlenecks

### Android Side
| Bottleneck | Location | Impact | Mitigation |
|------------|----------|--------|------------|
| 6 algorithms parallel | MainActivity.java | CPU ~40% on mid-tier | Run sequentially with priority |
| BLE scan restart | BluetoothLeScanner | 5s gap in coverage | Foreground service |
| JSON serialization | evaluateJavascript() | GC pressure, 2ms/frame | Reuse StringBuilder |
| Trilateration iterations | Trilateration.java | 10 iterations × 3+ APs | Early exit on convergence |

### HTML/Three.js Side
| Bottleneck | Location | Impact | Mitigation |
|------------|----------|--------|------------|
| Trail points >2000 | bounce.html | FPS drop to 20 | LOD: decimate old points |
| Beacon spheres (8+) | bounce.html | Draw calls | InstancedMesh |
| Post-processing chain | bounce.html | GPU memory | Disable on low-end |
| Chart.js radar | bounce.html | Re-render on every frame | Throttle to 1Hz |

---

## 11.4 Platform Compatibility Matrix

| Feature | API 24 (7.0) | API 28 (9.0) | API 31 (12.0) | API 33 (13.0) | API 34 (14.0) |
|---------|--------------|--------------|---------------|---------------|---------------|
| Wi-Fi Scan | ✅ | ✅ | ✅ | ⚠️ NEARBY_WIFI | ✅ |
| Wi-Fi Direct | ✅ | ✅ | ✅ | ✅ | ✅ |
| BLE Scan | ✅ | ✅ | ⚠️ BLUETOOTH_SCAN | ✅ | ✅ |
| GPS Background | ✅ | ✅ | ⚠️ ACCESS_BG_LOC | ✅ | ✅ |
| RTT Ranging | ❌ | ✅ | ✅ | ✅ | ✅ |
| Wake Lock | ✅ | ✅ | ✅ | ✅ | ⚠️ Foreground svc |
| Auto-Update | ✅ | ✅ | ✅ | ✅ | ✅ |

**Legend**: ✅ Full support | ⚠️ Additional permission/requirement | ❌ Not available

---

## 11.5 Security Considerations

### Current State
- **Debug keystore**: Hardcoded password (`android`) — acceptable for debug
- **Network**: GitHub API over HTTPS (no cert pinning)
- **Permissions**: 15 runtime permissions — minimal for feature set
- **Data**: No user data collected; all local processing

### Gaps for Production
1. **Release keystore**: Required for Play Store (TD-07)
2. **Network security config**: Cert pinning for GitHub API
3. **Permission audit**: `ACCESS_BACKGROUND_LOCATION` needs Play Store justification
4. **ProGuard/R8**: No code obfuscation (no-Gradle limitation)
5. **App signing**: Play App Signing enrollment needed

---

*End of Piece 11 — Continue to Piece 12 for Next Enhancement Roadmap*