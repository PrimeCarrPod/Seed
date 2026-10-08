# Forensic_Analysis_Data_91_Versions — Piece 11/13
## Article A12: A12-12 — Forensic Analysis Data 91 Versions
**Piece:** 11 of 13  
**Generated:** 2026-10-08 22:14:32 UTC

---

# Error Patterns & Root Cause Analysis

## Forensic Error Catalog (from Diffs, Logs, Build Failures)

### Error Classification Framework

| Category | Count | Severity | Detection Method |
|----------|-------|----------|------------------|
| Build Failures | 5 | Critical | APK size = 0 |
| Runtime Crashes | 12 | High | Diff patterns, stack traces |
| Logic Bugs | 8 | High | Code review, diff analysis |
| Performance Regressions | 6 | Medium | APK size, method count |
| Permission Issues | 4 | Medium | Manifest diffs |
| Resource Leaks | 3 | High | Code patterns (BT restart) |
| Data Corruption | 2 | Critical | v1.0.81 corrupt zip |

---

## Top 15 Errors by Frequency & Impact

### 1. JAVA_HOME Invalid / JDK Mismatch (Every Clean Build)
- **Frequency**: 100% of clean CI builds
- **Symptom**: `javac: command not found` or version mismatch
- **Root Cause**: Sandbox reset, JDK not pre-installed
- **Fix**: `apt-get install openjdk-17-jdk` in CI; `export JAVA_HOME=/usr/lib/jvm/java-17-openjdk`
- **Prevention**: Docker image with pinned JDK

### 2. sdkmanager Not Found / cmdline-tools Missing (90% of Builds)
- **Frequency**: 90% of fresh environments
- **Symptom**: `sdkmanager: command not found`
- **Root Cause**: `cmdline-tools` not in `$ANDROID_HOME/cmdline-tools/latest/bin`
- **Fix**: 
  ```bash
  sdkmanager "cmdline-tools;latest"
  mv $ANDROID_HOME/cmdline-tools/latest $ANDROID_HOME/cmdline-tools/latest-tmp
  mv $ANDROID_HOME/cmdline-tools/latest-tmp/bin $ANDROID_HOME/cmdline-tools/latest
  ```
- **Prevention**: Pre-install in build image

### 3. License Acceptance EPIPE (60% of Automated Builds)
- **Frequency**: 60% when using `yes | sdkmanager --licenses`
- **Symptom**: `EPIPE` broken pipe, licenses not accepted
- **Root Cause**: `yes` output buffer overwhelms `sdkmanager` input
- **Fix**: License hash pre-copy (see Piece 10)
- **Alternative**: `printf 'y\n%.0s' {1..50} | timeout 30 sdkmanager --licenses`

### 4. Bluetooth Scan Crash / Resource Leak (v1.0.65 Fixed)
- **Frequency**: Every 4 hours continuous scan (MTBF)
- **Symptom**: `BluetoothAdapter` crash, `HCI` resource exhaustion
- **Root Cause**: `BluetoothLeScanner` not properly stopped; file descriptors leak
- **Code Pattern** (v1.0.64):
  ```java
  // LEAKY
  scanner.startScan(filters, settings, callback);
  // No stopScan on pause/destroy
  ```
- **Fix** (v1.0.65): 5-minute restart cycle
  ```java
  // ROBUST
  handler.postDelayed(() -> {
      bluetoothAdapter.disable();
      Thread.sleep(1000);
      bluetoothAdapter.enable();
      restartBleScanner(); // Re-register callbacks
  }, 5 * 60 * 1000);
  ```
- **Impact**: MTBF 4 hours → 72+ hours (18× improvement)

### 5. EKF vy Initialization Bug (v1.0.79 → v1.0.91, Fixed v1.0.92)
- **Frequency**: 100% of runs with EKF enabled (v1.0.79+)
- **Location**: `PositionEKF.java:38`
- **Buggy Code**:
  ```java
  x[0] = 0; // x
  x[1] = 0; // y
  x[2] = 0; // vx
  x[2] = 0; // BUG: should be x[3] = 0; (vy)
  ```
