# Debugging Playbooks

## Article A6: A6-06 — Repeated_Errors_Catalog_Solutions
**Piece:** 12 of 13  
**Generated:** 2026-10-08 05:30:08 UTC

---

# Playbook 1: Build Fails Immediately

## Symptoms
- `JAVA_HOME invalid` / `sdkmanager not found` / `zipalign not found` / `android.jar missing`

## Diagnosis
```bash
# Run verification
./verify_env.sh
```

## Verification Script
```bash
#!/bash
# verify_env.sh
echo "=== Environment Verification ==="
echo "JAVA_HOME: $JAVA_HOME"
java -version 2>&1 | head -1
echo "ANDROID_HOME: $ANDROID_HOME"
echo "cmdline-tools: $(ls $ANDROID_HOME/cmdline-tools/)"
echo "build-tools: $(ls $ANDROID_HOME/build-tools/)"
echo "platforms: $(ls $ANDROID_HOME/platforms/)"
sdkmanager --version
```

## Fixes
| Error | Fix |
|-------|-----|
| JAVA_HOME | `export JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64` |
| sdkmanager | `mv $ANDROID_HOME/cmdline-tools/cmdline-tools $ANDROID_HOME/cmdline-tools/latest` |
| Licenses | `printf 'y\n%.0s' {1..8} | sdkmanager --licenses` |
| zipalign/apksigner | `sdkmanager "build-tools;33.0.1"` |
| android.jar | `sdkmanager "platforms;android-33"` |

---

# Playbook 2: APK Installs But Crashes on Launch

## Symptoms
- `adb install` succeeds
- App icon appears, tap opens then immediately closes
- No error in `adb logcat` initially

## Diagnosis
```bash
# Get crash log
adb logcat -s AndroidRuntime:E *:S
```

## Common Causes & Fixes
| Logcat Error | Cause | Fix |
|--------------|-------|-----|
| `Theme.AppCompat` not found | Using AppCompatActivity without dependency | Use `Activity` + `@android:style/Theme.Material.NoActionBar` |
| `ResourceNotFound: mipmap/ic_launcher` | Missing adaptive icon | Create `res/mipmap-anydpi-v26/ic_launcher.xml` |
| `ClassNotFoundException: MainActivity` | Package name mismatch | Verify `package=` in manifest matches Java package |
| `NullPointerException` in onCreate | setContentView after crash | Call `setContentView()` FIRST in onCreate |

## Verification Checklist
- [ ] Manifest: `android:theme="@android:style/Theme.Material.NoActionBar"`
- [ ] Adaptive icon exists in `mipmap-anydpi-v26/`
- [ ] `setContentView()` is first line after `super.onCreate()`
- [ ] Package name consistent everywhere

---

# Playbook 3: BLE Scan Stops Working

## Symptoms
- Scan starts, gets results for ~10 seconds
- Then no more callbacks
- `BluetoothAdapter` still reports scanning

## Diagnosis
```bash
# Check scan state
adb shell dumpsys bluetooth_manager | grep -A5 Scan
```

## Root Cause
Android kills continuous LE scan after ~10s (battery optimization)

## Fix
Implement 5s restart cycle (see E010):
```java
// In BleScanService
handler.postDelayed(scanRestarter, 5000);
// scanRestarter: stopScan -> startScan -> postDelayed(this, 5000)
```

## Verification
- [ ] Scan runs continuously for 5+ minutes
- [ ] Log shows "BLE scan restarted" every 5s
- [ ] Devices discovered consistently

---

# Playbook 4: Position Estimates Wrong (EKF Bug)

## Symptoms
- Position jumps erratically
- Y velocity grows unbounded
- Trail shows impossible movement

## Diagnosis
```bash
# Dump EKF state
adb shell am broadcast -a com.carrpod.bounce.DUMP_EKF
```

## Check EKF Initialization
```java
// PositionEKF.java:38
x[0] = x;  // x pos
x[1] = y;  // y pos
x[2] = 0;  // vx
x[3] = 0;  // vy - MUST BE x[3], NOT x[2]!
```

## Unit Test (Must Pass)
```java
@Test
public void testEKFInit() {
    PositionEKF ekf = new PositionEKF();
    ekf.initialize(0, 0);
    assertEquals(0, ekf.getState()[2], 0.001); // vx
    assertEquals(0, ekf.getState()[3], 0.001); // vy
}
```

---

# Playbook 5: WebView/Three.js Issues

## Symptoms
- 3D view blank or crashes after time
- `WebGL context lost` in console
- JS bridge calls fail silently

## Diagnosis
```bash
# Enable WebView debugging
adb shell setprop debug.webview.chromium <package_name>
# Then open chrome://inspect on desktop
```

## Fixes
| Issue | Fix |
|-------|-----|
| Context lost | Dispose geometry/material before rebuild |
| Bridge silent | try/catch + window.onerror |
| Bloom too bright | Reduce strength on mobile |
| Jagged trail | Min 4 points for CatmullRom |

---

# Playbook 6: Permission Denied (WiFi/BT/Location)

## Symptoms
- Feature silently fails
- No results from scan
- SecurityException in logcat

## Diagnosis
```bash
# Check granted permissions
adb shell dumpsys package com.carrpod.bounce | grep permission
```

## API-Level Permission Checklist
| Feature | API 23-28 | API 29-30 | API 31-32 | API 33+ |
|---------|-----------|-----------|-----------|---------|
| GPS Foreground | FINE/COARSE | FINE/COARSE | FINE/COARSE | FINE/COARSE |
| GPS Background | - | BACKGROUND | BACKGROUND | BACKGROUND |
| BLE Scan | BLUETOOTH | BLUETOOTH | SCAN | SCAN (neverForLocation) |
| BLE Connect | BLUETOOTH | BLUETOOTH | CONNECT | CONNECT |
| Wi-Fi Scan | FINE/COARSE | FINE/COARSE | FINE/COARSE | NEARBY_WIFI_DEVICES |

---

# Playbook 7: Gradle Build Issues (If Using Gradle)

## Symptoms
- `Could not resolve all files`
- `Unresolved reference: R`
- `d8: Cannot fit classes in single dex`

## Fixes
| Error | Fix |
|-------|-----|
| AGP resolve | Pin AGP 8.1.0 + Gradle 8.4 |
| R.java missing | Verify `aapt2 link --java` output dir |
| MultiDex | Enable `multiDexEnabled true` |

**Recommendation:** Don't use Gradle for this project. Use aapt2 no-Gradle build.

---

*Next Piece: Summary & Quick Reference*