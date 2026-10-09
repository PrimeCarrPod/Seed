# NEW APP RUNNER — BOUNCE ECOSYSTEM APP CREATION
**Project:** Create New Monetization App (TGAPP-style) from BOUNCE Evolution Template  
**Template:** `CREATE_NEW_APP_TEMPLATE.md` (this directory)  
**Target Location:** `CSMWip/05_BOUNCE/` → `CSMWip/05_BOUNCE/{APP_NAME}.WIP/` (incremental)  
**Branch Strategy:** `kilo/{app-name}-wip` → PR → `main`  
**Last Updated:** 2026-10-08  
**Source:** BOUNCE Evolution Forensic Analysis (91 versions, 13 sections complete)

---

## QUICK START — COPY-PASTE TO CREATE NEW APP

```bash
# 1. Navigate to workspace
cd /workspace/app

# 2. Set your app name (EDIT THIS)
export APP_NAME="MYNEWAPP"
export PACKAGE_NAME="com.bounce.mynewapp"
export PRICE_TIER="monthly_499"

# 3. Create incremental WIP folder in CSMWip/05_BOUNCE/
export NEXT_NUM=$(ls -d CSMWip/05_BOUNCE/*.WIP 2>/dev/null | wc -l)
export NEXT_NUM=$((NEXT_NUM + 1))
export WIP_DIR="CSMWip/05_BOUNCE/${APP_NAME}.WIP"
mkdir -p "$WIP_DIR"/{src,build,out,keystore,pieces,sections,framework,logs,zip,forensic,csmlogs}

# 4. Copy template & runner to new app folder
cp CSMWip/05_BOUNCE/FINAL_DELIVERABLES/templates/CREATE_NEW_APP_TEMPLATE.md "$WIP_DIR/APP_TEMPLATE_${APP_NAME}.md"
cp CSMWip/05_BOUNCE/FINAL_DELIVERABLES/templates/NEW_APP_RUNNER.md "$WIP_DIR/NEW_APP_RUNNER_${APP_NAME}.md"

# 5. Edit the template with your app specifics
# nano "$WIP_DIR/APP_TEMPLATE_${APP_NAME}.md"

# 6. Create git branch
git checkout -b "kilo/${APP_NAME,,}-wip"

# 7. Start session log
SESSION_LOG="$WIP_DIR/csmlogs/session_$(date -u +%Y%m%d_%H%M%S).md"
mkdir -p "$(dirname "$SESSION_LOG")"
echo "# ${APP_NAME} Session Log - $(date -u)" > "$SESSION_LOG"
```

---

## TEMPLATE CONFIGURATION — EDIT THESE SECTIONS

### Required Edits (APP_TEMPLATE_${APP_NAME}.md)

| Section | Fields to Edit | Example |
|---------|----------------|---------|
| **App Identity** | APP_NAME, PACKAGE_NAME, PLAY_STORE_ID, PRICE_TIER | "MYAPP", "com.bounce.myapp", "myapp-pro", "monthly_299" |
| **Feature Tiers** | FREE_FEATURES, PRO_FEATURES | Copy from template, modify |
| **Build Config** | min_sdk, target_sdk, kotlin_version, etc. | Keep defaults or adjust |
| **Signing Config** | keystore_path, key_alias | Use same as Bounce for APK updates |
| **Backend Config** | firebase_project, functions_region | New Firebase project |
| **Fleet Config** | root_key_derivation, max_fleet_size | Adjust for scale |
| **Update Config** | apk_hosting, forced_update_threshold | Firebase App Distribution |

### Do NOT Edit (Encapsulated)
- `BOUNCE_INTEGRATION` block — Shared keystore, broadcast action, FeatureGate class, JWT public key
- `FORENSIC_CONTEXT` block — 91 versions analyzed, EKF bug fixed v1.0.92
- `SPREADSHEETS_CREATED` block — References to BOUNCE analysis
- `SECTIONS_COMPLETED` block — Section 7 & 8 roadmap items
- `ROADMAP_ITEMS_FOR_THIS_APP` block — FP018-FP021

---

## GITHUB HANDLER WORKFLOW — FOR NEW APP DOCUMENTATION

