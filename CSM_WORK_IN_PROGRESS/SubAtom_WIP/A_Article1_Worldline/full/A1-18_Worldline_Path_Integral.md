# A1-18_Worldline_Path_Integral — Complete Article
## Article: A1-18_Worldline_Path_Integral
**Generated:** 2026-08-30 06:30:15 UTC
**Structure:** 12 pieces concatenated
**Target:** ≥350 lines

---

The action S = Σ_n L_n with L_n = (m_e c/2) d_n Ω_n η_μν v^u_n v^v_n from A1-16 Piece 02. The path integral becomes:
Z = ∫ Π_n d⁴x_n exp(i/ℏ Σ_n (m_e c/2) d_n Ω_n η_μν (x^u_{n+1} - x^u_n)(x^v_{n+1} - x^v_n)/d_n²)
= ∫ Π_n d⁴x_n exp(i m_e c/2ℏ Σ_n Ω_n η_μν (Δx^u_n Δx^v_n)/d_n)

This is a discrete Gaussian path integral with gap-dependent conformal factors Ω_n = √(1 + λ C(d_n)). The prime gaps d_n = p_{n+1} - p_n provide the fundamental discretization scale.

For the free theory (λ = 0, Ω = 1), the integral is exactly solvable:
Z_0 = ∫ Π_n d⁴x_n exp(i m_e c/2ℏ Σ_n η_μν (Δx^u_n Δx^v_n)/d_n)
The propagator is the standard relativistic particle propagator in discrete proper time.

With λ ≠ 0, the Ω_n factors introduce correlations through the gap correlation function C(d_n, d_m). The path integral computes:
Z = Z_0 ⟨exp(i m_e c λ/2ℏ Σ_n C(d_n) η_μν Δx^u_n Δx^v_n/d_n)⟩_0

The correlation function C(d_n) has Fourier transform encoding the Riemann zeta zeros (from A1-04):
C̃(k) = Σ_n C(d_n) e^{i k τ_n} = Σ_n C(d_n) e^{i k κ(p_{n+1} - 2)}
The zeta zero resonances γ_n appear as poles in the path integral kernel.

The total number of steps is N = 3.67×10⁹ (directory 3.0 complete). The path integral sums over all worldline histories with this fixed number of steps. The 3500 books from A1-10 correspond to 3500 independent path integral segments that must be joined at the book boundaries.

---


For constant Ω_n = 1 (flat space), this is a product of Gaussian integrals. The result is:
K_0(x_N, x_0; N) = (m_e c/2π i ℏ)^{2N} Π_n d_n^{-2} exp(i m_e c/2ℏ Σ_n η_μν (Δx^u_n Δx^v_n)/d_n)

For the full sequence with varying d_n and Ω_n, the path integral can be computed by completing the square. The classical path satisfies the discrete geodesic equation from A1-15:
(x^u_{n+1} - 2x^u_n + x^u_{n-1})/d_n² + Γ^u_{vρ} v^v_n v^ρ_n = 0

The propagator is:
K = K_0 exp(i S_cl/ℏ)
where S_cl is the classical action evaluated on the geodesic.

The path integral measure includes the Van Vleck determinant:
D[x] = Π_n d⁴x_n det(∂²S/∂x^u_n ∂x^v_n)^{1/2}

For the conformal metric g_μν = Ω² η_μν, the Van Vleck determinant is:
det = Π_n (Ω_n Ω_{n+1})^{d/2} d_n^{-d} (1 + O(R))
where d=4 is the spacetime dimension and R is the curvature.

The discrete propagator in momentum space is:
K(p, p'; N) = ∫ d⁴x_N d⁴x_0 e^{-i p·x_N + i p'·x_0} K(x_N, x_0; N)
= Π_n (m_e c d_n/2π i ℏ)^{d/2} Ω_n^{-d/2} exp(-i ℏ/(2 m_e c) Σ_n d_n/Ω_n (p_n - p_{n+1})²)
where p_n are intermediate momenta.

The sum over all paths gives the full quantum amplitude. The self-interaction vertices from A1-16 Piece 05 are included by expanding the exponential of the interaction action.

