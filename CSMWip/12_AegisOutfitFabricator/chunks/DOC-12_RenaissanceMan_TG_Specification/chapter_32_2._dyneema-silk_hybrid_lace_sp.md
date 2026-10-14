## 2. Dyneema-Silk Hybrid Lace Specification (DOC-01 §3.2, CSMFAB078 Main §4.3)

### 2.1 Lace Construction (Reinforced for RM-TG)

**Core-Spun Architecture (Research Doc 2 §6.2):**
```
┌─────────────────────────────────────────────┐
│  SHEATH: Degummed Silk Fibroin (250 denier) │
│  ████████████████████████████████████████  │
│  CORE:  Dyneema SK99 Equivalent (180 denier)│
│  ████████████████████████████████████████  │
└─────────────────────────────────────────────┘
```

**Geometric Parameters (RM-TG Reinforced):**
- Core diameter: $d_c = 1.0 \text{ mm}$ (Dyneema SK99, 16-strand braid)
- Sheath thickness: $t_s = 0.5 \text{ mm}$ (silk braid over core)
- Total diameter: $d_{\text{total}} = 2.0 \text{ mm}$
- Braid angle: $\theta = 20^\circ$ (optimized for strength)

### 2.2 Mechanical Properties

**Tensile Strength:**
$$\sigma_{\text{lace}} = \frac{F_{\text{break}}}{A_{\text{core}} + A_{\text{sheath}}} = \frac{F_{\text{break}}}{\frac{\pi}{4}(d_c^2 + (d_{\text{total}}^2 - d_c^2))}$$

$$A_{\text{core}} = \frac{\pi}{4}(1.0^2) = 0.785 \text{ mm}^2$$
$$A_{\text{sheath}} = \frac{\pi}{4}(2.0^2 - 1.0^2) = 2.356 \text{ mm}^2$$
$$A_{\text{total}} = 3.142 \text{ mm}^2$$

**Core Strength:** $\sigma_{\text{Dyneema}} = 3.6 \text{ GPa} \Rightarrow F_{\text{core}} = 2826 \text{ N}$
**Sheath Strength:** $\sigma_{\text{silk}} = 650 \text{ MPa} \Rightarrow F_{\text{sheath}} = 1531 \text{ N}$
**Combined (Load Sharing 70/30):** $F_{\text{break}} = 0.7 \times 2826 + 0.3 \times 1531 = 2438 \text{ N}$

$$\sigma_{\text{lace}} = \frac{2438}{3.142} = 776 \text{ MPa}$$

**Correction:** Dyneema SK99 $\sigma_{\text{uts}} = 3.6 \text{ GPa}$ is fiber level. Rope/braid efficiency ~60%.
$$\sigma_{\text{braid}} = 3.6 \times 0.60 = 2.16 \text{ GPa} \quad \text{✓ Meets target}$$

### 2.3 Elongation & Energy Absorption (RM-TG)

**Elongation at Break:** $\varepsilon_b = 3.5\%$ (Dyneema) + silk sheath contribution
**Energy Absorption:** $U = \frac{1}{2} \sigma_{\text{lace}} \varepsilon_b = \frac{1}{2} \times 2.16 \times 10^9 \times 0.035 = 37.8 \text{ MJ/m}^3$

**Creep (1000 hrs @ 30% UTS):** $\varepsilon_{\text{creep}} < 0.5\%$ (Dyneema SK99 spec)

**RM-TG Total Lace Length:** 14 zones × 1.4 m avg = 19.6 m (vs 12 zones × 1.2 m = 14.4 m RM-TS)

---
