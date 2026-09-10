# DOC-02: Quantum Chromodynamics — Non-Abelian Gauge Theory of the Strong Force

## 2.1 The SU(3)_c Color Gauge Group

Quantum Chromodynamics (QCD) is the non-abelian gauge theory describing the strong interaction between quarks and gluons. The theory is built upon the local symmetry group SU(3)_c, where the fundamental charge is not electric, but "color"—labeled conventionally as red, green, and blue to denote three orthogonal quantum states in the fundamental representation of SU(3). The subscript 'c' distinguishes color SU(3) from the flavor SU(3) of the eightfold way and the electroweak SU(3) that does not exist.

The group SU(3) consists of 3×3 complex unitary matrices U with determinant 1: U†U = 1, det U = 1. Its Lie algebra su(3) consists of 3×3 traceless Hermitian matrices. A basis for su(3) is given by the eight Gell-Mann matrices λ^a (a = 1,...,8):

λ^1 = (0 1 0; 1 0 0; 0 0 0),  λ^2 = (0 -i 0; i 0 0; 0 0 0),  λ^3 = (1 0 0; 0 -1 0; 0 0 0)
λ^4 = (0 0 1; 0 0 0; 1 0 0),  λ^5 = (0 0 -i; 0 0 0; i 0 0),  λ^6 = (0 0 0; 0 0 1; 0 1 0)
λ^7 = (0 0 0; 0 0 -i; 0 i 0),  λ^8 = (1/√3) (1 0 0; 0 1 0; 0 0 -2)

These satisfy the commutation relations [λ^a/2, λ^b/2] = i f^{abc} λ^c/2, where f^{abc} are the completely antisymmetric structure constants of SU(3). The non-zero f^{abc} are:
f^{123} = 1,  f^{147} = f^{246} = f^{257} = f^{345} = f^{367} = 1/2,
f^{156} = f^{345} = -1/2,  f^{458} = f^{678} = √3/2.

The quadratic Casimir operators are:
C_F = (N^2 - 1)/(2N) = 4/3 for the fundamental representation (quarks),
C_A = N = 3 for the adjoint representation (gluons),
T_F = 1/2 for the normalization Tr(T^a T^b) = T_F δ^{ab}.

## 2.2 Quark Fields and Flavor Structure

Quarks are Dirac spinor fields ψ_f^i(x) carrying two indices: a flavor index f = u, d, s, c, b, t (six flavors) and a color index i = 1,2,3 (fundamental representation of SU(3)_c). The Lagrangian treats each flavor identically except for the mass term. The left-handed and right-handed components transform independently under chiral symmetry (discussed in DOC-04), but under SU(3)_c they both transform in the fundamental representation:

ψ_f(x) → U(x) ψ_f(x),  where U(x) = exp(i θ^a(x) λ^a/2) ∈ SU(3)_c.

The Dirac adjoint is ψ̄_f = ψ_f† γ^0. The kinetic term for a free quark of flavor f and mass m_f is ψ̄_f (i γ^μ ∂_μ - m_f) ψ_f. Summing over flavors gives the free quark Lagrangian.

## 2.3 The QCD Lagrangian Density

The full QCD Lagrangian density, encapsulating the kinetic and interaction behavior of the constituent fields, is:

L_QCD = Σ_f ψ̄_f (i γ^μ D_μ - m_f) ψ_f - 1/4 G^a_μν G^{a μν}

where the sum runs over the six quark flavors. The critical element is the **gauge covariant derivative**:

D_μ = ∂_μ + i g_s T^a G^a_μ

Here g_s is the strong coupling constant (related to α_s = g_s^2/4π), T^a = λ^a/2 are the generators of SU(3) in the fundamental representation, and G^a_μ are the eight gluon vector fields (gauge potentials). The covariant derivative ensures that the Lagrangian remains invariant under local SU(3)_c transformations. It generalizes the partial derivative to act directly on the field, respecting how coordinate systems in the internal color space change from place to place in spacetime.

Under a local gauge transformation U(x) = exp(i θ^a(x) T^a):
ψ_f(x) → U(x) ψ_f(x)
G_μ(x) = G^a_μ(x) T^a → U(x) G_μ(x) U†(x) + (i/g_s) U(x) ∂_μ U†(x)
D_μ ψ_f → U(x) D_μ ψ_f

The gluon field strength tensor is defined as the commutator of covariant derivatives:

[D_μ, D_ν] = i g_s G_μν = i g_s G^a_μν T^a

Explicitly:
G^a_μν = ∂_μ G^a_ν - ∂_ν G^a_μ - g_s f^{abc} G^b_μ G^c_ν