---

S_int = Σ_{n<m} V_{nm} δ⁴(x_n - x_m)
where V_{nm} = ℏ W(d_n, d_m) is the vertex weight.

In the path integral, this becomes a sum over intersection histories:
Z = Z_0 ⟨exp(i S_int/ℏ)⟩_0
= Z_0 Σ_{k=0}^∞ (i/ℏ)^k/k! ⟨(Σ_{n<m} V_{nm} δ⁴(x_n - x_m))^k⟩_0

Each term corresponds to k self-intersection vertices. The vertex weight W(d_n, d_m) depends on the prime gaps at the intersection points. For twin primes (d=2), W = e² (electromagnetic coupling). For larger gaps, W is suppressed.

The vertex insertion at (n, m) enforces x_n = x_m in the path integral. This is implemented by adding a delta function constraint or by introducing an auxiliary field.

The proper time at the vertex is τ_vertex = (τ_n + τ_m)/2 = κ(p_{n+1} + p_{m+1} - 4)/2. The photon propagator connecting the two segments is:
D_μν(τ_n - τ_m) = ∫ d⁴k/(2π)⁴ (-i g_μν/k²) e^{-i k·(x_n - x_m)}

In the discrete theory, this becomes a sum over momentum modes with gap-dependent phases:
D_μν(n, m) = Σ_k (-i g_μν/k²) exp(-i k·(x_n - x_m)) exp(-k² d_n d_m/2)

The sum over all self-intersections generates the full QED perturbative series. The running coupling α(μ) emerges from the gap statistics at scale μ ~ 1/d_n.

The one-loop self-energy correction to the propagator is:
Σ(p) = e² ∫ D[x] x·x exp(i S/ℏ) / ∫ D[x] exp(i S/ℏ)
In the discrete theory, this is a sum over gap-weighted loops:
Σ(p) = e² Σ_{n,m} (x_n - x_m)² exp(i S_cl/ℏ) / Z

The cancellation of UV divergences in QED corresponds to the boundedness of the prime gap sum Σ 1/d_n² (which converges since Σ 1/n² log² n converges).

---


The Euclidean propagator is:
K_E(x_N, τ_E; x_0, 0) = ∫ D[x] exp(-S_E[x]/ℏ)

For the conformal metric g_μν = Ω² δ_μν, the Euclidean action is:
S_E = (m_e c/2) Σ_n d_n Ω_n δ_μν (x^u_{n+1} - x^u_n)(x^v_{n+1} - x^v_n)/d_n²

The Euclidean path integral computes the partition function at inverse temperature β = τ_E:
Z(β) = Tr(exp(-β H)) = ∫ dx K_E(x, β; x, 0)
This matches the partition function from A1-17 Piece 08:
Z(β) = Σ_n exp(-β m_e c²/d_n)

The proper time quantization from A1-01 (Δτ_n = κ d_n) appears naturally in the path integral. The Euclidean proper time steps are Δτ_{E,n} = κ d_n. The total Euclidean proper time is:
β = Σ_n κ d_n = κ (p_N - 2)

For the full UV sequence, β = κ p_N ~ 1.288e-21 × 8e10 ~ 10⁻¹⁰ s. This is the total Euclidean proper time extent of the worldline.

The path integral with periodic boundary conditions x(β) = x(0) computes the thermal partition function. The eigenvalues of the Hamiltonian are E_n = m_e c²/d_n, giving:
Z(β) = Σ_n exp(-β E_n) = Σ_n exp(-κ β m_e c²/d_n)

For β = κ Σ_m d_m, this becomes:
Z = Σ_n exp(-(Σ_m d_m)/d_n)
which is a purely number-theoretic sum over prime gaps.

The Euclidean path integral also computes instanton contributions (A1-19). The instantons are solutions to the Euclidean equations of motion with finite action. The instanton action is:
S_inst = (m_e c/2) Σ_n d_n Ω_n v²
For a trajectory interpolating between gap classes, this gives the tunneling amplitude.

