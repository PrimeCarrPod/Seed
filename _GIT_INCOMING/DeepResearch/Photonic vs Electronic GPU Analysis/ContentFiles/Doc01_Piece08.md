# Document 1: Quantum Electrodynamics of Electron Transport in Silicon
## Piece 8: Electromigration Physics: Black's Equation Derivation from Vacancy Diffusion

---

### 1.8 Electromigration Physics: Black's Equation Derivation from Vacancy Diffusion

Electromigration (EM) is the mass transport of metal atoms in interconnects due to momentum transfer from current-carrying electrons. It is the primary wear-out mechanism in copper interconnects, causing void formation (open circuits) and hillock extrusion (short circuits). The physics derives from vacancy diffusion under combined thermal and electrical driving forces.

#### 1.8.1 Electron-Wind Force and Effective Charge

The driving force for electromigration is the electron-wind force:

F_{ew} = Z* e E = Z* e ρ J

where Z* is the effective charge number (Z* ≈ +1 to +3 for Cu), e is elementary charge, E is electric field, ρ is resistivity, and J is current density.

The effective charge Z* has two components:
- **Direct force**: Electrostatic force on ion core (Z_direct = valence - screening)
- **Wind force**: Momentum transfer from scattering electrons (dominant)

For copper: Z* ≈ +1.5 to +2.5 (experimental), positive means atoms move in electron flow direction (toward anode).

#### 1.8.2 Vacancy Diffusion Equation with Driving Forces

The vacancy flux J_v is driven by gradients in chemical potential μ_v:

J_v = -D_v C_v ∇μ_v / k_BT

where D_v is vacancy diffusivity, C_v is vacancy concentration. The chemical potential includes thermal and electrical contributions:

μ_v = μ_v⁰ + k_BT ln(C_v/C_v⁰) - Z* e φ + Ω σ_h

where φ is electrostatic potential, Ω is atomic volume, σ_h is hydrostatic stress.

The vacancy flux becomes:

J_v = -D_v [∇C_v - (C_v Z* e / k_BT) ∇φ + (C_v Ω / k_BT) ∇σ_h]

#### 1.8.3 Steady-State Vacancy Distribution in Interconnect

For a uniform interconnect with constant cross-section A, the steady-state vacancy concentration profile satisfies ∇·J_v = 0:

d/dx [D_v (dC_v/dx - (C_v Z* e / k_BT) E + (C_v Ω / k_BT) dσ_h/dx)] = 0

In the absence of stress gradients (early stage EM):

dC_v/dx = (C_v Z* e / k_BT) E

Integrating from cathode (x=0) to anode (x=L):

C_v(x) = C_v(0) exp(Z* e E x / k_BT)

Vacancies accumulate at the anode (x=L), deplete at cathode. The vacancy supersaturation at anode:

S = C_v(L)/C_v⁰ = exp(Z* e E L / k_BT)

For typical conditions (J = 1 MA/cm², L = 100 μm, T = 350K):
Z* e E L / k_BT ≈ 1.5 × (1.7×10⁻⁸ Ω·m × 10¹⁰ A/m²) × 10⁻⁴ m / (4.8×10⁻²¹ J) ≈ 0.53
S ≈ 1.7 (moderate supersaturation)

#### 1.8.4 Void Nucleation and Growth Kinetics

Voids nucleate when vacancy supersaturation exceeds critical value. The nucleation rate:

I = I₀ exp(-ΔG*/k_BT)

where ΔG* = 16πγ³/3(Δμ)² is nucleation barrier, γ is surface energy, Δμ = k_BT ln S is chemical potential difference.

Once nucleated, void grows by vacancy absorption. For a spherical void of radius r:

dr/dt = D_v Ω C_v⁰ (S - 1) / r

The time to grow from critical radius r* to failure radius r_f:

t_g = (r_f² - r*²) / [2 D_v Ω C_v⁰ (S - 1)]

#### 1.8.5 Blech Length: The Critical Product J·L

Blech discovered that EM failure does not occur if the product J·L is below a critical value (Blech length L_B). This arises from stress buildup counteracting electron wind.

The hydrostatic stress gradient balances electron wind at steady state:

Ω dσ_h/dx = Z* e E

Integrating: σ_h(x) = σ_h(0) + (Z* e E / Ω) x

The stress is limited by yield strength σ_y of the metal. Maximum sustainable stress gradient:

(dσ_h/dx)_{max} = σ_y / L

Equating to electron wind force gives the Blech criterion:

J L ≤ (σ_y Ω) / (Z* e ρ) ≡ (J L)_{crit}

