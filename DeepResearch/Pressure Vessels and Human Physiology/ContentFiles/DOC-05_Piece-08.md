# DOC-05: Lamé Applications — Internal vs. External Pressure Regimes
## Document 5 of 17 — Pressure Vessels and Human Physiology Deep Research Expansion
## Lines 4301-4400 | Piece 8 of 9 | ~100 Lines

---

#### 5.8 Design Code Implementation: ASME VIII-2, ABS, DNV

**5.8.1 ASME BPVC Section VIII, Division 2 (Design by Analysis)**

**Part 4: Design by Analysis Requirements**
- **Elastic Analysis:** Linear elastic FEA, stress categorization
- **Elastic-Plastic Analysis:** For limit load, plastic collapse
- **Fatigue Analysis:** Strain-based or stress-based (Annex 3-F)
- **Buckling Analysis:** Eigenvalue + knockdown (Annex 3-E)

**Stress Categories (VIII-2, Table 5.1):**
| Category | Description | Allowable |
|----------|-------------|-----------|
| **$P_m$** | Primary membrane | $\sigma_{\text{allow}} = \min(\sigma_y/1.5, \sigma_u/3.5)$ |
| **$P_L$** | Primary local membrane | $1.5 \times P_m$ |
| **$P_b$** | Primary bending | $1.5 \times P_m$ |
| **$P_m + P_b$** | Primary membrane + bending | $1.5 \times P_m$ |
| **$P_L + P_b$** | Primary local + bending | $1.5 \times P_m$ |
| **$Q$** | Secondary (thermal, constraint) | $3.0 \times P_m$ (shakedown) |
| **$F$** | Peak (notch, thermal gradient) | Fatigue only |

**Stress Linearization (for FEA):**
Through-thickness stress $\sigma(x)$ decomposed:
$$\sigma_m = \frac{1}{t} \int_0^t \sigma(x) dx \quad \text{(membrane)}$$
$$\sigma_b = \frac{6}{t^2} \int_0^t \sigma(x)(x - t/2) dx \quad \text{(bending)}$$
$$\sigma_{\text{total}} = \sigma_m + \sigma_b \quad \text{(at surface)}$$

**5.8.2 ASME PVHO-1 Specific Requirements**

**Window Design (Mandatory Appendix 48):**
- **Design by Analysis (DBA)** required for new designs
- **Thermo-viscodamage model** for acrylic
- **5-step V&V** (DOC-01 §1.6)
- **Service Life Limits:** 10,000 cycles, 40,000 hrs, 10 years (flat disc)

**Chamber Design:**
- **Minimum thickness:** 6 mm (steel), 10 mm (aluminum)
- **Corrosion allowance:** 3 mm (steel), 1 mm (Al)
- **Joint efficiency:** $E = 1.0$ (full RT), $0.85$ (spot RT), $0.7$ (no RT)
- **Nozzle reinforcement:** $A_{\text{req}} = d \cdot t_r \cdot F$ (area replacement)

**5.8.3 ABS Rules for Underwater Vehicles**

**Pressure Hull (Section 3):**
- **Collapse pressure:** $P_c = \min(P_{\text{elastic}}, P_{\text{plastic}})$
- **Elastic buckling:** $P_{\text{cr}} = \frac{2E}{1-\nu^2} (t/D)^3$ (unstiffened)
- **Stiffened:** $P_{\text{cr}} = \frac{\pi^2 E I_s}{r^3 L_s} + P_{\text{cr,unstiff}}$
- **Knockdown:** $\alpha = 0.62 / (D/t)^{0.25}$ (for $D/t < 100$)
- **Design pressure:** $P_d = \alpha P_{\text{cr}} / 1.5$

**Window/Port Design:**
- Acrylic: ASME PVHO-1 or ABS Appendix 3
- Glass: ABS Appendix 4 (borosilicate)
- **Sapphire:** ABS Appendix 5 (for deep sea)

**Penetrations:**
- **Bulkhead penetrators:** Designed for $P_d \times 1.5$
- **Hull penetrations:** Reinforcement per Section 3-5-3

**5.8.4 DNV-ST-E271 (Diving Systems)**

**Pressure Vessel Design (Ch. 4):**
- **Design pressure:** $P_d = P_{\text{max}} + P_{\text{dynamic}}$
- **Collapse check:** $P_d \leq P_c / \gamma_c$, $\gamma_c = 1.5$
- **Yield check:** $P_d \leq P_y / \gamma_y$, $\gamma_y = 1.25$
- **Buckling check:** $P_d \leq P_{\text{cr}} / \gamma_b$, $\gamma_b = 1.5$

**Material Factors:**
- Steel: $\gamma_m = 1.15$
- Aluminum: $\gamma_m = 1.25$
- Titanium: $\gamma_m = 1.15$

**Fatigue (Ch. 5):**
- **Design S-N curves:** DNV-RP-C203
- **SCF from FEA:** Hot spot stress method
- **Correction for thickness:** $(t/25)^{-0.25}$ for $t > 25$ mm

**Windows (Ch. 6):**
- Acrylic: Design life 20 years or 20,000 cycles
- **Safety factor:** 3.0 on compressive strength (external pressure)
- **Retaining ring:** Designed for $1.5 \times$ pressure load

**5.8.5 NASA-STD-3001 Vol. 2 (Spacecraft)**

**Pressure Vessel Requirements:**
- **Factor of Safety:** 1.5 on yield, 2.0 on ultimate (metallic)
- **Composite Overwrap:** 2.0 on ultimate (liner), 4.0 on burst (composite)
- **Fatigue:** 4× life factor on crack growth
- **Fracture Control:** NASA-STD-5019 (fracture mechanics proof test)

**EMU Specific (Appendix):**
- **Bladder:** 4× burst pressure (30 kPa → 120 kPa burst)
- **Restraint:** 1.5× yield at operating pressure
- **Cycle Life:** 50 pressurizations (design), 25 (qual test)
- **Leak Rate:** $< 1.3 \times 10^{-4}$ std cm³/s (He)

**5.8.6 Code Comparison Summary**

| Aspect | ASME VIII-1 | ASME VIII-2 | ABS | DNV | NASA |
|--------|-------------|-------------|-----|-----|------|
| **Method** | Design by Rule | Design by Analysis | Semi-empirical | Semi-empirical | Analysis + Test |
| **Internal P** | UG-27 formula | Stress categorization | $P_d = \alpha P_{\text{cr}}/1.5$ | $P_d = P_c/1.5$ | 1.5/2.0 SF |
| **External P** | UG-28/29/30 charts | Buckling analysis | Stiffener formulas | $\gamma_b = 1.5$ | N/A (vacuum) |
| **Fatigue** | Not addressed | Annex 3-F (strain) | DNV-RP-C203 | DNV-RP-C203 | 4× life |
| **Windows** | PVHO-1 App. 48 | PVHO-1 App. 48 | ABS App. 3/4/5 | Ch. 6 | Fracture mech |
| **Thermal** | Not addressed | $3 \times P_m$ (Q) | Not explicit | Not explicit | Thermal cycle |
| **Composite** | Section X | Part 4 (aniso) | Not covered | Not covered | 2.0/4.0 SF |

---

*End of Piece 8 — DOC-05 Lines 4301-4400*
*Next: Piece 9 — References, Cross-Links, Validation & Document Closure*