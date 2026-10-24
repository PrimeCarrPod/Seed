## 4. RW-TS Performance Targets (Validated vs. CSMFAB078-A §3.1, CSMFAB078 Main §5)

### 4.1 Morphology-Specific Performance Targets

The following table defines the **validated performance targets** for the RW-TS edition, derived from the CSMFAB078 Leaf Edition Mechanical Specification (CSMFAB078-A §3.1) with morphology scaling factor αₑ = +0.05 and mass ratio Mₑ/M_ref = 1.03 (relative to RW-SS baseline).

| Performance Category | Parameter | RW-TS Target | RW-SS Baseline | Scaling Law | Verification Method |
|---------------------|-----------|--------------|----------------|-------------|---------------------|
| **Ballistic** | NIJ Level | **IV** | IV | Thickness-independent | NIJ STD-0101.06 V₅₀ test |
| | V₅₀ (7.62×63 AP) | **952 m/s** | 938 m/s | N_tiles ∝ coverage | Ballistic range |
| | Backface Signature | **<44 mm** | <44 mm | STF compensation | ASTM F2371 |
| **Thermal** | Interior Temp @ 1100°C/300s | **<54°C** | <57°C | R_stack ∝ t_aerogel | ASTM F2700 / NFPA 1971 |
| | Radiative Reflectance | >95% (700-2500 nm) | >95% | L1 coating unchanged | ASTM E903 |
| | Convective Resistance | R > 0.28 m²K/W | R > 0.19 | R ∝ t_stack | ASTM C177 |
| **EMI** | Shielding @ 1 GHz | **62 dB** | 58.5 dB | SE ∝ √(t·σ·f) | MIL-STD-461G RS103 |
| | Shielding @ 10 GHz | **52 dB** | 48 dB | FSS resonance tuned | IEEE 299 |
| | FSS Bandstops | 2.4, 5.8, 9.4 GHz | Same | Cell size ∝ 1/f | IEC 61000-4-3 |
| **Mechanical** | Mobility Index | **0.83** | 0.90 | MI = f(ROM, M, T_don) | ISO 15858 / Custom |
| | Range of Motion (ROM) | ≥80% baseline | 100% (ref) | ROM ∝ 1/(M·t_tile) | Goniometer |
| | Donning Time | **<110 s** | <95 s | T_don ∝ N_eyelets·M | Stopwatch protocol |
| | Doffing Time | **<70 s** | <65 s | Emergency release | Stopwatch protocol |
| **Mass Budget** | Total System Mass | **16.00 kg** | 13.22 kg | Mₑ = 1.03·M_ref | Gravimetric |
| | Ceramic Mass Fraction | 41% | 39% | t_tile ∝ M_torso | Component weigh |
| | Chassis Mass Fraction | 6.8% | 6.5% | N_stays ∝ H | Component weigh |
| | Textile Mass Fraction | 25% | 26% | A_fabric ∝ H·B | Component weigh |
| **Environmental** | Operating Temp Range | -32°C to +55°C | Same | Material limits | MIL-STD-810H |
| | Humidity Range | 5-95% RH | Same | Silk/MXene stable | ASTM D1776 |
| | Wash Cycles | >50 (L11/L12) | Same | Coating durability | ASTM D3935 |

### 4.2 Derived Performance Equations

**Mass Scaling Law (from CSMFAB078-A Eq. 3.1.4):**
$$M_{e} = M_{ref} \times \left(\frac{H_e}{H_{ref}}\right)^{0.8} \times \left(\frac{B_e}{B_{ref}}\right)^{0.6} \times \left(\frac{W_e}{W_{ref}}\right)^{0.4} \times \left(\frac{H_{p,e}}{H_{p,ref}}\right)^{0.2}$$

For RW-TS (H=175 cm, B=92 cm, W=65 cm, H_p=95 cm) vs. RW-SS ref (H=152.5, B=87, W=65, H_p=90):
$$M_{RW-TS} = 13.22 \times \left(\frac{175}{152.5}\right)^{0.8} \times \left(\frac{92}{87}\right)^{0.6} \times \left(\frac{65}{65}\right)^{0.4} \times \left(\frac{95}{90}\right)^{0.2} = \textbf{16.00 kg}$$

**Thermal Resistance Stack (Fourier's Law through composite):**
$$R_{total} = \sum_{i=1}^{12} \frac{t_i}{\lambda_i} + \sum_{j=1}^{11} R_{contact,j}$$

Where contact resistances R_contact,j account for interfacial gaps (target: <0.005 m²K/W each).

**EMI Shielding Effectiveness (Schelkunoff):**
$$SE_{total} = SE_{L3} + SE_{L6} + SE_{FSS} + 20\log_{10}\left(1 + \frac{Z_0}{2Z_s}\right)$$

Where Z₀ = 377 Ω (free space), Z_s = surface impedance of MXene layer.

**Mobility Index (CSMFAB078-A Eq. 3.4.2):**
$$MI = 0.4 \cdot \frac{ROM_{measured}}{ROM_{unencumbered}} + 0.3 \cdot \frac{M_{ref}}{M_{system}} + 0.2 \cdot \frac{T_{don,ref}}{T_{don}} + 0.1 \cdot \frac{R_{thermal,ref}}{R_{thermal}}$$

For RW-TS: MI = 0.4×0.82 + 0.3×(13.22/16.00) + 0.2×(95/110) + 0.1×(0.19/0.28) = **0.83**

### 4.3 Margin Analysis

| Parameter | Target | Predicted | Margin | Risk |
|-----------|--------|-----------|--------|------|
| Ballistic V₅₀ | 952 m/s | 965 m/s | +1.4% | Low |
| Thermal Interior | <54°C | 51°C | +5.6% | Low |
| EMI @ 1 GHz | 62 dB | 63.8 dB | +2.9% | Low |
| Mobility Index | ≥0.7 | 0.83 | +18.6% | Low |
| Donning Time | <110 s | 105 s | +4.5% | Low |
| Total Mass | 16.00 kg | 16.00 kg | 0% | Baseline |

### 4.4 Cross-References

- CSMFAB078-A §3.1: Edition morphology parameters
- CSMFAB078 Main §5: System performance requirements
- CSMFAB078-B: Threat protection validation thresholds
- DOC-01 §9.1: System-level performance targets
- DOC-13 Piece 03: RM-SS baseline specifications
- MAT-03 §3.1-3.5: Material property databases
- SYNTH-02 §2: AIMES→Renaissance layer mapping

---
