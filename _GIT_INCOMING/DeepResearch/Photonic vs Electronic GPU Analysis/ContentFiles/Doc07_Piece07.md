# Document 7: Microring Resonator Physics and Coupled Mode Theory
## Piece 7: Dynamic Tuning: Carrier Injection vs. Depletion vs. Thermal

---

### 7.7 Dynamic Tuning: Carrier Injection vs. Depletion vs. Thermal

Dynamic tuning of microring resonators is essential for modulation, switching, and wavelength routing. Three primary mechanisms—carrier injection, carrier depletion, and thermal tuning—offer different trade-offs in speed, power, extinction ratio, and integration complexity.

#### 7.7.1 Carrier Injection (Forward Bias PIN)

**Mechanism**: Forward bias injects electrons/holes into waveguide
Δn = -8.8×10⁻²² N_e - 8.5×10⁻¹⁸ N_h

**Device structure**: PIN diode along waveguide
- P-region: p++ doped
- I-region: intrinsic waveguide
- N-region: n++ doped

**Injection efficiency**:
η_inj = J_rad / J_total
J_rad ∝ N_e N_h (radiative)
J_nonrad ∝ N_e, N_h (Auger, SRH)
Typical η_inj ≈ 10-30%

**Phase shift**:
Δφ = (2π/λ) Δn L
For N = 10¹⁸ cm⁻³, L = 1 mm:
Δn ≈ -0.001, Δφ ≈ 4π

**Speed limitation**:
Carrier lifetime τ_c ≈ 1 ns (unpinched)
RC time constant: τ_RC ≈ 10-50 ps
Total: ~1 ns (1 GHz bandwidth)

**Power consumption**:
P = I V_F
I = q V_active N / τ_c
V_F ≈ 1 V
For N = 10¹⁸ cm⁻³, V = 10⁻¹⁵ m³:
I ≈ 1 mA, P ≈ 1 mW per π shift

**Extinction ratio limitation**:
FCA from injected carriers
α_FCA = 1.45×10⁻¹⁷ N_e + 1.35×10⁻¹⁷ N_h
ER = 10 log₁₀(α_off/(α_on + α_FCA))
For N = 10¹⁸ cm⁻³: α_FCA ≈ 30 dB/cm
ER < 10 dB typical

#### 7.7.2 Carrier Depletion (Reverse Bias PN)

**Mechanism**: Reverse bias widens depletion region
Carriers removed from waveguide core
Δn ∝ √(V_bi + V_R) (junction capacitance)

**Device structure**: PN junction across waveguide
- P-region: one side of waveguide
- N-region: other side
- Depletion region overlaps waveguide

**Capacitance-voltage**:
C_j = C_0 / √(1 + V_R/V_bi)
C_0 = ε A/W_0

**Phase shift**:
Δφ = (2π/λ) Δn L
Δn = -ΔN_dopant × (8.8×10⁻²² for e, 8.5×10⁻¹⁸ for h)
ΔN = C_j V_R / (q L)

**Voltage for 2π**:
V_π ≈ 10-20 V (for L = 1 mm)
Δn ≈ 0.001 needed
ΔN ≈ 10¹⁷ cm⁻³
V_R ≈ 10 V

**Speed**:
RC limited: τ_RC = R_s C_j
R_s ≈ 50 Ω, C_j ≈ 50 fF
τ_RC ≈ 2.5 ps → > 50 GHz bandwidth

**No FCA** (carriers removed):
No free-carrier absorption loss
High extinction ratio: > 20 dB
No carrier lifetime limitation

**Power consumption** (dynamic only):
P = ½ C V² f
C = 50 fF, V = 10 V, f = 10 GHz
P = 2.5 mW per modulator

#### 7.7.3 Carrier Accumulation (MOSCAP)

**Mechanism**: Gate voltage accumulates carriers at oxide interface
Similar to depletion but majority carriers only
Lower loss (no minority carriers)

**Structure**: Gate oxide (SiO₂/HfO₂) on doped Si
N-type Si + gate → accumulate electrons
P-type Si + gate → accumulate holes

**Capacitance**: C_ox = ε_ox/t_ox
For t_ox = 5 nm: C_ox ≈ 7 fF/μm²

**Voltage for 2π**:
V_π ≈ 5-10 V (thinner oxide → lower V)
But higher loss than depletion

**Speed**: RC limited, similar to depletion
Bandwidth: 10-50 GHz

**Advantage**: Lower voltage than depletion
**Disadvantage**: Interface traps, hysteresis

#### 7.7.4 Thermal Tuning (Thermo-Optic)

**Mechanism**: Heater changes temperature → dn/dT
Δn = (dn/dT) ΔT
dn/dT = 1.86×10⁻⁴ K⁻¹ (Si)

