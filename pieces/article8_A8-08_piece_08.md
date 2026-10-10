# TGAPP_Monetization_Architecture — Piece 08/13
## Article A8: A8-08 — TGAPP Monetization Architecture
**Piece:** 08 of 13  
**Generated:** 2026-10-08 06:55:00 UTC

---

# Server Components — License Server & Analytics (TG024-TG025)

## TG024: License Server (Optional, Backlog)
- **Category:** Server | **Priority:** P2 | **Effort:** Medium | **Target:** 1.0.1+
- **Description:** Central key validation service for enterprise fleets
- **Architecture:** Firebase Functions + Firestore (serverless, scales automatically)

### Firebase Function: validateReceipt
```javascript
// functions/src/license.ts
import * as functions from 'firebase-functions';
import { google } from 'googleapis';
import * as jwt from 'jsonwebtoken';

const androidPublisher = google.androidpublisher('v3');
const PRIVATE_KEY = process.env.LICENSE_PRIVATE_KEY!; // RS256 private key
const PUBLIC_KEY = process.env.LICENSE_PUBLIC_KEY!;   // RS256 public key

export const validateReceipt = functions.https.onCall(async (data, context) => {
  // 1. Validate input
  const { packageName, productId, purchaseToken, deviceId } = data;
  if (!packageName || !productId || !purchaseToken || !deviceId) {
    throw new functions.https.HttpsError('invalid-argument', 'Missing required fields');
  }
  
  // 2. Verify with Google Play Developer API
  const auth = new google.auth.GoogleAuth({
    scopes: ['https://www.googleapis.com/auth/androidpublisher']
  });
  const authClient = await auth.getClient();
  androidPublisher.options.auth = authClient;
  
  const purchase = await androidPublisher.purchases.products.get({
    packageName,
    productId,
    token: purchaseToken
  }).execute();
  
  // 3. Check purchase state
  if (purchase.consumptionState === 1) {
    throw new functions.https.HttpsError('failed-precondition', 'Purchase already consumed');
  }
  if (purchase.purchaseState !== 0) { // 0 = purchased
    throw new functions.https.HttpsError('failed-precondition', 'Purchase not valid');
  }
  
  // 4. Verify device binding (Play Integrity API)
  const integrityToken = data.integrityToken;
  if (integrityToken) {
    const integrity = await verifyPlayIntegrity(integrityToken, packageName);
    if (!integrity.deviceIntegrity?.includes('MEETS_DEVICE_INTEGRITY')) {
      throw new functions.https.HttpsError('permission-denied', 'Device integrity check failed');
    }
    // Verify device ID matches
    if (integrity.deviceId !== hashDeviceId(deviceId)) {
      throw new functions.https.HttpsError('permission-denied', 'Device ID mismatch');
    }
  }
  
  // 5. Generate device-bound license JWT
  const now = Math.floor(Date.now() / 1000);
  const expiresIn = 30 * 24 * 3600; // 30 days
  const tier = purchase.productId.includes('pro') ? 'pro' : 'enterprise';
  
  const features = getFeaturesForTier(tier);
  
  const license = jwt.sign({
    sub: deviceId,
    tier,
    iat: now,
    exp: now + expiresIn,
    features,
    fleetId: data.fleetId || null
  }, PRIVATE_KEY, { algorithm: 'RS256' });
  
  // 6. Store in Firestore for revocation tracking
  await admin.firestore().collection('licenses').doc(deviceId).set({
    license,
    tier,
    expiresAt: admin.firestore.Timestamp.fromMillis((now + expiresIn) * 1000),
    purchaseToken,
    createdAt: admin.firestore.FieldValue.serverTimestamp(),
    revoked: false
  });
  
  return { license, expiresIn, tier, features };
});

// Helper: Get features for tier
function getFeaturesForTier(tier: string): string[] {
  const features: Record<string, string[]> = {
    free: ['core_positioning', 'basic_viz', 'trail_recording', 'theme_manual', 'gpx_export', 'voice_alerts'],
    pro: ['core_positioning', 'basic_viz', 'trail_recording', 'theme_manual', 'gpx_export', 'voice_alerts',
          'mesh_premium', 'ar_overlay', 'fleet_keys', 'priority_updates', 'offline_maps', 'hazard_reporting_premium',
          'positioning_advanced', 'theme_auto'],
    enterprise: ['core_positioning', 'basic_viz', 'trail_recording', 'theme_manual', 'gpx_export', 'voice_alerts',
                 'mesh_premium', 'ar_overlay', 'fleet_keys', 'priority_updates', 'offline_maps', 'hazard_reporting_premium',
                 'positioning_advanced', 'theme_auto', 'fleet_admin', 'bulk_provisioning', 'api_access']
  };
  return features[tier] || features.free;
}
```

### License Revocation Endpoint
```javascript
export const revokeLicense = functions.https.onCall(async (data, context) => {
  // Admin only - check custom claims
  if (!context.auth?.token.admin) {
    throw new functions.https.HttpsError('permission-denied', 'Admin required');
  }
  
  const { deviceId, reason } = data;
  await admin.firestore().collection('licenses').doc(deviceId).update({
    revoked: true,
    revokedAt: admin.firestore.FieldValue.serverTimestamp(),
    revocationReason: reason
  });
  
  // Push revocation to device via FCM
  await admin.messaging().send({
    token: await getDeviceFcmToken(deviceId),
    data: { type: 'LICENSE_REVOKED', reason }
  });
  
  return { success: true };
});
```

## TG025: Analytics/Telemetry (Opt-in, Backlog)
- **Category:** Server | **Priority:** P2 | **Effort:** Low | **Target:** 1.0.1+
- **Description:** Anonymous usage stats for premium features
- **Privacy:** Opt-in only; no PII; aggregated only

### Events Tracked
```kotlin
// bounce-common - Analytics.kt
sealed class AnalyticsEvent {
    data class LicenseCheck(val valid: Boolean, val tier: String) : AnalyticsEvent()
    data class FeatureUsed(val feature: String, val tier: String) : AnalyticsEvent()
    data class MeshMessageSent(val type: String, val hopCount: Int) : AnalyticsEvent()
    data class UpdateInstalled(val fromVersion: Int, val toVersion: Int) : AnalyticsEvent()
    data class PositioningAccuracy(val algorithm: String, val accuracyMeters: Float) : AnalyticsEvent()
    data class CrashReport(val error: String, val stackTrace: String) : AnalyticsEvent()
}

// Only sent if user opted in + TGAPP valid
class AnalyticsManager @Inject constructor(
    private val featureGate: FeatureGate,
    private val prefs: SharedPreferences
) {
    private val optedIn: Boolean by lazy { prefs.getBoolean("analytics_opt_in", false) }
    
    fun log(event: AnalyticsEvent) {
        if (!optedIn || !featureGate.isEnabled("analytics")) return
        
        // Batch and send via Firebase Analytics or custom endpoint
        FirebaseAnalytics.getInstance(context).logEvent(event.javaClass.simpleName, 
            Bundle().apply { putString("data", event.toJson()) }
        )
    }
}
```

---

## Server Cost Estimate (Firebase)

| Component | Free Tier | Paid Tier (10k users) |
|-----------|-----------|----------------------|
| Functions | 2M invocations/mo | ~$5/mo |
| Firestore | 50K reads/day | ~$10/mo |
| Auth | 10K MAU | Included |
| Hosting | 10 GB | ~$5/mo |
| **Total** | **$0** | **~$20/mo** |

---

*End of Piece 08/13 — See Piece 09 for UI: TGAPP Home Screen & Bounce Premium Indicators*