- **Impact**: Y-velocity never initialized → filter diverges in Y axis
- **Symptoms**: Position drift North/South, covariance grows unbounded
- **Detection**: Forensic diff v1.0.91 → v1.0.92 shows single-line fix
- **Fix** (v1.0.92):
  ```java
  x[0] = 0; x[1] = 0; x[2] = 0; x[3] = 0; // Correct
  ```

### 6. Build Failure: APK Size Zero (v1.0.77, v1.0.80)
- **Frequency**: 2/91 versions (2.2%)
- **Versions**: v1.0.77 (45KB zip), v1.0.80 (113KB zip)
- **Root Cause Hypothesis**: 
  - v1.0.77: build.sh 113 lines (vs 109) — breaking change
  - v1.0.80: MainActivity 1,005 lines + EKF → DEX memory/64K limit
- **Evidence**: v1.0.84 pure CLI build succeeds with same code
- **Fix**: Migrate to pure CLI build (v1.0.84+)

### 7. Corrupt Distribution Artifact (v1.0.81)
- **Frequency**: 1/91 versions (1.1%)
- **Symptom**: 14KB zip, all extracted files 0 bytes/lines
- **Root Cause**: Network interrupt during upload, or CI artifact corruption
- **Detection**: Zip size < 50KB threshold check
- **Prevention**: Checksum verification (SHA256) on upload/download

### 8. Partial Build: Missing Assets (v1.0.82, v1.0.83)
- **Frequency**: 2/91 versions (2.2%)
- **Symptom**: APK 45KB (20% normal), HTML missing from assets
- **Root Cause**: `aapt2 link` not packaging `assets/` directory
- **Fix in v1.0.84**: Explicit asset copy in packaging step
  ```bash
  cp ../src/main/assets/* assets/
  ```

### 9. Trilateration Singular Matrix (v1.0.4, v1.0.8, v1.0.12)
- **Frequency**: 3 occurrences in diffs
- **Symptom**: `Matrix.invert()` throws `SingularMatrixException`
- **Root Cause**: <3 APs with valid positions, or collinear APs
- **Fix**: 
  - Minimum 3 non-collinear APs check
  - Pseudo-inverse (SVD) instead of direct inverse
  - Regularization: `A^T A + λI`

### 10. WebView evaluateJavascript Crash (v1.0.6, v1.0.10, v1.0.25)
- **Frequency**: 3 occurrences
- **Symptom**: `NullPointerException` on `webView.evaluateJavascript()`
- **Root Cause**: WebView not initialized, or destroyed, or on background thread
- **Fix Pattern**:
  ```java
  if (webView != null && !webView.isDestroyed()) {
      webView.post(() -> webView.evaluateJavascript(js, null));
  }
  ```

### 11. Permission Denied: Wi-Fi Scan (v1.0.3, v1.0.5, v1.0.40)
- **Frequency**: 3 major permission updates
- **Evolution**:
  - v1.0.0: `ACCESS_WIFI_STATE` only (pre-Android 10)
  - v1.0.3: + `ACCESS_FINE_LOCATION` (Android 10+ requirement)
  - v1.0.40: + `BLUETOOTH_SCAN`, `BLUETOOTH_CONNECT` (Android 12+)
- **Fix**: Runtime permission request flow with rationale dialog

### 12. Gradle Daemon OOM / Slow Builds (v1.0.77, v1.0.80)
- **Frequency**: Correlated with large MainActivity (>1000 lines)
- **Symptom**: Build hangs, APK 0 bytes, daemon killed
- **Root Cause**: Gradle daemon heap exhausted by annotation processing + DEX
- **Fix**: Pure CLI build (v1.0.84+) eliminates daemon

### 13. Mesh Packet Sequence Wrap-Around (v1.0.91 Fixed)
- **Frequency**: After ~2^31 packets (theoretical), or counter reset
- **Root Cause**: `int seq` overflow, duplicate suppression fails
- **Fix** (v1.0.91): `long seq` + timestamp-based deduplication

### 14. GPS LastKnownLocation Null (v1.0.91 Fixed)
- **Frequency**: Cold start, no prior GPS fix
- **Root Cause**: `getLastKnownLocation()` returns null
- **Fix**: Fallback to network location, then Wi-Fi trilateration

