# Summary & Quick Reference

## Article A6: A6-06 — Repeated_Errors_Catalog_Solutions
**Piece:** 13 of 13  
**Generated:** 2026-10-08 05:30:40 UTC

---

# Complete Error Catalog Summary

## All 30 Errors at a Glance

| ID | Type | Short Description | Versions | Fix Version | Time |
|----|------|-------------------|----------|-------------|------|
| E001 | Build | JAVA_HOME invalid | 1.0.0-91 | 1.0.0 | High |
| E002 | Build | sdkmanager not found | 1.0.0-91 | 1.0.0 | High |
| E003 | Build | License EPIPE | 1.0.0-91 | 1.0.0 | Medium |
| E004 | Build | AGP 8.2 resolve fail | 1.0.80-85 | 1.0.85 | High |
| E005 | Build | Unresolved import | 1.0.80-85 | 1.0.85 | Low |
| E006 | Runtime | AppCompat theme crash | 1.0.80-85 | 1.0.85 | High |
| E007 | Runtime | APK installs closes | 1.0.80-85 | 1.0.85 | High |
| E008 | Build | Manifest icon missing | 1.0.80-85 | 1.0.85 | Medium |
| E009 | Runtime | WiFi scan no results | 1.0.80-85 | 1.0.85 | High |
| E010 | Runtime | BLE scan dies 10s | 1.0.48-64 | 1.0.65 | High |
| E011 | Runtime | EKF vy not init | 1.0.90-91 | 1.0.92 | Medium |
| E012 | Runtime | Three.js OOM | 1.0.49-53 | 1.0.54 | High |
| E013 | Runtime | Trail noisy stationary | 1.0.49-55 | 1.0.56 | Medium |
| E014 | Build | aapt2 resource missing | 1.0.0-91 | 1.0.0 | Medium |
| E015 | Build | MultiDex 64K | 1.0.80-85 | 1.0.85 | Low |
| E016 | Runtime | Bridge silent fail | 1.0.0-51 | 1.0.52 | High |
| E017 | Runtime | SSID timing drift | 1.0.13-19 | 1.0.20 | Medium |
| E018 | Runtime | WiFi Direct GO fail | 1.0.13 | 1.0.14 | Medium |
| E019 | Runtime | GPS speed zero | 1.0.4-26 | 1.0.27 | Low |
| E020 | Runtime | Azimuth wrap 360 | 1.0.25-91 | 1.0.25 | Medium |
| E021 | Build | Gradle no Java | 1.0.80-85 | 1.0.85 | Medium |
| E022 | Build | R.java unresolved | 1.0.80-85 | 1.0.85 | Low |
| E023 | Runtime | BT perms API31+ | 1.0.48-91 | 1.0.48 | High |
| E024 | Runtime | BG location perm | 1.0.29-91 | 1.0.29 | High |
| E025 | Build | zipalign missing | 1.0.0-91 | 1.0.0 | High |
| E026 | Build | apksigner missing | 1.0.0-91 | 1.0.0 | High |
| E027 | Runtime | BT name null | 1.0.48-85 | 1.0.85 | Low |
| E028 | Runtime | CatmullRom <4 pts | 1.0.62-91 | 1.0.62 | Low |
| E029 | Runtime | Bloom too bright | 1.0.50-91 | 1.0.50 | Medium |
| E030 | Build | android-33 missing | 1.0.0-91 | 1.0.0 | Critical |

---

# Quick Reference Cards

## Environment Setup (Run Every Session)
```bash
export JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64
export ANDROID_HOME=/opt/android-sdk
export PATH=$JAVA_HOME/bin:$ANDROID_HOME/cmdline-tools/latest/bin:
  $ANDROID_HOME/build-tools/33.0.1:$ANDROID_HOME/platform-tools:$PATH

# Verify
java -version && sdkmanager --version
ls $ANDROID_HOME/platforms/android-33/android.jar
```