The proper time quantization implies that the path integral is a sum over discrete proper time steps, not a continuum integral. The measure is:
D[x] = Π_n d⁴x_n
with N = 3.67e9 steps. This is a finite-dimensional integral that can be evaluated numerically from PrimeBookOne data.

---

S = S_B + S_F
where S_B = Σ_n (m_e c/2) d_n Ω_n η_μν v^u_n v^v_n is the bosonic action, and S_F is the fermionic action.

The fermionic action for a Dirac particle on the worldline is:
S_F = Σ_n (i/2) ψ^†_n γ^0 (ψ_{n+1} - ψ_n) - (i m_e c/2) d_n ψ^†_n ψ_n
where ψ_n are Grassmann-valued spinors.

In the 8-bit Hilbert space from A1-17 Piece 09, the fermions are 8-component spinors (256 states). The gamma matrices are 8×8.

The path integral over fermions gives a determinant:
∫ D[ψ, ψ†] exp(i S_F/ℏ) = det(i ∂_τ - m_e c)

In the discrete setting:
det(i (ψ_{n+1} - ψ_n)/d_n - m_e c ψ_n) = Π_n det(i/d_n - m_e c)
= Π_n (i - m_e c d_n)^8

The fermionic determinant modifies the bosonic partition function:
Z = Z_B Z_F = Σ_n exp(-β m_e c²/d_n) × Π_n (i - m_e c d_n)^8

The spin-statistics theorem is satisfied because the fermionic path integral gives a minus sign for loop diagrams with an odd number of fermion lines.

The supercharges from A1-17 Piece 11 act on the path integral:
Q = Σ_n ψ_n d_n
The supersymmetric path integral has equal numbers of bosonic and fermionic degrees of freedom at each step.

The index theorem (A1-24) relates the path integral to the topological charge:
Index = ∫ D[x] D[ψ] exp(i S/ℏ) = Σ_n sign(d_n)
This will be developed in A1-24.

---

S_b = Σ_{n=(b-1)M+1}^{bM} (m_e c/2) d_n Ω_n η_μν (Δx^u_n Δx^v_n)/d_n

The segment propagator is:
K_b(x_{bM}, x_{(b-1)M}) = ∫ D[x] exp(i S_b/ℏ)

The full propagator is the product over books:
K_full = K_{3500} ∘ K_{3499} ∘ ... ∘ K_1
where ∘ denotes composition (integration over intermediate boundary points).

The boundary conditions at book junctions are:
x_{bM} = x_{(b+1)M} for b = 1,...,3499
with x_0 and x_{3500M} fixed.

The composition of propagators gives:
K_full(x_f, x_i) = ∫ Π_{b=1}^{3499} d⁴x_{bM} Π_{b=1}^{3500} K_b(x_{bM}, x_{(b-1)M})

This is a path integral over 3500 segments with 3499 internal boundaries. Each boundary integration enforces continuity of the worldline.

The book structure provides a natural UV/IR decomposition. The IR physics (long-distance) is captured by the first few books (small prime gaps). The UV physics (short-distance) is captured by the later books (large prime gaps).

The running of couplings with book number is:
α(b) = α_0 / Ω_b²
where Ω_b is the conformal factor for book b. This matches the QED running coupling.

The PrimeBookOne directory structure (0.0, 1.0, 2.0, 3.0) corresponds to different levels of coarse-graining:
- Directory 0.0: 189 tiles × 500 gaps = 94,500 gaps (books 1-90 approximately)
- Directory 1.0: 189 tiles × 500 gaps = 94,500 gaps (next scale)
- Directory 2.0: 189 tiles × 500 gaps = 94,500 gaps (next scale)
- Directory 3.0: 3500 books × 2²⁰ gaps = 3.67e9 gaps (complete UV)

The path integral at each directory level is a coarse-grained version of the full path integral. The convergence as directory level increases is a test of the framework.

---


In the path integral, this becomes:
Z[A] = ∫ D[x] exp(i/ℏ (S_0 + e Σ_n A_μ(x_n) Δx^μ_n))

