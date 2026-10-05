# Document 1: Quantum Electrodynamics of Electron Transport in Silicon
## Piece 10: Quantum Tunneling Leakage Currents in Angstrom-Scale Gate Oxides

---

### 1.10 Quantum Tunneling Leakage Currents in Angstrom-Scale Gate Oxides

As gate oxides scale below 2 nm (20 Å), quantum mechanical tunneling becomes the dominant leakage mechanism, replacing thermionic emission. At the 3nm technology node with equivalent oxide thickness (EOT) ~ 0.5-0.7 nm, direct tunneling and Fowler-Nordheim tunneling currents exceed acceptable limits, necessitating high-κ dielectrics and metal gates.

#### 1.10.1 Tunneling Mechanisms in MOS Structures

Three primary tunneling mechanisms in gate stacks:

1. **Direct Tunneling (DT)**: Carriers tunnel through the entire barrier at energies below the barrier top. Dominant for EOT < 2 nm at low V_G.

2. **Fowler-Nordheim (FN) Tunneling**: Carriers tunnel through a triangular barrier at high field (V_G > 1 V for thin oxides). Field emission from inversion layer or gate.

3. **Trap-Assisted Tunneling (TAT)**: Multi-step tunneling via defect states in the oxide. Dominates at intermediate fields and in high-κ dielectrics with high trap density.

#### 1.10.2 Direct Tunneling: WKB and Exact Solutions

For a rectangular barrier of height φ_B and thickness t_ox, the transmission coefficient using WKB approximation:

T(E) = exp(-2 ∫_0^{t_ox} κ(x) dx)

where κ(x) = √(2m_ox*(φ_B - E))/ħ for E < φ_B.

For trapezoidal barrier under bias V_G:
κ(x) = √(2m_ox*(φ_B - E - qV_G x/t_ox))/ħ

The tunneling current density (electron from Si to gate):

J_{DT} = (q m_{Si} k_B T / 2π² ħ³) ∫ T(E) ln[1 + exp((E_F - E)/k_BT)] dE

For low temperature and E_F well above E_C:
J_{DT} ≈ (q m_{Si} / 4π² ħ³) ∫_0^{E_F} T(E) (E_F - E) dE

#### 1.10.3 Fowler-Nordheim Tunneling: Triangular Barrier

At high gate bias, the barrier becomes triangular. The FN transmission coefficient:

T_{FN}(E) = exp[-(4√(2m_ox*)/3ħqF) (φ_B - E)^{3/2}]

where F = V_G/t_ox is the oxide field.

The FN current density:

J_{FN} = A_{FN} F² exp(-B_{FN}/F)

with:
A_{FN} = q³ / (16π² ħ φ_B)
B_{FN} = (4√(2m_ox*)/3ħq) φ_B^{3/2}

For SiO₂: φ_B = 3.1 eV (electrons), m_ox* = 0.42 m₀
B_{FN} ≈ 6.7×10⁷ V/cm

FN plot: ln(J/F²) vs. 1/F gives straight line with slope -B_{FN}.

#### 1.10.4 High-κ Dielectrics: Modified Barrier Heights and Masses

High-κ materials (HfO₂, ZrO₂, Al₂O₃, La₂O₃) enable physical thickness > 1 nm while achieving EOT < 1 nm.

Key parameters for common high-κ:
| Material | κ | φ_B (e⁻) (eV) | m*/m₀ | E_g (eV) |
|----------|---|----------------|-------|----------|
| SiO₂ | 3.9 | 3.1 | 0.42 | 9.0 |
| HfO₂ | 20-25 | 1.5-1.7 | 0.15-0.3 | 5.8 |
| ZrO₂ | 20-25 | 1.4-1.6 | 0.2-0.3 | 5.8 |
| Al₂O₃ | 9-10 | 2.8 | 0.35 | 8.8 |
| La₂O₃ | 25-30 | 2.3 | 0.3 | 6.0 |

Lower barrier height and lower effective mass in high-κ increase tunneling probability. The EOT scaling:

EOT = t_ox × (κ_{SiO₂}/κ_{high-κ}) + t_{IL}

where t_{IL} is interfacial layer (SiO₂ or SiON) thickness (~0.5 nm minimum).

#### 1.10.5 Multi-Layer Stack Tunneling: Transfer Matrix Method

For gate stacks with IL + high-κ + metal gate, the exact transmission coefficient is computed via transfer matrix method (TMM).

For N layers with potentials V_i and masses m_i, the wavefunction in layer i:

ψ_i(x) = A_i e^{ik_i x} + B_i e^{-ik_i x}

