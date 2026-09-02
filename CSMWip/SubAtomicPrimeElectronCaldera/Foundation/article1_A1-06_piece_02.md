# ARTICLE 1: Prime Electron Worldline Topology — A1-06 (Piece 02)

## 1.3 Vertex Charge and Orientation

Each vertex carries a charge Q_n and time orientation:

Q_n = (-1)^{n+1} · e

- Odd n: Q_n = +e (electron, forward time)
- Even n: Q_n = -e (positron, backward time)

This alternation implements the one-electron universe: the worldline weaves forward and backward in time.

Net lepton number at vertex n: L_n = (-1)^{n+1}

## 1.4 Vertex Density

Vertex density in prime index space: ρ_v(n) = 1 (one vertex per prime)
In proper time: ρ_v(τ) = dτ/dn = κ · d_n

In real time (lab frame): ρ_v(t) ~ dn/dt = (m_e c^2/ℏ) · ⟨d⟩^{-1} ≈ 10^{20} Hz

---

### 2. SELF-INTERACTION AT VERTICES

## 2.1 QED Vertex Factor

At each vertex, the electron emits/absorbs a virtual photon.
QED vertex factor: -ie γ^μ

In worldline formalism: the vertex contributes a factor exp(i e A_μ ẋ^μ)

## 2.2 Prime Gap as Photon Momentum

The gap d_n determines the virtual photon momentum:
q_n^μ = (ΔE_n/c, p⃗_n)

Energy transfer: ΔE_n = ℏ/Δτ_n = 2m_e c^2/d_n
Momentum transfer: |p⃗_n| = √(ΔE_n^2/c^2 - m_e^2 c^2)

For twin prime (d_n=2): ΔE = m_e c^2 (Compton scale)
For large gap: ΔE ≪ m_e c^2 (soft photon)

---

### 3. VERTEX CORRELATION FUNCTIONS

## 3.1 Two-Point Function

Vertex correlation: G(n,m) = ⟨x^μ_n x_μ_m⟩
In terms of primes: G(n,m) = κ^2 (p_n - 2)(p_m - 2)

For n ≠ m: G(n,m) = κ^2 (p_n - 2)(p_m - 2)
For n = m: G(n,n) = κ^2 (p_n - 2)^2

## 3.2 Gap-Mediated Correlations

The physical correlation is mediated by gaps:
C(n,m) = ⟨d_n d_m⟩ - ⟨d⟩^2

For |n-m| = 1: C(1) ≈ -2.5 (anti-correlation)
For |n-m| = 2: C(2) ≈ 1.2 (positive)
Oscillatory decay with period ~5 gaps.

---

### 4. PRIME ARITHMETIC PROGRESSIONS AS SELF-INTERSECTIONS

## 4.1 Self-Intersection Condition

The worldline crosses itself when x^μ_n = x^μ_m for n ≠ m.
In proper time: τ_n = τ_m + k·T (modulo periodicity T)

Prime condition: p_n - p_m = k · M (M = period in prime units)

## 4.2 Arithmetic Progressions

Self-intersections correspond to prime arithmetic progressions:
p_n = p_m + k · d

where d is the common difference (gap).

Example: 3, 7, 11 (d=4) → vertices 2, 4, 6 self-intersect
Example: 5, 11, 17 (d=6) → vertices 3, 5, 7 self-intersect

## 4.3 Green-Tao Theorem

Green-Tao (2004): Primes contain arbitrarily long arithmetic progressions.
Therefore the worldline has infinitely many self-intersections.
Each progression = a closed loop in the worldline.