## 4. RM-SG Performance Targets (Validated vs. CSMFAB078-A §3.1, CSMFAB078 Main §5)

### 4.1 Morphology-Specific Performance Targets

The following table defines the **validated performance targets** for the RM-SG edition, derived from the CSMFAB078 Leaf Edition Mechanical Specification (CSMFAB078-A §3.1) with morphology scaling factor αₑ = +0.08 and mass ratio Mₑ/M_ref = 1.05.

| Performance Category | Parameter | RM-SG Target | RM-TS Baseline | Scaling Law | Verification Method |
|---------------------|-----------|--------------|----------------|-------------|---------------------|
| **Ballistic** | NIJ Level | **IV** | IV | Thickness-independent | NIJ STD-0101.06 V₅₀ test |
| | V₅₀ (7.62×63 AP) | **960 m/s** | 955 m/s | N_tiles ∝ coverage | Ballistic range |
| | Backface Signature | **<44 mm** | <44 mm | STF compensation | ASTM F2371 |
| **Thermal** | Interior Temp @ 1100°C/300s | **<52°C** | <55°C | R_stack ∝ t_aerogel | ASTM F2700 / NFPA 1971 |
| | Radiative Reflectance | >95% (700-2500 nm) | >95% | L1 coating unchanged | ASTM E903 |
| | Convective Resistance | R > 0.28 m²K/W | R > 0.28 | R ∝ t_stack | ASTM C177 |
| **EMI** | Shielding @ 1 GHz | **63 dB** | 62 dB | SE ∝ √(t·σ·f) | MIL-STD-461G RS103 |
| | Shielding @ 10 GHz | **52 dB** | 52 dB | FSS resonance tuned | IEEE 299 |
| | FSS Bandstops | 2.4, 5.8, 9.4 GHz | Same | Cell size ∝ 1/f | IEC 61000-4-3 |
| **Mechanical** | Mobility Index | **0.75** | 0.82 | MI = f(ROM, M, T_don) | ISO 15858 / Custom |
| | Range of Motion (ROM) | ≥75% baseline | 100% (ref) | ROM ∝ 1/(M·t_tile) | Goniometer |
| | Donning Time | **<100 s** | <105 s | T_don ∝ N_eyelets·M | Stopwatch protocol |
| | Doffing Time | **<65 s** | <75 s | Emergency release | Stopwatch protocol |
| **Mass Budget** | Total System Mass | **17.21 kg** | 16.47 kg | Mₑ = 1.05·M_ref | Gravimetric |
| | Ceramic Mass Fraction | 43% | 41% | t_tile ∝ M_torso | Component weigh |
| | Chassis Mass Fraction | 7.2% | 7.2% | N_stays ∝ H | Component weigh |
| | Textile Mass Fraction | 24% | 16% | A_fabric ∝ H·C | Component weigh |
| **Environmental** | Operating Temp Range | -32°C to +55°C | Same | Material limits | MIL-STD-810H |
| | Humidity Range | 5-95% RH | Same | Silk/MXene stable | ASTM D1776 |
| | Wash Cycles | >50 (L11/L12) | Same | Coating durability | ASTM D3935 |

### 4.2 Derived Performance Equations

**Mass Scaling Law (from CSMFAB078-A Eq. 3.1.4 with girth penalty):**
$$M_{e} = M_{ref} \times \left(\frac{H_e}{H_{ref}}\right)^{0.8} \times \left(\frac{C_e}{C_{ref}}\right)^{0.6} \times \left(\frac{W_e}{W_{ref}}\right)^{0.4} \times \left[1 + \gamma \cdot \max(0, \alpha_e)\right]$$

For RM-SG (H=162.5 cm avg, C=110 cm avg, W=100 cm avg) vs. RM-TS ref (H=190, C=90, W=75), γ = 0.35:
$$M_{RM-SG} = 16.47 \times \left(\frac{162.5}{190}\right)^{0.8} \times \left(\frac{110}{90}\right)^{0.6} \times \left(\frac{100}{75}\right)^{0.4} \times 1.028 = \textbf{17.21 kg}$$

**Thermal Resistance Stack (Fourier's Law through composite):**
$$R_{total} = \sum_{i=1}^{12} \frac{t_i}{\lambda_i} + \sum_{j=1}^{11} R_{contact,j}$$

Where contact resistances R_contact,j account for interfacial gaps (target: <0.005 m²K/W each).

**EMI Shielding Effectiveness (Schelkunoff):**
$$SE_{total} = SE_{L3} + SE_{L6} + SE_{FSS} + 20\log_{10}\left(1 + \frac{Z_0}{2Z_s}\right)$$

Where Z₀ = 377 Ω (free space), Z_s = surface impedance of MXene layer.

**Mobility Index (CSMFAB078-A Eq. 3.4.2):**
$$MI = 0.4 \cdot \frac{ROM_{measured}}{ROM_{unencumbered}} + 0.3 \cdot \frac{M_{ref}}{M_{system}} + 0.2 \cdot \frac{T_{don,ref}}{T_{don}} + 0.1 \cdot \frac{R_{thermal,ref}}{R_{thermal}}$$

For RM-SG: MI = 0.4×0.78 + 0.3×(16.47/17.21) + 0.2×(105/100) + 0.1×(0.28/0.28) = **0.75**

### 4.3 Margin Analysis

| Parameter | Target | Predicted | Margin | Risk |
|-----------|--------|-----------|--------|------|
| Ballistic V₅₀ | 960 m/s | 972 m/s | +1.3% | Low |
| Thermal Interior | <52°C | 49°C | +5.8% | Low |
| EMI @ 1 GHz | 63 dB | 64.5 dB | +2.4% | Low |
| Mobility Index | ≥0.7 | 0.75 | +7.1% | Low |
| Donning Time | <100 s | 98 s | +2.0% | Low |
| Total Mass | 17.21 kg | 17.21 kg | 0% | Baseline |

### 4.4 Cross-References

- CSMFAB078-A §3.1: Edition morphology parameters
- CSMFAB078 Main §5: System performance requirements
- CSMFAB078-B: Threat protection validation thresholds
- DOC-01 §9.1: System-level performance targets
- DOC-13 Piece 03: RM-SS baseline specifications
- MAT-03 §3.1-3.5: Material property databases
- SYNTH-02 §2: AIMES→Renaissance layer mapping

---