```bash
# For each documentation section (1-N):
export ARTICLE_PREFIX=article1  # Change per section

# 1. Create pieces (13 per section)
./csmpieces/05_scripts_tools/GitHub_handler.sh create-pieces N "Section_Title" $ARTICLE_PREFIX

# 2. Write content to each piece
# Edit: pieces/articleN-XX_Section_Title_Piece_XX.md

# 3. Concatenate
ARTICLE_PREFIX=articleN ./csmpieces/05_scripts_tools/GitHub_handler.sh concat N

# 4. Zip pieces
ARTICLE_PREFIX=articleN ./csmpieces/05_scripts_tools/GitHub_handler.sh zip-pieces N

# 5. Verify
ARTICLE_PREFIX=articleN ./csmpieces/05_scripts_tools/GitHub_handler.sh verify N

# 6. Organize to SubAtom_WIP
ARTICLE_PREFIX=articleN ./csmpieces/05_scripts_tools/GitHub_handler.sh organize N

# 7. Commit & push
ARTICLE_PREFIX=articleN ./csmpieces/05_scripts_tools/GitHub_handler.sh commit-push N "Add ${APP_NAME} Section N: Section_Title - 13 pieces"
```

### Suggested Sections for New App
| N | Section Title | ARTICLE_PREFIX | Source Material |
|---|---------------|----------------|-----------------|
| 1 | App_Architecture_Overview | article1 | Template + BOUNCE Section 8 |
| 2 | Billing_License_Integration | article2 | Template + BOUNCE Section 7 (FP018-021) |
| 3 | Feature_Gating_Implementation | article3 | Template + BOUNCE Section 5 (BP015) |
| 4 | APK_Delivery_Update_Pipeline | article4 | Template + BOUNCE Section 4 |
| 5 | Fleet_Key_Management | article5 | Template + BOUNCE Section 11 (FT002, FT005) |
| 6 | Testing_Launch_Checklists | article6 | Template TESTING/LAUNCH sections |
| 7 | Future_Roadmap_P0_P3 | article7 | Template ROADMAP_ITEMS + BOUNCE Section 7 |

---

## PIECE CREATION — HOW TO CUT CONTENT

### 13-Piece Structure (Per Section)
```
Piece 01: Overview / Introduction
Piece 02: Architecture / Data Flow
Piece 03: Core Implementation
Piece 04: Integration Points
Piece 05: Configuration / Setup
Piece 06: Error Handling / Edge Cases
Piece 07: Testing Strategy
Piece 08: Performance / Optimization
Piece 09: Security Considerations
Piece 10: Deployment / Release
Piece 11: Monitoring / Observability
Piece 12: Future Enhancements
Piece 13: Summary / Cross-References
```

### Piece Naming Convention
```
pieces/article{N}-{XX}_{Section_Title}_Piece_{XX}.md
# Example: pieces/article1-01_App_Architecture_Overview_Piece_01.md
```

### Content Sources
- **BOUNCE Sections 1-13** → Reference for patterns, anti-patterns, errors
- **Template sections** → Direct content for new app specifics
- **Forensic data** → BOUNCE Section 12 for lessons learned
- **Roadmap items** → BOUNCE Section 7 for P0-P3 priorities

---

## SDK / BUILD PIPELINE — ENCAPSULATED FROM BOUNCE

### Required Tools (from BOUNCE Section 4)
```bash
# JDK 17+ (LTS)
export JAVA_HOME=/usr/lib/jvm/java-17-openjdk

# Android SDK
export ANDROID_HOME=$HOME/Android/Sdk
export ANDROID_SDK_ROOT=$ANDROID_HOME
export PATH=$PATH:$ANDROID_HOME/cmdline-tools/latest/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:$ANDROID_HOME/build-tools/34.0.0

# Licenses (pre-accepted)
yes | sdkmanager --licenses 2>/dev/null || true
```

