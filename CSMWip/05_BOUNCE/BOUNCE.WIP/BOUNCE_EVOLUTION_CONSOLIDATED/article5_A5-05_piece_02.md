# Best_Practices_AntiPatterns_Catalog — Piece 02/13
## Article A5: A5-05 — Best Practices AntiPatterns Catalog
**Piece:** 02 of 13  
**Generated:** 2026-10-08 05:07:19 UTC

---
# Build System Best Practices (BP001-BP005)

## Article A5: A5-05 — Best_Practices_AntiPatterns_Catalog
**Piece:** 02 of 13  
**Generated:** 2026-10-08 05:06:45 UTC

---

# BP001: No-Gradle aapt2 Pipeline for Fast Reproducible Builds
**Category:** Build | **Type:** Best Practice
**First Observed:** v1.0.0 | **Confirmed Working:** v1.0.91
**Evidence:** 4-second builds vs minutes with Gradle across 91 versions
**Impact:** Speed + transparency | **Applies To:** All versions
**Related:** Keep SDK paths fixed in build.sh

### Implementation
```bash
# build.sh - Direct aapt2 compilation
aapt2 compile --dir src/main/res -o res.zip
aapt2 link --proto-format -o app.apk -I $ANDROID_HOME/platforms/android-33/android.jar \
  --manifest src/main/AndroidManifest.xml -R res.zip --auto-add-overlay \
  --java src/main/java
```

### Why This Works
- Eliminates Gradle daemon startup, configuration, and dependency resolution
- Deterministic output: same inputs → identical APK
- Full control over every build step for debugging

---

# BP002: Pin SDK Versions (compileSdk 33, build-tools 33.0.1)
**Category:** Build | **Type:** Best Practice
**First Observed:** v1.0.0 | **Confirmed Working:** v1.0.91
**Evidence:** Stable builds across sessions, no surprise breakages
**Impact:** Reproducibility | **Applies To:** All versions
**Related:** Match build-tools to compileSdk (CP003 anti-pattern)

### Implementation
```bash
export COMPILE_SDK=33
export BUILD_TOOLS=33.0.1
export ANDROID_JAR=$ANDROID_HOME/platforms/android-${COMPILE_SDK}/android.jar
```

---

# BP003: Auto-Generate debug.keystore If Missing
**Category:** Build | **Type:** Best Practice
**First Observed:** v1.0.0 | **Confirmed Working:** v1.0.91
**Evidence:** Build never fails on missing keystore
**Impact:** Reliability | **Applies To:** All versions
**Related:** Use keytool in build.sh

### Implementation
```bash
if [[ ! -f debug.keystore ]]; then
  keytool -genkey -v -keystore debug.keystore -alias androiddebugkey \
    -keyalg RSA -keysize 2048 -validity 10000 \
    -storepass android -keypass android \
    -dname "CN=Android Debug,O=Android,C=US"
fi
```

---

# BP004: Inject Assets via zip After aapt2 link
**Category:** Build | **Type:** Best Practice
**First Observed:** v1.0.0 | **Confirmed Working:** v1.0.91
**Evidence:** HTML/JS/CSS included in APK reliably
**Impact:** Assets work | **Applies To:** All versions
**Related:** Step 2b in build.sh

### Implementation
```bash
# After aapt2 link creates base APK
cd assets && zip -r ../app.apk . && cd ..
```

---

# BP005: Use javac -source 11 -target 11 for Compatibility
**Category:** Build | **Type:** Best Practice
**First Observed:** v1.0.0 | **Confirmed Working:** v1.0.91
**Evidence:** Works on JDK 17 without class version errors
**Impact:** Compatibility | **Applies To:** All versions
**Related:** Don't use newer source levels

### Implementation
```bash
javac -source 11 -target 11 -d out/classes \
  --release 11 src/main/java/com/carrpod/bounce/*.java
```

---

*Next Piece: Build Anti-Patterns (CP001-CP003)*
