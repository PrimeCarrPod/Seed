# ARTICLE 1: Prime Electron Worldline Topology — A1-06 (Piece 04)

---

### 7. VERTEX OPERATORS IN CFT

## 7.1 Worldline CFT

The worldline is a 1D CFT with vertex operators:
V_n = :exp(i p_n · X(τ_n)):

where X(τ) is the embedding field.

## 7.2 Conformal Dimensions

Vertex operator V_n has conformal dimension:
Δ_n = p_n^2/(2κ^2) ~ (p_n/κ)^2

Primary fields: twin prime vertices (d=2) have minimal dimension.
Descendants: larger gaps have higher dimensions.

## 7.3 Operator Product Expansion

V_n(τ) V_m(0) ~ |τ|^{Δ_{nm}} V_{n+m} + ...

where Δ_{nm} = (p_n - p_m)^2/(2κ^2) = (d_{nm})^2/2

The OPE coefficients encode gap statistics.

---

### 8. WARD IDENTITIES FROM VERTEX SYMMETRY

## 8.1 Gauge Symmetry

The worldline has U(1) gauge symmetry:
X^μ(τ) → X^μ(τ) + ∂^μ λ(τ)

## 8.2 Ward Identity

∂_μ ⟨J^μ(τ) V_n⟩ = Σ_m δ(τ - τ_n) Q_n ⟨V_n⟩

Current: J^μ = Σ_n Q_n ẋ^μ_n δ(τ - τ_n)

## 8.3 Charge Conservation

Total charge: Q_total = Σ_n Q_n = e Σ_n (-1)^{n+1}

For finite N: Q_total = e (if N odd), 0 (if N even)
In the limit N→∞: Q_total = e/2 (Cesàro sum)

The electron charge is the regularized sum of vertex charges.

---

### 9. ANOMALY AND VERTEX PHASES

## 9.1 Chiral Anomaly

The worldline has a chiral anomaly:
∂_μ J^μ_5 = (e^2/16π^2) ε^{μνρσ} F_{μν} F_{ρσ}

## 9.2 Vertex Phase Contribution

Each vertex contributes a phase to the anomaly:
φ_n = arg(Γ(n)) = Im ln Γ(n)

Sum over vertices: Σ_n φ_n Q_n = anomaly coefficient

## 9.3 Prime Gap Anomaly

From gap sequence: anomaly = (1/2π) Σ_n ΔQ_n
= (1/2π) Σ_n (d_n/Λ) = p_N/(2πΛ)

The anomaly cancels between forward/backward vertices.

---

### 10. VERTEX OPERATOR ALGEBRA

## 10.1 Commutation Relations

[V_n, V_m] = 2i sin(π p_n p_m / M) V_{n+m}

where M is the UV cutoff (directory 3.0 scale).

## 10.2 Virasoro Algebra

The stress-energy tensor:
T(τ) = (1/2) :Ẋ^μ Ẋ_μ:

L_n = (1/2πi) ∮ dτ τ^{n+1} T(τ)

[L_n, L_m] = (n-m) L_{n+m} + (c/12) n(n^2-1) δ_{n+m,0}

Central charge: c = 1 (single boson X(τ))

---

### 11. VERTEX BOUNDARY CONDITIONS

## 11.1 UV Boundary (Directory 3.0)

At the UV scale (x ~ 10^11): vertices become dense.
Boundary condition: X^μ(τ) = X^μ(τ + T_UV)

T_UV = κ · p_{max} ~ 10^{-12} s

## 11.2 IR Boundary (Directory 0.0)

At IR scale (x ~ 10^6): vertices sparse.
Boundary condition: X^μ(τ) → free particle

## 11.3 Boundary States

| Boundary | Physics | Vertex Condition |
|----------|---------|------------------|
| IR (0.0) | Free electron | Neumann: ∂_τ X = 0 |
| UV (3.0) | GUT scale | Dirichlet: X = fixed |

---

### 12. VERTEX RENORMALIZATION

## 12.1 Vertex Counterterms

Loop corrections renormalize vertex:
Γ^μ_ren = Z_1 Γ^μ_bare

Z_1 = 1 + α/(2π) + ... from gap fluctuations.

## 12.2 Ward Identity → Z_1 = Z_2

Vertex renormalization = wavefunction renormalization.
From prime gaps: Z_1 = Z_2 = 1 + O(α ln x)

## 12.3 Running Vertex

The effective vertex at scale x:
Γ^μ(x) = γ^μ F_1(q^2) + (iσ^μν q_ν/2m) F_2(q^2)

F_1 from vertex density, F_2 from zero modes (A1-04).