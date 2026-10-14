## 4. Farthingale Hoop Architecture (DRAFT-04 §3.1-3.3, SYNTH-01 §4.4)

### 4.1 Whalebone/Steel Hybrid Hoop Design (Reduced Diameter)

**Hoop Configuration (4 hoops, graduated diameter):**

| Hoop # | Diameter (cm) | Material | Wire/Whalebone Ø | Function |
|--------|---------------|----------|------------------|----------|
| 1 (Waist) | 19.1 | Steel wire | 4 mm | Waistband anchor |
| 2 (Upper Hip) | 24.8 | Whalebone | 10 mm | Volume start |
| 3 (Mid Hip) | 28.5 | Whalebone | 12 mm | Max volume |
| 4 (Hem) | 26.0 | Steel wire | 4 mm | Hem weight |

**Collapsible Mechanism:** Nested telescoping with spring clips (DRAFT-04 §3.2)
**Deployment Time:** <10 s (magnetic rail assist)
**Total Farthingale Mass:** 0.38 kg

### 4.2 Hoop Stress Analysis

**Circumferential Stress (Waist Hoop):**
$$\sigma_\theta = \frac{P \times r}{t} = \frac{50 \text{ N} \times 0.0955}{0.004} = \textbf{1.19 MPa}$$

Where $P$ = LES Z5 tension (50 N), $r$ = 9.55 cm, $t$ = 4 mm (steel wire)
**Yield Strength (Steel):** 1,200 MPa → **Safety Factor: 1,008** ✅

**Bending Moment (Whalebone Hoops):**
$$M = \frac{w L^2}{8} = \frac{1.8 \times (0.3)^2}{8} = 0.020 \text{ Nm}$$
Where $w$ = distributed load (fabric weight), $L$ = hoop span

---
