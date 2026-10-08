# TGAPP_Monetization_Architecture — Piece 05/13
## Article A8: A8-08 — TGAPP Monetization Architecture
**Piece:** 05 of 13  
**Generated:** 2026-10-08 06:55:00 UTC

---

# Premium Features — Offline, Theme, Export (TG017-TG018, TG011 revisited)

## TG017: Offline Map Cache
- **Category:** Premium Features | **Priority:** P2 | **Effort:** Medium | **Target:** 1.0.96
- **Description:** Cache Mapbox/OSM vector tiles for offline use (FP008)
- **Implementation:**
  - Mapbox Maps SDK offline manager (or OSM + MapLibre)
  - Automatic tile download on Wi-Fi (user-defined regions)
  - LRU cache with 500MB default limit (configurable)
  - Tile expiry: 30 days (refresh on Wi-Fi)
- **Use Case:** Tunnels, parking garages, rural areas, international roaming
- **Gating:** `FeatureGate.isEnabled("offline_maps")`
- **Storage:** Encrypted file system (SQLCipher or EncryptedFile)

## TG018: Night/Day Auto Theme
- **Category:** Premium Features | **Priority:** P2 | **Effort:** Low | **Target:** 1.0.94
- **Description:** Auto-switch theme by time/ambient sensor (FP011)
- **Implementation:**
```css
/* bounce.html - CSS Custom Properties (Premium) */
:root {
  --bg-primary: #0a0a0f;
  --bg-secondary: #12121a;
  --text-primary: #e8e8f0;
  --accent: #00d4aa;
  --hazard: #ff4444;
  --vehicle: #4488ff;
  --trail: #00d4aa;
}

[data-theme="day"] {
  --bg-primary: #f8f8fc;
  --bg-secondary: #ffffff;
  --text-primary: #1a1a2e;
  --accent: #008866;
  --hazard: #cc0000;
  --vehicle: #0044cc;
  --trail: #008866;
}
```
```javascript
// Auto-switch logic (Premium)
function updateTheme() {
  if (!featureGate.isEnabled("theme_auto")) return;
  
  const hour = new Date().getHours();
  const isDay = hour >= 6 && hour < 20;
  // Or use AmbientLightSensor API if available
  document.documentElement.dataset.theme = isDay ? 'day' : 'night';
}
```
- **Gating:** `FeatureGate.isEnabled("theme_auto")` (free gets manual toggle only)

## TG011 Revisited: Weather Advisory Relay (Premium)
- **Category:** Premium Features | **Priority:** P1 | **Effort:** High | **Target:** 1.0.96
- **Note:** Already covered in Piece 03, but premium gating adds:
  - Higher relay priority (premium messages first)
  - Extended TTL (5 hops vs 3 for free)
  - Historical weather replay (24h buffer)
  - Fleet-specific weather channels

---

## Free vs Premium Feature Matrix

| Feature | Free (Bounce) | Premium (TGAPP) |
|---------|---------------|-----------------|
| Core Positioning (6 algos) | ✅ | ✅ |
| Basic Visualization | ✅ | ✅ |
| Trail Recording | ✅ | ✅ |
| Manual Theme Toggle | ✅ | ✅ |
| GPX/KML Export | ❌ | ✅ (TG016) |
| Voice Alerts | ❌ | ✅ (TG015) |
| Offline Maps | ❌ | ✅ (TG017) |
| Auto Theme | ❌ | ✅ (TG018) |
| Mesh Network (Basic) | ✅ (1 hop) | ✅ (3 hops) |
| Fleet Mesh | ❌ | ✅ (TG009) |
| Traffic Relay | ❌ | ✅ (TG010) |
| Weather Relay | ❌ | ✅ (TG011) |
| Trajectory Sharing | ❌ | ✅ (TG012) |
| RTT/UWB Positioning | ❌ | ✅ (TG013) |
| AR Overlay | ❌ | ✅ (TG014) |
| Priority Updates | ❌ | ✅ (TG007) |
| Fleet Keys | ❌ | ✅ (TG022) |

---

## Forensic Validation: Why This Split?

**Free Version Must:**
- Work standalone (no TGAPP required)
- Provide genuine value (positioning + visualization)
- Be open-source friendly (GPL compatible)

**Premium Version Adds:**
- Network effects (mesh, fleet, traffic)
- Accuracy breakthroughs (RTT, UWB)
- Safety features (voice, AR, trajectory)
- Convenience (offline, auto-theme, export)
- Business features (fleet management, priority updates)

---

*End of Piece 05/13 — See Piece 06 for Architecture: Shared Library & API Interface*