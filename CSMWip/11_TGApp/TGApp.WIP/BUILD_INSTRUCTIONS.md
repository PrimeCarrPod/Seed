# TGApp v1.0.1 — Build Instructions

## Quick Start (GitHub Actions - Recommended)

The easiest way to build the APK is via GitHub Actions:

1. **Push to GitHub:**
   ```bash
   cd /workspace/app/CSMWip/11_TGApp/TGApp.WIP
   git init
   git add .
   git commit -m "TGApp v1.0.1: Add billing, license validation, Gradle build"
   git branch -M kilo/tgapp-wip
   git remote add origin https://github.com/YOUR_USERNAME/YOUR_REPO.git
   git push -u origin kilo/tgapp-wip
   ```

2. **Configure Secrets in GitHub Repository Settings → Secrets → Actions:**
   | Secret | Description |
   |--------|-------------|
   | `KEYSTORE_BASE64` | Base64-encoded release.keystore (`base64 -w0 keystore/release.keystore`) |
   | `KEYSTORE_PASS` | Keystore password |
   | `KEY_PASS` | Key password |
   | `GOOGLE_SERVICES_JSON` | Base64-encoded google-services.json (`base64 -w0 google-services.json`) |

3. **Trigger Build:**
   - Go to Actions tab → "TGApp Build & Release" → "Run workflow"
   - Or push a tag: `git tag v1.0.1 && git push origin v1.0.1`

4. **Download APK:**
   - From Actions artifacts (debug + release)
   - From Releases page (on tag push)

---

## Local Build (Gradle)

### Prerequisites
- **JDK 17+** (Temurin/OpenJDK)
- **Android SDK** (API 34, Build Tools 34.0.0)
- **Gradle 8.5+** (via wrapper)

### Setup
```bash
# 1. Configure SDK path
cp local.properties.template local.properties
# Edit local.properties with your SDK path

# 2. Copy keystore (for release builds)
cp /path/to/bounce/release.keystore keystore/release.keystore

# 3. Configure Firebase (optional for debug)
cp google-services.json.template app/src/main/google-services.json
# Edit with your Firebase project config

# 4. Make wrapper executable
chmod +x gradlew
```

### Build Commands
```bash
# Debug build (no signing config needed)
./build_local.sh debug

# Release build (requires keystore)
./build_local.sh release

# Clean
./build_local.sh clean
```

### Output
- Debug: `APK/TGApp-v1.0.1-debug.apk`
- Release: `APK/TGApp-v1.0.1-release.apk`

---

## Local Build (Command-Line Tools Only)

If you prefer not to use Gradle:

```bash
# Requires: kotlinc, aapt2, d8, zipalign, apksigner in PATH
# Set ANDROID_HOME and JAVA_HOME

./build_v101.sh all
```

Output: `APK/TGApp-v1.0.1.apk`

---

## Required Configuration

### 1. Keystore (Critical for BOUNCE Integration)
The release keystore **MUST match BOUNCE's keystore** for APK update compatibility.

```bash
# Copy from BOUNCE
cp /workspace/app/CSMWip/05_BOUNCE/.../release.keystore keystore/release.keystore

# Set passwords (in CI/CD secrets, not in code!)
export KEYSTORE_PASS="your_keystore_password"
export KEY_PASS="your_key_password"
```

### 2. Firebase Project
1. Create project: `tardigradia-tgapp-prod` (or your name)
2. Add Android app: `com.TGApp.mynewapp`
3. Download `google-services.json` → `app/src/main/google-services.json`
4. Enable **Cloud Functions** (us-central1)
5. Deploy `validateReceipt` function (see below)

### 3. Play Console
1. Create app: `com.TGApp.mynewapp`
2. Create subscriptions:
   - `pro_yearly_499` — $49.99/year
   - `pro_monthly_499` — $4.99/month
3. Add test accounts (internal testing)
4. Publish to Internal Testing track

