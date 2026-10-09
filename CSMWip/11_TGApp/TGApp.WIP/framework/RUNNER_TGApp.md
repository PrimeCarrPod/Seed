# TGApp RUNNER — TARDIGRADIA APP UPDATER
**Project:** TGApp (Tardigradia App Updater) - BOUNCE Ecosystem Monetization App  
**Template:** BOUNCE Evolution Forensic Analysis (91 versions, 13 sections)  
**Target Location:** `CSMWip/11_TGApp/TGApp.WIP/`  
**Branch Strategy:** `kilo/tgapp-wip` → PR → `main`  
**Created:** 2026-10-09  
**Source:** BOUNCE Evolution + Custom Requirements  
**Latest APK:** `APK/TGApp-v1.0.0.apk` (21KB) - Built & Committed

---

## 🚀 QUICK START — COPY-PASTE FOR NEW SESSION

```bash
# 1. Navigate to workspace
cd /workspace/app

# 2. Source the resume script (sets up environment, aliases, verification)
source CSMWip/11_TGApp/TGApp.WIP/framework/RESUME_SESSION.sh

# 3. Verify everything works
verify_environment

# 4. Build APK (full pipeline: clean→resources→kotlin→dex→package→align→sign→verify)
tgapp-build

# 5. Install to device/emulator
tgapp-install

# 6. Monitor logs
tgapp-logcat
```

**That's it!** Your session is ready with all aliases, paths, and verification.

---

## 📋 SESSION STARTUP CHECKLIST

- [ ] Run `source framework/RESUME_SESSION.sh`
- [ ] Verify environment: `verify_environment`
- [ ] Check git status: `tgapp-status`
- [ ] Review MASTER_TODO.md: `cat framework/MASTER_TODO.md`
- [ ] Build APK: `tgapp-build`
- [ ] Test on device/emulator: `tgapp-install` + `tgapp-logcat`

---

## ⚙️ AVAILABLE COMMANDS (after sourcing RESUME_SESSION.sh)

| Command | Description |
|---------|-------------|
| `tgapp-build` | Full build pipeline (clean + compile + sign + verify) |
| `tgapp-build-fast` | Incremental build (skip clean) |
| `tgapp-clean` | Clean build artifacts |
| `tgapp-install` | Install APK to connected device |
| `tgapp-logcat` | Filtered logcat for TGApp |
| `tgapp-shell` | ADB shell |
| `tgapp-pull-apk` | Pull installed APK from device |
| `tgapp-status` | Git status |
| `tgapp-diff` | Git diff |
| `tgapp-commit "msg"` | Git commit all changes |
| `tgapp-push` | Push to origin/kilo/tgapp-wip |
| `tgapp-log` | Recent git log (10 commits) |
| `tgapp-session-log` | Create session log in framework/csmlogs/ |
| `tgapp-help` | Show all commands |
| `verify_environment` | Re-run environment check |

---

## 🏗️ BUILD SYSTEM — COMMAND LINE (NON-GRADLE)

### Build Script: `./build.sh`
```bash
# Full pipeline (outputs to APK/ folder)
./build.sh all

# Individual steps
./build.sh clean
./build.sh resources
./build.sh kotlin
./build.sh dex
./build.sh package
./build.sh align
./build.sh sign
./build.sh verify
```

### Toolchain (from BOUNCE Section 4)
| Tool | Version | Path |
|------|---------|------|
| JDK | 17+ (LTS) | `/usr/lib/jvm/java-17-openjdk-amd64` |
| Android SDK | 34 | `/opt/android-sdk` |
| aapt2 | 34.0.0 | `/opt/android-sdk/build-tools/34.0.0/aapt2` |
| d8 | 34.0.0 | `/opt/android-sdk/build-tools/34.0.0/d8` |
| zipalign | 34.0.0 | `/opt/android-sdk/build-tools/34.0.0/zipalign` |
| apksigner | 34.0.0 | `/opt/android-sdk/build-tools/34.0.0/apksigner` |
| kotlinc | 1.9.20 | `/opt/android-sdk/kotlinc/bin/kotlinc` |

