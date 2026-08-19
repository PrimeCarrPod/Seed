# Document 10: Heterogeneous Integration and III-V/Silicon Epitaxy
## Piece 4: Quantum Dot Laser: 3D Carrier Confinement and Density of States

---

### 10.4 Quantum Dot Laser: 3D Carrier Confinement and Density of States

Quantum dot (QD) lasers represent the ultimate limit of carrier confinement in semiconductor lasers, offering superior temperature stability, low threshold current, and high differential efficiency. Their integration on silicon via heterogeneous integration is a key enabler for silicon photonic light sources.

#### 10.4.1 Quantum Confinement in Three Dimensions

**Quantum well (2D)**: Confinement in 1 dimension
- Density of states (DOS): Step function
- DOS(E) = m*/(πħ²) for E > E_n

**Quantum wire (1D)**: Confinement in 2 dimensions
- DOS(E) ∝ 1/√(E - E_n)
- Van Hove singularities at subband edges

**Quantum dot (0D)**: Confinement in 3 dimensions
- DOS(E): Series of delta functions
- DOS(E) = Σ_n δ(E - E_n)
- Atom-like discrete energy levels

**Confinement energies** (particle in 3D box):
E_n = E_e + E_hh
E_e = (ħ²π²/2m_e*) (n_x²/L_x² + n_y²/L_y² + n_z²/L_z²)
E_hh = (ħ²π²/2m_hh*) (n_x²/L_x² + n_y²/L_y² + n_z²/L_z²)

**Typical QD dimensions** (InAs/GaAs):
- Base: 20-30 nm
- Height: 2-5 nm
- Confinement energy: 0.5-1.0 eV (electrons), 0.1-0.3 eV (holes)

#### 10.4.2 Density of States and Gain Spectrum

**QD density of states** (including inhomogeneous broadening):
g(E) = (N_QD/√(2π)σ) exp[-(E-E₀)²/2σ²]
- N_QD = areal density (10¹⁰-10¹¹ cm⁻²)
- σ = inhomogeneous broadening (20-40 meV)
- E₀ = ground state energy

**Homogeneous broadening** (per QD):
γ_h = γ_rad + γ_nr + γ_deph
- γ_rad = 1/τ_rad ≈ 1 ns⁻¹
- γ_nr = non-radiative
- γ_deph = pure dephasing (phonons, ~1 ps⁻¹ at 300K)

**Gain coefficient**:
g(ω) = (πq²/ε₀ncm₀²) |M|² g(E) [f_e - f_h]
- M = dipole matrix element
- f_e, f_h = Fermi functions

**Gain bandwidth** (inhomogeneous):
Δλ_gain ≈ 2.35σ ≈ 50-100 nm
Much broader than QW (~10 nm)

#### 10.4.3 Carrier Dynamics in QDs

**Capture and relaxation**:
1. Carriers injected into wetting layer (WL)
2. Phonon-assisted capture into QD excited states
3. Relaxation to ground state (LO phonon emission)
4. Recombination (radiative/non-radiative)

**Capture time** (WL → QD):
τ_cap ≈ 1-10 ps (electrons), 10-100 ps (holes)
Limited by phonon bottleneck

**Relaxation time** (excited → ground):
τ_rel ≈ 0.1-1 ps (LO phonon cascade)

**Escape time** (ground → WL):
τ_esc = τ_cap exp(ΔE/kT)
ΔE = confinement energy
At 300K: τ_esc ~ ns-μs

#### 10.4.4 Rate Equations for QD Lasers

**QD ground state occupation**:
df/dt = (1-f)/τ_cap - f/τ_rad - f/τ_nr - fg

**Wetting layer carriers**:
dn_wl/dt = J/q - n_wl/τ_wl - n_wl/τ_cap

**Photon density**:
dS/dt = Γvg - S/τ_p + βn/τ_rad

**Threshold condition**:
g_th = α_i + α_m
α_i = internal loss, α_m = mirror loss

**Threshold current density**:
J_th = q d [n_tr + (α_i + α_m)/Γg₀]
Lower than QW due to δ-function DOS

#### 10.4.5 Temperature Sensitivity and T₀

