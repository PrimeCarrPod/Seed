# TGAPP_Monetization_Architecture — Piece 11/13
## Article A8: A8-08 — TGAPP Monetization Architecture
**Piece:** 11 of 13  
**Generated:** 2026-10-08 06:55:00 UTC

---

# Business Model — Free Tier, Fleet Pricing, Referral (TG030-TG032)

## TG030: Free Tier Bounce
- **Category:** Business | **Priority:** P0 | **Effort:** Low | **Target:** 1.0.93
- **Description:** Core features free forever (Freemium model)
- **Included in Free:**
  - All 6 positioning algorithms (RSSI, Kalman, Particle, EKF, UKF, RSSI-ML)
  - Basic visualization (3D map, trails, vehicle positions)
  - Trail recording + manual GPX/KML export
  - Manual theme toggle (day/night)
  - Voice alerts (basic TTS)
  - Mesh network (1-hop only, no relay)
  - Basic hazard reporting (local only)
  - Self-update via Play Store (standard timing)
- **Excluded (Premium):**
  - Mesh relay (3 hops) + fleet mesh
  - Traffic/Weather/Trajectory relay
  - RTT/UWB positioning
  - AR Overlay
  - Offline maps
  - Auto theme
  - Priority updates (direct APK)
  - Fleet key management

### Free Tier Rationale
- **Adoption:** Zero friction to try; builds user base
- **Value:** Genuine utility (not crippleware)
- **Conversion:** Premium = network effects + accuracy + safety
- **Forensic Basis:** 91 versions free → zero revenue; freemium proven model

## TG031: Fleet Pricing
- **Category:** Business | **Priority:** P1 | **Effort:** Medium | **Target:** 1.0.96
- **Description:** Tiered pricing for fleet operations

### Pricing Tiers

| Tier | Price | Vehicles | Features | Target |
|------|-------|----------|----------|--------|
| **Individual** | $4.99/mo | 1 | All Pro features | Solo drivers, enthusiasts |
| **Small Fleet** | $3.99/mo/vehicle | 2-50 | All Pro + Fleet Admin | Delivery, rideshare, taxi |
| **Enterprise** | $2.99/mo/vehicle | 50+ | All Pro + Enterprise + API + SLA | Logistics, trucking, transit |

### Fleet Admin Features (Enterprise)
- Bulk provisioning (CSV upload → QR codes)
- Fleet dashboard (real-time map, alerts, analytics)
- Geofence management
- Driver behavior scoring
- API access (REST + WebSocket)
- Custom branding (white-label TGAPP)
- Dedicated support (Slack/email, 4h SLA)
- Data export (BigQuery, CSV, API)

### Revenue Projection (Conservative)

| Month | Individual | Small Fleet | Enterprise | Total MRR |
|-------|------------|-------------|------------|-----------|
| 1 | 50 | 0 | 0 | $250 |
| 3 | 200 | 5 (10 veh) | 0 | $1,200 |
| 6 | 500 | 10 (50 veh) | 1 (100 veh) | $4,500 |
| 12 | 1,000 | 25 (200 veh) | 3 (500 veh) | $15,500 |

**Break-even:** Month 4 (dev cost ~$20k)

## TG032: Referral Program
- **Category:** Business | **Priority:** P2 | **Effort:** Low | **Target:** 1.0.96+
- **Description:** Viral growth via fleet manager referrals
- **Mechanics:**
  - Referrer: 1 free month per referred fleet (min 5 vehicles)
  - Referee: 50% off first month
  - Tracking: Unique referral code in TGAPP → shared via link
  - Attribution: Firebase Dynamic Links + Firestore

### Implementation
```kotlin
// TGAPP - ReferralManager.kt
class ReferralManager @Inject constructor(
    private val api: TgappApi,
    private val prefs: SharedPreferences
) {
    private val referralCode: String by lazy { 
        prefs.getString("referral_code") ?: generateCode() 
    }
    
    fun getReferralLink(): String {
        return "https://tgapp.carrpod.com/join?ref=$referralCode"
    }
    
    fun shareReferral() {
        val intent = Intent(Intent.ACTION_SEND).apply {
            type = "text/plain"
            putExtra(Intent.EXTRA_TEXT, 
                "Join my fleet on BOUNCE! Get 50% off first month: ${getReferralLink()}"
            )
        }
        context.startActivity(Intent.createChooser(intent, "Share via"))
    }
    
    suspend fun claimReferral(code: String): ReferralResult {
        return api.claimReferral(code, getDeviceId())
    }
    
    private fun generateCode(): String {
        val code = "TG${Random.nextInt(10000, 99999)}"
        prefs.edit().putString("referral_code", code).apply()
        return code
    }
}
```

---

## Competitive Positioning

| Solution | Cost/Vehicle/Mo | Hardware | Mesh | Offline | AR | Updates |
|----------|-----------------|----------|------|---------|-----|---------|
| **BOUNCE + TGAPP** | **$2.99-4.99** | **None** | ✅ | ✅ | ✅ | **Hours** |
| Waze for Cities | Free | None | ❌ | ❌ | ❌ | Days |
| Fleet Complete | $25-35 | OBD-II | ❌ | ❌ | ❌ | Weeks |
| Samsara | $30-50 | Gateway | ❌ | ❌ | ❌ | Weeks |
| Custom V2X | $100+ | RSU/OBU | ✅ | N/A | N/A | Months |

**Key Differentiator:** Software-only, commodity Android, rapid updates, mesh network.

---

*End of Piece 11/13 — See Piece 12 for Implementation Roadmap & Technical Debt*