## 2. Electromagnetic Compatibility (EMC)

### 2.1 EMC Requirements — MIL-STD-461G / MIL-STD-464C

Per **MIL-STD-461G** (Requirements for Control of EMI Characteristics) and **MIL-STD-464C** (Interface Standard for EMC), AIMES meets:

| Test | Standard | Limit | AIMES Design Feature |
|------|----------|-------|---------------------|
| **CE101** (Conducted Emissions, Power) | MIL-STD-461G | 20 Hz–10 kHz | MHD input filter, common-mode choke |
| **CE102** (Conducted Emissions, Power) | MIL-STD-461G | 10 kHz–10 MHz | π-filter, layout optimization |
| **CS101** (Conducted Susceptibility, Power) | MIL-STD-461G | 30 Hz–150 kHz | MHD regulator rejection > 60 dB |
| **CS114** (Conducted Susceptibility, Bulk Cable) | MIL-STD-461G | 10 kHz–200 MHz | CM/DM chokes, ferrite, shielding |
| **CS115** (Conducted Susceptibility, Impulse) | MIL-STD-461G | 10 kHz–100 MHz | TVS diodes, isolation |
| **RE101** (Radiated Emissions, Magnetic) | MIL-STD-461G | 30 Hz–100 kHz | Twisted pair, mu-metal shield |
| **RE102** (Radiated Emissions, Electric) | MIL-STD-461G | 10 kHz–18 GHz | MXene shield (SE > 80 dB), seam control |
| **RS101** (Radiated Susceptibility, Magnetic) | MIL-STD-461G | 30 Hz–100 kHz | Mu-metal, active cancellation |
| **RS103** (Radiated Susceptibility, Electric) | MIL-STD-461G | 2 MHz–18 GHz, 200 V/m | Faraday cage (MXene textile, SE > 80 dB) |
| **RS105** (Transient Susceptibility) | MIL-STD-461G | EMP, Lightning | TVS, GDT, shielded cable |

**System-Level EMC** (MIL-STD-464C):

| Requirement | AIMES Compliance |
|-------------|------------------|
| **E3 Margin** | ≥ 6 dB all test points |
| **Intra-system EMC** | ICD-003 (Power↔AI), ICD-004 (Sensors↔PHM) |
| **Inter-system EMC** | Platform integration testing |
| **HEMP/EMP Hardening** | RS105 + shielding, surge protection |
| **Lightning** | DO-160G Section 22, Zone 2A |

### 2.2 EMI Shielding Effectiveness — MXene Textile

Per **DOC-22, DOC-29**, the MXene-coated textile provides primary EMI shielding:

**Shielding Effectiveness (SE) Model**:

$$
SE_{total} = SE_R + SE_A + SE_M
$$

Where:
- $SE_R = 20 \log_{10} \left( \frac{Z_0}{4 Z_s} \right)$ = Reflection loss
- $SE_A = 20 \log_{10} \left( e^{t/\delta} \right) = 8.686 \frac{t}{\delta}$ = Absorption loss
- $SE_M$ = Multiple reflection correction (negligible if $SE_A > 10$ dB)

**MXene Parameters**:
- Conductivity $\sigma \approx 10^4$ S/m (Ti₃C₂Tx, DOC-22)
- Skin depth $\delta = \sqrt{\frac{2}{\omega \mu \sigma}}$
- Thickness $t = 50 \mu m$ (coating)

**SE Performance**:

| Frequency | SE_R (dB) | SE_A (dB) | SE_Total (dB) | Requirement |
|-----------|-----------|-----------|---------------|-------------|
| **1 MHz** | 45 | 12 | 57 | > 60 (margin via seam tape) |
| **10 MHz** | 35 | 38 | 73 | > 60 |
| **100 MHz** | 25 | 120 | 145 | > 80 |
| **1 GHz** | 15 | 380 | 395 | > 80 |
| **10 GHz** | 5 | 1200 | 1205 | > 80 |

**Seam Shielding** (MXene tape bridge, DOC-22 §5.3):

$$
SE_{seam} = 20 \log_{10} \left( \frac{\lambda}{2\pi L} \right) - 20 \log_{10} \left( \frac{R_s}{Z_0} \right)
$$

Where $L$ = seam length, $R_s$ = seam resistance. Target: $SE_{seam} > 60$ dB at 10 GHz.

### 2.3 Magnetic Signature Management

Per **MIL-STD-464C** and **STANAG 4391**, AIMES manages magnetic signature:

| Source | Magnitude | Mitigation |
|--------|-----------|------------|
| **MHD Generator** | 50–500 μT @ 1m | Mu-metal housing, counter-winding |
| **MR Fluid Coils** | 10–100 μT @ 1m | Twisted pair, active cancellation |
| **Battery Cables** | 5–20 μT @ 1m | Twisted pair, routing |
| **Steel/Baleen Chassis** | Remanent | Degaussing (DOC-34), material selection |

**Degaussing Protocol** (DOC-34 §6.3):

$$
H_{degauss}(t) = H_{max} \cdot e^{-t/\tau} \cdot \sin(\omega t)
$$

Applied at D-Level (Phase D inspection) and post-major maintenance.

---