**Characteristic temperature T₀**:
J_th(T) = J_0 exp(T/T₀)

**QW lasers**: T₀ ≈ 50-80 K
**QD lasers**: T₀ > 200 K (ideal), 100-150 K (real)

**High T₀ origin**:
- Carrier redistribution within inhomogeneous ensemble
- Carriers move to higher-energy QDs as T increases
- Total gain maintained

**Limiting factors**:
- Wetting layer states (carrier leakage)
- Excited state population
- Non-radiative recombination (Auger, SRH)
- Auger: C n³, C ∝ 1/V_QD

#### 10.4.6 Quantum Dot Lasers on Silicon

**Epitaxial approaches**:
1. **Direct growth**: InAs QDs on GaAs/Si
   - GaAs buffer on Si (ART, graded)
   - InAs QDs on GaAs
   - TDD < 10⁶ cm⁻² achievable

2. **Wafer bonding**: InAs QDs on InP → bond to Si
   - Higher material quality
   - Lower thermal budget

3. **Hybrid**: InAs QDs on GaAs → transfer print to Si
   - Flexible, high yield
   - Alignment challenges

**Performance on Si** (state-of-the-art):
- CW lasing at 20-80°C
- J_th ≈ 100-500 A/cm²
- P_out > 10 mW
- λ = 1.3 μm (O-band), 1.55 μm (C-band)

#### 10.4.7 Quantum Dot Laser Dynamics

**Modulation response**:
f_3dB = (1/2π) √(vg/τ_p - 1/τ_p²)
vg = differential gain × photon density

**Advantages over QW**:
- Higher f_3dB (lower gain compression)
- Higher differential gain
- Lower α-factor (chirp)

**Large-signal modulation**:
- Eye diagram open at 25-50 Gbps
- Low chirp: < 2 α-factor
- Suitable for 100G/400G coherent

**Gain compression**:
ε = (1/τ_cap + 1/τ_rel) / (vg²)
QD: lower ε than QW (carrier reservoir in WL)

#### 10.4.8 Quantum Dot Laser Integration Challenges

**Thermal management**:
- QDs on Si: buried in oxide/Si
- Poor thermal conductivity path
- Self-heating → T increase → J_th increase
- Solution: thin BOX, thermal vias, diamond heat spreader

**Electrical injection**:
- p-n junction across QD layer
- Current spreading in thin layers
- Contact resistance critical

**Optical coupling**:
- QD laser → Si waveguide
- Adiabatic taper, grating coupler
- Alignment tolerance: < 1 μm

**Reliability**:
- Defect generation at high current
- Catastrophic optical damage (COD)
- Dark line defects from TDD

#### 10.4.9 Quantum Dot Lasers for Optical Interconnects

**Datacenter requirements**:
- λ = 1310 nm (O-band) or 1550 nm (C-band)
- P_out > 2 mW per channel
- Modulation > 25 Gbps (NRZ), 50 Gbps (PAM-4)
- Power < 5 mW/Gbps

**QD laser advantages**:
- Low J_th → low power
- High T₀ → no TEC needed
- Broad gain → WDM compatible
- Low chirp → longer reach

**Integration schemes**:
1. **Direct growth**: III-V on Si, then process
2. **Micro-transfer printing**: QD lasers on Si
3. **Wafer bonding**: III-V on SiO₂/Si
4. **Flip-chip bonding**: III-V die on Si photonic IC

#### 10.4.9 Future: Quantum Dot Lasers for Quantum Computing

**Single-photon sources**:
- Single QD in cavity
- Purcell enhancement: F_p = 3Qλ³/4π²V
- g⁽²⁾(0) < 0.01 demonstrated

**Entangled photon pairs**:
- Biexciton-exciton cascade
- Polarization entanglement
- Fidelity > 99% in cavity

**Spin qubits**:
- Electron spin in QD
- T₂ > 1 ms (isotopically pure)
- Optical control, electrical readout

**QD laser arrays**:
- 1000+ lasers on single chip
- WDM for quantum communication
- Integrated with Si photonics

---

*End of Piece 4. Next: Piece 5 - Heterogeneous Integration: Micro-Transfer Printing (μTP) Yield Modeling*