### 4. Firebase Function: validateReceipt
```javascript
// functions/index.js
const { onCall } = require("firebase-functions/v2/https");
const { google } = require("googleapis");
const jwt = require("jsonwebtoken");

exports.validateReceipt = onCall(async (request) => {
  const { packageName, productId, purchaseToken, orderId } = request.data;
  
  // Verify with Google Play Developer API
  const auth = new google.auth.GoogleAuth({
    scopes: ["https://www.googleapis.com/auth/androidpublisher"],
  });
  const authClient = await auth.getClient();
  const androidpublisher = google.androidpublisher({ version: "v3", auth: authClient });
  
  try {
    const purchase = await androidpublisher.purchases.subscriptions.get({
      packageName,
      subscriptionId: productId,
      token: purchaseToken,
    });
    
    if (purchase.data.paymentState === 1) { // Payment received
      // Generate JWT with RS256 (matching BOUNCE public key)
      const privateKey = process.env.JWT_PRIVATE_KEY; // Store in Secret Manager
      const licenseJwt = jwt.sign(
        { features: ["pro"], exp: Math.floor(Date.now()/1000) + 365*24*60*60 },
        privateKey,
        { algorithm: "RS256" }
      );
      return { valid: true, licenseJwt };
    }
    return { valid: false };
  } catch (error) {
    console.error("Validation failed:", error);
    return { valid: false };
  }
});
```

Deploy:
```bash
cd functions
npm install
firebase deploy --only functions:validateReceipt
```

---

## Verification Checklist

After building, verify the APK:

```bash
# 1. Check size (target: 150-200 KB)
ls -lh APK/TGApp-v1.0.1-release.apk

# 2. Verify signature
apksigner verify --print-certs APK/TGApp-v1.0.1-release.apk

# 3. Check permissions
aapt dump permissions APK/TGApp-v1.0.1-release.apk

# 4. Install on device
adb install -r APK/TGApp-v1.0.1-release.apk

# 5. Test billing flow
adb shell am start -n com.TGApp.mynewapp/.MainActivity

# 6. Check logs
adb logcat -s TGApp_MainActivity
```

Expected permissions:
```
android.permission.INTERNET
android.permission.ACCESS_NETWORK_STATE
android.permission.WAKE_LOCK
com.android.vending.BILLING
android.permission.REQUEST_INSTALL_PACKAGES
android.permission.QUERY_ALL_PACKAGES
android.permission.FOREGROUND_SERVICE
android.permission.FOREGROUND_SERVICE_DATA_SYNC
```

---

## Troubleshooting

### "SDK location not found"
```bash
# Create local.properties
echo "sdk.dir=$HOME/Android/Sdk" > local.properties
```

### "Keystore not found"
```bash
# For debug builds, it auto-creates debug.keystore
# For release, copy BOUNCE keystore to keystore/release.keystore
```

### "BILLING permission not found"
Ensure `com.android.vending.BILLING` is in AndroidManifest.xml

### "Firebase not initialized"
Check `google-services.json` is in `app/src/main/` and matches package name

### Gradle build fails
```bash
# Clean and retry
./gradlew clean
./gradlew assembleRelease --stacktrace
```

---

## APK Size Targets

| Build Type | Target Size | Max Size |
|------------|-------------|----------|
| Debug | ~200 KB | 300 KB |
| Release (ProGuard) | **150-200 KB** | 250 KB |

If release APK > 250 KB:
- Enable `minifyEnabled true` and `shrinkResources true`
- Check ProGuard rules keep necessary classes
- Remove unused dependencies

---

## BOUNCE Integration Verification

After both apps are installed:

1. **TGApp:** Purchase Pro subscription
2. **TGApp:** Receives JWT from Firebase → stores in SharedPreferences → broadcasts `LICENSE_UPDATED`
3. **BOUNCE:** Receives broadcast → calls `FeatureGate.isProEnabled()` → unlocks premium features
4. **TGApp:** Can deliver BOUNCE APK updates via Firebase App Distribution

---

## Support

- **Logs:** `CSMWip/11_TGApp/TGApp.WIP/csmlogs/`
- **Template:** `APP_TEMPLATE_TGApp.md`
- **Runner:** `NEW_APP_RUNNER_TGApp.md`
- **Lessons Learned:** `LESSONS_LEARNED_TGApp.md`
- **Upgrade Plan:** `UPGRADE_PLAN_v101.md`