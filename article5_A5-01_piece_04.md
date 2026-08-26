# Prime_Genetic_Code — Piece 04/12
## Article A5: A5-01 — Prime Genetic Code
**Piece:** 04 of 12  
**Generated:** 2026-08-26 21:59:00 UTC

---

# Prime 5 and Amino Acid Properties

## 4.1 The Five Fundamental Properties

Amino acids are characterized by 5 prime properties (the prime 5 basis):
1. **Hydrophobicity** (H) — water exclusion
2. **Volume** (V) — steric size
3. **Charge** (Q) — electrostatic
4. **Aromaticity** (A) — π-stacking
5. **Flexibility** (F) — backbone entropy

Each amino acid is a vector in ℚ₅⁵:
```
a = (H_a, V_a, Q_a, A_a, F_a) ∈ ℚ₅⁵
```

## 4.2 Prime 5 Modular Forms for Amino Acid Indices

The amino acid index values are special values of prime 5 modular forms:
```
Index(a) = f₅(τ_a),  τ_a = i√(p_a)
```
where p_a is the prime associated with amino acid a. The 20 amino acids map to the first 20 primes:
```
Ala→2, Arg→3, Asn→5, Asp→7, Cys→11, Gln→13, Glu→17, Gly→19,
His→23, Ile→29, Leu→31, Lys→37, Met→41, Phe→43, Pro→47,
Ser→53, Thr→59, Trp→61, Tyr→67, Val→71
```

## 4.3 The Prime 5 Amino Acid Distance

The distance between amino acids in property space:
```
d₅(a, b) = |Index(a) - Index(b)|₅
```
This 5-adic distance predicts substitution probabilities in evolution:
```
P(a→b) ∝ exp(-d₅(a, b)/kT₅)
```

---

*Author: Jason Isaac Brodsky (California, 1976)*