### Build Script Template (from BOUNCE `build.sh`)
```bash
#!/bin/bash
# $WIP_DIR/build.sh
set -e

APP_DIR="src/main"
AAPT2="$ANDROID_HOME/build-tools/34.0.0/aapt2"
D8="$ANDROID_HOME/build-tools/34.0.0/d8"
ZIPALIGN="$ANDROID_HOME/build-tools/34.0.0/zipalign"
APKSIGNER="$ANDROID_HOME/build-tools/34.0.0/apksigner"

# 1. Compile resources
$AAPT2 compile --dir $APP_DIR/res -o compiled_res.zip
$AAPT2 link -o base.apk -I $ANDROID_HOME/platforms/android-34/android.jar \
  --manifest $APP_DIR/AndroidManifest.xml -R compiled_res.zip \
  --java gen --auto-add-overlay

# 2. Compile Kotlin/Java
kotlinc -d classes.jar -cp $ANDROID_HOME/platforms/android-34/android.jar \
  $APP_DIR/java/**/*.kt $APP_DIR/java/**/*.java

# 3. Dex
$D8 --lib $ANDROID_HOME/platforms/android-34/android.jar \
  --output . classes.jar

# 4. Package APK
$AAPT2 link -o unsigned.apk -I $ANDROID_HOME/platforms/android-34/android.jar \
  --manifest $APP_DIR/AndroidManifest.xml -R compiled_res.zip \
  --dex classes.dex --java gen

# 5. Align & Sign
$ZIPALIGN -f -p 4 unsigned.apk aligned.apk
$APKSIGNER sign --ks keystore/release.keystore --ks-key-alias release-key \
  --ks-pass pass:$KEYSTORE_PASS --key-pass pass:$KEY_PASS \
  -o ${APP_NAME}-v1.0.0.apk aligned.apk

# 6. Verify
$APKSIGNER verify ${APP_NAME}-v1.0.0.apk
```

### Gradle Alternative (Modern)
```kotlin
// build.gradle.kts
plugins {
    id("com.android.application") version "8.2.0" apply false
    id("org.jetbrains.kotlin.android") version "1.9.20" apply false
}

// Module build.gradle.kts
android {
    namespace = "com.bounce.mynewapp"
    compileSdk = 34
    defaultConfig {
        applicationId = "com.bounce.mynewapp"
        minSdk = 28
        targetSdk = 34
        versionCode = 1
        versionName = "1.0.0"
    }
    signingConfigs {
        create("release") {
            storeFile = file("keystore/release.keystore")
            storePassword = System.getenv("KEYSTORE_PASS")
            keyAlias = "release-key"
            keyPassword = System.getenv("KEY_PASS")
        }
    }
    buildTypes {
        release {
            signingConfig = signingConfigs.getByName("release")
            minifyEnabled = false
        }
    }
}
dependencies {
    implementation("com.android.billingclient:billing:6.2.1")
    implementation(platform("com.google.firebase:firebase-bom:32.7.0"))
    implementation("com.google.firebase:firebase-functions-ktx")
    implementation("org.jetbrains.kotlinx:kotlinx-coroutines-android:1.7.3")
}
```

---

## BOUNCE INTEGRATION — ENCAPSULATED PATTERNS

### License Validation (from BOUNCE Section 8)
```kotlin
// FeatureGate.kt — Shared with BOUNCE
class FeatureGate(context: Context) {
    private val prefs = context.getSharedPreferences("bounce_license", Context.MODE_PRIVATE)
    private val publicKey = """-----BEGIN PUBLIC KEY-----
MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAn...
-----END PUBLIC KEY-----""".trimIndent()
    
    fun isProEnabled(): Boolean {
        val jwt = prefs.getString("license_jwt", "") ?: return false
        return try {
            val parts = jwt.split(".")
            val payload = String(Base64.decode(parts[1], Base64.URL_SAFE), "UTF-8")
            val json = JSONObject(payload)
            val exp = json.getLong("exp") * 1000
            val features = json.getJSONArray("features")
            exp > System.currentTimeMillis() && features.toList().contains("pro")
        } catch (e: Exception) { false }
    }
    
    fun onLicenseUpdated(jwt: String) {
        prefs.edit().putString("license_jwt", jwt).apply()
        context.sendBroadcast(Intent("LICENSE_UPDATED"))
    }
}
```

### Broadcast Receiver (in BOUNCE MainActivity)
```kotlin
// In BOUNCE app — receives license updates from TGAPP
val licenseReceiver = object : BroadcastReceiver() {
    override fun onReceive(context: Context, intent: Intent) {
        if (intent.action == "LICENSE_UPDATED") {
            FeatureGate(context).apply { /* refresh feature gates */ }
        }
    }
}
context.registerReceiver(licenseReceiver, IntentFilter("LICENSE_UPDATED"))
```

