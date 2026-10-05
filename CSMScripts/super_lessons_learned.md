# Super Lessons Learned — Prime Repository Quality Protocols
# Aggregated from: Seed/GitHub sources, CSM session logs, Android build sessions

> **"Every explosion is a lesson. The wave rides. The lesson learns."**

---

## TABLE OF CONTENTS

1. [SESSION INITIALIZATION](#1-session-initialization)
2. [GIT WORKFLOW](#2-git-workflow)
3. [ANDROID APK BUILDING](#3-android-apk-building)
4. [SDK SETUP & TOOLCHAIN](#4-sdk-setup--toolchain)
5. [SSL & NETWORK IN SANDBOXES](#5-ssl--network-in-sandboxes)
6. [BRANCH NAMING & SUBJECT MATTER](#6-branch-naming--subject-matter)
7. [VERSION STRING INTEGRITY](#7-version-string-integrity)
8. [CENTRAL LESSONS INDEX](#8-central-lessons-index)

---

## 1. SESSION INITIALIZATION

### 1.1 Core Protocol (V5.1)

**Always run `lettherebelight.sh` as the first command in every session.** It performs:

1. **Repo validation** — verifies git, origin remote, network connectivity
2. **Branch lock** — syncs with origin/main, creates session branch
3. **Heartbeat write** — commits and pushes within 5 seconds
4. **Census write** — counts online/offline agents
5. **State read** — checks COMMS log, outboxes, @JASON BRODSKY overrides

### 1.2 Subject Matter Branch Naming

Branch names include context:
```
session/<subject-matter>-<agent>_<timestamp>
```

Example: `session/build-bounce-sdk-agent_local_20260813-195027`

### 1.3 Environment Variables Exported

```
LETTHEREBELIGHT_BRANCH    # Current session branch
LETTHEREBELIGHT_SESSION   # Session ID
LETTHEREBELIGHT_AGENT     # Agent identifier
LETTHEREBELIGHT_TIMESTAMP # ISO timestamp
LETTHEREBELIGHT_REPO_ROOT # Repository root directory
LETTHEREBELIGHT_REPO_URL  # Remote repository URL
```

---

## 2. GIT WORKFLOW

### 2.1 Git Push SSL Certificate Errors

**Problem:** `git push` fails with SSL certificate verification errors in containerized environments.

```bash
# SOLUTION: Disable SSL verification for sandbox environments
git -c http.sslVerify=false push origin <branch>

# For retry logic (as in lettherebelight.sh):
safe_git() {
    git pull origin main --rebase 2>/dev/null && return 0
    git rebase --abort 2>/dev/null || true
    git merge --abort 2>/dev/null || true
    git reset --hard origin/main 2>/dev/null && return 0
    git checkout main 2>/dev/null && git pull origin main 2>/dev/null && return 0
    return 1
}

safe_push() {
    git -c http.sslVerify=false push origin main 2>/dev/null && return 0
    safe_git 2>/dev/null
    git -c http.sslVerify=false push origin main 2>/dev/null && return 0
    sleep 1
    safe_git 2>/dev/null && git -c http.sslVerify=false push origin main 2>/dev/null && return 0
    return 1
}
```

### 2.2 Git Contention Errors

**Problem:** Multiple agents pushing to main simultaneously causes `cannot lock ref` errors.

**Solutions:**
- Use retry loops with exponential backoff
- Push to session branch, not main (until ready to merge)
- `safe_push()` function retries until success

### 2.3 Branch Divergence Recovery

```bash
# Recover from failed rebase/contention
git rebase --abort 2>/dev/null || true
git merge --abort 2>/dev/null || true
git reset --hard origin/main 2>/dev/null
```

### 2.4 Shard Naming Convention

Use `session/<agent-uuid>_<timestamp>` format for session branches.
Use `session/<subject-matter>-<agent>_<timestamp>` when subject context matters.

---

## 3. ANDROID APK BUILDING

### 3.1 NEVER USE PYTHON ZIP FOR APK MANIFESTS

**CRITICAL FAILURE MODE:** APK builds but Android refuses to install with "App not installed" error.

**Root Cause:** Android requires **binary AndroidManifest.xml** (AXML format), not raw XML text. Python zip tools write raw XML.

**Solution:** Always use the `aapt2` pipeline:
```
aapt2 compile → aapt2 link → asset inject → javac → d8 → dex inject → zipalign → apksigner
```

### 3.2 SDK Version Compatibility Matrix

| Build Tools | Platform | Status |
|-------------|----------|--------|
| 33.0.1 | android-33 | ✓ WORKS |
| 34.0.0 | android-34 | ✓ SHOULD WORK |
| 33.0.1 | android-36 | ✗ FAILS (aapt2 cannot parse newer resources) |

**Rule:** Build-tools major.minor must be **≤** platform API level.

### 3.3 Download URLs That Work

```
✓ commandlinetools-linux-11076708_latest.zip    (146 MB)
✓ platform-33_r02.zip                          (67 MB)
✓ platform-36_r02.zip                          (63 MB)
✓ build-tools_r33.0.1-linux.zip                (56 MB)
✓ platform-tools_r35.0.2-linux.zip             (7.5 MB)
```

**URLs that return 404:**
```
✗ build-tools_r34.0.0-linux.zip
✗ build-tools_r36.0.0-linux.zip
✗ build-tools_r30.0.3-linux.zip
✗ platform-33_r03.zip
✗ android-13_r03.zip
```

### 3.4 Platform Extraction Oddity

Google extracts `platform-33_r02.zip` as `android-13/`, not `android-33/`.

**Fix:** Rename after extraction:
```bash
[ -d "android-13" ] && mv "android-13" "android-33"
```

### 3.5 Build Pipeline Steps

1. **aapt2 compile** — compile resources
2. **aapt2 link** — link to base.apk, generate binary AndroidManifest.xml
3. **Asset injection** — inject HTML/JS/images
4. **javac** — compile Java with `-source 11 -target 11`
5. **d8** — dex compilation with `--lib android.jar`
6. **Dex injection** — inject classes.dex
7. **zipalign** — align to 4-byte boundaries
8. **apksigner** — sign with debug keystore

### 3.6 Version Code Incrementing

Always increment `VERSION_CODE` for new releases:
- v1.0.91 → VERSION_CODE=191
- v1.0.95 → VERSION_CODE=195
- v1.0.96 → VERSION_CODE=196

---

## 4. SDK SETUP & TOOLCHAIN

### 4.1 Java Source/Target Must Be 11

Even with JDK 17, compile with `-source 11 -target 11` for d8 compatibility.

### 4.2 Asset Injection Order

**Incorrect order:** dex-in → assets → zipalign → sign = assets overwrite dex!

**Correct order:** aapt2 link → assets inject → javac → d8 → dex inject → zipalign → sign

### 4.3 Adaptive Icon Without Image Assets

Use `<adaptive-icon>` with `@color` references:

```xml
<!-- res/mipmap-anydpi-v26/ic_launcher.xml -->
<adaptive-icon xmlns:android="http://schemas.android.com/apk/res/android">
    <background android:drawable="@color/app_bg"/>
    <foreground android:drawable="@color/app_fg"/>
</adaptive-icon>
```

### 4.4 Keystore Auto-Generation

apksigner auto-generates debug.keystore on first build with:
```
dname: CN={APP_NAME} Debug, OU=CarrPod
```

---

## 5. SSL & NETWORK IN SANDBOXES

### 5.1 curl Requires -k Flag

All Google CDN downloads must use `curl -k` in sandbox environments:

```bash
curl -k -sL "$URL" -o "$OUTPUT"
```

### 5.2 sdkmanager Offline Failures

**Symptom:** sdkmanager fails to fetch remote repository manifest.

**Fix:** Download SDK components directly via curl instead of using sdkmanager.

### 5.3 Java Installation in Cloud Sessions

```bash
apt-get update -qq && apt-get install -y -qq openjdk-17-jdk-headless
export JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64
```

### 5.4 cmdline-tools Path Requirement

SDK cmdline-tools must be at `latest/` subdirectory:
```bash
mkdir -p $ANDROID_HOME/cmdline-tools
unzip commandlinetools-*.zip -d $ANDROID_HOME/cmdline-tools
mv $ANDROID_HOME/cmdline-tools/cmdline-tools $ANDROID_HOME/cmdline-tools/latest
```

---

## 6. BRANCH NAMING & SUBJECT MATTER

### 6.1 Dynamic Branch Naming

Branch names include session context:
```bash
BRANCH_NAME="session/$(echo "$SUBJECT_MATTER" | tr '/ ' '-' | tr '[:upper:]' '[:lower:]')-${SESSION_ID:-local}_${TIMESTAMP}"
```

### 6.2 Subject Matter Context

Use `KILO_SUBJECT` environment variable to provide context:
```bash
export KILO_SUBJECT="build-bounce-sdk"
bash CSMScripts/lettherebelight.sh
# Creates: session/build-bounce-sdk-local_20260813-195027
```

---

## 7. VERSION STRING INTEGRITY

### 7.1 APK Version String Problem

**Symptom:** Repacking APK by modifying assets changes version string accidentally (1.0.91 → 1.0.95).

**Impact:** APK differs from baseline by 3 bytes, causes installation failures.

**Prevention:**
1. Extract `assets/bounce.html` from source APK **byte-for-byte**
2. Do NOT run string replacements on version strings unless explicitly requested
3. Always diff resulting APK against baseline using Python zipfile comparison

### 7.2 RSA Signature Differences

Every `apksigner` run generates new RSA signature with different timestamp/nonce.

**This is expected and harmless** — ignore `META-INF/ANDROIDD.RSA` differences when comparing APKs for content equality.

---

## 8. CENTRAL LESSONS INDEX

| Category | Lesson | Reference |
|----------|--------|-----------|
| **APK** | Never use Python zip for manifests | `CSMApps/Bounce/work-in-progress/lessons-learned.md` |
| **APK** | RSA signature differs every sign | `lessons-learned.md` |
| **APK** | Verify version string integrity | `Augment26/session-log-20260812-bounce-update-menu-documentation.md` |
| **Git** | Use `git -c http.sslVerify=false` in sandbox | `marmalade-v7-build-session-20260716.md` |
| **Git** | Retry loops prevent contention failures | `SESSION-INITv5/README.md` |
| **SDK** | `curl -k` mandatory for Google CDN | `CSMScripts/android-toolkit/README.md` |
| **SDK** | build-tools 33.0.1 + platform 33 works | `android-toolkit/README.md` |
| **SDK** | Platform 33 extracts as android-13 | `marmalade-v7-build-session-20260716.md` |
| **Build** | Java target 11 required for d8 | `android-toolkit/README.md` |
| **Build** | Asset injection order matters | `android-toolkit/README.md` |
| **Build** | Clean `out/` directory after copying versions | `lessons-learned.md` |
| **Build** | Menu toggle test on device | `lessons-learned.md` |
| **Build** | Version code increment required | `lessons-learned.md` |
| **Session** | Always run lettherebelight.sh first | `bounty-session-20260812-menu.md` |
| **Session** | Branch naming with subject context | `lettherebelight.sh` |

---

## QUICK REFERENCE: COMMON PITFALLS

| Pitfall | Symptom | Prevention |
|---------|---------|--------------|
| SSL error | `git push` fails | Use `-c http.sslVerify=false` |
| APK won't install | Raw XML in manifest | Use aapt2 pipeline |
| build-tools 404 | Download fails | Use 33.0.1 (known working) |
| platform renamed | `android-13` found | Rename to `android-33` |
| Version string change | 3 bytes diff | Extract byte-for-byte |
| RSA signature diff | META-INF differs | Expected — ignore |
| Stale heartbeat | >30s old | STALE, >120s OFFLINE |
| Branch lock fail | Can't push | `safe_push()` retry loop |

---

## USAGE

### As First Command in Every Session

```bash
# Simple
bash CSMScripts/lettherebelight.sh

# With subject matter context
export KILO_SUBJECT="build-bounce-sdk"
bash CSMScripts/lettherebelight.sh

# SDK bootstrap after init
bash CSMScripts/SDKForge.sh && eval "$(bash CSMScripts/SDKForge.sh --export-env)"

# Build an APK
export ANDROID_HOME=/path/to/.sdk/android-sdk
cd CSMApps/Bounce/v1.0.79 && bash build.sh
```

### Verify APK Signature

```bash
apksigner verify --verbose app-debug.apk
```

### Check APK Contents

```bash
unzip -p app.apk AndroidManifest.xml | file -
# Should say "Android binary XML", not "XML document"
```

---

*PrimeCarrPod/Seed — Safe Pod Engineering Repository*
*Compiled 2026-08-13*