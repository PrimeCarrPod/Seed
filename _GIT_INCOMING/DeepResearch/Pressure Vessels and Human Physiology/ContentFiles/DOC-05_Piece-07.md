# DOC-05: Lamé Applications — Internal vs. External Pressure Regimes
## Document 5 of 17 — Pressure Vessels and Human Physiology Deep Research Expansion
## Lines 4201-4300 | Piece 7 of 9 | ~100 Lines

---

#### 5.7 Dynamic & Cyclic Loading: Fatigue from Pressure Spectra

**5.7.1 Pressure Cycle Spectrum — PVHO Operational Profiles**

| PVHO Class | Cycle Type | $\Delta P$ Range | Cycles/Year | Design Life |
|------------|------------|------------------|-------------|-------------|
| **Aircraft** | Sinusoidal (climb/cruise/descent) | 0 → 55 kPa | 2,000–4,000 | 60,000–100,000 |
| **Hyperbaric Chamber** | Square wave (treatment) | 0 → 500 kPa | 1,000–2,000 | 10,000–50,000 |
| **Submersible** | Single deep dive | 0 → 65 MPa | 50–100 | 200–500 |
| **Saturation Habitat** | Single compression | 0 → 70 MPa | 1–2/mission | 100–200 |
| **EMU** | EVA cycle | 0 → 30 kPa | 25–50 | 25–50 |
| **Diving Bell** | Lock-on/off | 0 → 70 MPa | 100–500 | 1,000–5,000 |

**5.7.2 Stress Range from Pressure Range**

For internal pressure (thin wall approx):
$$\Delta \sigma_{\theta} = \frac{\Delta P \cdot r}{t} \quad \text{(membrane)}$$
$$\Delta \sigma_{\theta}(r_i) = \Delta P \frac{r_o^2 + r_i^2}{r_o^2 - r_i^2} \quad \text{(Lamé, inner surface)}$$

**For thick walls, stress gradient through thickness:**
$$\Delta \sigma_{\theta}(r) = \Delta P \frac{r_i^2}{r_o^2 - r_i^2} \left(1 + \frac{r_o^2}{r^2}\right)$$

**Fatigue Damage (Miner's Rule):**
$$D = \sum_{i=1}^{n} \frac{n_i}{N_i(\Delta \sigma_i)}$$
Where $N_i$ from $S-N$ curve for material/geometry.

**5.7.3 Fatigue at Stress Concentrations (Windows, Nozzles, Penetrations)**

**Local Stress Range:**
$$\Delta \sigma_{\text{local}} = K_f \Delta \sigma_{\text{nominal}}$$
$$K_f = 1 + q(K_t - 1) \quad \text{(fatigue notch factor)}$$
$q$ = notch sensitivity (0.8–1.0 for Al/steel, 0.3–0.5 for composites)

**Window Corner (from DOC-03):**
- $K_t \approx 2.8$ (rounded rectangular, $r=25$ mm)
- $q \approx 0.9$ → $K_f \approx 2.6$
- $\Delta \sigma_{\text{nom}} = 26$ MPa (aircraft at 55 kPa)
- $\Delta \sigma_{\text{local}} = 68$ MPa

**S-N Curve (2024-T3, R=0):**
$$\Delta \sigma N^{1/3.5} = C \approx 1,200 \text{ MPa·cycles}^{1/3.5}$$
At $\Delta \sigma = 68$ MPa: $N \approx 15,000$ cycles

**Aircraft at 4,000 cycles/yr → 3.75 years to crack initiation.**
**Hence: Regular eddy current inspections every 1,500 cycles.**

**5.7.4 Residual Stress Effects on Fatigue**

**Beneficial Compressive Residual (Autofrettage, Cold Work, Laser Peening):**
$$\Delta \sigma_{\text{eff}} = \Delta \sigma_{\text{applied}} - \sigma_{\text{res,comp}} \quad \text{(if $\sigma_{\text{res}} < \Delta \sigma/2$)}$$

**Detrimental Tensile Residual (Welding, Machining):**
$$\Delta \sigma_{\text{eff}} = \Delta \sigma_{\text{applied}} + \sigma_{\text{res,tens}}$$

**Weld Toe (Hyperbaric Chamber):**
- As-welded: $\sigma_{\text{res}} \approx 0.5 \sigma_y \approx 130$ MPa (tensile)
- $\Delta \sigma_{\text{nom}} = 15$ MPa (pressure)
- $\Delta \sigma_{\text{eff}} \approx 145$ MPa → **Major fatigue reduction**

**Post-Weld Heat Treatment (PWHT):**
- Reduces $\sigma_{\text{res}}$ to $< 0.1 \sigma_y \approx 26$ MPa
- **Mandatory for PVHO chamber welds (ASME PVHO-1)**

**5.7.5 Corrosion Fatigue (Marine PVHOs)**

**Seawater Environment:**
- Reduces fatigue limit by **2–5×** (depending on material, cathodic protection)
- Eliminates "infinite life" region — **no endurance limit**

**Design Approaches:**
1. **Cathodic Protection:** Impressed current or sacrificial anodes → shifts corrosion potential
2. **Coating System:** Epoxy + polyurethane (500–1000 µm) → barrier
3. **Corrosion Allowance:** Add 3–6 mm to thickness
4. **Material Upgrade:** Duplex stainless (2205), Ni-Cu (Monel 400), Ti-6Al-4V

**S-N in Seawater (CP applied):**
$$\Delta \sigma_{\text{sw}} = \Delta \sigma_{\text{air}} / 2 \quad \text{(approximate)}$$

**Without CP:** $\Delta \sigma_{\text{sw}} = \Delta \sigma_{\text{air}} / 5$

**5.7.6 Thermal Fatigue (Spacecraft, High-Altitude)**

**Thermal Cycle:** Sun ($+150°C$) → Eclipse ($-100°C$) → $\Delta T = 250°C$
**Cycle Period:** 90 min (LEO) → 5,800 cycles/year

**Thermal Stress Range (Constrained):**
$$\Delta \sigma_{\text{th}} = \frac{E \alpha \Delta T}{1-\nu} \approx \frac{70 \times 10^3 \times 23 \times 10^{-6} \times 250}{0.7} = 575 \text{ MPa} \quad \text{(Al alloy)}$$

**Combined with Pressure:**
$$\Delta \sigma_{\text{total}} = \sqrt{\Delta \sigma_P^2 + \Delta \sigma_{\text{th}}^2 + 2\nu \Delta \sigma_P \Delta \sigma_{\text{th}}} \quad \text{(if in-phase)}$$

**For ISS Module (Al 2219, $r=2.2$ m, $t=2.5$ mm, $P=101$ kPa):**
$$\Delta \sigma_P = \frac{101 \times 2200}{2.5} = 89 \text{ MPa}$$
$$\Delta \sigma_{\text{total}} \approx \sqrt{89^2 + 575^2} = 582 \text{ MPa} \quad \text{(if perfectly in-phase)}$$

**Actual:** Thermal and pressure cycles **out of phase** → lower combined damage.
**Fatigue analysis requires cycle-by-cycle integration (Rainflow counting).**

---

*End of Piece 7 — DOC-05 Lines 4201-4300*
*Next: Piece 8 — Section 5.8 Design Code Implementation: ASME VIII-2, ABS, DNV*