### APK Delivery (Firebase App Distribution)
```kotlin
// In TGAPP — delivers signed APK to BOUNCE users
fun deliverUpdate(userId: String, apkPath: String) {
    val functions = FirebaseFunctions.getInstance("us-central1")
    val task = functions.getHttpsCallable("deliverApk").call(hashMapOf(
        "userId" to userId,
        "apkUrl" to uploadToStorage(apkPath),
        "version" to "1.0.1",
        "signature" to signApk(apkPath)
    ))
}
```

---

## INCREMENTAL NUMBERING — CSMWIP FOLDER STRUCTURE

### Current State (Auto-Detected)
```bash
# Check existing WIP folders
ls -d CSMWip/05_BOUNCE/*.WIP
# Output:
# CSMWip/05_BOUNCE/BOUNCE.WIP
# CSMWip/05_BOUNCE/TGAPP.WIP        (when created)
# CSMWip/05_BOUNCE/MYNEWAPP.WIP     (next)

# Next number = count + 1
export NEXT_NUM=$(ls -d CSMWip/05_BOUNCE/*.WIP 2>/dev/null | wc -l)
export NEXT_NUM=$((NEXT_NUM + 1))
# Result: 3 (for 3rd app)
```

### Folder Structure Created
```
CSMWip/05_BOUNCE/
├── BOUNCE.WIP/                    # Original (1)
├── TGAPP.WIP/                     # Monetization app (2)
├── MYNEWAPP.WIP/                  # Your new app (3)
│   ├── src/main/                  # Android source
│   ├── build/                     # Build outputs
│   ├── out/                       # Signed APKs
│   ├── keystore/                  # Release keystore
│   ├── pieces/                    # 13 pieces × N sections
│   ├── sections/                  # Concatenated sections
│   ├── framework/                 # MASTER_TODO, RESUME_SESSION
│   ├── logs/                      # ProjectLogs, heartbeat
│   ├── zip/                       # Piece archives
│   ├── forensic/                  # Local forensic (optional)
│   └── csmlogs/                   # Session logs
└── FINAL_DELIVERABLES/            # Shared templates
```

---

## MERGE METHODS — 7 VERIFIED WAYS

```bash
# 1. PR Auto-Merge (Recommended)
gh pr create --base main --head "kilo/${APP_NAME,,}-wip" \
  --title "Add ${APP_NAME}: New monetization app" \
  --body "From BOUNCE Evolution template" && gh pr merge --auto

# 2. Direct Push (if branch protection off)
git push origin "kilo/${APP_NAME,,}-wip"

# 3. Force with Lease (if conflicts)
git push --force-with-lease origin "kilo/${APP_NAME,,}-wip":main

# 4. Rebase + Push
git rebase main "kilo/${APP_NAME,,}-wip" && git push origin "kilo/${APP_NAME,,}-wip"

# 5. GitHub API Merge
git push origin "kilo/${APP_NAME,,}-wip" && \
  gh api repos/PrimeCarrPod/Seed/merges -X POST \
  -f base=main -f head="kilo/${APP_NAME,,}-wip"

# 6. Format-Patch + Am
git format-patch main.."kilo/${APP_NAME,,}-wip" --stdout | git am -3 && git push origin main

# 7. Bundle Transfer (offline)
git bundle create ${APP_NAME}.bundle main.."kilo/${APP_NAME,,}-wip"
# Transfer bundle → git pull ${APP_NAME}.bundle
```

---

## SESSION LOG PUSH — AFTER EACH MILESTONE

```bash
SESSION_LOG="$WIP_DIR/csmlogs/session_$(date -u +%Y%m%d_%H%M%S).md"
cp "$WIP_DIR/logs/ProjectLogs.md" "$SESSION_LOG" 2>/dev/null || \
  echo "# ${APP_NAME} Session $(date -u)" > "$SESSION_LOG"
git add "$SESSION_LOG"
git commit -m "Add ${APP_NAME} session log: $(basename $SESSION_LOG)"
git push origin "kilo/${APP_NAME,,}-wip"
```

---

## KEY REFERENCE FILES (FROM BOUNCE EVOLUTION)