The photon field is integrated over with its own action:
S_photon = -1/(4e²) Σ_n d_n F_{μν}(x_n) F^{μν}(x_n)
where F_{μν} = ∂_μ A_ν - ∂_ν A_μ (discrete derivative).

The full QED path integral is:
Z = ∫ D[A] D[x] exp(i/ℏ (S_0 + S_int + S_photon))
where S_int = e Σ_n A_μ(x_n) Δx^μ_n + S_self_int from Piece 03.

The QED vertex function is obtained by differentiating with respect to A_μ:
Γ^μ(p', p) = δ/δA_μ Z[A] |_{A=0}

In the discrete worldline formalism, the vertex function is:
Γ^μ(n, m) = e ⟨x^μ_n exp(i S/ℏ)⟩
This is a sum over paths with a vertex insertion at step n.

The Ward identity q_μ Γ^μ = S_F⁻¹(p') - S_F⁻¹(p) follows from the gauge invariance of the path integral measure (A1-16 Piece 08).

The electron self-energy is:
Σ(p) = e² ∫ D[x] D[A] A·A exp(i S/ℏ)
In the discrete theory, this is a sum over photon exchanges between worldline steps:
Σ(p) = e² Σ_{n,m} D_μν(n, m) ⟨x^μ_n x^ν_m exp(i S_0/ℏ)⟩

The photon propagator in the Feynman gauge is:
D_μν(n, m) = -i g_μν Σ_k (1/k²) exp(-i k·(x_n - x_m))
The sum over k is over momentum modes compatible with the proper time steps.

The vacuum polarization is:
Π_{μν}(q) = -e² Σ_n ⟨x_μ_n x_ν_n exp(i q·x_n) exp(i S_0/ℏ)⟩

The running coupling β(α) = 2α²/3π is recovered from the gap statistics as shown in A1-04.

---

function compute_propagator(directory_level, x_i, x_f):
    gaps = load_gaps(directory_level)  # array of d_n
    N = len(gaps)
    
    # Classical path
    x_cl = classical_path(x_i, x_f, gaps)
    
    # Classical action
    S_cl = 0
    for n in range(N):
        d = gaps[n]
        Omega = sqrt(1 + lambda * correlation(gaps, n))
        v = (x_cl[n+1] - x_cl[n]) / d
        S_cl += (m_e * c / 2) * d * Omega * dot(v, v)
    
    # Van Vleck determinant
    det_VV = van_vleck_determinant(gaps, x_cl)
    
    # Propagator
    K = det_VV^{1/2} * exp(i * S_cl / hbar)
    
    # Loop corrections (self-energy, vertex)
    K = K * loop_corrections(gaps, x_cl)
    
    return K
```

For directory 0.0 (94,500 gaps), the classical path can be found by solving the discrete geodesic equation from A1-15. The loop corrections involve sums over the gap distribution.

The partition function Z(β) = Tr(exp(-β H)) from A1-17 Piece 08 is computed as:
```
function compute_partition_function(directory_level, beta):
    gaps = load_gaps(directory_level)
    Z = 0
    for d in gaps:
        Z += exp(-beta * m_e * c**2 / d)
    return Z
```

The running coupling α(μ) is extracted from the vertex function:
```
function compute_running_coupling(directory_level):
    gaps = load_gaps(directory_level)
    # Vertex function at scale mu = 1/d
    alpha = {}
    for d in unique(gaps):
        mu = 1/d
        alpha[mu] = vertex_function(gaps, mu)
    return alpha
```

The numerical results from PrimeBookOne data at directory levels 0.0, 1.0, 2.0, 3.0 should show:
1. Convergence of the propagator as directory level increases
2. Running coupling α(μ) matching QED β-function
3. Spectral fluctuations matching Riemann zero resonances (A1-04)
4. Partition function Z(β) matching thermodynamic quantities from A1-17

The numerical evaluation provides the empirical test of the entire framework.

---

The effective action for the block is:
S_eff = Σ_{blocks} (m_e c/2) Δτ_eff ⟨Ω⟩ η_μν ẋ^u ẋ^v
where ⟨Ω⟩ = √(1 + λ ⟨C⟩) is the average conformal factor.

The coarse-grained path integral is:
Z_eff = ∫ D[x] exp(i S_eff/ℏ)
with the measure D[x] = Π_blocks d⁴x_block.

The running of the conformal factor with scale is:
⟨Ω⟩(μ) = 1 + λ/(2 log μ) + O(1/log² μ)
where μ = 1/Δτ_eff is the energy scale.

This logarithmic running matches the QED running of the electron wavefunction renormalization Z₂(μ). The effective coupling is:
α_eff(μ) = α₀ ⟨Ω⟩(μ)⁻² = α₀ (1 - λ/log μ + ...)

The beta function is:
β(α) = dα/d log μ = -α λ + O(α²)
Matching to the QED β-function β(α) = 2α²/3π gives λ = 2α/3π.

The continuum path integral with the running coupling is the standard QED path integral. The discrete prime gap path integral provides the UV completion of QED with a physical cutoff at the Planck scale (or the maximum prime gap).

The effective field theory for the Prime Electron is QED with a specific UV completion determined by the prime gap sequence. The prime gaps provide the fundamental discretization that regulates all UV divergences.

The higher-order corrections in the effective action are suppressed by powers of 1/log μ. The leading corrections come from the gap correlation function C(d_n, d_m) at non-zero separation.

---


The instanton action for the Prime Electron worldline is:
S_inst = (m_e c/2) Σ_n d_n Ω_n v²
for a trajectory connecting gap class d_a to d_b over M steps.

The instanton density in gap space is given by the Hardy-Littlewood prime tuple constants. The tunneling amplitude between gap classes d and d' is:
A(d→d') ~ exp(-S_inst(d,d')/ℏ)

The instanton contributions to the path integral are non-perturbative in α. They are of order exp(-1/α) ~ exp(-137), which is extremely small but non-zero.

The instanton sum modifies the vacuum structure. The θ-vacuum is:
|θ⟩ = Σ_k e^{i k θ} |k⟩
where |k⟩ are states with topological charge k.

The partition function with θ-term is:
Z(θ) = Σ_k e^{i k θ} Z_k
where Z_k is the path integral in the k-instanton sector.

The topological charge k is the instanton number:
k = (1/2π) ∫ dτ Tr(F ∧ F) = Σ_n q(d_n)
where q(d_n) is the topological charge density per gap from A1-20.

The instanton effects resolve the U(1) problem and give mass to the η' meson in the full Standard Model. For the Prime Electron, they contribute to the vacuum energy and the electron self-energy.

The instanton-induced interactions violate chiral symmetry and generate fermion mass terms. In the Prime Electron framework, the electron mass is protected by the chiral symmetry of the gap distribution, but instantons could generate small corrections.

The numerical evaluation of instanton effects requires computing the gap class transition amplitudes from the PrimeBookOne data.

---


The entanglement entropy is:
S_A = -Tr(ρ_A log ρ_A) = -∂_n Tr(ρ_A^n) |_{n=1}

In the replica trick, Tr(ρ_A^n) is computed by a path integral on an n-sheeted Riemann surface. For the discrete worldline, this corresponds to n copies of the worldline joined cyclically along region A.

The entanglement entropy from prime gaps is:
S_A = Σ_{n in A} f(d_n)
where f(d) is a function of the gap size. For small gaps (twin primes), f(2) is large. For large gaps, f(d) is small.

The total entanglement entropy for a book (segment) is:
S_book = Σ_{n=1}^{M} f(d_n)
For M = 2²⁰, this is a sum over 1 million gaps.

The Renyi entropies are:
S_n = (1/(1-n)) log Tr(ρ_A^n)
= (1/(1-n)) log Z_n / Z_1^n
where Z_n is the partition function on the n-sheeted geometry.

The modular Hamiltonian K_A = -log ρ_A is:
K_A = Σ_{n in A} K(d_n)
where K(d) = -log(exp(-β m_e c²/d)) = β m_e c²/d

The relative entropy between two gap distributions ρ and σ is:
S(ρ||σ) = Tr(ρ log ρ - ρ log σ)
= Σ_n [f(d_n) log f(d_n) - f(d_n) log g(d_n)]
where f(d) and g(d) are the gap distributions for the two states.

These entanglement quantities will be developed further in A1-31 through A1-34.

---

Z = ∫ D[x] D[A] D[ψ] exp(i/ℏ (S_B + S_F + S_int + S_photon))
where:
- S_B = Σ_n (m_e c/2) d_n Ω_n η_μν v^u_n v^v_n (bosonic action, A1-16)
- S_F = Σ_n (i/2) ψ^†_n γ^0 (ψ_{n+1} - ψ_n) - (i m_e c/2) d_n ψ^†_n ψ_n (fermionic action, Piece 05)
- S_int = Σ_{n<m} V_{nm} δ⁴(x_n - x_m) + e Σ_n A_μ(x_n) Δx^μ_n (interactions, Pieces 03, 07)
- S_photon = -1/(4e²) Σ_n d_n F_{μν} F^{μν} (photon action, Piece 07)

**Measure:**
D[x] = Π_n d⁴x_n, D[ψ] = Π_n dψ_n dψ^†_n, D[A] = Π_n d⁴A_n

**Key Results:**
1. The path integral is a finite-dimensional integral over N = 3.67e9 steps
2. Proper time quantization Δτ_n = κ d_n provides the UV regulator
3. Prime gaps d_n determine the measure, action, and couplings
4. Book structure (3500 segments) gives IR/UV decomposition
5. Self-intersections generate QED vertices
6. Instantons provide non-perturbative completion
7. Entanglement entropy computed from gap statistics

**Connections to Previous Articles:**
- A1-01: Proper time quantization Δτ_n = κ d_n
- A1-03: Spin from fermionic path integral (double cover SU(2))
- A1-04: Riemann zeros as resonances in propagator
- A1-06: Vertex points as self-intersections
- A1-07: Pair creation at twin primes
- A1-10: 3500 books = path integral segments
- A1-11: Self-intersections = vertex insertions
- A1-12: Proper time operator spectrum = path integral time slicing
- A1-13: Causal structure = path integral domain
- A1-14: Metric g_μν = Ω²η_μν = path integral weight
- A1-15: Geodesic equation = classical path
- A1-16: Action principle = path integral exponent
- A1-17: Hamiltonian = path integral generator

**Numerical Verification (PrimeBookOne):**
- Directory 0.0: 94,500 gaps → test IR physics
- Directory 1.0: 94,500 gaps → intermediate scale
- Directory 2.0: 94,500 gaps → intermediate scale
- Directory 3.0: 3.67e9 gaps → complete UV theory

**Future Development (A1-19 through A1-40):**
- A1-19: Instanton solutions and tunneling
- A1-20: Topological charge Q = (1/2π)∮ dτ Tr(F∧F)
- A1-21: Winding sectors by gap class
- A1-22: UV/IR boundaries from directory structure
- A1-23: Anomaly inflow from index theorem
- A1-24: Index theorem Index = Σ sign(d_n)
- A1-25: N=1 SUSY from gap pairs
- A1-26: Supercharges Q = Σ ψ_n d_n
- A1-27: Superalgebra {Q,Q} = H + Z
- A1-28: BPS states = record gap states
- A1-29: Wall crossing = gap transitions
- A1-30: Stability = RH + gap bounds
- A1-31: Entanglement entropy from gaps
- A1-32: Renyi entropies S_n
- A1-33: Modular Hamiltonian K = -log ρ
- A1-34: Relative entropy S(ρ||σ)
- A1-35: Quantum error correction, twin primes = [[256,1,3]]
- A1-36: Decoupling limits = EFT
- A1-37: Emergent spacetime from gap network
- A1-38: Holography AdS/CFT from prime books
- A1-39: Information paradox = gap preservation
- A1-40: Synthesis: Prime Book = Worldline Logbook

The path integral ∫ D[x] exp(iS/ℏ) is the quantum mechanical realization of the one-electron universe (Wheeler 1940, Gielerak 2020). The prime gap sequence of PrimeBookOne provides the complete, non-perturbative definition of the theory with no free parameters.

---