For copper: σ_y ≈ 400 MPa, Ω ≈ 1.18×10⁻²⁹ m³, Z* ≈ 2, ρ ≈ 1.7×10⁻⁸ Ω·m
(J L)_{crit} ≈ 1.4×10⁴ A/cm

Interconnects with J·L below this value are "immortal" (no EM failure).

#### 1.8.6 Black's Equation: Empirical Lifetime Model

Black's equation gives the mean time to failure (MTTF) for EM:

MTTF = A J^{-n} exp(E_a / k_BT)

where:
- A: Constant depending on geometry, material, microstructure
- J: Current density
- n: Current density exponent (n ≈ 2 for pure EM, n ≈ 1 for stress-induced voiding)
- E_a: Activation energy (E_a ≈ 0.7-0.9 eV for Cu grain boundary diffusion)
- T: Temperature

**Derivation from vacancy diffusion:**

The void growth time to failure t_f ∝ 1/(D_v C_v⁰ S)

With D_v = D₀ exp(-E_a/k_BT) and C_v⁰ = exp(-E_f/k_BT) (formation energy E_f)
And S - 1 ≈ Z* e E L / k_BT = Z* e ρ J L / k_BT for small argument

Thus:
t_f ∝ (k_BT / J) exp((E_a + E_f)/k_BT)

The apparent activation energy E_app = E_a + E_f ≈ 0.7 + 1.3 = 2.0 eV (but measured ~0.8 eV because E_f is not rate-limiting; vacancy supply from sources/sinks dominates).

The current exponent n = 1 for pure EM (linear in J), but n = 2 is often used as empirical fit including stress effects.

#### 1.8.7 Microstructural Effects: Grain Boundaries vs. Bulk Diffusion

Diffusion paths in copper interconnects:
1. **Grain boundary diffusion** (dominant in bamboo/near-bamboo structures): D_gb = D₀_gb exp(-E_gb/k_BT), E_gb ≈ 0.7-0.8 eV
2. **Surface/interface diffusion**: D_s = D₀_s exp(-E_s/k_BT), E_s ≈ 0.5-0.6 eV
3. **Bulk diffusion**: D_b = D₀_b exp(-E_b/k_BT), E_b ≈ 2.0 eV (negligible at operating T)

In fine-grained Cu (grain size < line width), grain boundaries form percolation network. In bamboo structure (grain size > line width), grain boundaries are perpendicular to current, forcing diffusion along interfaces.

The effective diffusivity:

D_{eff} = f_gb D_gb + f_s D_s + (1 - f_gb - f_s) D_b

where f_gb, f_s are volume fractions of grain boundary and surface paths.

#### 1.8.8 Copper vs. Aluminum Electromigration

| Property | Aluminum | Copper |
|----------|----------|--------|
| Resistivity ρ (μΩ·cm) | 2.7 | 1.7 |
| Activation energy E_a (eV) | 0.5-0.6 (GB) | 0.7-0.9 (GB) |
| Z* | +1 to +2 | +1.5 to +2.5 |
| Blech length (JL)_crit | ~4000 A/cm | ~14000 A/cm |
| Self-heating (ρJ²) | Higher | Lower |
| EM lifetime at same J | Baseline | 10-100× better |

Copper's higher E_a and lower ρ give dramatically better EM resistance, enabling higher current densities in advanced nodes.

#### 1.8.9 Stress Migration and Thermomigration

**Stress migration (SM)**: Mass transport due to thermal stress gradients during cooling from deposition temperature. No current required. Void formation at stress maxima.

**Thermomigration**: Mass transport due to temperature gradient ∇T:
J_Q = -D C Q* ∇T / k_BT²
where Q* is heat of transport (≈ 1-2 eV for Cu).

In high-power AI chips, all three (EM, SM, thermomigration) couple:
J_total = J_EM + J_SM + J_thermo

#### 1.8.10 EM-Aware Design Rules and Lifetime Prediction

Modern EM sign-off uses:
1. **Current density limits**: J_max(T, width, length, via count)
2. **Blech product check**: J·L < (JL)_crit for short segments
3. **Via arrays**: Multiple vias share current, reduce J per via
4. **Redundant vias**: N+1 rule for critical nets
5. **Corner bends**: Current crowding at bends increases local J
6. **Temperature-aware**: Local T from thermal simulation

Black's equation with n=2, E_a=0.8 eV for Cu:
MTTF(10 yr) at 125°C, J=1 MA/cm² → MTTF ≈ 50 years at 0.5 MA/cm²

For 3nm node with J_max = 2-3 MA/cm² and T_junction = 100-120°C, EM margins are tight, requiring careful sign-off.

---

*End of Piece 8. Next: Piece 9 - Hot Carrier Injection and Si-SiO₂ Interface Trap Generation*