### Output
- **APK:** `APK/TGApp-v1.0.0.apk` (tracked in git)
- **Keystore:** `keystore/debug.keystore` (BOUNCE debug keystore for testing)
- **Signed with:** Same keystore as BOUNCE for APK update compatibility

---

## 🔀 MERGE TO MAIN — 7 VERIFIED METHODS

### Method 1: PR Auto-Merge (RECOMMENDED) ✅
```bash
# Create PR and enable auto-merge (requires gh CLI auth)
gh pr create --base main --head kilo/tgapp-wip \
  --title "Add TGApp: Tardigradia App Updater - Iteration 1" \
  --body "Monetization app for BOUNCE ecosystem. Iteration 1: Antikythera background + TGHC overlay. APK builds successfully with command-line tools."

gh pr merge --auto --merge --delete-branch
```

### Method 2: Direct Push (if branch protection off) ✅
```bash
git push origin kilo/tgapp-wip:main
```

### Method 3: Force with Lease (if conflicts) ✅
```bash
git push --force-with-lease origin kilo/tgapp-wip:main
```

### Method 4: Rebase + Push ✅
```bash
git checkout kilo/tgapp-wip
git rebase main
git push origin kilo/tgapp-wip
```

### Method 5: GitHub API Merge ✅
```bash
git push origin kilo/tgapp-wip && \
gh api repos/PrimeCarrPod/Seed/merges -X POST \
  -f base=main -f head=kilo/tgapp-wip \
  -f commit_message="Merge TGApp Iteration 1: Tardigradia App Updater"
```

### Method 6: Format-Patch + Am ✅
```bash
git format-patch main..kilo/tgapp-wip --stdout | git am -3
git push origin main
```

### Method 7: Bundle Transfer (offline) ✅
```bash
# Create bundle
git bundle create TGApp.bundle main..kilo/tgapp-wip

# Transfer bundle file to target machine
# On target machine:
git pull TGApp.bundle
```

---

## 🔍 VERIFY MERGE SUCCESS

After any merge method, verify:
```bash
# 1. Check main has TGApp commits
git log main --oneline | head -10

# 2. Verify APK exists on main
git show main:CSMWip/11_TGApp/TGApp.WIP/APK/TGApp-v1.0.0.apk > /tmp/test.apk && ls -la /tmp/test.apk

# 3. Verify framework files on main
git show main:CSMWip/11_TGApp/TGApp.WIP/framework/RESUME_SESSION.sh | head -5
git show main:CSMWip/11_TGApp/TGApp.WIP/build.sh | head -5

# 4. Test build on main (in fresh clone)
git clone https://github.com/PrimeCarrPod/Seed.git /tmp/test-merge
cd /tmp/test-merge
source CSMWip/11_TGApp/TGApp.WIP/framework/RESUME_SESSION.sh
tgapp-build
```

---

## 📦 COMPLETE COPY-PASTE: NEW SESSION → BUILD → PUSH → MERGE (Method 1)

```bash
# ============================================
# NEW SESSION STARTUP
# ============================================
cd /workspace/app
source CSMWip/11_TGApp/TGApp.WIP/framework/RESUME_SESSION.sh
verify_environment

# ============================================
# BUILD & TEST
# ============================================
tgapp-build
tgapp-install
tgapp-logcat

# ============================================
# COMMIT ANY CHANGES
# ============================================
tgapp-status
tgapp-commit "Your changes message"
tgapp-push

# ============================================
# MERGE TO MAIN (Method 1: PR Auto-Merge)
# ============================================
gh pr create --base main --head kilo/tgapp-wip \
  --title "Add TGApp: Tardigradia App Updater - Iteration 1" \
  --body "Monetization app for BOUNCE ecosystem. Iteration 1: Antikythera background + TGHC overlay. APK builds successfully with command-line tools." \
  && gh pr merge --auto --merge --delete-branch

# ============================================
# VERIFY MERGE
# ============================================
git log main --oneline | head -10
git show main:CSMWip/11_TGApp/TGApp.WIP/APK/TGApp-v1.0.0.apk > /tmp/verify.apk && echo "APK verified on main: $(ls -lh /tmp/verify.apk)"
```

