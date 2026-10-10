# SDK_Tools_Methods_Build_Pipeline — Piece 01/13
## Article A4: A4-04 — SDK Tools Methods Build Pipeline
**Piece:** 01 of 13  
**Generated:** 2026-10-08 04:35:00 UTC

---

## JDK & JAVA TOOLCHAIN

### JDK 17 (OpenJDK)
- **Version Required:** 17
- **First Used:** 1.0.0 | **Last Used:** 1.0.91
- **Purpose:** Java compilation (javac) + keytool for debug keystore
- **Configuration:** `export JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64`
- **Install Command:** `apt-get install openjdk-17-jdk-headless`
- **Known Issue:** JAVA_HOME reset on sandbox every session
- **Workaround:** Export in every session / build script
- **Best Practice:** Always export before build, use `/usr/lib/jvm/java-17-openjdk-amd64`
- **Environment Notes:** Cloud environments lose Java on reset

### javac (Java Compiler)
- **Version:** JDK 17 (javac 17.x)
- **First Used:** 1.0.0 | **Last Used:** 1.0.91
- **Purpose:** Compile .java → .class files
- **Flags:** `-source 11 -target 11` (BP005 — compatibility)
- **Bootstrap:** Uses android.jar from SDK platform
- **Known Issue:** None with fixed flags
- **Best Practice:** Don't use newer source levels (breaks on older Android)

### keytool (Keystore Management)
- **Version:** JDK 17 included
- **First Used:** 1.0.0 | **Last Used:** 1.0.91
- **Purpose:** Debug keystore generation
- **Command:** `keytool -genkey -alias androiddebugkey -keystore debug.keystore -storepass android -keypass android -dname "CN=Android Debug,O=Android,C=US" -keyalg RSA -keysize 2048 -validity 10000`
- **Known Issue:** None
- **Best Practice:** Auto-generate if missing (BP003), separate release keystore needed (TD-08)

---

## ANDROID SDK PLATFORM

### Android SDK Platform (android-33)
- **Version Required:** android-33 (API 33 / Android 13)
- **First Used:** 1.0.0 | **Last Used:** 1.0.91
- **Purpose:** android.jar for compilation target
- **Path:** `$ANDROID_HOME/platforms/android-33/android.jar`
- **Install Command:** `sdkmanager "platforms;android-33"`
- **Known Issue:** Missing in cloud environments
- **Workaround:** Download manually if sdkmanager fails
- **Best Practice:** Pin to api-33 (compileSdk 33)
- **Environment Notes:** Required for compileSdk 33, targetSdk 33

---

## BUILD TOOLS (AAPT2, D8, ZIPALIGN, APKSIGNER)

### Build Tools 33.0.1
- **Version Required:** 33.0.1
- **First Used:** 1.0.0 | **Last Used:** 1.0.91
- **Components:** aapt2, d8, zipalign, apksigner
- **Path:** `$ANDROID_HOME/build-tools/33.0.1/`
- **Install Command:** `sdkmanager "build-tools;33.0.1"`
- **Known Issue:** Only 34.0.0 (with renderscript) in some envs
- **Workaround:** Install 33.0.1 explicitly
- **Best Practice:** Match build-tools to compileSdk version
- **Critical For:** No-Gradle build pipeline

### aapt2 (Android Asset Packaging Tool v2)
- **Version:** 33.0.1
- **First Used:** 1.0.0 | **Last Used:** 1.0.91
- **Purpose:** Resource compilation + linking
- **Step 1:** `aapt2 compile --dir res -o resources.zip`
- **Step 2:** `aapt2 link -o base.apk -I android.jar --manifest AndroidManifest.xml -R resources.zip --auto-add-overlay --java src/main/java`
- **Known Issue:** None with correct paths
- **Best Practice:** Use `--auto-add-overlay`

### d8 (Dex Compiler)
- **Version:** 33.0.1
- **First Used:** 1.0.0 | **Last Used:** 1.0.91
- **Purpose:** .class → .dex conversion
- **Command:** `d8 --lib android.jar --min-api 24 --output obj classes`
- **Known Issue:** None
- **Best Practice:** Use `--min-api` matching minSdk (24)

---

## PIECE 01 SUMMARY
This piece covers the Java toolchain (JDK 17, javac with source/target 11, keytool), Android SDK Platform (android-33, required for compilation), and Build Tools 33.0.1 (aapt2 for resource compilation/linking, d8 for dex conversion). These are the foundation of the no-Gradle build pipeline.

**Next Piece (02):** zipalign, apksigner, cmdline-tools, Gradle/AGP/Kotlin