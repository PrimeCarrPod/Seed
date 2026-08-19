# Document 1: Quantum Electrodynamics of Electron Transport in Silicon
## Piece 3: Quantum Mechanical Scattering Matrix for Electron-Impurity Interactions

---

### 1.3 Quantum Mechanical Scattering Matrix for Electron-Impurity Interactions

Ionized impurity scattering dominates at low temperatures and high doping concentrations in silicon. The scattering potential from a charged impurity at position R_i is the screened Coulomb (Yukawa) potential:

V(r) = (q²/4πε_s) e^{-q_s |r - R_i|} / |r - R_i|

where ε_s = 11.7ε₀ is the static dielectric constant of silicon, and q_s is the inverse screening length (Thomas-Fermi or Debye).

#### 1.3.1 Born Approximation and Scattering Amplitude

In the first Born approximation, the scattering amplitude for transition |k⟩ → |k'⟩ is:

f(k', k) = - (m*/2πħ²) ∫ V(r) e^{-i(k' - k)·r} d³r

For the Yukawa potential, the Fourier transform yields:

f(q) = - (m*q²/2πħ²ε_s) 1/(q² + q_s²)

where q = k' - k is the momentum transfer. The differential cross-section is:

dσ/dΩ = |f(q)|² = (m*²q⁴/4π²ħ⁴ε_s²) 1/(q² + q_s²)²

#### 1.3.2 Brooks-Herring and Conwell-Weisskopf Formulas

Integrating over solid angle gives the total scattering rate. Two screening models yield different results:

**Brooks-Herring (Thomas-Fermi screening, degenerate statistics):**
q_s² = 4πq² (∂n/∂E_F) = 4πq² g(E_F)

For parabolic bands: ∂n/∂E_F = m*k_F/π²ħ³

**Conwell-Weisskopf (Debye screening, non-degenerate):**
q_s² = 4πq²n/(k_BTε_s)

The Brooks-Herring mobility for n-type silicon:

μ_{BH} = (128√2π ε_s² (k_BT)^{3/2}) / (N_I q³ m*^{1/2} [ln(1 + β) - β/(1+β)])

where β = (2k_F/q_s)², N_I is ionized impurity concentration, and k_F = (3π²n)^{1/3}.

#### 1.3.3 Partial Wave Expansion and Phase Shifts

Beyond Born approximation, the full scattering matrix is obtained via partial wave expansion. The wavefunction asymptotically:

ψ(r) → e^{ikz} + f(θ) e^{ikr}/r

Expanding in spherical harmonics:

f(θ) = (1/k) Σ_{l=0}^∞ (2l+1) e^{iδ_l} sin δ_l P_l(cos θ)

The phase shifts δ_l are obtained by solving the radial Schrödinger equation:

[d²/dr² + k² - l(l+1)/r² - 2m*V(r)/ħ²] u_l(r) = 0

with boundary condition u_l(r) ~ sin(kr - lπ/2 + δ_l) as r → ∞.

For the Yukawa potential, no closed-form solution exists, but numerical integration yields phase shifts. The total cross-section:

σ_{tot} = (4π/k²) Σ_{l=0}^∞ (2l+1) sin² δ_l

The momentum relaxation cross-section (transport cross-section):

σ_{tr} = (4π/k²) Σ_{l=0}^∞ (l+1) sin²(δ_{l+1} - δ_l)

The mobility relates to σ_{tr} via:

μ = q/(m* n_I v_{th} σ_{tr})

where v_{th} = √(8k_BT/πm*) is thermal velocity.

#### 1.3.4 Scattering Matrix Elements in Second Quantization

The impurity potential in second quantization:

H_{imp} = Σ_{kk'} V_{k'k} c^†_{k'} c_k

with matrix element:

V_{k'k} = (1/Ω) Σ_i V(q) e^{-iq·R_i}

where Ω is crystal volume, q = k' - k, and V(q) = q²/ε_s(q² + q_s²).

For randomly distributed impurities, ensemble averaging gives:

⟨|V_{k'k}|²⟩ = (N_I/Ω) |V(q)|²

The scattering rate from Fermi's Golden Rule:

W_{k→k'} = (2π/ħ) (N_I/Ω) |V(q)|² δ(E_k - E_{k'})

#### 1.3.5 Correlation Effects and Clustered Impurities

At high doping (N_D > 10¹⁸ cm⁻³), impurities are not randomly distributed. Dopant clustering and correlation effects modify the structure factor:

S(q) = 1 + N_I ∫ [g(r) - 1] e^{-iq·r} d³r

where g(r) is the pair correlation function. For a correlated impurity distribution:

⟨|V_{k'k}|²⟩ = (N_I/Ω) |V(q)|² S(q)

This reduces scattering at small q (screening enhancement) but can increase large-angle scattering.

#### 1.3.6 Neutral Impurity Scattering

Neutral impurities (e.g., inactive dopants, defects) scatter via short-range potential. The cross-section is approximately constant (s-wave scattering):

σ₀ ≈ 4π a₀²

where a₀ is the scattering length. The scattering rate:

W_{neut} = (2π/ħ) N_{neut} |V₀|² g(E)

This mechanism becomes significant in highly compensated material or after irradiation damage.

#### 1.3.7 Surface Roughness Scattering in MOSFETs

In inversion layers, interface roughness at the Si/SiO₂ boundary causes scattering. The potential fluctuation:

δV(z) = (qN_s/C_{ox}) δ(x,y)

where δ(x,y) is the interface height variation with correlation length Λ and height Δ.

The scattering matrix element:

|M|² = (q²N_s²/2C_{ox}²) (Δ²Λ²) e^{-q²Λ²/4}

Scattering rate for subband i → j:

W_{ij} = (m*/πħ³) (q²N_s²Δ²Λ²/C_{ox}²) ∫_0^∞ q e^{-q²Λ²/4} / (q² + q_s²) dq

This limits mobility in nanoscale MOSFETs where inversion layer is pushed against the interface.

---

*End of Piece 3. Next: Piece 4 - Density of States Modification in Sub-3nm FinFET/GAA Channels*