# Document 1: Quantum Electrodynamics of Electron Transport in Silicon
## Piece 9: Hot Carrier Injection and Si-SiO₂ Interface Trap Generation

---

### 1.9 Hot Carrier Injection and Si-SiO₂ Interface Trap Generation

Hot Carrier Injection (HCI) is a degradation mechanism in MOSFETs where high-energy carriers (electrons in nMOS, holes in pMOS) gain sufficient energy from the lateral electric field near the drain to overcome the Si/SiO₂ barrier (3.1 eV for electrons, 4.5 eV for holes) and inject into the gate oxide. This causes interface trap generation, oxide trapped charge, and threshold voltage shift.

#### 1.9.1 Energy Distribution of Hot Carriers

Under high drain bias (V_D > V_G - V_th), the lateral field near drain exceeds 10⁵ V/cm. Carriers are heated above the lattice temperature. The energy distribution function develops a high-energy tail.

For electrons in the channel, the average energy is:

⟨E⟩ = (3/2) k_B T_e

where T_e is electron temperature. The energy balance equation:

d(⟨E⟩)/dt = q v_d F - (⟨E⟩ - (3/2)k_B T_L)/τ_E

The steady-state electron temperature:

T_e = T_L + (2/3) q τ_E v_d F / k_B

For v_d = 10⁷ cm/s, F = 2×10⁵ V/cm, τ_E ≈ 0.3 ps:
T_e ≈ 300K + 1200K ≈ 1500K

The high-energy tail follows a heated Maxwellian or Druyvesteyn distribution:

f(E) ∝ exp(-E/k_B T_e) (heated Maxwellian)
f(E) ∝ exp(-E²/E₀²) (Druyvesteyn, better for high fields)

#### 1.9.2 Injection Probability: Lucky Electron Model

The "lucky electron" model (Kyi et al.) calculates injection probability:

P_inj = P_{gain} × P_{trans} × P_{coll}