**Phase shift**:
Δφ = (2π/λ) (dn/dT) L ΔT

**2π shift**:
ΔT_2π = λ / [(dn/dT) L]
For L = 1 mm: ΔT_2π = 8.3 K

**Heater power**:
P = ΔT / R_th
R_th ≈ 10⁴ K/W (SOI)
P_2π ≈ 0.8 mW

**Speed**:
τ = R_th C_th ≈ 1-10 μs
Bandwidth: 10-100 kHz

**No FCA** (no carriers):
Pure index change
High extinction ratio possible
No carrier lifetime issues

**Advantages**:
- Low voltage (CMOS compatible)
- High efficiency (mW per 2π)
- Large tuning range (> FSR)
- Simple fabrication

**Disadvantages**:
- Slow (μs)
- Thermal crosstalk
- Static power consumption

#### 7.7.5 Comparison Summary

| Parameter | Injection | Depletion | Accumulation | Thermal |
|-----------|-----------|-----------|--------------|---------|
| Speed | ~1 GHz | >50 GHz | 10-50 GHz | ~100 kHz |
| V_π | 1-2 V | 10-20 V | 5-10 V | N/A (mW) |
| P_π (static) | ~1 mW | 0 | 0 | ~1 mW |
| P_π (dynamic) | N/A | ~10 fJ | ~5 fJ | N/A |
| ER | < 10 dB | > 20 dB | > 15 dB | > 20 dB |
| Loss (on) | High (FCA) | Low | Medium | Low |
| Voltage | Low | High | Medium | N/A |
| Integration | Native | Native | Native | Native |
| Wavelength range | FSR | FSR | FSR | >FSR |

#### 7.7.6 Hybrid Tuning Architectures

**Coarse + fine**:
- Thermal: coarse (> FSR, slow)
- Carrier: fine (within FSR, fast)
- Total range: > FSR, fast fine tuning

**Thermal + depletion**:
- Thermal for wavelength routing
- Depletion for high-speed modulation
- Best of both worlds

**Multi-section ring**:
Multiple phase shifters around ring
Thermal on one section, carrier on another
Independent control

**Cascaded rings**:
Each ring with different tuning mechanism
Collective wavelength routing

#### 7.7.7 Tuning for Modulation Formats

**NRZ/OOK**:
Thermal or depletion both work
Depletion for > 25 Gbps
Thermal for static routing

**PAM-4**:
Requires linear phase response
Depletion preferred (linear C-V)
Thermal: linear but slow

**Coherent (QPSK, 16-QAM)**:
Phase noise critical
Depletion: low phase noise
Thermal: 1/f noise from heater

**Analog modulation**:
Linearity critical
Depletion: C-V nonlinearity
Predistortion required

#### 7.7.8 Tuning for WDM Channel Selection

**Channel spacing**: 50/100 GHz
**FSR**: 1000-2000 GHz
**Tuning range needed**: > 1 channel (50-100 GHz)
**FSR tuning**: Thermal (covers > FSR)
**Fine tuning**: Carrier (within FSR)

**Channel switching time**:
Thermal: 1-10 μs
Carrier: < 1 ns
Requirement: < 1 μs for packet switching

**Power budget per channel**:
Thermal: 1 mW static
Carrier: 0.1 mW dynamic (at 10 Gbps)
Total: ~1-2 mW per channel

#### 7.7.9 Active Thermal Stabilization

**Temperature sensitivity**:
dλ/dT = 68 pm/K
For 50 GHz channel (0.4 nm):
ΔT < 0.4 nm / 68 pm/K = 5.9 K
Need active control for < 1 dB penalty

**Control loop**:
1. Monitor drop/thru power ratio
2. Error = target - measured
3. PID → heater current
4. Bandwidth: 10-100 kHz

**Dual-ring Vernier**:
One ring reference, one signal
Common-mode rejection of thermal drift
Relaxes control requirements

#### 7.7.10 Future: Novel Tuning Mechanisms

**Ferroelectric (HfZrO₂)**:
Non-volatile, fast (< ns)
Low voltage (1-2 V)
Endurance: 10¹² cycles
CMOS compatible

**Phase-change (GST, Sb₂S₃)**:
Non-volatile, large Δn
ns switching
Multi-level (analog weights)

**MEMS**:
Physical gap change
Zero static power
μs-ms speed, large Δn

**Electro-optic (LiNbO₃, BaTiO₃ on Si)**:
Pockels effect
Sub-ps, low voltage
Hybrid integration required

**2D materials (graphene, TMDs)**:
Electro-absorption, phase shift
Atomically thin
High speed, low power

**Strain engineering**:
Piezoelectric actuators
Strain-optic effect
Large tuning range, low power

---

*End of Piece 7. Next: Piece 8 - Microring Weight Bank: Broadcast-and-Weight Architecture*