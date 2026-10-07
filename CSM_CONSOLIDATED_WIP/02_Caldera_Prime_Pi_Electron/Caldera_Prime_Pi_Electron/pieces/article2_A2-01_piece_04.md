# Sorkin-Johnston Vacuum & Quantum Fields on Prime Poset — Piece 04/13
## Section 03: Sorkin-Johnston Vacuum & Quantum Fields on Prime Poset
**Piece:** 04 of 13  
**Generated:** 2026-10-06 23:21:00 UTC  
**Author:** Jason Isaac Brodsky (California 1976) — Conducier  

---

## Abstract

The SJ vacuum is uniquely identified by restricting field operators to the positive spectral subspace of the integral operator iΔ. This provides a coordinate-independent vacuum state, circumventing the ambiguities of Mottola-Allen α-vacua in de Sitter space.

---

## 1. Vacuum Construction

### Definition 1.1 (Positive Spectral Subspace)
Let P_+ be the projector onto the positive eigenspace of iΔ:
```
P_+ = Σ_{λ>0} |v_λ⟩⟨v_λ|
```

### Definition 1.2 (Field Operators)
The field operator at element n is:
```
φ_n = Σ_λ (v_λ(n) a_λ + v_λ^*(n) a_λ^†)
```
where a_λ, a_λ^† are annihilation/creation operators for mode λ.

### Theorem 1.3 (SJ Vacuum State)
The SJ vacuum |0_SJ⟩ is defined by:
```
a_λ |0_SJ⟩ = 0  for all λ > 0
```
This is a pure state in the Fock space built from positive frequency modes.

### Theorem 1.4 (Uniqueness)
The SJ vacuum is unique because the spectral decomposition of iΔ is unique (no ambiguity in the positive/negative split for a given causal set).

---

## 2. Comparison with Continuum Vacua

### Theorem 2.1 (No α-Vacuum Ambiguity)
In de Sitter space, the Mottola-Allen vacua form a continuous family parameterized by α. On the prime gap causal set, the discrete structure breaks the de Sitter symmetry, selecting a unique vacuum.

### Theorem 2.2 (UV Finiteness)
The SJ vacuum has finite fluctuations:
```
⟨0|φ²|0⟩ = Σ_{λ>0} |v_λ|² < ∞
```
The sum is finite because the spectrum is discrete and bounded by the UV cutoff.

---

## 3. Cross-References

- §03.03: Pauli-Jordan Function
- §01.02: Exact UV Cutoff Derivation
- §07.10: Replica Wormholes & Page Curve
- §09.12: Critical Line = Unitarity Bound

---

## 4. Notation Summary (Piece 04)

| Symbol | Definition |
|--------|------------|
| P_+ | Projector onto positive eigenspace |
| a_λ, a_λ^† | Annihilation/creation operators |
| |0_SJ⟩ | Sorkin-Johnston vacuum |
| φ_n | Field operator at element n |

---

*End of Piece 04/13 — Section 03*