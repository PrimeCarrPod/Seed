# DOC-16: TLV Diffusion Limitations & Ventilator Engineering
## Document 16 of 17 — Pressure Vessels and Human Physiology Deep Research Expansion
## Lines 14001-14100 | Piece 6 of 9 | ~100 Lines

---

#### 16.6 Heat Exchanger & Oxygenator Integration

**16.6.1 Thermal Management — The PFC Cooling Challenge**

**Heat Loads in TLV Loop:**
| Source | Power [W] | Notes |
|--------|-----------|-------|
| **Patient Metabolic** | 100–500 | 100 W rest, 500 W heavy |
| **Pump Work (viscous dissipation)** | 50–200 | $P = \Delta P \cdot Q$ |
| **Oxygenator (gas exchange)** | 10–20 | Exothermic O₂ dissolution |
| **CO₂ Stripper** | 5–10 | Endothermic (slight) |
| **TOTAL** | **200–700 W** | Must be rejected |

**PFC Thermal Properties (Challenge):**
- $c_p = 1.0 \text{ J/g·K}$ (4× lower than water)
- $k = 0.06 \text{ W/m·K}$ (10× lower than water)
- $\rho = 1.9 \text{ g/cm}^3$ (2× water)

**Required PFC Flow for Cooling (ΔT = 2°C):**
$$\dot{m} = \frac{\dot{Q}}{c_p \Delta T} = \frac{500}{1.0 \times 2} = 250 \text{ g/s} = \mathbf{130 \text{ mL/s} = 7.8 \text{ L/min}}$$

**TLV Tidal Flow (RR=10, TV=3.8L):**
$$\dot{V}_{tidal} = TV \times RR = 3.8 \times 10 = 38 \text{ L/min}$$

**Tidal Flow (38 L/min) > Cooling Requirement (7.8 L/min) — Tidal flow PROVIDES cooling!**

**16.6.2 Heat Exchanger Design (Counter-Current, PFC-PFC)**

**Geometry: Shell-and-Tube (Compact)**
- **Hot Side (Patient Return):** 38 L/min, 38°C
- **Cold Side (Chilled Supply):** 38 L/min, 36°C
- **ΔT_lm:** ~1.5°C
- **Required Area:** $A = \frac{\dot{Q}}{U \cdot \Delta T_{lm}}$
- **U (PFC-PFC, turbulent):** ~500 W/m²K
- **Area:** $A = \frac{500}{500 \times 1.5} = \mathbf{0.67 \text{ m}^2}$

**Compact Design (Brazed Plate):**
- **Plates:** 50 plates, 0.3 m × 0.4 m
- **Channel Gap:** 2 mm
- **Flow per Channel:** 0.8 L/min
- **Pressure Drop:** < 20 kPa
- **Mass:** 3 kg (stainless steel 316L)

**16.6.3 Membrane Oxygenator (O₂ In / CO₂ Out)**

**Hollow Fiber Membrane Oxygenator (Adapted from ECMO):**
- **Fiber Material:** Polypropylene (PP) or PMP (polymethylpentene)
- **Pore Size:** 0.05 µm (hydrophobic, prevents PFC entry)
- **Fiber ID/OD:** 200/300 µm
- **Packing Density:** 50%
- **Surface Area:** 0.5–1.0 m² (adult)

**Gas Transfer Equations:**
$$\dot{n}_{O_2} = K_{O_2} \cdot A \cdot (P_{O_2,gas} - P_{O_2,PFC})$$
$$\dot{n}_{CO_2} = K_{CO_2} \cdot A \cdot (P_{CO_2,PFC} - P_{CO_2,gas})$$

**Mass Transfer Coefficients (PFC side limiting):**
- $K_{O_2} \approx 2 \times 10^{-4} \text{ cm/s}$
- $K_{CO_2} \approx 1.5 \times 10^{-4} \text{ cm/s}$

**Required Area for 250 mL/min O₂ Transfer:**
$$A = \frac{\dot{n}_{O_2}}{K_{O_2} \cdot \Delta P_{O_2}} = \frac{1.1 \times 10^{-3}}{2 \times 10^{-4} \times 700} = \mathbf{0.008 \text{ m}^2} \quad \text{(theoretical)}$$

**With Safety Factor (fouling, boundary layer): 0.5–1.0 m²**

**Oxygenator Design (Adult):**
- **Fiber Bundle:** 10,000 fibers, 25 cm length
- **Priming Volume:** 50–100 mL
- **Gas Flow (100% O₂ sweep):** 5–10 L/min
- **Pressure Drop (PFC):** < 15 kPa
- **Priming:** Pre-fill with PFC, debubble

**16.6.3 CO₂ Stripper (Counter-Current Gas Sweep)**

**Design:** Same fiber bundle, separate compartment
- **Sweep Gas:** N₂ or He (low CO₂) at 5–10 L/min
- **Vacuum Assist:** -20 kPa (enhances CO₂ removal)
- **CO₂ Removal:** > 95% per pass
- **Integration:** Combined housing with oxygenator (shared fibers)

**CO₂ Removal Capacity:**
$$\dot{n}_{CO_2} = K_{CO_2} \cdot A \cdot (P_{CO_2,PFC} - P_{CO_2,sweep})$$
At $P_{CO_2,PFC} = 40 \text{ mmHg}$, $P_{sweep} \approx 0$:
$$\dot{n}_{CO_2} \approx 1.5 \times 10^{-3} \text{ mol/s} = \mathbf{66 \text{ mL/min}} \quad \text{(per 0.5 m²)}$$

**For 1,500 mL/min CO₂: Need ~11 m² (impractical) → Increase sweep flow, vacuum, or multi-pass.**

**Practical Solution:** **Multi-stage stripper (3 stages in series) + vacuum (-50 kPa) + high sweep flow (20 L/min).**

---

*End of Piece 6 — DOC-16 Lines 14001-14100*
*Next: Piece 7 — Section 16.7 Control Systems & Safety*