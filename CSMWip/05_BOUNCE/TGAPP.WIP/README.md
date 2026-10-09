# TGApp — BOUNCE Ecosystem Monetization App

**Version:** 1.0.0  
**Package:** com.bounce.tgapp  
**Price Tier:** $5.99/year (yearly_599)  
**Branch:** kilo/tgapp-wip

## Overview

TGApp is the monetization layer for the BOUNCE ecosystem. It handles:
- Google Play Billing (subscriptions)
- License validation (JWT RS256)
- Feature gating (Free vs Pro)
- APK delivery to BOUNCE users (Firebase App Distribution)
- Fleet key management

BOUNCE remains free and open-source; TGApp holds all paid logic.

## Architecture

```
┌─────────────────┐     LICENSE_UPDATED      ┌─────────────────┐
│      TGApp      │ ──────── broadcast ─────► │     BOUNCE      │
│  (Monetization) │                            │  (Positioning)  │
│                 │                            │                 │
│ • Billing       │                            │ • FeatureGate   │
│ • License JWT   │                            │ • Receives      │
│ • APK Delivery  │                            │   broadcast     │
│ • Fleet Keys    │                            │ • Enables Pro   │
└─────────────────┘                            └─────────────────┘
```

### Surgical Extraction from BOUNCE v1.0.91

TGApp uses a **lobotomized BOUNCE core** — only the WebView encapsulation layer:
- `buildDualWebView()` — Background (antikytherian.com) + Overlay (tghc.pro)
- `setupFullscreen()` — Immersive sticky mode
- `injectJs()` — JavaScript bridge for license status
- `onConfigurationChanged()` — Rotation handling

**Removed:** All sensors, Bluetooth, WiFi, GPS, fleet, Kalman/EKF, menus, HUD, controls.

## Project Structure

```
TGAPP.WIP/
├── app/
│   ├── build.gradle.kts          # Gradle config
│   └── src/main/
│       ├── AndroidManifest.xml
│       ├── java/com/bounce/tgapp/
│       │   ├── MainActivity.kt       # Dual WebView + license bridge
│       │   ├── FeatureGate.kt        # JWT RS256 validation
│       │   ├── BillingActivity.kt    # Play Billing flow
│       │   ├── LicenseService.kt     # Background validation
│       │   └── TGAppApplication.kt   # Firebase init
│       ├── assets/
│       │   └── tgapp.html            # 8× google.com overlay
│       ├── res/
│       │   ├── layout/
│       │   ├── values/
│       │   └── xml/network_security_config.xml
├── build.sh                       # BOUNCE pipeline (aapt2→kotlinc→d8→zipalign→apksigner)
├── keystore/release.keystore      # Shared with BOUNCE for APK updates
├── pieces/                        # GitHub Handler: 13 pieces × N sections
├── sections/                      # Concatenated documentation
└── csmlogs/                       # Session logs
```

## Build

### Prerequisites
```bash
export JAVA_HOME=/usr/lib/jvm/java-17-openjdk
export ANDROID_HOME=$HOME/Android/Sdk
export ANDROID_SDK_ROOT=$ANDROID_HOME
export PATH=$PATH:$ANDROID_HOME/cmdline-tools/latest/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:$ANDROID_HOME/build-tools/34.0.0
yes | sdkmanager --licenses 2>/dev/null || true
```

### Build Script (BOUNCE Pipeline)
```bash
cd /workspace/app/CSMWip/05_BOUNCE/TGAPP.WIP
chmod +x build.sh
KEYSTORE_PASS=android KEY_PASS=android ./build.sh
# Output: out/TGAPP-v1.0.0.apk
```

### Gradle (Modern)
```bash
cd /workspace/app/CSMWip/05_BOUNCE/TGAPP.WIP
./gradlew assembleRelease
# Output: app/build/outputs/apk/release/app-release.apk
```

## Key Integration Points

### Shared Keystore
Both BOUNCE and TGApp use the same release keystore for APK updates:
- `keystore/release.keystore` (alias: `release-key`)
- Enables BOUNCE to verify TGApp-delivered APKs

