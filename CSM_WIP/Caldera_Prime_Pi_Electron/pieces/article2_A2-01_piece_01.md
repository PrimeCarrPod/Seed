# Sorkin-Johnston Vacuum & Quantum Fields on Prime Poset — Piece 01/13
## Section 03: Sorkin-Johnston Vacuum & Quantum Fields on Prime Poset
**Piece:** 01 of 13  
**Generated:** 2026-10-06 23:18:00 UTC  
**Author:** Jason Isaac Brodsky (California 1976) — Conducier  

---

## Abstract

Extracting quantum field theory from the discrete partial order of the prime lattice requires the Sorkin-Johnston (SJ) formalism. A free scalar quantum field theory on the prime gap causal set is completely specified by the advanced and retarded Green's functions. We establish the SJ formalism on the discrete poset.

---

## 1. Sorkin-Johnston Formalism on Discrete Partial Orders

### Definition 1.1 (Causal Set QFT)
A quantum field theory on a causal set C is defined by a real scalar field φ: C → ℝ with action:
```
S[φ] = (1/2) Σ_{x,y∈C} φ(x) K(x,y) φ(y)
```
where K is the kinetic operator.

### Definition 1.2 (Retarded Green's Function)
The retarded Green's function G_ret for a massive scalar field on the discrete lattice is constructed via convolution:
```
G_ret = G_0 * (1 − m² G_0)^{-1}
```
where G_0 is the massless retarded Green's function and * denotes convolution on the causal set.

### Theorem 1.3 (Massless Green's Function on Causal Set)
For a causal set with sprinkling density ρ, the massless retarded Green's function is:
```
G_0(x,y) = (1/2π) θ(τ(x,y)) / τ(x,y)
```
where τ(x,y) is the proper time along the longest chain from x to y, and θ is the Heaviside step function.

---

## 2. Causal Matrix and Pauli-Jordan Function

### Definition 2.1 (Causal Matrix)
The causal matrix C is defined by:
```
C_{xy} = 1 if x ≺ y, else 0
```

### Theorem 2.2 (Massive Green's Function)
The massive retarded Green's function is formulated as:
```
G_ret = (i + m² C)^{-1}
```
where the inverse is taken in the space of causal matrices.

### Definition 2.3 (Pauli-Jordan Function)
The Pauli-Jordan (commutator) function is the antisymmetric matrix:
```
iΔ(x,y) = G_ret(x,y) − G_adv(x,y) = G_ret(x,y) − G_ret(y,x)
```

### Theorem 2.4 (Skew-Symmetry)
The Pauli-Jordan matrix iΔ is real and skew-symmetric:
```
(iΔ)^T = −iΔ
```
This ensures real eigenvalues for the integral operator.

---

## 3. Positive Spectral Subspace

### Theorem 3.1 (SJ Vacuum Uniqueness)
The SJ vacuum is uniquely identified by restricting the field operators to the positive spectral subspace of the integral operator iΔ.

**Proof.** The eigenvalue equation iΔ v = λ v yields real eigenvalues due to skew-symmetry. Retaining only the positive eigenfunctions defines the positive frequency modes, generating a unique, coordinate-independent vacuum state. ∎

### Corollary 3.2 (Two-Point Wightman Function)
The two-point Wightman function emerges from the positive spectral projection:
```
W(x,y) = ⟨0|φ(x)φ(y)|0⟩ = Σ_{λ>0} v_λ(x) v_λ(y)
```
This circumvents the inherent ambiguities of vacuum selection in highly curved or discrete spacetimes.

---

## 4. Cross-References

- §01.03: Proper-Time Lattice from Prime Gap Sequence
- §01.05: Metric Tensor Components
- §02.01: Causal Set Theory Primer
- §02.03: Proper Time as Longest Chain
- §12.05: Sorkin-Johnston Eigenvalue Solvers

---

## 5. Notation Summary (Piece 01)

| Symbol | Definition |
|--------|------------|
| G_ret | Retarded Green's function |
| G_adv | Advanced Green's function |
| G_0 | Massless Green's function |
| C_{xy} | Causal matrix |
| iΔ | Pauli-Jordan function |
| W(x,y) | Wightman function |
| λ | Eigenvalues of iΔ |
| v_λ | Eigenfunctions |

---

*End of Piece 01/13 — Section 03*