| File | Location | Purpose |
|------|----------|---------|
| `CREATE_NEW_APP_TEMPLATE.md` | `FINAL_DELIVERABLES/templates/` | App configuration template |
| `NEW_APP_RUNNER.md` | `FINAL_DELIVERABLES/templates/` | This file |
| `MASTER_INDEX.md` | `FINAL_DELIVERABLES/master_index/` | Cross-reference all BOUNCE sections |
| `A8-08_TGAPP_Monetization_Architecture.md` | `FINAL_DELIVERABLES/sections/` | TGAPP architecture reference |
| `A7-07_Future_Progress_Roadmap_P0_P3.md` | `FINAL_DELIVERABLES/sections/` | P0-P3 roadmap (FP018-FP021) |
| `GitHub_handler.sh` | `csmpieces/05_scripts_tools/` | Piece management script |
| `Bounce-v1.0.92.apk` | `FINAL_DELIVERABLES/apks/` | Reference signed APK (EKF fix) |
| Forensic CSVs | `FINAL_DELIVERABLES/forensic_summary/` | Lessons learned, error patterns |

---

## CONTEXT FOR TOKEN LIMIT

> **Project:** New BOUNCE Ecosystem App (TGAPP-style monetization)  
> **Template:** BOUNCE Evolution Forensic Analysis (91 versions, 13 sections)  
> **Target:** `CSMWip/05_BOUNCE/{APP_NAME}.WIP/` (incremental numbering)  
> **Branch:** `kilo/{app-name}-wip`  
> **Key Integration:** Shared keystore, LICENSE_UPDATED broadcast, FeatureGate, JWT RS256  
> **Build:** Android SDK 34, Kotlin 1.9.20, Billing 6.2.1, Firebase BOM 32.7.0  
> **APK Delivery:** Firebase App Distribution, signed with Bounce keystore  
> **Next:** Edit template → Create pieces → GitHub Handler → PR → Main

---

## CHECKLIST — BEFORE FIRST COMMIT

- [ ] `APP_TEMPLATE_${APP_NAME}.md` edited with your app specifics
- [ ] `NEW_APP_RUNNER_${APP_NAME}.md` reviewed
- [ ] Keystore copied to `$WIP_DIR/keystore/release.keystore`
- [ ] `build.sh` or `build.gradle.kts` created in `$WIP_DIR/`
- [ ] Firebase project created, `google-services.json` added
- [ ] Git branch `kilo/${APP_NAME,,}-wip` created
- [ ] First session log created in `$WIP_DIR/csmlogs/`
- [ ] README.md created in `$WIP_DIR/` with app overview

---

## SURGICAL EXTRACTION — FROM BOUNCE TO NEW APP (v1.0.1+)

### Philosophy: Lobotomized BOUNCE Core
Take a **working BOUNCE version** (v1.0.91+ with EKF fix), surgically extract ONLY the WebView/HTML encapsulation layer, and transplant it into a minimal new app. Remove all menus, sensors, scanning, Bluetooth, WiFi, GPS, fleet, broadcast, trail, controls — keep ONLY:

1. **WebView Engine** — `buildWebView()` method with hardware acceleration
2. **HTML Asset** — `bounce.html` → rename to `tgapp.html` with Antikythera + TGHC overlay
3. **JS Bridge** — `addJavascriptInterface` + `injectJs()` + `androidBridge()` 
4. **Fullscreen Immersive** — `setupFullscreen()` + `onConfigurationChanged()`
5. **Network Security** — Cleartext for dev domains, HTTPS for production

### Step-by-Step Surgical Extraction

