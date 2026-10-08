# Master_Index_Cross_Reference_Complete — Piece 07/13
## Article A13: A13-13 — Master Index Cross Reference Complete
**Piece:** 07 of 13  
**Generated:** 2026-10-08 22:46:20 UTC

---

## ERROR → FIX TRACEABILITY

| Error (Sec 6) | Root Cause | Fix Applied | Fix Version | Best Practice (Sec 5) | Anti-Pattern (Sec 5) |
|---------------|------------|-------------|-------------|----------------------|---------------------|
| E001 JAVA_HOME | Sandbox reset | Export in every session | 1.0.0 | — | — |
| E002 sdkmanager not found | cmdline-tools path | mv to latest/ | 1.0.0 | — | — |
| E003 License EPIPE | yes pipe | printf or license hash | 1.0.0 | — | — |
| E007 Theme crash | Missing AppCompat | Use @android:style/Theme | 1.0.85 | — | — |
| E009 Wi-Fi no results | API33 perms | NEARBY_WIFI_DEVICES + flag | 1.0.85 | BP006 | CP004 |
| E010 BT scan dies | Android kills scan | 5s restart cycle | 1.0.65 | BP008 | CP005 |
| E011 EKF vy bug | Copy-paste typo | x[3]=0 for vy | 1.0.92 | — | CP008 |
| E012 OOM WebGL | Three.js not disposed | geometry.dispose() | 1.0.54 | BP016 | CP009 |
| E013 Noisy trail | GPS zero-fix | Speed > 1mph threshold | 1.0.56 | BP010 | CP010 |
| E016 JS silent failures | No try/catch | HTML try/catch wrapper | 1.0.52 | BP015 | CP012 |
| E017 SSID drift | Accumulating delays | Fixed 5.1s cycle | 1.0.20 | BP012 | — |
| E018 WFD fails | Single method | Multi-method fallback | 1.0.14 | BP011 | CP007 |
| E020 Azimuth wrap | 359→0 jump | Wrap handling | 1.0.25 | BP007 | — |

