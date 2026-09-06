# DOC-09: Inert Gas Desaturation & Pre-Breathe Kinetics
## Document 9 of 17 — Pressure Vessels and Human Physiology Deep Research Expansion
## Lines 7401-7500 | Piece 3 of 9 | ~100 Lines

---

#### 9.3 NASA Pre-breathe Protocols: Standard & Campout

**9.3.1 Standard Protocol (4-hour Pre-breathe)**

**Sequence:**
1. **Cabin at 101.3 kPa (14.7 psi), 21% O₂ / 79% N₂**
2. **Don EMU, purge suit with 100% O₂** (5 min)
3. **Exercise Protocol (4 hours total):**
   - 50 min: Light exercise (cycle ergometer, 50 W)
   - 10 min: Rest
   - 50 min: Light exercise
   - 10 min: Rest
   - 50 min: Light exercise
   - 10 min: Rest
   - 50 min: Light exercise
   - 10 min: Rest
3. **Depressurize airlock to 29.6 kPa (4.3 psi)**
4. **45 min additional 100% O₂ in suit** (before hatch opening)
5. **EVA begins**

**Total Pre-EVA Time:** ~5 hours

**9.3.2 Tissue Nitrogen Evolution — Standard Protocol**

**Phase 1: 4-hr Pre-breathe at 101.3 kPa, 100% O₂**

| Compartment | $t_{1/2}$ [min] | $P_{N_2}(0)$ [kPa] | $P_{N_2}(240 \text{ min})$ [kPa] | % Remaining |
|-------------|-----------------|-------------------|----------------------------------|-------------|
| 1 (Blood) | 5 | 66.1 | 66.1 × 2⁻⁴⁸ = **0.0002** | 0.0003% |
| 2 | 10 | 66.1 | 66.1 × 2⁻²⁴ = **0.004** | 0.006% |
| 3 | 20 | 66.1 | 66.1 × 2⁻¹² = **0.016** | 0.02% |
| 4 | 40 | 66.1 | 66.1 × 2⁻⁶ = **1.03** | 1.6% |
| 5 | 80 | 66.1 | 66.1 × 2⁻³ = **8.26** | 12.5% |
| 6 | 120 | 66.1 | 66.1 × 2⁻² = **16.5** | 25% |
| 7 | 240 | 66.1 | 66.1 × 2⁻¹ = **33.0** | 50% |
| 8 | 480 | 66.1 | 66.1 × 2⁻⁰·⁵ = **46.7** | 71% |
| 9 | 720 | 66.1 | 66.1 × 2⁻⁰·³³ = **52.4** | 79% |

**Phase 2: Depressurization to 29.6 kPa (instantaneous)**

Supersaturation ratios immediately after depressurization:
| Comp | $P_{tiss}$ [kPa] | $P_{amb}$ [kPa] | Ratio | Buhlmann M-value [kPa] | Status |
|------|------------------|-----------------|-------|------------------------|--------|
| 1 | ~0 | 29.6 | 0 | 45 | SAFE |
| 2 | ~0 | 29.6 | 0 | 38 | SAFE |
| 3 | 0.016 | 29.6 | 0.0005 | 32 | SAFE |
| 4 | 1.03 | 29.6 | 0.035 | 28 | SAFE |
| 5 | 8.26 | 29.6 | 0.28 | 24 | SAFE |
| 6 | 16.5 | 29.6 | 0.56 | 21 | SAFE |
| 7 | 33.0 | 29.6 | **1.11** | 18 | **MARGINAL** |
| 8 | 46.7 | 29.6 | **1.58** | 16 | **CRITICAL** |
| 9 | 52.4 | 29.6 | **1.77** | 14 | **CRITICAL** |

**Phase 3: 45-min Suit Pre-breathe at 29.6 kPa, 100% O₂**

Additional washout during 45 min:
$$P_{N_2,i}(45) = P_{N_2,i}(240) \cdot 2^{-45 / t_{1/2,i}}$$

| Comp | $P_{N_2}(240)$ | $P_{N_2}(285)$ | Ratio at 29.6 kPa | Status |
|------|----------------|----------------|-------------------|--------|
| 7 (240 min) | 33.0 | 33.0 × 2⁻⁰·¹⁸⁷⁵ = **29.2** | 0.99 | SAFE |
| 8 (480 min) | 46.7 | 46.7 × 2⁻⁰·⁰⁹³⁷⁵ = **43.7** | **1.48** | MARGINAL |
| 9 (720 min) | 52.4 | 52.4 × 2⁻⁰·⁰⁶²⁵ = **50.1** | **1.69** | MARGINAL |

**Result:** Slow compartments (8, 9) still slightly supersaturated but **within probabilistic DCS < 1%** (VVAL-18M model accounts for perfusion changes during EVA).

**9.3.3 Campout Protocol (24-hour at 10.2 psi / 70.3 kPa)**

**Sequence:**
1. **Night before EVA:** Cabin depressurized to **70.3 kPa (10.2 psi)**, 26.5% O₂ / 73.5% N₂
2. **Sleep 8 hours** at 70.3 kPa (reduces N₂ loading)
3. **Morning:** 60 min 100% O₂ at 70.3 kPa
4. **Don EMU, depress airlock to 29.6 kPa**
5. **45 min suit 100% O₂**
6. **EVA begins**

**Total Pre-EVA Time:** ~10 hours (but overnight)

**9.3.4 Campout Tissue Nitrogen Analysis**

**Phase 1: 8-hr Sleep at 70.3 kPa, 26.5% O₂**
$P_{I}N_2 = 0.735 \times (70.3 - 6.3) = 47.0$ kPa
$P_{A}N_2 \approx 47.0 - 8 = 39.0$ kPa

Tissues **on-gas** toward 39.0 kPa (from 66.1 kPa):
$$P_{N_2,i}(480) = 39.0 + (66.1 - 39.0) \cdot 2^{-480 / t_{1/2,i}}$$

| Comp | $P_{N_2}(480)$ [kPa] | % of Sea-Level |
|------|---------------------|----------------|
| 1 | ~39.0 | 59% |
| 4 (40 min) | 39.0 + 27.1×2⁻¹² = **39.0** | 59% |
| 5 (80 min) | 39.0 + 27.1×2⁻⁶ = **39.4** | 60% |
| 6 (120 min) | 39.0 + 27.1×2⁻⁴ = **40.7** | 62% |
| 7 (240 min) | 39.0 + 27.1×2⁻² = **45.8** | 69% |
| 8 (480 min) | 39.0 + 27.1×2⁻¹ = **52.5** | 79% |
| 9 (720 min) | 39.0 + 27.1×2⁻⁰·⁶⁷ = **55.8** | 84% |

**Phase 2: 60-min 100% O₂ at 70.3 kPa**
Washout from 39.0 kPa ambient:
$$P_{N_2,i}(540) = P_{N_2,i}(480) \cdot 2^{-60 / t_{1/2,i}}$$

**Phase 3: Depress to 29.6 kPa + 45 min suit O₂**
Similar to standard protocol but starting from lower tissue tensions.

**Result:** **Lower DCS risk than standard protocol** for slow compartments.
**Trade:** Requires overnight cabin depressurization (affects other crew, systems).

---

*End of Piece 3 — DOC-09 Lines 7401-7500*
*Next: Piece 4 — Section 9.4 Roscosmos 30-Minute Protocol Analysis*