### License Broadcast
```kotlin
// TGApp sends
context.sendBroadcast(Intent("LICENSE_UPDATED"))

// BOUNCE receives
val receiver = object : BroadcastReceiver() {
    override fun onReceive(context: Context, intent: Intent) {
        if (intent.action == "LICENSE_UPDATED") {
            FeatureGate(context).apply { /* refresh */ }
        }
    }
}
context.registerReceiver(receiver, IntentFilter("LICENSE_UPDATED"))
```

### FeatureGate (Shared Class)
```kotlin
class FeatureGate(context: Context) {
    fun isProEnabled(): Boolean { /* JWT RS256 validation */ }
    fun onLicenseUpdated(jwt: String) { /* store + broadcast */ }
}
```

### JWT Public Key (RS256)
```text
-----BEGIN PUBLIC KEY-----
MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAn...
-----END PUBLIC KEY-----
```

## Firebase Backend

- **Project:** bounce-tgapp-prod
- **Region:** us-central1
- **Functions:**
  - `validateReceipt` — Play receipt → license JWT
  - `deliverApk` — Signed APK → BOUNCE user
  - `provisionFleetKey` — QR code → fleet credentials

## Documentation (GitHub Handler)

13 pieces per section, organized via `GitHub_handler.sh`:

| Section | Title | Prefix |
|---------|-------|--------|
| 1 | App Architecture Overview | article1 |
| 2 | Billing & License Integration | article2 |
| 3 | Feature Gating Implementation | article3 |
| 4 | APK Delivery & Update Pipeline | article4 |
| 5 | Fleet Key Management | article5 |
| 6 | Testing & Launch Checklists | article6 |
| 7 | Future Roadmap (P0-P3) | article7 |

```bash
# Example: Create Section 1 pieces
export ARTICLE_PREFIX=article1
./csmpieces/05_scripts_tools/GitHub_handler.sh create-pieces 1 "App_Architecture_Overview" article1
```

## Roadmap (from BOUNCE Section 7)

| ID | Item | Priority | Target |
|----|------|----------|--------|
| FP018 | TGApp Core | P0 | v1.0.93 |
| FP019 | Purchase Verification | P0 | v1.0.93 |
| FP020 | Feature Gating | P0 | v1.0.93 |
| FP021 | Split Updater | P1 | v1.0.94 |

## Testing Checklist

- [ ] Play Store billing flow (test tracks)
- [ ] License validation (valid/expired/revoked)
- [ ] Feature gating (free vs pro)
- [ ] APK delivery (signature verification)
- [ ] Fleet key provisioning
- [ ] Offline license check (cached JWT)
- [ ] BOUNCE integration (broadcast receive)

## Launch Checklist

- [ ] Play Store listing (screenshots, description)
- [ ] Privacy policy URL
- [ ] Terms of service URL
- [ ] Support email
- [ ] Firebase project configured
- [ ] Keystore backed up
- [ ] CI/CD pipeline (GitHub Actions)
- [ ] Monitoring/alerting (Crashlytics, Play Console)

## References

- **BOUNCE Evolution Forensic Analysis:** 91 versions, 13 sections
- **Section 7:** Future Progress Roadmap (FP018-FP021)
- **Section 8:** TGApp Monetization Architecture (pending)
- **Template:** `CSMWip/05_BOUNCE/FINAL_DELIVERABLES/templates/CREATE_NEW_APP_TEMPLATE.md`
- **Runner:** `CSMWip/05_BOUNCE/FINAL_DELIVERABLES/templates/NEW_APP_RUNNER.md`

## Next Steps

1. Configure Firebase project (`google-services.json`)
2. Create Play Store subscription product (`pro_yearly_599`)
3. Deploy Firebase Functions (`validateReceipt`, `deliverApk`)
4. Generate production keystore (replace debug keystore)
5. Build and test APK
6. Document via GitHub Handler (7 sections × 13 pieces)
7. PR to main: `gh pr create --base main --head kilo/tgapp-wip`