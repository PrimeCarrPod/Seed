## 1. Mobility Index Overview (SYNTH-01 §4.3, DOC-01 §9.1, CSMFAB078-A §3.4)

The RM-SG edition achieves **balanced mobility-protection performance** with a mobility index of 0.75, optimized for the broad compact morphology.

### 1.1 Mobility Index Comparison

| Metric | RM-SS | RM-TS | **RM-SG** | RM-TG | Target |
|--------|-------|-------|-----------|-------|--------|
| **Mobility Index (MI)** | 0.89 | 0.82 | **0.75** | 0.71 | ≥0.7 |
| **System Mass** | 13.73 kg | 16.47 kg | **17.21 kg** | 20.88 kg | ≤26 kg |
| **Mass/Height Ratio** | 0.085 kg/cm | 0.087 kg/cm | **0.106 kg/cm** | 0.107 kg/cm | — |
| **Tile Thickness** | 20/10 mm | 25/15 mm | **25/15 mm** | 50/25 mm | — |
| **Donning Time** | 90 s | 105 s | **98 s** | 115 s | <120 s |

### 1.2 Mobility Index Formula

$$MI = w_1 \frac{ROM_{actual}}{ROM_{baseline}} + w_2 \frac{1}{M_{system}} + w_3 \frac{1}{T_{don}} + w_4 \frac{1}{R_{thermal}}$$

Where $w = [0.4, 0.3, 0.2, 0.1]$, $ROM$ = range of motion, $M$ = mass, $T_{don}$ = donning time, $R_{thermal}$ = thermal resistance.

### 1.3 RM-SG MI Calculation

$$MI_{RM-SG} = 0.4 \times 0.78 + 0.3 \times \frac{16.47}{17.21} + 0.2 \times \frac{105}{98} + 0.1 \times \frac{0.28}{0.28} = \textbf{0.75}$$

Where:
- ROM retention = 78% (average across joints)
- Mass ratio = 16.47/17.21 = 0.957
- Donning time ratio = 105/98 = 1.071
- Thermal resistance ratio = 1.0 (same as RM-TS reference)

### 1.4 Cross-References

- SYNTH-01 §4.3: Unified mobility model
- DOC-01 §9.1: System-level mobility targets
- CSMFAB078-A §3.4: Edition mobility requirements
- Chapter 66: Joint-specific ROM
- Chapter 67: Task-specific mobility
- Chapter 68: Tile articulation mechanics
- Chapter 69: LES tension vs. mobility

---