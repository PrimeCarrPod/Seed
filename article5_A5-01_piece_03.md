# Prime_Genetic_Code — Piece 03/12
## Article A5: A5-01 — Prime Genetic Code
**Piece:** 03 of 12  
**Generated:** 2026-08-26 21:59:00 UTC

---

# Error Minimization and Prime 3 Symmetry

## 3.1 The Prime 3 Error-Correcting Code

The genetic code is a [64, 21, 3] error-correcting code over the alphabet of 21 symbols. The minimum distance between codons for different amino acids is 2 in Hamming distance, but the prime 3 structure gives a stronger protection.

The code's error-correcting capability:
- Single base substitutions at third position: 70% synonymous (wobble)
- Single base substitutions at first position: often similar amino acids
- Single base substitutions at second position: radical changes (conserved by prime 3)

## 3.2 Prime 3 Group Action on the Code

The cyclic group C₃ acts on the three codon positions:
```
σ: (pos₁, pos₂, pos₃) → (pos₂, pos₃, pos₁)
```
This corresponds to the three reading frames. The genetic code is invariant under the prime 3 action combined with appropriate amino acid permutations.

## 3.3 Prime 3 and the Polar Requirement

The polar requirement of amino acids (Woese's scale) correlates with the prime 3 structure:
```
Polar Requirement = Σ_p a_p p^{-v_p(codon)}
```
The 20 amino acids separate into 3 prime 3 classes by polarity:
- Nonpolar (hydrophobic): 8 amino acids
- Polar (uncharged): 7 amino acids
- Charged: 5 amino acids
Total: 20 = 8 + 7 + 5 (Fibonacci-like prime distribution)

---

*Author: Jason Isaac Brodsky (California, 1976)*