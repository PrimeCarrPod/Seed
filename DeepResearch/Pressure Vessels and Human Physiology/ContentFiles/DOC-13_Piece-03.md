# DOC-13: HPNS & Trimix Countermeasures
## Document 13 of 17 — Pressure Vessels and Human Physiology Deep Research Expansion
## Lines 11001-11100 | Piece 3 of 9 | ~100 Lines

---

#### 13.3 Optimal Trimix Formulation Across Depth

**13.3.1 The Bilayer Balance Equation**

**Goal:** Zero net bilayer area change ($\Delta A/A_0 = 0$)
$$\Delta A_{He} + \Delta A_{N_2} = 0$$

**From MD Data (DOC-12, DOC-13 §13.2):**
- He effect: $\frac{\Delta A}{A_0} \approx -0.02 \cdot \frac{P_{He}}{100 \text{ bar}}$ (linear approx)
- N₂ effect: $\frac{\Delta A}{A_0} \approx +0.18 \cdot \frac{P_{N_2}}{100 \text{ bar}}$ (linear approx)

**Balance Condition:**
$$-0.02 \cdot \frac{P_{He}}{100} + 0.18 \cdot \frac{P_{N_2}}{100} = 0$$
$$0.18 \cdot P_{N_2} = 0.02 \cdot P_{He}$$
$$\frac{P_{N_2}}{P_{He}} = \frac{0.02}{0.18} = \frac{1}{9}$$

**Optimal Molar Ratio:**
$$\frac{F_{N_2}}{F_{He}} = \frac{1}{9} \quad \Rightarrow \quad F_{N_2} : F_{He} = 1 : 9$$

**13.3.2 Optimal Trimix vs. Depth**

**Constraints:**
1. $F_{He} + F_{N_2} + F_{O_2} = 1$
2. $P_{O_2} = F_{O_2} \cdot P_{total} = 0.4\text{–}0.5 \text{ bar}$ (normoxic)
3. $F_{N_2} / F_{He} = 1/9$ (bilayer balance)

**Solution at Depth $D$ (msw), $P_{total} = (D/10 + 1)$ bar:**

$$F_{O_2} = \frac{0.45}{P_{total}}$$
$$F_{He} + F_{N_2} = 1 - F_{O_2}$$
$$F_{N_2} = \frac{1}{10} (1 - F_{O_2})$$
$$F_{He} = \frac{9}{10} (1 - F_{O_2})$$

**Optimal Trimix Table:**

| Depth [msw] | $P_{total}$ [bar] | $F_{O_2}$ | $F_{N_2}$ | $F_{He}$ | Mix Name |
|-------------|-------------------|-----------|-----------|----------|----------|
| **120** | 13 | 0.035 | 0.096 | 0.869 | **Trimix 10/87** |
| **150** | 16 | 0.028 | 0.097 | 0.875 | **Trimix 10/87** |
| **200** | 21 | 0.021 | 0.098 | 0.881 | **Trimix 10/88** |
| **250** | 26 | 0.017 | 0.098 | 0.885 | **Trimix 10/88** |
| **300** | 31 | 0.015 | 0.098 | 0.887 | **Trimix 10/89** |
| **400** | 41 | 0.011 | 0.099 | 0.890 | **Trimix 10/89** |
| **500** | 51 | 0.009 | 0.099 | 0.892 | **Trimix 10/89** |

**Remarkably Constant: ~10% N₂, 90% He across all depths!**

**13.3.3 Practical Trimix (Integer Percentages)**

**Standardized Mixes (Commercial/IMCA):**

| Depth Range | Mix | $F_{He}$ | $F_{N_2}$ | $F_{O_2}$ | $P_{O_2}$ at Max Depth |
|-------------|-----|----------|-----------|-----------|------------------------|
| **120–180 msw** | **Trimix 10/70** | 70% | 10% | 20% | 0.35–0.55 bar |
| **180–250 msw** | **Trimix 10/60** | 60% | 10% | 30% | 0.35–0.55 bar |
| **250–350 msw** | **Trimix 10/50** | 50% | 10% | 40% | 0.35–0.55 bar |
| **350–450 msw** | **Trimix 10/40** | 40% | 10% | 50% | 0.35–0.55 bar |

**Note: $F_{N_2}$ held constant at ~10% — the "Magic 10% N₂"**

**13.3.4 Why 10% N₂ Works Across Depths**

**Bilayer Balance Ratio:**
$$\frac{P_{N_2}}{P_{He}} = \frac{F_{N_2} \cdot P_{total}}{F_{He} \cdot P_{total}} = \frac{F_{N_2}}{F_{He}} \approx \frac{0.10}{0.90} = \frac{1}{9} \quad \text{(EXACTLY the balance ratio!)}$$

**Since both partial pressures scale with total pressure, the RATIO remains constant!**

**This is why a FIXED 10% N₂ / 90% He blend works at ALL DEPTHS (with O₂ adjustment).**

**13.3.5 O₂ Adjustment — The Only Variable**

**$F_{O_2}$ must decrease with depth to maintain $P_{O_2} = 0.45$ bar:**
$$F_{O_2} = \frac{0.45}{P_{total}} = \frac{0.45}{D/10 + 1}$$

**Helium Fraction Adjustment:**
$$F_{He} = 0.90 \times (1 - F_{O_2}) = 0.90 \left(1 - \frac{0.45}{P_{total}}\right)$$
$$F_{N_2} = 0.10 \times (1 - F_{O_2}) = 0.10 \left(1 - \frac{0.45}{P_{total}}\right)$$

**As Depth Increases:**
- $F_{O_2}$ decreases (less O₂ needed)
- $F_{He}$ increases slightly (fills the gap)
- $F_{N_2}$ increases slightly (maintains 1:9 ratio with He)

---

*End of Piece 3 — DOC-13 Lines 11001-11100*
*Next: Piece 4 — Section 13.4 EEG & Tremor Biomarkers*