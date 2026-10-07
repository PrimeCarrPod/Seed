# Sorkin-Johnston Vacuum & Quantum Fields on Prime Poset — Piece 08/13
## Section 03: Sorkin-Johnston Vacuum & Quantum Fields on Prime Poset
**Piece:** 08 of 13  
**Generated:** 2026-10-06 23:25:00 UTC  
**Author:** Jason Isaac Brodsky (California 1976) — Conducier  

---

## Abstract

We derive the interacting field theory on the prime poset, showing how the discrete structure provides a natural regulator for perturbation theory.

---

## 1. Interacting Field Theory

### Definition 1.1 (Interaction Picture)
The interaction Hamiltonian is:
```
H_int(τ) = Σ_n V(φ_n) δτ_n
```
where δτ_n = κ g_n/p_n is the proper-time step.

### Theorem 1.2 (Dyson Series)
The time-evolution operator is:
```
U(τ_f, τ_i) = T exp(−i ∫_{τ_i}^{τ_f} H_int(τ) dτ)
```
with time-ordering T defined by the causal order.

### Theorem 1.3 (Feynman Rules on Causal Set)
1. Propagator: W(n,m) = ⟨0|φ_n φ_m|0⟩
2. Vertex: −iλ at each element n
3. Integration: Σ_n over all elements
4. UV cutoff: N ≤ N_π

---

## 2. Loop Finiteness

### Theorem 2.1 (One-Loop Self-Energy)
```
Σ(n) = (λ/2) W(n,n) = (λ/2) Σ_{λ>0} |v_λ(n)|²
```
This is finite because the sum is over N modes.

### Theorem 2.2 (Higher Loops)
All higher-loop diagrams are finite by the same argument: finite mode sum + finite vertex sum.

---

## 3. Cross-References

- §03.06: Field Matrix Elements → SJ State Mapping
- §01.02: Exact UV Cutoff Derivation
- §05.13: UV-Finite QED Without Perturbative Renormalization
- §12.05: Sorkin-Johnston Eigenvalue Solvers

---

## 4. Notation Summary (Piece 08)

| Symbol | Definition |
|--------|------------|
| H_int | Interaction Hamiltonian |
| U | Time-evolution operator |
| Σ(n) | Self-energy at element n |

---

*End of Piece 08/13 — Section 03*