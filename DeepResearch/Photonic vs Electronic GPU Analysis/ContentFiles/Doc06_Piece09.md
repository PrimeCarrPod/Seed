# Document 6: Mach-Zehnder Interferometer Mesh Theory
## Piece 9: Non-Volatile Phase Change Material (PCM) Integration: GST Physics

---

### 6.9 Non-Volatile Phase Change Material (PCM) Integration: GST Physics

Phase Change Materials (PCMs) offer non-volatile, low-power phase shifting for MZI meshes. Germanium-Antimony-Tellurium (GST) alloys switch between amorphous and crystalline states with large refractive index contrast, enabling zero-static-power phase shifters. This piece covers the physics, integration, and performance of GST-based phase shifters.

#### 6.9.1 PCM Physics: Amorphous vs. Crystalline

**GST composition**: Ge₂Sb₂Te₅ (most common)
Other: GeSb₂Te₄, GeSb₄Te₇, Sb₂Te₃

**Two states**:
- **Amorphous (reset)**: Disordered, high resistivity, low n
- **Crystalline (set)**: Ordered, low resistivity, high n

**Refractive index contrast** (at 1550 nm):
n_amorphous ≈ 4.0 + j0.1
n_crystalline ≈ 5.5 + j1.5
Δn ≈ 1.5 (real), Δκ ≈ 1.4 (imaginary)

**Electrical contrast**:
ρ_amorphous ≈ 1 Ω·m
ρ_crystalline ≈ 10⁻³ Ω·m
Ratio: 10³

**Switching mechanism**:
- Reset (amorphize): Melt-quench (high current, short pulse)
- Set (crystallize): Anneal (moderate current, longer pulse)

#### 6.9.2 GST Phase Change Dynamics

**Reset (amorphous)**:
1. High current pulse (I_reset ≈ 1-5 mA)
2. Joule heating → T > T_melt (620°C)
3. Rapid quench (ns) → amorphous
4. Pulse width: 1-10 ns

**Set (crystalline)**:
1. Moderate current (I_set ≈ 0.1-0.5 mA)
2. Heating to T_cryst (150-250°C)
3. Hold for crystallization time
4. Pulse width: 50-200 ns

**Crystallization time**:
τ_cryst = τ₀ exp(E_a/kT)
τ₀ ≈ 1 ns, E_a ≈ 2.3 eV
At 200°C: τ ≈ 10 ns
At 150°C: τ ≈ 1 μs

#### 6.9.3 Optical Properties for Phase Shifting

**Phase shift per unit length**:
Δθ/L = (2π/λ) Δn_eff
Δn_eff = Γ Δn (overlap factor)

**Overlap factor** (GST on waveguide):
Γ = ∫_{GST} |E|² dx / ∫_{all} |E|² dx
Typical: Γ = 0.1-0.3

**Phase shift for 2π**:
L_2π = λ / Δn_eff
For Δn_eff = 0.3: L_2π ≈ 5 μm
For Δn_eff = 0.1: L_2π ≈ 15 μm

**Insertion loss**:
Amorphous: low loss (κ ≈ 0.1)
Crystalline: higher loss (κ ≈ 1.5)
Loss difference: Δα ≈ 10-20 dB/cm

**Extinction ratio**:
ER = 10 log₁₀(P_cryst/P_amorph)
For L = 10 μm: ER ≈ 1-2 dB

#### 6.9.4 GST Integration Architectures

**1. Cladding PCM** (on top of waveguide):
- GST deposited on waveguide
- Evanescent coupling
- Low overlap (Γ ≈ 0.05-0.1)
- Longer devices needed

**2. Slot waveguide**:
- GST in low-index slot
- High field concentration
- Γ ≈ 0.3-0.5
- Short devices

**3. Hybrid waveguide**:
- GST as core layer
- Full overlap
- Γ ≈ 1
- Fabrication challenge

**4. Resonant enhancement**:
- GST in microring
- Resonance shift: Δλ/λ = Δn/n_g
- Large phase shift near resonance

#### 6.9.5 Electrical Design for Switching