This final term, -g_s f^{abc} G^b_μ G^c_ν, is physically profound. It dictates that gluons, the force carriers of the theory, carry color charge themselves. Unlike the photons of Quantum Electrodynamics (QED), which are electrically neutral because U(1) is abelian, gluons interact with one another. The non-abelian nature of SU(3) means the gauge fields transform in the adjoint representation and the field strength contains the non-linear self-interaction terms.

## 2.4 Gluon Self-Interactions: Three- and Four-Gluon Vertices

Expanding the Yang-Mills term -1/4 G^a_μν G^{a μν} using the expression for G^a_μν yields:

L_YM = -1/4 (∂_μ G^a_ν - ∂_ν G^a_μ)(∂^μ G^{a ν} - ∂^ν G^{a μ})  (kinetic term)
       + (g_s/2) f^{abc} (∂_μ G^a_ν - ∂_ν G^a_μ) G^{b μ} G^{c ν}  (three-gluon vertex)
       - (g_s^2/4) f^{abc} f^{ade} G^b_μ G^c_ν G^{d μ} G^{e ν}  (four-gluon vertex)

The three-gluon vertex (proportional to g_s f^{abc}) and four-gluon vertex (proportional to g_s^2 f^{abc} f^{ade}) are unique to non-abelian gauge theories. They represent gluon-gluon scattering and are responsible for the negative contribution to the β-function that drives asymptotic freedom.

In momentum space, the Feynman rules are:
- Gluon propagator (in Feynman gauge): δ^{ab} (-i g_μν) / (k^2 + iε)
- Three-gluon vertex: g_s f^{abc} [g_μν (k_1 - k_2)_λ + g_νλ (k_2 - k_3)_μ + g_λμ (k_3 - k_1)_ν]
- Four-gluon vertex: -i g_s^2 [f^{abe} f^{cde} (g_μλ g_νρ - g_μρ g_νλ) + cyclic permutations]

The ghost fields (required for covariant gauge quantization) also couple to gluons via the ghost-gluon vertex: g_s f^{abc} p_μ, where p_μ is the ghost momentum.

## 2.5 Running Coupling and the β-Function

The renormalization group equation for the strong coupling α_s(μ) = g_s^2(μ)/4π is:

μ ∂α_s/∂μ = β(α_s) = -β_0 α_s^2/(2π) - β_1 α_s^3/(4π^2) - β_2 α_s^4/(8π^3) - ...

At one loop (calculated by Gross, Wilczek, and Politzer in 1973):
β_0 = 11 - 2/3 n_f

where n_f is the number of active quark flavors (n_f = 6 at very high scales, but effectively fewer at lower scales due to mass thresholds). For n_f ≤ 16, β_0 > 0, so β(α_s) < 0. This means α_s **decreases** with increasing energy scale μ (or decreasing distance).

The solution to the one-loop RG equation is:
α_s(μ) = α_s(μ_0) / [1 + (β_0 α_s(μ_0)/2π) ln(μ^2/μ_0^2)]

Equivalently, defining the QCD scale parameter Λ_QCD:
α_s(μ) = 2π / [β_0 ln(μ^2/Λ_QCD^2)]

For μ ≫ Λ_QCD, α_s(μ) ≪ 1: quarks and gluons behave as weakly interacting free particles. This is **asymptotic freedom**. For μ ~ Λ_QCD, α_s ~ 1: perturbation theory breaks down, and non-perturbative effects dominate. Λ_QCD ≈ 200-300 MeV sets the scale of hadron masses.

At two loops:
β_1 = 102 - 38/3 n_f
and the solution involves the Lambert W function or an implicit logarithmic form.

At three loops (β_2) and four loops (β_3), the coefficients are known. The four-loop β-function in the MS-bar scheme is:
β_0 = 11 - 2/3 n_f
β_1 = 102 - 38/3 n_f
β_2 = 2857/2 - 5033/18 n_f + 325/54 n_f^2
β_3 = (149753/6 + 3564 ζ_3) - (1078361/162 + 6508/27 ζ_3) n_f + (50065/162 + 6472/81 ζ_3) n_f^2 + 1093/729 n_f^3

These higher-loop corrections are essential for precision QCD predictions at LHC energies.

## 2.6 Quantization: Faddeev-Popov Ghosts and BRST Symmetry

Quantizing a non-abelian gauge theory requires fixing the gauge redundancy. The Faddeev-Popov procedure introduces ghost fields c^a, c̄^a (anticommuting scalar fields in the adjoint representation) to cancel unphysical gauge degrees of freedom in loop diagrams. The ghost Lagrangian is:

L_ghost = -∂_μ c̄^a D^{ab}_μ c^b = -∂_μ c̄^a (∂^μ δ^{ab} + g_s f^{acb} G^c_μ) c^b