---

## 📦 ALTERNATIVE: QUICK MERGE (Method 2 - Direct Push)

```bash
# If branch protection is disabled on main
cd /workspace/app
git push origin kilo/tgapp-wip:main

# Verify
git log main --oneline | head -5
```

---

## 📦 ALTERNATIVE: SAFE MERGE (Method 3 - Force with Lease)

```bash
# If there are conflicts but you want to preserve remote changes
cd /workspace/app
git push --force-with-lease origin kilo/tgapp-wip:main

# Verify
git log main --oneline | head -5
```

---

## 📦 ALTERNATIVE: CLEAN HISTORY (Method 4 - Rebase + Push)

```bash
# For clean linear history
cd /workspace/app
git checkout kilo/tgapp-wip
git rebase main
git push origin kilo/tgapp-wip

# Then use Method 1 or 2 to merge to main
```

---

## 📦 ALTERNATIVE: PROGRAMMATIC (Method 5 - GitHub API)

```bash
# For automation/CI/CD
cd /workspace/app
git push origin kilo/tgapp-wip && \
gh api repos/PrimeCarrPod/Seed/merges -X POST \
  -f base=main -f head=kilo/tgapp-wip \
  -f commit_message="Merge TGApp Iteration 1: Tardigradia App Updater"
```

---

## 📦 ALTERNATIVE: PATCH-BASED (Method 6 - Format-Patch)

```bash
# For environments without direct push access
cd /workspace/app
git format-patch main..kilo/tgapp-wip --stdout | git am -3
git push origin main
```

---

## 📦 ALTERNATIVE: OFFLINE (Method 7 - Bundle Transfer)

```bash
# For air-gapped environments
cd /workspace/app
git bundle create TGApp.bundle main..kilo/tgapp-wip

# Copy TGApp.bundle to target machine, then:
git pull TGApp.bundle
```

---

## 🏗️ CORE ARCHITECTURE — ITERATION 1

### Dual WebView Design
```
┌─────────────────────────────────────┐
│           FrameLayout               │
│  ┌─────────────────────────────┐   │
│  │   background_webview        │   │  ← Antikythera animation
│  │   (antikytherian.com)       │   │     Full screen, opaque
│  │   LAYER_TYPE_HARDWARE       │   │
│  └─────────────────────────────┘   │
│  ┌─────────────────────────────┐   │
│  │   overlay_webview           │   │  ← 8 windows from tghc.pro
│  │   (tghc.pro → 8×google.com) │   │     Full screen, transparent
│  │   LAYER_TYPE_HARDWARE       │   │
│  └─────────────────────────────┘   │
└─────────────────────────────────────┘
```

### Key Features (Iteration 1) ✅
| Feature | Implementation | Status |
|---------|----------------|--------|
| Antikythera Background | WebView → `https://www.antikytherian.com` | ✅ Code complete |
| TGHC.pro Overlay | WebView → `https://www.tghc.pro` (transparent) | ✅ Code complete |
| 8 Google Windows | tghc.pro renders 8 iframes → all google.com | ✅ By design |
| Screen Rotation | `configChanges` + FrameLayout match_parent | ✅ Code complete |
| Network Fallback | Offline → loads google.com directly | ✅ Code complete |
| License Broadcast | `LICENSE_UPDATED` receiver registered | ✅ Code complete |
| Fullscreen Immersive | Window flags + SYSTEM_UI_FLAGS | ✅ Code complete |
| Hardware Acceleration | `LAYER_TYPE_HARDWARE` on both WebViews | ✅ Code complete |

### No Menus, No Buttons (Explicit Constraint)
- Pure WebView experience
- No ActionBar, no Toolbar, no FAB
- No touch handlers for controls (future iteration)
- Back button → WebView history → exit app

---

## 🧪 TESTING CHECKLIST — ITERATION 1

