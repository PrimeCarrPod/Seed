# DOC-09: Inert Gas Desaturation & Pre-Breathe Kinetics
## Document 9 of 17 — Pressure Vessels and Human Physiology Deep Research Expansion
## Lines 7801-7900 | Piece 7 of 9 | ~100 Lines

---

#### 9.7 Helium/Oxygen (Heliox) Pre-breathe for Future Suits

**9.7.1 Why Helium? — The Higher Pressure Suit Scenario**

**Future Suit Pressures (from DOC-08):**
- **xEMU Option B:** 34.5 kPa (5.0 psi)
- **Lunar Gateway (55 kPa cabin):** 40–55 kPa suit possible
- **Mars Surface:** 55 kPa suit

**At 40 kPa suit pressure with 100% O₂:**
- $P_{A}O_2 = 40 - 12.9 = 27.1$ kPa (adequate)
- **BUT:** Fire risk increases (2.5–4× sea level)
- **Solution:** **Heliox** (He/O₂ mix) reduces O₂ partial pressure

**Heliox Composition for 40 kPa Suit:**
- Target $P_{A}O_2 = 16.7$ kPa (same as NASA EMU)
- $P_{A}O_2 = F_{I}O_2 (40 - 6.3) - 6.6 = 16.7$
- $F_{I}O_2 \times 33.7 = 23.3$
- $F_{I}O_2 = 0.69$ → **69% O₂ / 31% He**

**9.7.2 Helium Washout Kinetics — The Critical Difference**

**Helium Properties vs. Nitrogen:**
| Property | Nitrogen (N₂) | Helium (He) |
|----------|---------------|-------------|
| **Molecular Weight** | 28 g/mol | 4 g/mol |
| **Diffusion Coefficient (water)** | 1.0× | **2.65×** |
| **Solubility (Ostwald, blood)** | 0.067 | **0.015** (4.5× LESS) |
| **Half-time (same perfusion)** | Baseline | **~0.38×** |

**Half-time Scaling:**
$$t_{1/2,He} \approx t_{1/2,N_2} \cdot \frac{\lambda_{He}}{\lambda_{N_2}} \cdot \frac{D_{N_2}}{D_{He}} \approx t_{1/2,N_2} \times 0.38$$

**Compartment Half-times for Helium:**
| Compartment | $t_{1/2,N_2}$ [min] | $t_{1/2,He}$ [min] |
|-------------|---------------------|-------------------|
| 1 (Blood) | 5 | **1.9** |
| 2 | 10 | **3.8** |
| 3 | 20 | **7.6** |
| 4 | 40 | **15.2** |
| 5 | 80 | **30.4** |
| 6 | 120 | **45.6** |
| 7 | 240 | **91** |
| 8 (Fat) | 480 | **182** |
| 9 (Fat) | 720 | **274** |

**9.7.3 Heliox Pre-breathe Time Calculation**

**Scenario:** Cabin 101.3 kPa air → Suit 40 kPa Heliox (69% O₂ / 31% He)

**Inert Gas in Cabin:** N₂ (78%)
**Inert Gas in Suit:** He (31%) — **NO N₂ in suit!**

**Two-Phase Washout:**
1. **N₂ washout** during pre-breathe (breathing suit gas in cabin)
2. **He on-gassing** during pre-breathe (inspired He → tissue He)

**Pre-breathe Gas:** 69% O₂ / 31% He at 101.3 kPa
- $P_{I}He = 0.31 \times (101.3 - 6.3) = 29.5$ kPa
- $P_{I}N_2 = 0$ (pure heliox)

**N₂ Washout (same as before, but faster due to He-enhanced diffusion?):**
Actually, N₂ washout rate depends on perfusion, not inspired gas.
**But:** He in blood may enhance N₂ diffusion (solvent effect) — minor.

**He On-gassing (The New Constraint):**
$$P_{He,i}(t) = P_{I}He \cdot (1 - e^{-kt}) = 29.5 \cdot (1 - 2^{-t/t_{1/2,He}})$$

**At Suit Pressure (40 kPa):**
- Ambient $P_{He} = 0.31 \times (40 - 6.3) = 10.4$ kPa
- **Supersaturation risk from He on-gassing!**

**Required Pre-breathe Time for He Equilibrium:**
$$t_{90\%,He} = 3.32 \cdot t_{1/2,He}$$

| Comp | $t_{1/2,He}$ [min] | $t_{90\%}$ [min] |
|------|-------------------|------------------|
| 1 | 1.9 | **6** |
| 4 | 15.2 | **50** |
| 6 | 45.6 | **151** |
| 8 (Fat) | 182 | **604** (10 hr) |

**Fat compartments still SLOW for He!** (Lower solubility but still perfusion-limited)

**9.7.4 Optimal Heliox Pre-breathe Protocol (40 kPa Suit)**

**Option A: Full Heliox Pre-breathe (Cabin at 101.3 kPa)**
- Breathe 69/31 Heliox for **4 hours** (same as N₂ protocol)
- He on-gasses in parallel with N₂ washout
- At 4 hours: N₂ ~washed out, He ~80% saturated in fat
- Depressurize to 40 kPa: He supersaturation in fat → **DCS risk!**

**Option B: Staged Protocol (NASA Research)**
1. **2 hours 100% O₂** at 101.3 kPa → N₂ washout (fast compartments)
2. **2 hours Heliox** at 101.3 kPa → He on-gassing begins, N₂ continues
3. **Depressurize to 40 kPa** + 45 min Heliox in suit
4. **Result:** He in fat < critical supersaturation

**Option C: Cabin Pressure Reduction (Gateway 55 kPa)**
- Cabin at 55 kPa, 30% O₂ / 70% N₂
- Pre-breathe 100% O₂ → N₂ washout
- Suit at 40 kPa Heliox → **No pre-breathe needed** (from DOC-08)

**9.7.5 Helium DCS — Different Pathophysiology**

**He Bubbles vs. N₂ Bubbles:**
- **Smaller critical radius** (higher surface tension)
- **Faster growth** (higher diffusion coefficient)
- **But:** Lower solubility → less total gas available

**Clinical Experience (Saturation Diving):**
- Heliox saturation → **shorter decompression** than N₂
- **But:** He DCS has **higher incidence of neurological (Type II) symptoms**
- **Mechanism:** He diffuses into spinal cord faster

**Implication for EVA:** Heliox suits require **conservative He washout protocols** despite faster kinetics.

---

*End of Piece 7 — DOC-09 Lines 7801-7900*
*Next: Piece 8 — Section 9.8 In-Suit Monitoring & Real-Time DCS Risk*