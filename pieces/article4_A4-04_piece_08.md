# SDK_Tools_Methods_Build_Pipeline — Piece 08/13
## Article A4: A4-04 — SDK Tools Methods Build Pipeline
**Piece:** 08 of 13  
**Generated:** 2026-10-08 04:35:00 UTC

---

## SDK VERSION CONSTANTS

### Compile / Target / Min SDK
| Constant | Value | API Level | Android Version | Since | Notes |
|----------|-------|-----------|-----------------|-------|-------|
| compileSdk | 33 | 33 | Android 13 (Tiramisu) | 1.0.0 | Compilation target |
| targetSdk | 33 | 33 | Android 13 | 1.0.0 | Runtime target |
| minSdk | 24 | 24 | Android 7.0 (Nougat) | 1.0.0 | 99.3% coverage |

### Version Matching Rules (Critical)
| Component | Version | Must Match |
|-----------|---------|------------|
| compileSdk | 33 | targetSdk, build-tools |
| build-tools | 33.0.1 | compileSdk major |
| platform | android-33 | compileSdk |
| minSdk | 24 | — (lower bound) |

### Build Tools Version Policy
- **Rule:** build-tools version = compileSdk major version (33.0.x)
- **Current:** 33.0.1 (stable, no renderscript)
- **Avoid:** 34.0.0 (includes renderscript, larger, unnecessary)
- **Check:** `ls $ANDROID_HOME/build-tools/` should show 33.0.1

---

## ANDROID MANIFEST SDK DECLARATIONS

### AndroidManifest.xml (Relevant Sections)
```xml
<manifest xmlns:android="http://schemas.android.com/apk/res/android"
    package="com.carrpod.bounce">
    
    <uses-sdk
        android:minSdkVersion="24"
        android:targetSdkVersion="33" />
    
    <!-- Permissions (15 total) -->
    <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION" />
    <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION" />
    <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION" />
    <uses-permission android:name="android.permission.ACCESS_WIFI_STATE" />
    <uses-permission android:name="android.permission.CHANGE_WIFI_STATE" />
    <uses-permission android:name="android.permission.NEARBY_WIFI_DEVICES"
        android:usesPermissionFlags="neverForLocation" />
    <uses-permission android:name="android.permission.BLUETOOTH_SCAN"
        android:usesPermissionFlags="neverForLocation" />
    <uses-permission android:name="android.permission.BLUETOOTH_CONNECT" />
    <uses-permission android:name="android.permission.BLUETOOTH_ADVERTISE" />
    <uses-permission android:name="android.permission.WAKE_LOCK" />
    <uses-permission android:name="android.permission.INTERNET" />
    <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE" />
    <uses-permission android:name="android.permission.CHANGE_NETWORK_STATE" />
    <uses-permission android:name="android.permission.CAMERA" />
    <uses-permission android:name="android.permission.RECORD_AUDIO" />
</manifest>
```

---

## GRADLE BUILD CONFIG (v1.0.80+)

### build.gradle.kts (Module)
```kotlin
plugins {
    id("com.android.application") version "8.1.0" apply false
    id("org.jetbrains.kotlin.android") version "1.9.22" apply false
}

android {
    namespace = "com.carrpod.bounce"
    compileSdk = 33
    
    defaultConfig {
        applicationId = "com.carrpod.bounce"
        minSdk = 24
        targetSdk = 33
        versionCode = 91
        versionName = "1.0.91"
    }
    
    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }
    
    kotlinOptions {
        jvmTarget = "11"
    }
}
```

### settings.gradle.kts
```kotlin
pluginManagement {
    repositories {
        google()
        mavenCentral()
        gradlePluginPortal()
    }
}
dependencyResolutionManagement {
    repositories {
        google()
        mavenCentral()
    }
}
rootProject.name = "Bounce"
include(":app")
```

### gradle.properties
```properties
org.gradle.jvmargs=-Xmx2048m -Dfile.encoding=UTF-8
android.useAndroidX=true
android.enableJetifier=true
kotlin.code.style=official
```

---

## PIECE 08 SUMMARY
This piece covers SDK version constants (compileSdk/targetSdk 33, minSdk 24, build-tools 33.0.1 matching), version matching rules (critical for build stability), AndroidManifest.xml SDK declarations with all 15 permissions (including API33 NEARBY_WIFI_DEVICES with neverForLocation), and Gradle build configuration (AGP 8.1.0, Kotlin 1.9.22, compileOptions Java 11). The no-Gradle build.sh uses the same constants via environment variables.

**Next Piece (09):** Tool Installation Automation — cmdline-tools, Platform, Build-Tools, Licenses