with k_i = √(2m_i(E - V_i))/ħ (propagating) or κ_i = √(2m_i(V_i - E))/ħ (evanescent).

Matching boundary conditions at each interface (ψ and (1/m) dψ/dx continuous) gives the transfer matrix M:

[ψ_{i+1}; (1/m_{i+1}) ψ'_{i+1}] = M_i [ψ_i; (1/m_i) ψ'_i]

Total matrix M_total = M_N ... M_1. Transmission:

T = |2k₁ / (M_{11} k₁ + M_{12} k₁ k_{N+1} + M_{21} + M_{22} k_{N+1})|²

This captures resonant tunneling through quantum well states in the high-κ layer.

#### 1.10.6 Trap-Assisted Tunneling (TAT) in High-κ

Defects in high-κ (oxygen vacancies, Hf vacancies) create trap levels in the bandgap. TAT current:

J_{TAT} = q ∫ N_t(E_t) f(E_t) c_n(E) c_p(E) dE_t

where N_t is trap density, c_n, c_p are capture/emission coefficients.

For a single trap level at E_t:
c_n = σ_n v_{th} T_{1}(E_t) (tunneling from Si to trap)
c_p = σ_p v_{th} T_{2}(E_t) (tunneling from trap to gate)

where T_1, T_2 are tunneling probabilities to/from trap.

TAT dominates at intermediate fields where DT is small and FN is not yet active. It causes:
- Increased leakage at low V_G
- Bias temperature instability (BTI) degradation
- Random telegraph noise (RTN)

#### 1.10.7 Band-to-Band Tunneling (BTBT) in Source/Drain Junctions

In ultra-short channels, band-to-band tunneling at drain junction causes off-state leakage (GIDL - gate-induced drain leakage).

BTBT generation rate (Kane model):

G_{BTBT} = A E^{1/2} exp(-B/E)

where E is electric field at junction, A, B are material constants.

For silicon: B ≈ 1.5×10⁷ V/cm

The tunneling current:
I_{BTBT} = q ∫ G_{BTBT} dV

In TFETs (tunnel FETs), BTBT is the intentional turn-on mechanism, enabling sub-60 mV/dec subthreshold swing.

#### 1.10.8 Quantum Confinement in Inversion Layer

The inversion layer is a triangular quantum well. The subband energies:

E_n = (3π/2 ħ q F_{eff} / √(2m*))^{2/3} (n - 1/4)^{2/3}

where F_{eff} is effective vertical field.

For (100) Si surface, m* = m_t = 0.19 m₀ for Δ₄ valleys. The first subband:
E_1 ≈ 30-50 meV above E_C (vs. 0 for classical).

This raises the effective barrier for tunneling by E_1, reducing leakage. The centroid of inversion layer is ~1.5-2 nm from interface.

#### 1.10.9 Gate Leakage Specifications and Technology Scaling

ITRS/IRDS gate leakage targets:
- High-performance (HP): J_g < 1-10 A/cm² at V_DD
- Low-power (LP): J_g < 0.01-0.1 A/cm²
- Low standby power (LSTP): J_g < 10⁻⁶ A/cm²

For 3nm node (V_DD ≈ 0.65V, EOT ≈ 0.6 nm):
- SiO₂ (impossible): J_g > 10⁶ A/cm²
- HfO₂ (t_phys = 2 nm, EOT = 0.6 nm): J_g ≈ 1-10 A/cm² (meets HP)
- La₂O₃/Al₂O₃ laminate: J_g < 0.1 A/cm² (meets LP)

#### 1.10.10 Future Directions: 2D Materials and Negative Capacitance

**2D material channels (MoS₂, WSe₂, BP)**:
- Atomically thin, no dangling bonds
- Bandgap ~1-2 eV (MoS₂: 1.8 eV direct in monolayer)
- Tunneling from 2D channel: different density of states
- van der Waals integration avoids lattice mismatch

**Negative Capacitance FET (NCFET)**:
- Ferroelectric HfZrO₂ (HZO) as gate dielectric
- Negative capacitance amplifies surface potential
- Sub-60 mV/dec swing reduces V_DD, reduces leakage
- Internal voltage amplification: V_ch = V_G / (1 - C_ox/C_FE)

**Quantum engineering of barriers**:
- Graded composition (HfSiO, HfAlO) for smoother barriers
- Dipole engineering at interfaces
- Strain engineering of effective mass

---

*End of Piece 10. Document 1 complete (10 pieces). Next: Glue pieces into Doc01_Final.md*