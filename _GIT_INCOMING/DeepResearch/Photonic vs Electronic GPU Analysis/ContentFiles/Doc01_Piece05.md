# Document 1: Quantum Electrodynamics of Electron Transport in Silicon
## Piece 5: Fermi-Dirac Statistics and Pauli Blocking in Degenerate Channels

---

### 1.5 Fermi-Dirac Statistics and Pauli Blocking in Degenerate Channels

In heavily doped silicon and inversion layers of nanoscale MOSFETs, the electron gas becomes degenerate (E_F - E_C > k_BT), requiring full Fermi-Dirac statistics rather than Maxwell-Boltzmann approximation. The Pauli exclusion principle fundamentally modifies scattering rates, screening, and transport coefficients.

#### 1.5.1 Fermi-Dirac Distribution and Degeneracy Parameter

The equilibrium occupation of state |nk⟩ is:

f⁰(E) = 1 / [exp((E - E_F)/k_BT) + 1]

The degeneracy parameter η = (E_F - E_C)/k_BT determines the statistics regime:
- η ≪ -1: Non-degenerate (Maxwell-Boltzmann), f⁰ ≈ e^{-(E-E_F)/k_BT}
- η ≈ 0: Mildly degenerate
- η ≫ 1: Strongly degenerate, f⁰ ≈ Θ(E_F - E) (step function at T=0)

For silicon at 300K, N_C ≈ 2.8×10¹⁹ cm⁻³ (effective DOS). Doping N_D > 10¹⁹ cm⁻³ gives η > 0. In inversion layers, surface density n_s > 10¹³ cm⁻² yields 2D degeneracy.

#### 1.5.2 Fermi Integrals and Carrier Statistics

Carrier density in 3D:

n = N_C F_{1/2}(η) = (2/√π) N_C ∫_0^∞ √ε / (e^{ε-η} + 1) dε

where F_j(η) is the complete Fermi-Dirac integral of order j, ε = E/k_BT.

In 2D (inversion layer):

n_s = (m*k_BT/πħ²) ln(1 + e^η) = N_{2D} F_0(η)

where N_{2D} = m*k_BT/πħ², F_0(η) = ln(1+e^η).

In 1D (nanowire subband):

n_{1D} = (√2/π) (m*k_BT/ħ²)^{1/2} F_{-1/2}(η)

Asymptotic expansions:
- For η ≫ 1: F_j(η) ≈ η^{j+1}/Γ(j+2) [1 + π²j(j+1)/6η² + ...]
- For η ≪ -1: F_j(η) ≈ e^η

#### 1.5.3 Pauli Blocking Factor in Scattering Rates

The collision integral includes Pauli blocking factors:

W_{k→k'}^{blocked} = W_{k→k'}^0 (1 - f⁰_{k'})

where W^0 is the bare scattering rate without blocking. The (1 - f⁰) factor suppresses scattering into occupied states.

For elastic scattering at T=0 in a degenerate gas, only states within k_BT of E_F can scatter, because initial states below E_F are filled and final states above E_F are empty. The phase space for scattering is reduced by factor ~k_BT/E_F.

#### 1.5.4 Screening in Degenerate Electron Gas

The static dielectric function in random phase approximation (RPA):

ε(q,0) = 1 + q_s²/q²

where the Thomas-Fermi screening wavevector in 3D:

q_{TF}² = 4πq² (∂n/∂μ) = 4πq² g(E_F) = 4πq² (m*k_F/π²ħ³)

At T=0: q_{TF} = √(4k_F/πa₀*) where a₀* = ħ²ε_s/m*q² is effective Bohr radius.

In 2D: q_s = 2m*q²/ħ² (independent of density!)
In 1D: screening is logarithmic, weaker than 2D/3D.

Degenerate screening is more effective than non-degenerate (Debye) screening because ∂n/∂μ is larger at E_F.

#### 1.5.5 Impurity Scattering in Degenerate Regime

The Brooks-Herring formula with degeneracy:

μ_{imp} = (8√2π ε_s² ħ³) / (m*^{3/2} q³ N_I) × [η^{3/2} / (ln(1+β) - β/(1+β))]

where β = 4k_F²/q_s² = k_F/πq_{TF}. As doping increases, μ ∝ n^{-1/2} (vs. n^{-1} in non-degenerate).

The scattering rate averaged over Fermi surface:

⟨W⟩ = (1/n) ∫ W(k) f⁰(k) d³k/(2π)³

At T=0, only states on Fermi surface contribute, giving μ ∝ E_F^{3/2}/N_I.

#### 1.5.6 Phonon Scattering with Pauli Blocking

For acoustic phonon scattering in degenerate gas:

1/τ_{ac}(E_F) = (2π/ħ) (Ξ² k_BT / ρ v_s²) g(E_F) (1 - f⁰)

The (1 - f⁰) factor is ≈1 for final states above E_F. The energy dependence of g(E) is evaluated at E_F.

For optical phonon emission, the threshold energy E > ħω + E_F blocks emission from states below E_F - ħω. The scattering rate:

1/τ_{op} ∝ (n_{op} + 1) g(E - ħω) (1 - f⁰(E - ħω))

At low T, emission is only possible for electrons within ħω of E_F.

#### 1.5.7 Electron-Electron Scattering and Fermi Liquid Theory

In a degenerate Fermi gas, electron-electron (e-e) scattering is suppressed by Pauli blocking. The phase space for two-particle scattering scales as (T/T_F)², where T_F = E_F/k_B is Fermi temperature.

The e-e scattering rate:

1/τ_{ee} ∝ (T/T_F)² E_F

At room temperature in silicon (T_F ~ 1000K for n=10¹⁹ cm⁻³), T/T_F ~ 0.3, making e-e scattering non-negligible.

Fermi liquid theory describes the quasiparticle lifetime:

1/τ_{qp}(E) = a (E - E_F)² + b (πk_BT)²

The T² dependence of resistivity in metals (ρ ∝ T²) is a hallmark of Fermi liquid behavior. In doped silicon, phonon scattering dominates at 300K, but e-e scattering becomes important at low T and high doping.

#### 1.5.8 Degeneracy Effects on Thermoelectric Coefficients

The Seebeck coefficient (thermopower) in degenerate limit:

S = (π²/3) (k_B/q) (k_BT/E_F) [r + 3/2]

where r is the scattering exponent (τ ∝ E^r). For acoustic phonons r = -1/2, giving S ∝ T.

The Wiedemann-Franz law for thermal conductivity:

κ_e = L₀ σ T

with Lorenz number L₀ = π²/3 (k_B/q)² = 2.44×10⁻⁸ WΩ/K² for degenerate gas. In non-degenerate limit, L = 2(k_B/q)².

#### 1.5.9 Quantum Capacitance in Degenerate Channels

The quantum capacitance relates density change to Fermi level shift:

C_Q = q² (∂n/∂E_F) = q² g(E_F)

In 2D: C_Q = q² m*/πħ² (constant!)
In 1D: C_Q = (q²/πħ) √(2m*/E - E₀) (diverges at subband edge)

For a MOS capacitor, total gate capacitance:

1/C_g = 1/C_{ox} + 1/C_Q

In strong inversion with degenerate 2DEG, C_Q ≈ 1.5-2 μF/cm² for m* = 0.19m₀, comparable to C_{ox} for thin oxides, limiting gate control.

#### 1.5.10 High-Field Transport in Degenerate Channels

Under high electric fields, the distribution function develops a high-energy tail. The effective electron temperature T_e > T_L (lattice temperature). The energy balance equation:

(3/2) n k_B dT_e/dt = q n v_d F - (3/2) n k_B (T_e - T_L)/τ_E

In degenerate gas, the heat capacity is C_e = (π²/3) n k_B (T_e/T_F), much smaller than classical (3/2)nk_B. This causes faster heating for same power input.

The hot-electron distribution can be approximated by a displaced Fermi-Dirac:

f(E) ≈ 1/[exp((E - E_F - q v_d·x)/k_B T_e) + 1]

This "heated Fermi-Dirac" form preserves the Pauli blocking structure while capturing carrier heating.

---

*End of Piece 5. Next: Piece 6 - Matthiessen's Rule Breakdown at Cryogenic vs. Operating Temperatures*