# TGAPP_Monetization_Architecture — Piece 04/13
## Article A8: A8-08 — TGAPP Monetization Architecture
**Piece:** 04 of 13  
**Generated:** 2026-10-08 06:55:00 UTC

---

# Premium Features — Advanced Positioning & AR (TG013-TG016)

## TG013: Advanced Positioning Suite
- **Category:** Premium Features | **Priority:** P1 | **Effort:** High | **Target:** 1.0.95
- **Description:** RTT + UWB + Particle Filter adaptive learning (FP001-FP003)
- **Components:**
  - **RTT Ranging (802.11mc):** Sub-meter indoor accuracy (API 28+)
  - **UWB Ranging (FiRa):** cm-level precision (API 29+, hardware required)
  - **Particle Filter Param Learning:** Adaptive RSSI mean/variance/pathloss per AP
- **Gating:** All three require `FeatureGate.isEnabled("positioning_advanced")`
- **Forensic Basis:** RSSI-only ceiling at ~3m (v1.0.91); RTT/UWB break ceiling

## TG014: AR Overlay (ARCore)
- **Category:** Premium Features | **Priority:** P2 | **Effort:** High | **Target:** 1.0.97+
- **Description:** Camera feed + 3D annotations for immersive hazard/navigation view
- **Dependencies:** ARCore, camera permission, ARCore-certified device
- **Features:**
  - Hazard markers in world space (anchored to GPS+VPS)
  - Vehicle trajectory prediction lines
  - Lane-level navigation arrows
  - Night mode with IR camera support
- **Performance Target:** 30fps on mid-range; <500MB RAM
- **Gating:** `FeatureGate.isEnabled("ar_overlay")`

## TG015: Voice Announcements (TTS)
- **Category:** Premium Features | **Priority:** P1 | **Effort:** Low | **Target:** 1.0.95
- **Description:** Text-to-Speech for hands-free hazard alerts (FP010)
- **Implementation:**
```kotlin
// Bounce - VoiceService.kt (premium only)
class VoiceService @Inject constructor(
    private val featureGate: FeatureGate
) {
    private val tts = TextToSpeech(context) { status ->
        if (status == TextToSpeech.SUCCESS) {
            tts.setLanguage(Locale.US)
            tts.setSpeechRate(1.0f)
        }
    }
    
    fun announce(hazard: Hazard) {
        if (!featureGate.isEnabled("voice_alerts")) return
        
        val text = when (hazard.type) {
            HazardType.VEHICLE -> "Vehicle approaching from ${hazard.bearing} degrees"
            HazardType.CONGESTION -> "Congestion ahead, ${hazard.distance} meters"
            HazardType.WEATHER -> "Weather alert: ${hazard.description}"
        }
        tts.speak(text, TextToSpeech.QUEUE_FLUSH, null, "hazard_${hazard.id}")
    }
}
```
- **Gating:** `FeatureGate.isEnabled("voice_alerts")`

## TG016: Export GPX/KML
- **Category:** Premium Features | **Priority:** P2 | **Effort:** Low | **Target:** 1.0.94
- **Description:** Standard mapping formats for post-drive analysis (FP012)
- **Formats:**
  - **GPX 1.1:** Tracks with extensions for accuracy, algorithm, speed
  - **KML 2.2:** Styled for Google Earth (color by algorithm, altitude by accuracy)
- **Forensic Value:** Enables post-drive analysis of positioning quality
- **Gating:** `FeatureGate.isEnabled("gpx_export")`

---

## Positioning Accuracy Comparison (Forensic Data)

| Algorithm | v1.0.91 Accuracy | Premium Enhancement | Target Accuracy |
|-----------|------------------|---------------------|-----------------|
| RSSI Trilateration | ~3m | — | 3m |
| Kalman Filter | ~2.5m | Adaptive params (FP003) | 1.5m |
| Particle Filter | ~2m | Learned params (FP003) | 1m |
| EKF | ~2m | Fixed vy bug (FP026) | 1.5m |
| **RTT (802.11mc)** | N/A | **TG013 Premium** | **<1m** |
| **UWB (FiRa)** | N/A | **TG013 Premium** | **<0.1m** |
| BT 3D Spatial | ~1.5m | Azimuth/elevation | 1m |

**Key Insight:** Premium positioning breaks the RSSI accuracy ceiling that free version hits.

---

*End of Piece 04/13 — See Piece 05 for Offline Maps, Theme, Export Features*