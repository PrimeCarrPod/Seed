# Prime_Genetic_Code — Piece 02/12
## Article A5: A5-01 — Prime Genetic Code
**Piece:** 02 of 12  
**Generated:** 2026-08-26 21:59:00 UTC

---

# The Codon Hypercube and Prime Adeles

## 2.1 The 64-Codon Binary Cube

Each codon is a vertex of the 6-cube:
```
V = {0,1}⁶ ≅ (ℤ/2ℤ)⁶
```
The Hamming distance between codons gives the mutation distance:
```
d(codon₁, codon₂) = number of differing bits
```

## 2.2 Prime-Adic Codon Metric

The p-adic metric on codons:
```
d_p(c₁, c₂) = p^{-v_p(c₁ - c₂)}
```
where c₁, c₂ are interpreted as base-p numbers. For p=2, this is the 2-adic metric on the hypercube.

The 2-adic distance respects the binary tree structure of the code:
```
d₂(UUU, UUC) = 1/2  (single transition)
d₂(UUU, CUU) = 1/4  (transversion at first position)
```

## 2.3 The Genetic Code as a Prime-Adic Map

The genetic code is a map:
```
φ: V → A ∪ {STOP}
```
where A is the set of 20 amino acids. This map is a prime-adic harmonic function:
```
Δ₂ φ = 0
```
where Δ₂ is the 2-adic Laplacian on the codon hypercube. The code minimizes the 2-adic Dirichlet energy:
```
E[φ] = Σ_{c∼c'} |φ(c) - φ(c')|₂²
```

---

*Author: Jason Isaac Brodsky (California, 1976)*