**Heater design**:
- Resistive heater adjacent to GST
- Material: TiN, W, GST itself (self-heating)
- Thermal confinement critical

**Current density**:
J_reset ≈ 10⁷ A/cm²
J_set ≈ 10⁶ A/cm²

**Contact design**:
- Bottom/top electrodes
- Low resistance (W, TiN)
- Thermal isolation from contacts

**Pulse shaping**:
- Reset: fast rise (<1 ns), short (1-5 ns)
- Set: slower rise, longer (50-200 ns)
- Fall time critical for reset (quench rate)

#### 6.9.6 Non-Volatile Operation and Endurance

**Non-volatility**:
- States stable at room temperature
- Crystalline: > 10 years at 85°C
- Amorphous: metastable, crystallizes at 150°C

**Endurance**:
- GST: 10⁶ - 10⁹ cycles
- Failure: void formation, segregation
- Interface degradation

**Data retention**:
- Arrhenius: t_ret = τ₀ exp(E_a/kT)
- E_a ≈ 2.3 eV (crystallization)
- 10 years at 85°C (JEDEC standard)

**Cycling effects**:
- Resistance drift (amorphous)
- Threshold voltage drift
- Element segregation (Te-rich)

#### 6.9.7 Multi-Level Operation

**Intermediate states**:
Partial crystallization → intermediate n
Achieved by: partial reset, controlled set

**Number of levels**:
4-8 levels demonstrated (2-3 bits)
Limited by: resistance drift, read noise

**Applications**:
- Analog weights (not just phase)
- Neuromorphic: synaptic weights
- In-memory computing

#### 6.9.8 GST Phase Shifter Performance Metrics

| Parameter | Value |
|-----------|-------|
| Phase shift (2π) | 5-15 μm |
| Switching energy | 10-100 pJ |
| Switching time | 1-200 ns |
| Static power | 0 (non-volatile) |
| Loss (amorphous) | 1-2 dB |
| Loss (crystalline) | 3-5 dB |
| Extinction ratio | 1-3 dB |
| Endurance | 10⁶-10⁹ cycles |
| Retention | >10 years @ 85°C |

#### 6.9.9 Comparison with Other Phase Shifters

| Metric | Thermal | Carrier | EO (LiNbO₃) | MEMS | GST PCM |
|--------|---------|---------|-------------|------|---------|
| Static power | 3 mW/π | 0 | 0 | 0 | **0** |
| Speed | μs | ns | ps | ms | ns |
| Energy/π | N/A | 10 fJ | 1 fJ | 1 pJ | **10-100 pJ** |
| Loss | low | low | low | low | medium |
| Integration | native | native | hybrid | hybrid | **native** |
| Non-volatile | no | no | no | no | **yes** |
| Multi-level | no | limited | no | no | **yes** |

#### 6.9.10 GST Integration Challenges and Future

**Challenges**:
1. **Loss**: Crystalline loss limits cascade
2. **Drift**: Resistance drift affects analog precision
3. **Endurance**: 10⁶ cycles may limit training
4. **Integration**: CMOS-compatible but thermal budget
5. **Variability**: Device-to-device variation

**Solutions**:
- **Sb₂S₃, Sb₂Se₃**: Lower loss, lower Δn
- **GeTe**: Faster, higher endurance
- **Encapsulation**: Prevent oxidation, segregation
- **Interface engineering**: TiN/GST, W/GST
- **Pulse optimization**: Adaptive pulses

**Future directions**:
- **Integrated PCM memory + compute**: In-memory computing
- **Multi-bit PCM**: 4-8 levels for analog weights
- **Cryogenic PCM**: Operation at 4K
- **2D PCMs**: MoTe₂, WTe₂ (atomically thin)
- **Ferroelectric PCM**: HfZrO₂ (non-volatile, fast)

**Conclusion**: GST PCM is promising for inference (static weights) and low-power edge AI. Training requires high endurance solutions or hybrid approaches (PCM for static, thermal/carrier for dynamic).

---

*End of Piece 9. Next: Piece 10 - Adjoint Method for Mesh Gradient Computation*