# DOC-11: Saturation Diving Decompression Kinetics
## Document 11 of 17 — Pressure Vessels and Human Physiology Deep Research Expansion
## Lines 9101-9200 | Piece 2 of 9 | ~100 Lines

---

#### 11.2 Multi-Compartment Helium/Nitrogen Kinetics

**11.2.1 Helium vs. Nitrogen Half-times — The Diffusion Ratio**

**Graham's Law of Diffusion:**
$$\frac{D_{He}}{D_{N_2}} = \sqrt{\frac{M_{N_2}}{M_{He}}} = \sqrt{\frac{28}{4}} = \sqrt{7} = \mathbf{2.65}$$

**Tissue Half-time Ratio:**
$$\frac{t_{1/2,N_2}}{t_{1/2,He}} \approx \frac{D_{He}}{D_{N_2}} \times \frac{\lambda_{N_2}}{\lambda_{He}}$$

**Solubility Ratio (Ostwald, blood):**
$$\frac{\lambda_{N_2}}{\lambda_{He}} = \frac{0.067}{0.015} = 4.47$$

**Predicted Half-time Ratio:**
$$\frac{t_{1/2,N_2}}{t_{1/2,He}} \approx 2.65 \times 4.47 = 11.8$$

**Actual Measured Ratios (Tissue-Dependent):**
| Tissue | $t_{1/2,N_2}$ [min] | $t_{1/2,He}$ [min] | Ratio |
|--------|---------------------|-------------------|-------|
| **Blood** | 5 | 1.5 | **3.3** |
| **Brain** | 10 | 3.0 | **3.3** |
| **Muscle (fast)** | 40 | 12 | **3.3** |
| **Muscle (slow)** | 120 | 36 | **3.3** |
| **Fat** | 720 | 240 | **3.0** |

**Key Insight:** **Ratio ~3.3, not 11.8** — perfusion-limited, not diffusion-limited!
Blood flow (perfusion) is the rate-limiting step, not gas diffusion.

**11.2.2 Saturation Decompression — Dual Gas Kinetics (Trimix)**

**During Decompression on Trimix:**
- **Helium washes out fast** (3× faster than N₂)
- **Nitrogen washes out slow** — becomes limiting factor

**Tissue Tensions at Start of Decompression (300 msw Trimix):**
| Comp | $t_{1/2,He}$ [min] | $P_{He,sat}$ [bar] | $t_{1/2,N_2}$ [min] | $P_{N_2,sat}$ [bar] |
|------|-------------------|-------------------|---------------------|---------------------|
| 1 | 1.5 | 29.5 | 5 | 1.0 |
| 2 | 3.0 | 29.5 | 10 | 1.0 |
| 3 | 7.0 | 29.5 | 20 | 1.0 |
| 4 | 15 | 29.5 | 40 | 1.0 |
| 5 | 35 | 29.5 | 80 | 1.0 |
| 6 | 75 | 29.5 | 120 | 1.0 |
| 7 | 150 | 29.5 | 240 | 1.0 |
| 8 | 300 | 29.5 | 480 | 1.0 |
| 9 | 500 | 29.5 | 720 | 1.0 |

**During Decompression (Heliox → Trimix switch at ~120 msw):**
- **Above 120 msw:** Pure heliox → He washout only
- **Below 120 msw:** Trimix → He washout + N₂ on-gassing (counterbalance)

**11.2.3 US Navy Saturation Decompression Model (VVAL-18M Adapted)**

**Compartment Structure (9 compartments for He, 9 for N₂):**
| Comp | $t_{1/2,He}$ [min] | $t_{1/2,N_2}$ [min] | $M_{0,He}$ [fsw] | $\Delta M_{He}$ | $M_{0,N_2}$ [fsw] | $\Delta M_{N_2}$ |
|------|-------------------|---------------------|------------------|----------------|-------------------|-----------------|
| 1 | 1.5 | 5 | 50 | 1.5 | 80 | 1.2 |
| 2 | 3.0 | 10 | 45 | 1.4 | 70 | 1.1 |
| 3 | 7.0 | 20 | 40 | 1.3 | 60 | 1.0 |
| 4 | 15 | 40 | 35 | 1.2 | 50 | 0.9 |
| 5 | 35 | 80 | 30 | 1.1 | 42 | 0.8 |
| 6 | 75 | 120 | 26 | 1.0 | 36 | 0.7 |
| 7 | 150 | 240 | 22 | 0.9 | 30 | 0.6 |
| 8 | 300 | 480 | 19 | 0.8 | 25 | 0.5 |
| 9 | 500 | 720 | 16 | 0.7 | 20 | 0.4 |

**M-value (Allowed Tissue Pressure):**
$$M = M_0 + \Delta M \cdot P_{amb} \quad \text{(in fsw)}$$

**Decompression Criterion:**
$$P_{tiss,He} + P_{tiss,N_2} \leq M_{He} + M_{N_2} \quad \text{(combined gas criterion)}$$

**11.2.4 Decompression Algorithm (Stepwise Integration)**

**Time Step:** $\Delta t = 1$ minute (or adaptive)

**For Each Compartment $i$:**
1. **Calculate Inspired Pressures:**
   $$P_{I,He} = F_{He} \cdot (P_{amb} - 0.0627) \quad \text{(62.7 mbar = 47 mmHg H₂O)}$$
   $$P_{I,N_2} = F_{N_2} \cdot (P_{amb} - 0.0627)$$

2. **Update Tissue Tensions:**
   $$P_{He,i}(t+\Delta t) = P_{He,i}(t) + (P_{I,He} - P_{He,i}(t)) \cdot (1 - 2^{-\Delta t / t_{1/2,He,i}})$$
   $$P_{N_2,i}(t+\Delta t) = P_{N_2,i}(t) + (P_{I,N_2} - P_{N_2,i}(t)) \cdot (1 - 2^{-\Delta t / t_{1/2,N_2,i}})$$

3. **Check M-value Limit:**
   $$P_{He,i} + P_{N_2,i} \leq M_{He,i}(P_{amb}) + M_{N_2,i}(P_{amb})$$

4. **If Limit Exceeded:** Reduce ascent rate or insert stop

**This is the CORE ALGORITHM used in US Navy saturation decompression computers.**

---

*End of Piece 2 — DOC-11 Lines 9101-9200*
*Next: Piece 3 — Section 11.3 US Navy Decompression Schedules (6/5/4/3 fsw/hr)*