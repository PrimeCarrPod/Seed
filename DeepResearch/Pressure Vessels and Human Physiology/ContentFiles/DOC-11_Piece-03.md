# DOC-11: Saturation Diving Decompression Kinetics
## Document 11 of 17 — Pressure Vessels and Human Physiology Deep Research Expansion
## Lines 9201-9300 | Piece 3 of 9 | ~100 Lines

---

#### 11.3 US Navy Decompression Schedules (6/5/4/3 fsw/hr)

**11.3.1 The Standard Ascent Rate Schedule**

**US Navy Saturation Decompression (Heliox/Trimix):**

| Depth Segment [fsw] | Depth Segment [msw] | Ascent Rate [fsw/hr] | Ascent Rate [msw/hr] | Time per 100 fsw [hr] |
|---------------------|---------------------|----------------------|----------------------|----------------------|
| **1,600 – 200** | 487 – 61 | **6** | 1.8 | 16.7 |
| **200 – 100** | 61 – 30.5 | **5** | 1.5 | 20.0 |
| **100 – 50** | 30.5 – 15 | **4** | 1.2 | 12.5 |
| **50 – 0** | 15 – 0 | **3** | 0.91 | 16.7 |

**Total Ascent Time (from 1,600 fsw):**
$$\frac{1,400}{6} + \frac{100}{5} + \frac{50}{4} + \frac{50}{3} = 233 + 20 + 12.5 + 16.7 = \mathbf{282 \text{ hours}} \quad (11.8 \text{ days})$$

**From 200 fsw (61 msw):**
$$\frac{100}{5} + \frac{50}{4} + \frac{50}{3} = 20 + 12.5 + 16.7 = \mathbf{49 \text{ hours}} \quad (2 \text{ days})$$

**From 100 fsw (30.5 msw):**
$$\frac{50}{4} + \frac{50}{3} = 12.5 + 16.7 = \mathbf{29 \text{ hours}}$$

**11.3.2 Why These Specific Rates? — The Physiological Basis**

**Critical Compartment Analysis:**

| Depth Zone | Limiting Compartment | Reason |
|------------|---------------------|--------|
| **Deep (1,600–200 fsw)** | Fast He compartments (1–3) | He washout limited by M-value gradient |
| **Mid (200–100 fsw)** | Medium He/N₂ (4–6) | Transition zone, both gases matter |
| **Shallow (100–50 fsw)** | Slow N₂ compartments (7–9) | N₂ washout becomes critical |
| **Very Shallow (50–0 fsw)** | Fat (N₂) | Slowest N₂ washout, highest supersaturation |

**Ascent Rate Derivation (Simplified):**

Maximum safe ascent rate when fastest compartment at M-value:
$$\frac{dP_{amb}}{dt} = \frac{M_0 + \Delta M \cdot P_{amb} - P_{tiss}}{\Delta M \cdot \frac{dP_{amb}}{dt} \cdot \Delta t + \frac{P_{tiss} - P_{I}}{t_{1/2}} \cdot \Delta t} \quad \text{(iterative)}$$

**At Deep Depths (He-dominated):**
- $P_{He,tiss} \approx P_{amb} \cdot F_{He}$
- $M_{He} = M_{0,He} + \Delta M_{He} \cdot P_{amb}$
- **Margin:** $M_{He} - P_{He,tiss} \approx M_{0,He} + (\Delta M_{He} - F_{He}) P_{amb}$
- For $F_{He} \approx 0.98$, $\Delta M_{He} \approx 1.2$: Margin increases with depth!
- **Faster ascent allowed deep** (6 fsw/hr)

**At Shallow Depths (N₂-dominated):**
- $P_{N_2,tiss}$ lags $P_{amb}$ (slow washout)
- $M_{N_2} = M_{0,N_2} + \Delta M_{N_2} \cdot P_{amb}$
- **Margin decreases** as $P_{amb}$ drops
- **Slower ascent required** (3 fsw/hr)

**11.3.3 Schedule Validation — 300 msw (1,000 fsw) Example**

**Storage Depth:** 300 msw = 1,000 fsw (31 bar)
**Gas:** Trimix (He/O₂/N₂, 0.45 bar O₂, 1.0 bar N₂)

| Phase | Depth [fsw] | Rate [fsw/hr] | Duration [hr] | Cumulative [hr] |
|-------|-------------|---------------|---------------|-----------------|
| **Compression** | 0 → 1,000 | 60 fsw/hr (max) | 16.7 | 16.7 |
| **Storage** | 1,000 | — | 30 days | 720+ |
| **Decompression Start** | 1,000 | — | — | — |
| **Segment 1** | 1,000 → 200 | 6 | 133.3 | 133.3 |
| **Segment 2** | 200 → 100 | 5 | 20 | 153.3 |
| **Segment 3** | 100 → 50 | 4 | 12.5 | 165.8 |
| **Segment 4** | 50 → 0 | 3 | 16.7 | **182.5** |

**Total Decompression: 182.5 hours = 7.6 days**

**With 16/24-hr Day (see Section 11.4):**
$$\frac{182.5}{16} = 11.4 \text{ decompression days} \rightarrow \mathbf{12 \text{ calendar days}}$$

---

*End of Piece 3 — DOC-11 Lines 9201-9300*
*Next: Piece 4 — Section 11.4 The 16/24-Hour Decompression Day*