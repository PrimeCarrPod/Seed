|--------|--------|---------------|---------------------|
| **System Mass** | ≤26 kg (RM), ≤24 kg (RW) | Gravimetric | Weigh complete ensemble |
| **Thermal Protection** | Interior <60°C @ 1100°C/300s | ASTM F1291, ISO 17493 | Instrumented manikin |
| **Ballistic Resistance** | NIJ IV (.30-06 APM2, 878 m/s) | NIJ STD-0101.06 | V₅₀ ≥ 930 m/s |
| **EMI Shielding** | >60 dB @ 1 GHz, >40 dB @ 10 GHz | MIL-STD-461G, IEC 61000-4-9 | TEM cell / reverberation chamber |
| **Directed Energy** | ΔT ≤14°C vs black body (MW/laser) | MIL-STD-461G, custom | CW laser 10.6 μm, 5 kW/m² |
| **Force Trauma** | ≥65% peak force reduction @ 50J | ASTM F2371, ISO 15858 | Instrumented impactor |
| **Bio-Acoustic SNR** | >20 dB @ 1-50 Hz (heartbeat/respiration) | CSMFAB011 | PVDF-TrFE array correlation |
| **Schumann Attenuation** | >30 dB @ 7.83 Hz | Custom protocol | Coil excitation + interior probe |
| **Mobility Index** | ≥0.7 (normalized ROM) | ISO 15858 | Motion capture + joint angle analysis |
| **Donning Time** | <120 seconds (trained) | Operational protocol | Stopwatch, 3 trials |
| **Edition Transition** | <90 seconds | Operational protocol | LES re-tension + panel swap |

---

## 5. Fabricator Chain Overview

### 5.1 Device Topology

```
┌─────────────────────────────────────────────────────────────────────┐
│                    AEGIS OUTFIT FABRICATOR CHAIN                    │
├─────────────────────────────────────────────────────────────────────┤
│                                                                     │
│  SILK FARM          METALLIC THREAD MILL      CERAMIC MICRO-FAB    │
│  (Bombyx mori)      (Au-Hg/Ag gilding)       (Flash sinter)        │
│       │                     │                        │              │
│       └─────────┬───────────┴───────────┬──────────┘              │
│                 ▼                       ▼                         │
│        ┌─────────────────────────────────────────┐               │