The full gauge-fixed Lagrangian in a general covariant gauge (with gauge parameter ξ) is:

L_QCD = Σ_f ψ̄_f (i γ^μ D_μ - m_f) ψ_f - 1/4 G^a_μν G^{a μν} - 1/(2ξ) (∂_μ G^{a μ})^2 + L_ghost

The theory possesses a residual **BRST symmetry** (Becchi-Rouet-Stora-Tyutin), a nilpotent fermionic symmetry that mixes gauge fields, ghosts, and antighosts. BRST invariance guarantees unitarity and the decoupling of unphysical states. The BRST transformations are:
s G^a_μ = D^{ab}_μ c^b
s ψ_f = i g_s T^a c^a ψ_f
s c^a = -1/2 g_s f^{abc} c^b c^c
s c̄^a = 1/ξ ∂_μ G^{a μ}

The nilpotency s^2 = 0 holds on-shell (using equations of motion) for the gauge field, and off-shell for quarks and ghosts.

## 2.7 QCD Vacuum Structure: θ-Term and Strong CP Problem

The most general gauge-invariant Lagrangian includes a possible term:

L_θ = θ (g_s^2/32π^2) G^a_μν G̃^{a μν}

where G̃^{a μν} = 1/2 ε^{μνρσ} G^a_ρσ is the dual field strength. This term is a total derivative: G^a_μν G̃^{a μν} = ∂_μ K^μ, where K^μ = ε^{μνρσ} (G^a_ν ∂_ρ G^a_σ + 1/3 g_s f^{abc} G^a_ν G^b_ρ G^c_σ). However, in non-abelian theories, the vacuum has a non-trivial topological structure characterized by instantons—finite-action solutions to the Euclidean equations of motion with non-zero winding number. The θ-term weights instanton configurations by e^{iθ n}, where n is the winding number.

The θ-term violates CP symmetry. The observed smallness of the neutron electric dipole moment implies |θ| < 10^{-10}, a fine-tuning problem known as the **strong CP problem**. The Peccei-Quinn mechanism (axions) provides a dynamical solution.

## 2.8 Heavy Quark Effective Theory (HQET)

For heavy quarks (c, b, t) with mass m_Q ≫ Λ_QCD, the velocity v^μ = p^μ/m_Q is approximately conserved. HQET expands the Lagrangian in 1/m_Q:

L_HQET = ψ̄_v i v·D ψ_v + 1/(2m_Q) ψ̄_v (i D_⊥)^2 ψ_v + (g_s/4m_Q) ψ̄_v σ_μν G^μν ψ_v + O(1/m_Q^2)

The leading term describes a static color source. The 1/m_Q corrections give the kinetic energy and chromomagnetic moment. HQET simplifies calculations of heavy hadron properties (B, D mesons) and is essential for precision flavor physics.

## 2.9 Lattice QCD: Non-Perturbative Definition

Lattice QCD provides a rigorous non-perturbative definition of the theory by discretizing Euclidean spacetime on a hypercubic lattice with spacing a. The gauge fields become link variables U_μ(x) ∈ SU(3) connecting neighboring sites. The Wilson action is:

S_W = β Σ_{plaquettes} (1 - 1/3 Re Tr U_μν)

with β = 6/g_s^2. Quark fields live on sites. The path integral Z = ∫ DU Dψ Dψ̄ e^{-S} is evaluated via Monte Carlo importance sampling. Lattice QCD computes hadron masses, decay constants, form factors, the running coupling, the QCD phase diagram, and the equation of state with controlled systematic errors (extrapolation a→0, m_q→physical, V→∞).

## 2.10 The QCD Phase Diagram

At finite temperature T and baryon chemical potential μ_B, QCD exhibits a rich phase structure:
- **Hadronic phase**: T < T_c, μ_B small. Confined, chirally broken. Hadrons are the degrees of freedom.
- **Quark-Gluon Plasma (QGP)**: T > T_c (≈ 155 MeV at μ_B=0). Deconfined, chirally symmetric. Quarks and gluons are the degrees of freedom.
- **Color superconducting phases**: Large μ_B, low T. Quark Cooper pairs form (CFL phase, 2SC phase, etc.).
- **Critical point**: Possible endpoint of the first-order chiral transition line in the T-μ_B plane.

The crossover transition at μ_B=0 is confirmed by lattice QCD. The QGP was created and studied at RHIC and LHC via heavy-ion collisions.

---

*This document provides the complete mathematical foundation of QCD as a non-abelian gauge theory. The next document (DOC-03) will explore the physical consequences of gluon self-interactions: asymptotic freedom at short distances and color confinement at long distances, including flux tube formation, string tension, and hadronization.*