1. **P_gain**: Probability to gain energy > 3.1 eV without scattering
   For mean free path λ_e and threshold energy E_th:
   P_{gain} = exp(-∫ dx / λ_e(E(x)))
   With E(x) = q ∫ F(x') dx' (energy gained from field)

2. **P_trans**: Transmission probability through Si/SiO₂ interface
   Using WKB approximation for trapezoidal barrier:
   P_trans = exp(-2 ∫ √(2m_ox*(V(x)-E)/ħ²) dx)
   For 3.1 eV barrier, 5 nm oxide, E = 3.5 eV: P_trans ≈ 10⁻⁴

3. **P_coll**: Probability of no collision in oxide
   P_coll = exp(-t_ox / λ_ox)

Total injection probability per channel electron:
P_inj ≈ 10⁻⁶ to 10⁻⁴ depending on V_D, V_G

#### 1.9.3 Substrate Current as HCI Monitor

Injected holes (for nMOS) flow to substrate, creating measurable substrate current I_sub:

I_sub = I_D × P_inj × (hole collection efficiency)

The substrate current peaks at V_G ≈ V_D/2 (maximum lateral field near drain). The HCI degradation rate correlates with I_sub:

d(ΔV_th)/dt ∝ I_sub

This allows non-destructive monitoring of HCI stress.

#### 1.9.4 Interface Trap Generation Mechanism

Injected hot carriers create interface traps (P_b centers) via several mechanisms:

1. **Hydrogen release model**:
   Hot electrons break Si-H bonds at interface:
   ≡Si-H + e_hot → ≡Si· + H⁺ + e⁻
   The hydrogen ion diffuses into oxide, leaving a dangling bond (P_b center).

2. **Hot hole injection** (pMOS):
   Holes inject from drain into valence band, create interface traps via similar mechanism.

3. **Oxide trap generation**:
   Hot electrons create electron-hole pairs in oxide (impact ionization):
   e_hot + SiO₂ → e + e + h
   Holes trap at pre-existing defects (E' centers, peroxy radicals).

4. **Anode hole injection** (AHI):
   Injected electrons reach gate anode, inject holes back into oxide (secondary injection).

#### 1.9.5 Reaction-Diffusion Model for Trap Growth

The reaction-diffusion (R-D) model (McPherson, Stathis) describes trap generation kinetics:

∂N_it(x,t)/∂t = k_f [H⁰] N₀ - k_r [H⁰] N_it

where N_it is interface trap density, N₀ is precursor density, [H⁰] is neutral hydrogen concentration.

Hydrogen diffusion in oxide:
∂[H⁰]/∂t = D_H ∂²[H⁰]/∂x² - k_f [H⁰] N₀ + k_r [H⁰] N_it

Boundary conditions:
- At Si/SiO₂ (x=0): [H⁰] determined by H₂ dissociation equilibrium
- At gate (x=t_ox): [H⁰] = 0 (hydrogen scavenged by gate)

The model predicts:
- N_it ∝ t^n with n ≈ 0.25-0.3 (power-law time dependence)
- ΔV_th ∝ N_it ∝ t^n
- Recovery: N_it decreases when stress removed (hydrogen re-passivates)

#### 1.9.6 HCI Degradation Metrics

Key degradation parameters:

1. **Threshold voltage shift**:
   ΔV_th = q N_it / C_ox + ΔV_{ox}
   where ΔV_{ox} is oxide trapped charge contribution.

2. **Transconductance degradation**:
   Δg_m/g_m₀ ≈ - (ΔV_th / (V_G - V_th)) (for linear region)
   Worse in saturation due to mobility degradation.

3. **Drain current degradation**:
   ΔI_D/I_D₀ at fixed V_G, V_D

4. **Subthreshold swing degradation**:
   ΔS = (k_BT/q) ln(10) × (q N_it / C_ox)

5. **Off-state leakage increase**:
   GIDL (gate-induced drain leakage) increases due to interface traps near drain.

#### 1.9.7 Channel Hot Electron (CHE) vs. Drain Avalanche Hot Carrier (DAHC)

**CHE (V_G ≈ V_D/2)**:
- Maximum substrate current
- Peak lateral field near drain
- Electrons gain energy from channel field
- Dominant in long-channel devices

**DAHC (V_G ≈ V_D)**:
- Avalanche multiplication at drain junction
- Hot electrons/holes from impact ionization
- Holes inject into oxide (pMOS) or create traps
- Dominant in short-channel devices

**Secondary Generated Hot Electron (SGHE)**:
- Holes from avalanche create electron-hole pairs
- Secondary electrons inject into oxide

#### 1.9.8 Temperature Dependence of HCI

HCI degradation shows complex temperature dependence:

- **Low T (< 200K)**: Carriers cool less efficiently (phonon freeze-out), higher T_e, more injection
- **Room T**: Peak degradation (optimal balance of energy gain and scattering)
- **High T (> 400K)**: Increased phonon scattering reduces T_e, less injection

The activation energy for HCI degradation:
E_a ≈ 0.1-0.2 eV (weak temperature dependence)

This weak T-dependence distinguishes HCI from time-dependent dielectric breakdown (TDDB) which has E_a ≈ 1-2 eV.

#### 1.9.9 HCI in Advanced Nodes: Geometry and Material Effects

**FinFET/GAA effects**:
- 3D confinement changes density of states
- Corner effects: field crowding at fin corners
- Self-heating: buried oxide (BOX) in SOI/FinFET reduces thermal dissipation
- Strain: tensile strain increases electron mobility, may increase HCI

**High-κ/metal gate**:
- Higher κ reduces E_ox for same V_G, reducing injection
- Metal gate work function tuning affects V_th, changes operating point
- Remote phonon scattering from high-κ reduces mobility, may reduce HCI

**LDD (Lightly Doped Drain)**:
- Reduces peak lateral field
- Spreads voltage drop over longer distance
- Standard feature since 0.5μm node

#### 1.9.10 HCI Lifetime Projection and Circuit Impact

Lifetime projection uses accelerated stress:
- Stress at high V_D, V_G, T
- Measure ΔV_th(t)
- Extrapolate to use conditions using power-law: ΔV_th = A t^n
- Voltage acceleration: log(ΔV_th) ∝ 1/V_D^m (m ≈ 2-4)

Circuit-level impact:
- Analog: Gain reduction, offset increase, noise increase
- Digital: Delay increase, noise margin reduction
- SRAM: Read/write margin degradation, cell stability loss

Design mitigation:
- Guard-banding V_DD
- Adaptive body bias
- Circuit aging sensors
- Redundancy and error correction

---

*End of Piece 9. Next: Piece 10 - Quantum Tunneling Leakage Currents in Angstrom-Scale Gate Oxides*