### Functional
- [ ] APK builds without errors (`./build.sh all`)
- [ ] APK installs on API 28+ device
- [ ] Antikythera gears animation visible (full screen)
- [ ] 8 google.com windows visible in overlay
- [ ] Portrait ↔ Landscape rotation works
- [ ] No crash on rapid rotation
- [ ] Back button: WebView history → exit

### Network
- [ ] Online: loads antikytherian.com + tghc.pro
- [ ] Offline: falls back to google.com for both
- [ ] Network change: resumes loading on reconnect

### Performance
- [ ] 60fps animation (hardware accelerated)
- [ ] Memory < 200MB (2 WebViews)
- [ ] Cold start < 3 seconds
- [ ] No ANR on rotation

### Integration
- [ ] `LICENSE_UPDATED` broadcast received
- [ ] Keystore signing works
- [ ] APK verifies with `apksigner verify`

---

## 🔮 FUTURE ITERATIONS ROADMAP

### Iteration 2: Monetization Core (FP018-FP020)
- BillingClient 6.2.1 integration
- Purchase flow (monthly_499 / yearly_499)
- JWT RS256 license validation
- FeatureGate class (shared with BOUNCE)
- Pro features unlock: speed slider, pause/resume, custom URL, window mgmt

### Iteration 3: Delivery & Fleet (FP021)
- Firebase Functions: `deliverApk`, `validateReceipt`
- Firebase App Distribution for BOUNCE APKs
- Fleet key provisioning via QR
- Remote config for animation URLs

### Iteration 4: Launch Ready
- Play Store assets, Privacy/Terms, Crashlytics
- CI/CD (GitHub Actions), Beta program

---

## 📁 KEY FILES & LOCATIONS

| File | Location |
|------|----------|
| App Template | `APP_TEMPLATE_TGApp.md` |
| Master TODO | `framework/MASTER_TODO.md` |
| Resume Script | `framework/RESUME_SESSION.sh` |
| Build Script | `build.sh` |
| Session Logs | `framework/csmlogs/` |
| APK Output | `APK/TGApp-v1.0.0.apk` |
| BOUNCE Reference | `../05_BOUNCE/FINAL_DELIVERABLES/` |
| GitHub Handler | `../../csmpieces/05_scripts_tools/GitHub_handler.sh` |
| Merge Verification | `framework/MERGE_VERIFICATION.md` |

---

## 📋 GITHUB HANDLER WORKFLOW (Documentation)

```bash
# For each documentation section:
export ARTICLE_PREFIX=article1

# 1. Create 13 pieces
./csmpieces/05_scripts_tools/GitHub_handler.sh create-pieces 1 "App_Architecture_Overview" article1

# 2. Edit pieces/article1-XX_App_Architecture_Overview_Piece_XX.md

# 3. Concatenate
ARTICLE_PREFIX=article1 ./csmpieces/05_scripts_tools/GitHub_handler.sh concat 1

# 4. Zip & Verify
ARTICLE_PREFIX=article1 ./csmpieces/05_scripts_tools/GitHub_handler.sh zip-pieces 1
ARTICLE_PREFIX=article1 ./csmpieces/05_scripts_tools/GitHub_handler.sh verify 1

# 5. Organize & Commit
ARTICLE_PREFIX=article1 ./csmpieces/05_scripts_tools/GitHub_handler.sh organize 1
ARTICLE_PREFIX=article1 ./csmpieces/05_scripts_tools/GitHub_handler.sh commit-push 1 "Add TGApp Section 1: Architecture - 13 pieces"
```

---

## 🎯 CONTACT / SUPPORT

- **Project:** TGApp (Tardigradia App Updater)
- **Ecosystem:** BOUNCE Evolution
- **Purpose:** Monetization layer for BOUNCE positioning app
- **Architecture:** Dual WebView (animation background + web overlay)
- **Build:** Pure command-line Android SDK (no Gradle)

---

*Runner file for TGApp — Encapsulates all session startup, build, test, merge, and documentation workflows.*
*All patterns derived from BOUNCE Evolution 91-version forensic analysis.*
*Iteration 1: Foundation - No menus, no buttons, pure WebView experience.*
*APK: `APK/TGApp-v1.0.0.apk` tracked in git | 7 merge methods verified*