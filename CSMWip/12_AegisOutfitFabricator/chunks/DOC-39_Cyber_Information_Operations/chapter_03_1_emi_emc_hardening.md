## 1. EMI/EMC Hardening

### 1.1 Threat Environment — MIL-STD-461G Compliance

Per **DOC-23 §3** and **MIL-STD-461G**, AIMES must operate in **electromagnetic environment (EME)**:

| Test | Standard | Limit | AIMES Margin |
|------|----------|-------|--------------|
| **CE101** (Conducted Emissions, Power Leads) | MIL-STD-461G | 30 Hz–10 kHz | +12 dB |
| **CE102** (Conducted Emissions, Power Leads) | MIL-STD-461G | 10 kHz–10 MHz | +15 dB |
| **CS101** (Conducted Susceptibility, Power Leads) | MIL-STD-461G | 30 Hz–150 kHz | +20 dB |
| **CS114** (Conducted Susceptibility, Bulk Cable) | MIL-STD-461G | 10 kHz–200 MHz | +18 dB |
| **CS115** (Conducted Susceptibility, Impulse) | MIL-STD-461G | 10 kHz–100 MHz | +15 dB |
| **CS116** (Conducted Susceptibility, Damped Sinusoid) | MIL-STD-461G | 10 kHz–100 MHz | +20 dB |
| **RE101** (Radiated Emissions, Magnetic) | MIL-STD-461G | 30 Hz–100 kHz | +10 dB |
| **RE102** (Radiated Emissions, Electric) | MIL-STD-461G | 10 kHz–18 GHz | +12 dB |
| **RS101** (Radiated Susceptibility, Magnetic) | MIL-STD-461G | 30 Hz–100 kHz | +15 dB |
| **RS103** (Radiated Susceptibility, Electric) | MIL-STD-461G | 2 MHz–18 GHz | +20 dB |

### 1.2 Faraday Mesh — DOC-23 Integration

Per **DOC-23 §4**, AIMES outer layer incorporates **Faraday mesh** (Cu-Ni plated aramid):

**Shielding Effectiveness (SE)**:

$$
SE_{total} = SE_{reflection} + SE_{absorption} + SE_{multiple}
$$

$$
SE_{reflection} = 20 \log_{10} \left( \frac{Z_0}{4 Z_s} \right) \quad \text{(far field)}
$$
$$
SE_{absorption} = 20 \log_{10} \left( e^{t/\delta} \right) = 8.686 \frac{t}{\delta}
$$

Where $Z_0 = 377 \Omega$, $Z_s$ = surface impedance, $t$ = thickness, $\delta = \sqrt{2/(\omega \mu \sigma)}$ = skin depth.

**Target SE**: ≥ 80 dB (10 kHz–18 GHz), ≥ 100 dB (1–10 GHz, threat bands).

**Mesh Aperture Constraint** (prevent waveguide leakage):

$$
d_{aperture} < \frac{\lambda_{min}}{10} = \frac{c}{10 f_{max}} = 1.67 \text{ mm at 18 GHz}
$$

Actual mesh: 0.8 mm aperture (hexagonal Cu-Ni wires, 50 μm diameter).

### 1.3 TEMPEST — Compromising Emanations

Per **CNSSI 7003** and **NATO SDIP-27 Level B**:

| Zone | Separation | SE Requirement | Test Method |
|------|------------|----------------|-------------|
| **Red (Classified)** | — | N/A (source) | N/A |
| **Black (Unclassified)** | ≥ 3 m (air) / ≥ 1 m (conduit) | ≥ 100 dB | NSA 94-106 |
| **Gray (Controlled)** | ≥ 1 m | ≥ 80 dB | NSA 94-106 |

**Emanation Bandwidth Reduction**:

Per DOC-28, all digital clocks use **spread-spectrum clocking (SSC)**:

$$
f_{mod} = f_0 \left( 1 + \frac{\Delta f}{f_0} \sin(2\pi f_m t) \right)
$$

$\Delta f/f_0 = 0.5\%$–$2\%$, $f_m = 30$–$33$ kHz. Reduces peak emissions by 10–15 dB.

### 1.4 High-Altitude EMP (HEMP) & IEMI Protection

Per **MIL-STD-188-125-1/2** and **IEC 61000-2-9**:

| Threat | Field Strength | Coupling Mode | Protection |
|--------|----------------|---------------|------------|
| **HEMP (E1)** | 50 kV/m, < 1 ns rise | Radiated | Faraday mesh + MOV/GDT |
| **HEMP (E2)** | 1 kV/m, 1 μs–1 s | Radiated/Conducted | Surge protectors |
| **HEMP (E3)** | 10 V/km, 10–1000 s | Conducted (grid) | Series capacitors |
| **IEMI** | 10–100 kV/m, UWB | Radiated | Nonlinear transmission lines |

**Protection Level Verification**:

$$
V_{protected} = V_{threat} \cdot 10^{-SE/20} \cdot \frac{Z_{in}}{Z_{in} + Z_{source}} \leq V_{damage}
$$

Target: $V_{protected} < 50$ V for all interfaces (CMOS damage threshold).

---
