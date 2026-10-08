# Root Cause Taxonomy & Prevention Strategies

## Article A6: A6-06 — Repeated_Errors_Catalog_Solutions
**Piece:** 11 of 13  
**Generated:** 2026-10-08 05:29:36 UTC

---

# Root Cause Categories

## 1. Environment Configuration (30% of errors)
| Error | Root Cause | Prevention |
|-------|------------|------------|
| E001 | JAVA_HOME not persisted | Add to shell rc + verify in build.sh |
| E002 | SDK cmdline-tools path | Automate `mv .../latest` in setup |
| E003 | License acceptance EPIPE | Use license hash bypass |
| E025 | build-tools not installed | `sdkmanager "build-tools;33.0.1"` in bootstrap |
| E026 | apksigner not installed | Same as E025 |
| E030 | android-33 platform missing | `sdkmanager "platforms;android-33"` in bootstrap |
| E021 | JAVA_HOME before Gradle | Export in build script preamble |

**Prevention: Environment Bootstrap Script**
```bash
#!/bash
# bootstrap_env.sh - Run once per session
export JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64
export ANDROID_HOME=/opt/android-sdk
export PATH=$JAVA_HOME/bin:$ANDROID_HOME/cmdline-tools/latest/bin:
  $ANDROID_HOME/build-tools/33.0.1:$ANDROID_HOME/platform-tools:$PATH

# Verify
java -version
sdkmanager --version
ls $ANDROID_HOME/platforms/android-33/android.jar
```

---

## 2. API Level Evolution (23% of errors)
| Error | API Change | Pattern |
|-------|------------|---------|
| E009 | API33: NEARBY_WIFI_DEVICES | New permission for existing capability |
| E023 | API31: 3 BT permissions | Granular replacement of BLUETOOTH |
| E024 | API29: ACCESS_BACKGROUND_LOCATION | Separate background permission |
| E006-E008 | API26+: Adaptive icons | New icon format required |

**Prevention: Permission Compatibility Matrix**
```java
// PermissionManager.java - Centralized handling
public class PermissionManager {
    public static String[] getRequiredPermissions(int apiLevel) {
        List<String> perms = new ArrayList<>();
        perms.add(ACCESS_FINE_LOCATION);
        perms.add(ACCESS_COARSE_LOCATION);
        
        if (apiLevel >= 29) perms.add(ACCESS_BACKGROUND_LOCATION);
        if (apiLevel >= 31) {
            perms.add(BLUETOOTH_SCAN);
            perms.add(BLUETOOTH_CONNECT);
            perms.add(BLUETOOTH_ADVERTISE);
        } else {
            perms.add(BLUETOOTH);
            perms.add(BLUETOOTH_ADMIN);
        }
        if (apiLevel >= 33) {
            perms.add(NEARBY_WIFI_DEVICES);  // with neverForLocation
        }
        return perms.toArray(new String[0]);
    }
}
```

---

## 3. Android Framework Quirks (20% of errors)
| Error | Quirk | Workaround |
|-------|-------|------------|
| E010 | BLE scan 10s timeout | 5s restart cycle |
| E017 | Handler drift | Fixed cycle timer |
| E018 | WiFiDirect API gaps | Multi-method fallback |
| E007 | Theme/icon cascade | Framework themes + adaptive icons |

**Prevention: Defensive Android Patterns**
```java
// Always assume framework has quirks
// 1. Don't trust continuous operations (BLE, GPS)
// 2. Don't trust single API method (WiFi Direct)
// 3. Don't trust timing (Handler, AlarmManager)
// 4. Always have fallbacks
```

---

## 4. Code Quality (17% of errors)
| Error | Quality Issue | Fix |
|-------|---------------|-----|
| E011 | Copy-paste typo (x[2] twice) | Array index constants + unit test |
| E012 | Missing dispose() | Dispose tracking pattern |
| E013 | No speed threshold | Domain logic validation |
| E016 | No try/catch | Defensive bridge wrapper |
| E019 | No GPS noise handling | Speed/distance filters |
| E020 | No angle normalization | Math utility functions |

**Prevention: Code Quality Gates**
```bash
# Pre-commit checks
# 1. Array index validation (custom lint rule)
# 2. Dispose() call verification
# 3. try/catch on all bridge calls
# 4. Unit tests for math functions
```

---

## 5. Architecture Decisions (10% of errors)
| Error | Decision | Consequence |
|-------|----------|-------------|
| E004-E009 | Gradle migration | 9 errors, 20x build time |
| E015 | Gradle dependencies | MultiDex risk |
| E022 | aapt2 R.java path | Gen directory mismatch |

**Prevention: Architecture Decision Records (ADRs)**
```
ADR-001: Use no-Gradle aapt2 build
Status: Accepted
Context: Gradle 8.2+ incompatible, 20x slower
Decision: Revert to aapt2, pin SDK versions
Consequences: No AGP issues, 4s builds, manual dependency mgmt
```

---

# Prevention Strategy Summary

## Immediate (Per Session)
- [ ] Run `bootstrap_env.sh`
- [ ] Verify `java -version`, `sdkmanager --version`
- [ ] Check `ANDROID_HOME` structure

## Per Version
- [ ] Test on API 23, 28, 29, 31, 33 emulators
- [ ] Run unit tests for positioning algorithms
- [ ] Verify build.sh clean build < 10s
- [ ] Check WebView console for JS errors

## Per Feature
- [ ] Add unit test for new algorithm
- [ ] Document API level requirements
- [ ] Implement fallback chains
- [ ] Add health check endpoint

## Continuous
- [ ] Monitor error catalog for new patterns
- [ ] Update permission matrix per Android release
- [ ] Review ADRs quarterly
- [ ] Share fixes across team

---

*Next Piece: Debugging Playbooks*