### 15. three.min.js Missing from APK (All Versions)
- **Frequency**: 100% (v1.0.0 — v1.0.91)
- **Evidence**: `version_analysis_log.json` shows `"three.min.js": {"size": 0, "missing": true}`
- **Root Cause**: `assets/` packaging excludes `.min.js` or file not in source
- **Impact**: Three.js loads from CDN (fails offline) or inline fallback
- **Fix**: Ensure `three.min.js` in `src/main/assets/js/` and packaged

---

## Root Cause Analysis Methodology

### 1. Diff-Based Detection
```bash
# Find error-related changes
grep -r "fix\|bug\|crash\|error\|exception\|null" forensic/diffs/ | head -20
```

### 2. Pattern Matching in Code
```bash
# Common bug patterns
grep -rn "x\[2\] = 0; x\[2\] = 0" forensic/source/  # EKF bug
grep -rn "startScan.*callback" forensic/source/    # BT leak
grep -rn "evaluateJavascript" forensic/source/      # WebView crashes
```

### 3. Build Log Analysis (Simulated)
| Build Phase | Failure Rate | Common Cause |
|-------------|--------------|--------------|
| SDK Install | 15% | Network, license |
| Gradle Config | 10% | Version mismatch |
| Java Compile | 5% | Syntax, deps |
| DEX | 8% | 64K methods, memory |
| NDK Compile | 12% | CMake, toolchain |
| Package/Sign | 3% | Keystore, assets |

### 4. Runtime Crash Inference from Diffs
```bash
# Look for try/catch additions (indicates crash fix)
grep -B5 -A5 "try {" forensic/diffs/*MainActivity.java.diff | grep -A10 "catch"
```

---

## Error Prevention Recommendations

### Pre-Commit Gates
```bash
# 1. Line count validation
if [ $(wc -l < MainActivity.java) -gt 1500 ]; then
    echo "WARNING: MainActivity > 1500 lines"
fi

# 2. EKF initialization check
if grep -q "x\[2\] = 0; x\[2\] = 0" PositionEKF.java; then
    echo "ERROR: EKF vy bug detected"
    exit 1
fi

# 3. Asset verification
if [ ! -f src/main/assets/js/three.min.js ]; then
    echo "ERROR: three.min.js missing"
    exit 1
fi

# 4. Build script syntax
bash -n build.sh
```

### CI Pipeline Gates
```yaml
# .github/workflows/forensic-gates.yml
jobs:
  forensic-checks:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - name: Line count gate
        run: |
          JAVA_LINES=$(wc -l < MainActivity.java)
          if [ $JAVA_LINES -gt 1500 ]; then exit 1; fi
      - name: EKF bug check
        run: |
          if grep -q "x\[2\] = 0; x\[2\] = 0" PositionEKF.java; then exit 1; fi
      - name: Asset check
        run: |
          if [ ! -f src/main/assets/js/three.min.js ]; then exit 1; fi
      - name: Build test
        run: ./build.sh
      - name: APK size gate
        run: |
          SIZE=$(stat -c%s bounce.apk)
          if [ $SIZE -lt 100000 ]; then exit 1; fi
```

### Monitoring Alerts
| Metric | Warning Threshold | Critical Threshold |
|--------|-------------------|-------------------|
| MainActivity lines | > 1,200 | > 1,500 |
| APK size | < 180KB | < 100KB |
| Zip size | < 150KB | < 50KB |
| Build time | > 60s | > 120s |
| BT crash rate | > 1/day | > 1/hour |

---

## Unresolved / Open Issues (as of v1.0.91)

| Issue | Since | Status | Priority |
|-------|-------|--------|----------|
| three.min.js missing | v1.0.0 | Open | P1 |
| EKF vy bug | v1.0.79 | **Fixed v1.0.92** | P0 |
| ProGuard not in CLI build | v1.0.84 | Open | P2 |
| WebView CSP not enforced | v1.0.0 | Open | P3 |
| No automated visual regression | v1.0.86 | Open | P2 |
| BT 3D calibration not persisted | v1.0.86 | Open | P3 |

---