## Build Commands (Memorize)
```bash
# Clean build
./build.sh clean && ./build.sh

# Install
adb install -r app.apk

# Logs
adb logcat -s Bounce:* *:E
```

## Critical Files to Never Break
| File | Guard |
|------|-------|
| build.sh | Test after ANY change |
| PositionEKF.java:38 | **vy = x[3] not x[2]** |
| BleScanService.java | 5s restart cycle |
| MainActivity.java | Permissions v1.0.3 pattern |
| bounce.html | Local assets only |

## Permission Matrix (Copy to Manifest)
```xml
<!-- Location -->
<uses-permission android:name="android.permission.ACCESS_FINE_LOCATION" />
<uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION" />
<uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION" />

<!-- Bluetooth (API 31+) -->
<uses-permission android:name="android.permission.BLUETOOTH_SCAN"
    android:usesPermissionFlags="neverForLocation" />
<uses-permission android:name="android.permission.BLUETOOTH_CONNECT" />
<uses-permission android:name="android.permission.BLUETOOTH_ADVERTISE" />
<!-- Legacy -->
<uses-permission android:name="android.permission.BLUETOOTH"
    android:maxSdkVersion="30" />
<uses-permission android:name="android.permission.BLUETOOTH_ADMIN"
    android:maxSdkVersion="30" />

<!-- Wi-Fi (API 33+) -->
<uses-permission android:name="android.permission.NEARBY_WIFI_DEVICES"
    android:usesPermissionFlags="neverForLocation" />
```

## Emergency Debug Commands
```bash
# EKF state
adb shell am broadcast -a com.carrpod.bounce.DUMP_EKF

# Trail points
adb shell am broadcast -a com.carrpod.bounce.DUMP_TRAIL

# BLE scan status
adb shell am broadcast -a com.carrpod.bounce.DUMP_BLE

# Health check
adb shell am broadcast -a com.carrpod.bounce.HEALTH_CHECK

# WebView debug
adb shell setprop debug.webview.chromium com.carrpod.bounce
# Then: chrome://inspect
```

---

# Cross-References to Other Sections

| Section | Relevant Errors |
|---------|-----------------|
| 1 (HTML Aspects) | E012, E016, E028, E029 |
| 2 (Android Features) | E006-E011, E017-E019, E023-E024 |
| 3 (Connections) | E016, E027 |
| 4 (SDK/Tools) | E001-E005, E014, E015, E021, E022, E025, E026, E030 |
| 5 (Best Practices) | All - anti-patterns cataloged here |
| 7 (Future Progress) | E011 (P0-01), E010 (P1-03), E012 (P1-02) |
| 9 (Working Features) | Timeline of fixes |
| 10 (Refinement) | E011, E015, E018, E020, E028, E029 |
| 12 (Forensic) | Full version history in version_changes.csv |

---

# Key Lessons Learned

1. **Build system is a feature** - Gradle experiment cost 9 errors and 20x build time
2. **Silent failures are dangerous** - BLE scan death, EKF bug, bridge failures
3. **API level permissions escalate** - Each Android version adds granular perms
4. **Environment isn't persistent** - JAVA_HOME, SDK paths must be re-setup each session
5. **Unit tests would have caught E011** - Array index typo in EKF initialization
6. **Defensive patterns pay off** - 5s BLE restart, speed threshold, angle normalization
7. **Fallback chains essential** - WiFi Direct: Builder → Reflection → Bonjour

---

# Final Recommendation

**Top 3 fixes that would prevent 80% of errors:**
1. **Environment bootstrap script** - Automates E001, E002, E003, E025, E026, E030
2. **Permission matrix + centralized manager** - Handles E009, E023, E024
3. **Unit tests for positioning algorithms** - Would catch E011, validate E010, E012, E020

---

*End of Repeated Errors Catalog & Solutions (Section 6 / Article A6-06)*" article6