```bash
# 1. START FROM WORKING BOUNCE VERSION
cd /workspace/app/CSMApps/Bounce/
unzip -l "CarrPod_Bounce_v1.0.91 2.zip"  # Verify v1.0.91 exists

# 2. EXTRACT BOUNCE SOURCE
mkdir -p /tmp/bounce-extract
cd /tmp/bounce-extract
unzip "/workspace/app/CSMApps/Bounce/CarrPod_Bounce_v1.0.91 2.zip" "v1.0.91/src/main/*"

# 3. IDENTIFY SURGICAL TARGETS
# KEEP (transplant to new app):
#   v1.0.91/src/main/java/com/carrpod/bounce/MainActivity.java → buildWebView(), injectJs(), setupFullscreen()
#   v1.0.91/src/main/assets/bounce.html → rename to tgapp.html (Antikythera + 8× TGHC)
#   v1.0.91/src/main/AndroidManifest.xml → permissions + fullscreen theme
#   v1.0.91/src/main/res/xml/network_security_config.xml → cleartext domains
#   v1.0.91/build.sh → pipeline (aapt2 → javac → d8 → zipalign → apksigner)

# REMOVE (lobotomize):
#   ALL sensor/Bluetooth/WiFi/GPS/fleet/broadcast/trail/control code
#   ALL menu/button/HUD/POV/theory/fleet/broadcast UI
#   ALL Kalman/EKF/Particle/Trilateration/ZoneHMM/WiFi-RTT classes
#   ALL permission requests beyond INTERNET/NETWORK_STATE/WAKE_LOCK

# 4. TRANSPLANT TO NEW APP WIP
NEW_WIP="CSMWip/11_TGApp/TGApp.WIP"

# WebView engine → MainActivity.java
mkdir -p $NEW_WIP/src/main/java/com/TGApp/mynewapp/
# Copy buildWebView(), injectJs(), setupFullscreen(), onConfigurationChanged() from BOUNCE

# HTML asset → tgapp.html
mkdir -p $NEW_WIP/src/main/assets/
# Transform bounce.html → tgapp.html:
#   - Load antikytherian.com in background WebView
#   - Load tghc.pro (8× google.com) in overlay WebView
#   - Remove all BOUNCE HUD/controls/menus

# Manifest → permissions + theme
# Network security config → cleartext for antikytherian.com, tghc.pro

# Build script → exact BOUNCE pipeline
```

### HTML Transformation: bounce.html → tgapp.html

```html
<!-- ORIGINAL (BOUNCE): Single WebView with Three.js scene + HUD -->
<!-- SURGICAL TARGET: Dual WebView architecture -->

<!-- 1. BACKGROUND WebView → antikytherian.com -->
<!-- Loads: https://www.antikytherian.com (Antikythera mechanism animation) -->
<!-- Full screen, hardware accelerated, opaque -->

<!-- 2. OVERLAY WebView → tghc.pro -->
<!-- Loads: https://www.tghc.pro (8× google.com windows) -->
<!-- Full screen, hardware accelerated, TRANSPARENT background -->
<!-- No Three.js, no HUD, no controls -->

<!-- JS Bridge for license status -->
<script>
function androidBridge(method, data) {
    if (typeof BounceBridge !== 'undefined' && BounceBridge[method]) {
        BounceBridge[method](JSON.stringify(data));
    }
}
// Receive license status from native
function onLicenseStatus(data) {
    // Show/hide Pro features in overlay
}
</script>
```

### BOUNCE v1.0.91 Surgical Components Map

