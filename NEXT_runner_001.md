# NEXT_runner_001 — Workspace Root

## Status: ✅ FOUR PROJECTS BUILD SUCCESSFUL (2026-10-14)

### Android SDK Environment — ✅ VERIFIED
```bash
# SDK installed at /opt/android-sdk
# Build tools 34.0.0: aapt2, d8, zipalign, apksigner ✅
# Platform android-34: android.jar ✅
```

### ACTIVE PROJECT: TGApp.WIP.V3 (Prime Electron Worldline - WebGL 3D) — ✅ COMPLETE
```bash
cd /workspace/app/CSMWip/11_TGApp/TGApp.WIP.V3
ln -sf ../../05_BOUNCE/debug.keystore debug.keystore
# Uses three.js (assets/three.min.js) - WebGL 3D electron with three.js
# Clean UI toggle button (hides ALL menus)
python3 build.py build
# → tgapp_electron_v3.apk created (1.8 MB with three.js + prime tiles)
```

### Log File Location (V3)
```
# V3 package: com.tgapp.electron.v3 (different from V2's com.tgapp.electron)
/storage/emulated/0/Android/data/com.tgapp.electron.v3/files/Download/tge_electron_crash_log.txt

# Also mirrored to public Downloads:
/storage/emulated/0/Download/tge_electron_crash_log.txt
```

### Other Projects (Build Verified)
| Project | Status | APK Size |
|---------|--------|----------|
| `CSMWip/05_BOUNCE` | ✅ | 25 KB |
| `CSMWip/11_TGApp/TGE_E5` | ✅ | 17 KB |
| `CSMWip/11_TGApp/TGApp.WIP.V2` | ✅ | 2.1 MB (2D Canvas) |
| `CSMWip/11_TGApp/TGApp.WIP.V3` | ✅ | 1.8 MB (WebGL 3D + three.js) |

### Build Commands Reference (V3 Active)
```bash
# === TGApp.WIP.V3 (WebGL 3D) - ACTIVE ===
cd /workspace/app/CSMWip/11_TGApp/TGApp.WIP.V3
ln -sf ../../05_BOUNCE/debug.keystore debug.keystore
python3 build.py build

# Verify
export BUILD_TOOLS=/opt/android-sdk/build-tools/34.0.0
$BUILD_TOOLS/apksigner verify tgapp_electron_v3.apk

# Install on device
adb install -r tgapp_electron_v3.apk
```

---

**Last Updated**: 2026-10-14  
**Active Project**: TGApp.WIP.V3 — WebGL 3D with three.js ✅, clean UI toggle, prime gaps, sensor integration, log file working
