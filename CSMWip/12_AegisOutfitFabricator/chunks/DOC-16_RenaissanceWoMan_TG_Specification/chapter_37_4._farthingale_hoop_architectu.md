## 4. Farthingale Hoop Architecture (DRAFT-04 §3.1-3.3, SYNTH-01 §4.4)

### 4.1 Whalebone/Steel Hybrid Hoop Design

**Hoop Configuration (6 hoops, graduated diameter):**

| Hoop # | Diameter (cm) | Material | Wire/Whalebone Ø | Function |
|--------|---------------|----------|------------------|----------|
| 1 (Waist) | 31.8 | Steel wire | 5 mm | Waistband anchor |
| 2 (Upper Hip) | 42.5 | Whalebone | 12 mm | Volume start |
| 3 (Mid Hip) | 50.2 | Whalebone | 14 mm | Max volume |
| 4 (Lower Hip) | 54.8 | Whalebone | 12 mm | Volume taper |
| 5 (Knee) | 52.0 | Whalebone | 10 mm | Knee clearance |
| 6 (Hem) | 45.0 | Steel wire | 4 mm | Hem weight |

**Collapsible Mechanism:** Nested telescoping with spring clips (DRAFT-04 §3.2)
**Deployment Time:** <15 s (magnetic rail assist)
**Total Farthingale Mass:** 0.92 kg

### 4.2 Hoop Stress Analysis

**Circumferential Stress (Waist Hoop):**
$$\sigma_\theta = \frac{P \times r}{t} = \frac{75 \text{ N} \times 0.159}{0.005} = \textbf{2.39 MPa}$$

Where $P$ = LES Z5 tension (75 N), $r$ = 15.9 cm, $t$ = 5 mm (steel wire)
**Yield Strength (Steel):** 1,200 MPa → **Safety Factor: 502** ✅

**Bending Moment (Whalebone Hoops):**
$$M = \frac{w L^2}{8} = \frac{2.5 \times (0.5)^2}{8} = 0.078 \text{ Nm}$$
Where $w$ = distributed load (fabric weight), $L$ = hoop span

---