| BOUNCE Component | Location | Action | New App Location |
|------------------|----------|--------|------------------|
| `buildWebView()` | MainActivity.java:2070 | **KEEP** → dual WebView | MainActivity.java |
| `injectJs()` | MainActivity.java:2140 | **KEEP** | MainActivity.java |
| `setupFullscreen()` | MainActivity.java:2050 | **KEEP** | MainActivity.java |
| `onConfigurationChanged()` | MainActivity.java:2130 | **KEEP** | MainActivity.java |
| `bounce.html` | assets/bounce.html | **TRANSFORM** → tgapp.html | assets/tgapp.html |
| `AndroidManifest.xml` | src/main/AndroidManifest.xml | **ADAPT** → minimal perms | src/main/AndroidManifest.xml |
| `network_security_config.xml` | res/xml/network_security_config.xml | **ADAPT** → dev domains | res/xml/network_security_config.xml |
| `build.sh` | build.sh | **COPY** exact pipeline | build.sh |
| `JsBridge` class | MainActivity.java:2150 | **REMOVE** (not needed) | — |
| `buildHeader()` | MainActivity.java:2160 | **REMOVE** | — |
| `buildControlBar()` | MainActivity.java:2180 | **REMOVE** | — |
| All sensor/BT/WiFi/GPS code | MainActivity.java | **REMOVE** | — |
| All Kalman/EKF/Particle classes | wifi/*.java | **REMOVE** | — |

---

## GITHUB HANDLER SCRIPT USAGE

### Location
```bash
/workspace/app/csmpieces/05_scripts_tools/GitHub_handler.sh
```

### For Each Documentation Section (13 pieces per section)

```bash
# Setup
export ARTICLE_PREFIX=article1  # article1, article2, etc.
export SECTION_TITLE="Surgical_Extraction_Guide"  # snake_case

# 1. CREATE 13 PIECES
./csmpieces/05_scripts_tools/GitHub_handler.sh create-pieces 1 "Surgical_Extraction_Guide" article1

# 2. EDIT EACH PIECE (13 files created)
# pieces/article1-01_Surgical_Extraction_Guide_Piece_01.md  → Overview
# pieces/article1-02_Surgical_Extraction_Guide_Piece_02.md  → Architecture
# pieces/article1-03_Surgical_Extraction_Guide_Piece_03.md  → Core Extraction
# pieces/article1-04_Surgical_Extraction_Guide_Piece_04.md  → Integration Points
# pieces/article1-05_Surgical_Extraction_Guide_Piece_05.md  → Configuration
# pieces/article1-06_Surgical_Extraction_Guide_Piece_06.md  → Error Handling
# pieces/article1-07_Surgical_Extraction_Guide_Piece_07.md  → Testing
# pieces/article1-08_Surgical_Extraction_Guide_Piece_08.md  → Performance
# pieces/article1-09_Surgical_Extraction_Guide_Piece_09.md  → Security
# pieces/article1-10_Surgical_Extraction_Guide_Piece_10.md  → Deployment
# pieces/article1-11_Surgical_Extraction_Guide_Piece_11.md  → Monitoring
# pieces/article1-12_Surgical_Extraction_Guide_Piece_12.md  → Future Enhancements
# pieces/article1-13_Surgical_Extraction_Guide_Piece_13.md  → Summary/Cross-Refs

# 3. CONCATENATE
ARTICLE_PREFIX=article1 ./csmpieces/05_scripts_tools/GitHub_handler.sh concat 1

# 4. ZIP PIECES
ARTICLE_PREFIX=article1 ./csmpieces/05_scripts_tools/GitHub_handler.sh zip-pieces 1

# 5. VERIFY
ARTICLE_PREFIX=article1 ./csmpieces/05_scripts_tools/GitHub_handler.sh verify 1

# 6. ORGANIZE TO SUBATOM_WIP
ARTICLE_PREFIX=article1 ./csmpieces/05_scripts_tools/GitHub_handler.sh organize 1

# 7. COMMIT & PUSH
ARTICLE_PREFIX=article1 ./csmpieces/05_scripts_tools/GitHub_handler.sh commit-push 1 "Add TGApp Section 1: Surgical Extraction Guide - 13 pieces"
```

### Quick Verification
```bash
# Verify handler exists and works
ls -la /workspace/app/csmpieces/05_scripts_tools/GitHub_handler.sh
./csmpieces/05_scripts_tools/GitHub_handler.sh --help  # or just run without args
```

---

## QUICK REFERENCE — SURGICAL CHECKLIST

| Step | Action | Command/Location |
|------|--------|------------------|
| 1 | Extract BOUNCE v1.0.91 | `unzip "CarrPod_Bounce_v1.0.91 2.zip" "v1.0.91/src/main/*"` |
| 2 | Copy `buildWebView()` | BOUNCE MainActivity.java → New MainActivity.java |
| 3 | Copy `injectJs()` + `setupFullscreen()` | Same |
| 4 | Transform `bounce.html` → `tgapp.html` | Dual WebView, no Three.js/HUD |
| 5 | Adapt Manifest | Minimal perms (INTERNET, NETWORK, WAKE_LOCK) |
| 6 | Copy `network_security_config.xml` | Add antikytherian.com, tghc.pro cleartext |
| 7 | Copy `build.sh` | Exact BOUNCE pipeline (aapt2→javac→d8→zipalign→apksigner) |
| 8 | Build & verify | `./build.sh` → 25KB APK |
| 9 | Document via GitHub Handler | 13 pieces per section |

---

*Runner file for BOUNCE Ecosystem App Creation — Place next to CREATE_NEW_APP_TEMPLATE.md*
*All patterns encapsulated from BOUNCE Evolution 91-version forensic analysis*
*Incremental numbering in CSMWip/05_BOUNCE/ — GitHub Handler workflow ready*
*Last Updated: 2026-10-09 — Surgical extraction v1.0.1 added*
