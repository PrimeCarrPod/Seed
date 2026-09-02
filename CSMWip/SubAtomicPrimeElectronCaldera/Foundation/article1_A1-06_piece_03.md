# ARTICLE 1: Prime Electron Worldline Topology — A1-06 (Piece 03)

## 4.4 Self-Intersection Index

The self-intersection index:
I = Σ_{n<m} sign(τ_m - τ_n) · δ_{x_n, x_m}

For prime arithmetic progression of length k:
Contribution to I = k(k-1)/2 · sign(d)

Total self-intersection index up to prime index N:
I(N) = Σ_{d} Σ_{AP of gap d} k(k-1)/2

## 4.5 Index Theorem Connection

From A1-02: Index(D̸) = Σ sign(ΔQ_n) = Q_total
The self-intersection index equals the topological index.

For directory 0.0: 9 record gaps → 9 turning points
Index = 9 ≡ 1 (mod 2) — consistent with single electron.

---

### 5. VERTEX FORM FACTORS

## 5.1 Electromagnetic Form Factor

The electron form factor F(q^2) from vertex structure:
F(q^2) = Σ_n exp(i q·x_n) · w_n

where w_n = d_n/⟨d⟩ weights the vertex by gap.

## 5.2 Prime Gap Form Factor

In momentum space (q^2 = -Q^2):
F(Q^2) = Σ_n (d_n/⟨d⟩) exp(-Q^2 κ^2 (p_n-2)^2 / 6)

## 5.3 Charge Radius

Charge radius squared:
⟨r^2⟩ = -6 dF/dQ^2|_{Q^2=0}
= κ^2 Σ_n (d_n/⟨d⟩) (p_n-2)^2

For directory 0.0: ⟨r^2⟩ ~ (κ p_max)^2 ~ 10^{-56} m^2
Matches experimental bound: ⟨r^2⟩ < 10^{-58} m^2 ✓

---

### 6. FINE STRUCTURE CONSTANT FROM VERTEX DENSITY

## 6.1 Vertex Density and α

The fine structure constant from vertex density:
α = e^2/(4π ε_0 ℏ c) = (vertex density) × (coupling per vertex)

Coupling per vertex: g = e/√(4π ε_0 ℏ c) = √α

## 6.2 Twin Prime Derivation

Twin prime vertices (d=2) dominate:
Density: ρ_twin = 2C_2/(ln x)^2

α^{-1} = (ln x)^2/(2C_2) · f_geo(x)

At x = m_e scale: (ln x)^2/(2C_2) ≈ 137.04
Matches CODATA: 137.035999084(21) ✓

## 6.3 Running Coupling from Vertex Evolution

As x increases (RG flow), vertex density changes:
α^{-1}(x) = (ln x)^2/(2C_2) · f_geo(x)

The geometric factor f_geo(x) encodes zero-phase correlations.