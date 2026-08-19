# DOC-11: Saturation Diving Decompression Kinetics
## Document 11 of 17 — Pressure Vessels and Human Physiology Deep Research Expansion
## Lines 9401-9500 | Piece 5 of 9 | ~100 Lines

---

#### 11.5 Heliox Thermal Management (85–95°F / 29–35°C)

**11.5.1 The Helium Thermal Problem**

**Helium Properties at Depth:**
- **Thermal Conductivity:** $k_{He} = 0.15 \text{ W/m·K}$ (at 1 bar) → **0.30 W/m·K at 20 bar**
- **Density:** $\rho_{He} \propto P$ → **20× denser at 20 bar**
- **Specific Heat:** $c_p = 5.2 \text{ kJ/kg·K}$ (constant)
- **Prandtl Number:** $Pr \approx 0.68$ (constant)

**Convective Heat Transfer Coefficient:**
$$h \propto \rho^{0.8} \propto P^{0.8}$$

**At 300 msw (31 bar):**
$$h_{31 bar} \approx h_{1 bar} \times 31^{0.8} = h_{1 bar} \times 15.2$$

**Heat Loss from Diver (Convection):**
$$\dot{Q}_{conv} = h A (T_{skin} - T_{gas})$$

**At Surface (1 bar, air):** $h \approx 10 \text{ W/m}^2\text{K}$, $A = 1.8 \text{ m}^2$
$$\dot{Q}_{conv,1bar} = 10 \times 1.8 \times (34 - 22) = 216 \text{ W}$$

**At 300 msw (31 bar, heliox):** $h \approx 152 \text{ W/m}^2\text{K}$
$$\dot{Q}_{conv,31bar} = 152 \times 1.8 \times (34 - T_{gas})$$

**To Maintain Same Heat Loss (216 W):**
$$216 = 152 \times 1.8 \times (34 - T_{gas})$$
$$34 - T_{gas} = 0.79 \Rightarrow T_{gas} = \mathbf{33.2^\circ\text{C}} \quad (91.8^\circ\text{F})$$

**11.5.2 Required Chamber Temperature Range**

**Thermal Neutrality Condition:**
$$\dot{Q}_{met} = \dot{Q}_{conv} + \dot{Q}_{rad} + \dot{Q}_{resp}$$

**Metabolic Heat (Resting):** 100 W
**Convective Loss (at T_gas):**
$$\dot{Q}_{conv} = 152 \times 1.8 \times (34 - T_{gas}) = 274 \times (34 - T_{gas})$$

**Radiative Loss (to walls at T_gas):**
$$\dot{Q}_{rad} = \epsilon \sigma A (T_{skin}^4 - T_{wall}^4) \approx 5 \times 5.67 \times 10^{-8} \times 1.8 \times (307^4 - T_{gas}^4) \approx 50 \text{ W} \quad \text{(small)}$$

**Respiratory Loss (at depth):**
$$\dot{Q}_{resp} = \dot{V}_E \cdot \rho_{gas} \cdot c_p \cdot (T_{body} - T_{gas})$$
At 31 bar, $\rho_{He} = 0.5 \text{ kg/m}^3$, $\dot{V}_E = 0.01 \text{ m}^3/\text{s}$:
$$\dot{Q}_{resp} = 0.01 \times 0.5 \times 5200 \times (37 - T_{gas}) = 26 \times (37 - T_{gas})$$

**Total Heat Loss at T_gas = 32°C:**
$$\dot{Q}_{conv} = 274 \times 2 = 548 \text{ W}$$
$$\dot{Q}_{resp} = 26 \times 5 = 130 \text{ W}$$
$$\dot{Q}_{rad} \approx 50 \text{ W}$$
$$\dot{Q}_{total} = 728 \text{ W} \gg 100 \text{ W (metabolic)}$$

**Diver would RAPIDLY HYPOTHERMIZE at 32°C!**

**Required Chamber Temperature:**
$$100 = 274 \times (34 - T_{gas}) + 26 \times (37 - T_{gas}) + 50$$
$$50 = 300 \times (34 - T_{gas}) \quad \text{(approx)}$$
$$34 - T_{gas} = 0.17 \Rightarrow T_{gas} = \mathbf{33.8^\circ\text{C}} \quad (93^\circ\text{F})$$

**US Navy Specification: 85–95°F (29–35°C)**
- **Lower bound (85°F/29°C):** Light work, good insulation
- **Upper bound (95°F/35°C):** Heavy work, minimal insulation

**11.5.3 Heating System Design (Saturation Complex)**

**Heat Sources:**
1. **Electric Resistance Heaters** (primary) — 50–100 kW
2. **Heat Reclaim from Scrubber** (exothermic) — 10–20 kW
3. **Diver Metabolic** — 100 W × 12 = 1.2 kW (minor)
4. **Compressor Waste Heat** — 20–50 kW (if available)

**Temperature Control:**
- **Zone control:** Living chamber, transfer lock, bell separate
- **Sensors:** 10+ RTDs per chamber
- **Control:** PID, ±0.5°C stability

**11.5.4 Thermal Stress During Decompression**

**As Pressure Drops, Convective Cooling DECREASES:**
$$\dot{Q}_{conv} \propto P^{0.8}$$

**During Decompression (31 bar → 1 bar):**
- $h$ drops by **15×**
- **Chamber must be COOLED** to maintain thermal neutrality

**Cooling Requirement During Decompression:**
- **Refrigeration units** (vapor compression) — 20–50 kW
- **Seawater heat exchangers** (if available)
- **Expansion cooling** (venting gas) — limited

**Critical Transition (50–0 fsw):**
- Gas switches to air/nitrox
- Thermal properties change
- **Temperature must track pressure profile**

**11.5.5 Diver Thermal Protection (Insulation)**

**Saturation Diver Garment:**
- **Base layer:** Polypropylene (wicking)
- **Mid layer:** Fleece/wool (insulation, 10–20 mm)
- **Outer layer:** Cotton/aramid (protection)
- **Total Clo value:** 1.5–2.5 clo

**Heat Flux Through Garment:**
$$\dot{Q} = \frac{T_{skin} - T_{gas}}{R_{clo} + 1/h}$$
Where $R_{clo} = 0.155 \times \text{clo} \quad [\text{m}^2\text{K/W}]$

**At 2 clo, $R_{clo} = 0.31$:**
$$\dot{Q} = \frac{34 - 33}{0.31 + 1/152} = \frac{1}{0.317} = 3.2 \text{ W/m}^2 \quad \text{(negligible)}$$

**Garment is ESSENTIAL — without it, $T_{gas}$ would need to be > 40°C!**

---

*End of Piece 5 — DOC-11 Lines 9401-9500*
*Next: Piece 6 — Section 11.6 Saturation Complex Life Support Integration*