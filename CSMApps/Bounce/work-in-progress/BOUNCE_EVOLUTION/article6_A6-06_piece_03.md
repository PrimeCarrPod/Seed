# Build SDK/License & Gradle Errors (E004, E005, E014, E015, E021, E022)

## Article A6: A6-06 — Repeated_Errors_Catalog_Solutions
**Piece:** 03 of 13  
**Generated:** 2026-10-08 05:25:20 UTC

---

# E004: Could not resolve all files for configuration — checkDebugAarMetadata
**Type:** Build | **First:** v1.0.80 | **Last:** v1.0.85 | **Frequency:** Multiple
**Root Cause:** AGP 8.2 incompatibility with Gradle 8.x
**Solution:** Pin to AGP 8.1.0 + Gradle 8.4
**Worked:** Yes | **Fixed In:** v1.0.85 | **Time Lost:** High
**Notes:** AGP 8.1.0 + gradle-8.4 = stable combination

### Reproduction
```bash
$ ./gradlew assembleDebug
> Could not resolve all files for configuration ':app:checkDebugAarMetadata'.
> Could not find androidx.appcompat:appcompat:1.6.0
```

### Root Cause Detail
AGP 8.2 changed dependency resolution and metadata checking. Incompatible with older androidx library versions used in the project.

### Fix Implementation
```gradle
// build.gradle (project level)
buildscript {
    dependencies {
        classpath 'com.android.tools.build:gradle:8.1.0'
    }
}
// gradle/wrapper/gradle-wrapper.properties
distributionUrl=https\://services.gradle.org/distributions/gradle-8.4-bin.zip
```

### Prevention
- Pin AGP and Gradle versions explicitly
- Test upgrade in isolated branch first
- Document working combination in README

---

# E005: Unresolved reference: components
**Type:** Build | **First:** v1.0.80 | **Last:** v1.0.85 | **Frequency:** Few
**Root Cause:** Importing non-existent package during Gradle migration
**Solution:** Remove unused imports
**Worked:** Yes | **Fixed In:** v1.0.85 | **Time Lost:** Low
**Notes:** Only import what you use - IDE auto-import adds garbage

### Reproduction
```kotlin
import com.example.components.*  // Doesn't exist
```

### Fix Implementation
```kotlin
// Remove unused imports - use IDE "Optimize Imports"
// Or manually verify each import exists
```

---

# E014: aapt2 link fails: resource not found
**Type:** Build | **First:** v1.0.0 | **Last:** v1.0.91 | **Frequency:** Occasional
**Root Cause:** Missing res/ directories or wrong paths in AndroidManifest
**Solution:** Verify res/ structure matches AndroidManifest references
**Worked:** Yes | **Fixed In:** v1.0.0 | **Time Lost:** Medium
**Notes:** Check resource paths before aapt2 link

### Reproduction
```bash
$ aapt2 link ... -R res.zip
Error: resource mipmap/ic_launcher not found
```

### Fix Implementation
```bash
# Verify resource structure
find src/main/res -name "*.xml" | head -20
# Ensure all @drawable/@mipmap/@layout references exist
```

---

# E015: d8: Cannot fit requested classes in a single dex file
**Type:** Build | **First:** v1.0.80 | **Last:** v1.0.85 | **Frequency:** Rare
**Root Cause:** Too many methods (>64K) from Gradle dependencies
**Solution:** Enable multiDex or reduce dependencies
**Worked:** Yes | **Fixed In:** v1.0.85 | **Time Lost:** Low
**Notes:** Not hit in Bounce (small app) - only with Gradle bloat

### Reproduction
```bash
$ d8 --output out/classes.dex ...
Error: Cannot fit requested classes in a single dex file (# methods: 72341 > 65536)
```

### Fix Implementation
```gradle
// build.gradle
android {
    defaultConfig {
        multiDexEnabled true
    }
}
dependencies {
    implementation 'androidx.multidex:multidex:2.0.1'
}
```

---

# E021: Gradle cannot find Java
**Type:** Build | **First:** v1.0.80 | **Last:** v1.0.85 | **Frequency:** Multiple
**Root Cause:** JAVA_HOME not exported before Gradle invocation
**Solution:** `export JAVA_HOME` before `gradlew`
**Worked:** Yes | **Fixed In:** v1.0.85 | **Time Lost:** Medium
**Notes:** Must export before Gradle - Gradle doesn't inherit from parent shell in some contexts

### Reproduction
```bash
$ ./gradlew assembleDebug
Error: Could not find or load main class org.gradle.wrapper.GradleWrapperMain
```

### Fix Implementation
```bash
export JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64
export PATH=$JAVA_HOME/bin:$PATH
./gradlew assembleDebug
```

---

# E022: Unresolved reference: R (generated)
**Type:** Build | **First:** v1.0.80 | **Last:** v1.0.85 | **Frequency:** Occasional
**Root Cause:** aapt2 link didn't generate R.java in expected location
**Solution:** Verify aapt2 link --java output dir matches source set
**Worked:** Yes | **Fixed In:** v1.0.85 | **Time Lost:** Low
**Notes:** Check gen/ directory for generated R.java

### Reproduction
```kotlin
import com.carrpod.bounce.R  // Unresolved reference
```

### Fix Implementation
```bash
# Ensure aapt2 link generates R.java to correct package directory
aapt2 link ... --java src/main/java
# Verify
find src/main/java -name "R.java"
```

---

*Next Piece: Runtime Theme/AppCompat Errors (E006, E007, E008)*