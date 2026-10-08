# Electron Physics — V5.0 Deep Dive Series
## Part 2 of 14 — Electron Magnetic Moment (g-2): Higher-Loop QED (2-5 Loop)

---

### Abstract

Detailed development of 2-loop through 5-loop QED contributions to a_e, with worldline/prime-gap correspondence for each loop order. Feynman diagram counts, renormalization, and numerical methods.

---

### 1. 2-Loop QED (O(α²)) — Prime Gap Variance

**Diagrams**: 7 vertex + 2 self-energy + 3 vacuum polarization = 12 diagrams

**Coefficient**: C_2 = -0.328478965579...

**Prime gap moment**: ⟨d²⟩ - ⟨d⟩² = variance of prime gap distribution at electron scale (directory 0.0)

**Renormalization**: On-shell scheme, UV divergences cancel between vertex and self-energy. IR divergences cancel via Bloch-Nordsieck.

**Worldline**: Two kinks on worldline → proper-time double integral ∫∫ dτ₁ dτ₂ with ordering.

---

### 2. 3-Loop QED (O(α³)) — Prime Gap Skewness

**Diagrams**: 72 diagrams (vertex 46, self-energy 14, VP 12)

**Coefficient**: C_3 = 1.181241456...

**Prime gap moment**: ⟨d³⟩ - 3⟨d⟩⟨d²⟩ + 2⟨d⟩³ = skewness

**Method**: Laporta algorithm (integration-by-parts reduction to master integrals). 10 master integrals.

**Worldline**: Three kinks → triple proper-time integral. Skewness of Δτ distribution.

---

### 3. 4-Loop QED (O(α⁴)) — Prime Gap Kurtosis

**Diagrams**: 891 diagrams

**Coefficient**: C_4 = -1.912245... (numeric, ~10 digits)

**Prime gap moment**: ⟨d⁴⟩ - 4⟨d⟩⟨d³⟩ + 6⟨d⟩²⟨d²⟩ - 3⟨d⟩⁴ = excess kurtosis

**Method**: Numerical integration (VEGAS) of 138 master integrals. Subtraction of UV/IR subdivergences automated.

**Worldline**: Four kinks → kurtosis of proper-time fluctuations. Negative kurtosis = platykurtic (lighter tails than Gaussian).

---

### 4. 5-Loop QED (O(α⁵)) — 5th Moment (2024 Complete)

**Diagrams**: 12,672 diagrams (6,336 vertex + 3,168 self-energy + 3,168 VP)

**Coefficient**: C_5 ≈ 7.8 (sign positive, magnitude growing)

**Prime gap moment**: 5th central moment of prime gap distribution

**Method**: 
- Automated diagram generation (QGRAF)
- IBP reduction (Kira/FIRE) → ~200 master integrals
- Numerical integration (Cuhre/VEGAS) with sector decomposition
- Cross-check: analytic for subset of diagrams

**Status**: **Complete 2024** (Aoyama, Kinoshita, Nio, et al.)

**Worldline**: Five kinks → 5th moment. Positive = right-skewed proper-time distribution.

---

### 5. Loop Order vs Prime Gap Moment Summary

| Loop | Diagrams | Coefficient C_n | Prime Moment | Sign |
|------|----------|-----------------|--------------|------|
| 1    | 1        | +0.5            | ⟨d⟩          | +    |
| 2    | 12       | -0.328          | Var(d)       | -    |
| 3    | 72       | +1.181          | Skew(d)      | +    |
| 4    | 891      | -1.912          | Kurt(d)      | -    |
| 5    | 12,672   | +7.8            | Moment_5     | +    |

**Pattern**: Sign alternates; magnitude grows ~ n! (asymptotic series). Prime gap moments follow same alternation from Riemann zero sum.

---

### 6. Renormalization & Scheme Dependence

- **On-shell scheme**: Used for final result; α defined at q²=0 (Thomson limit)
- **MS-bar scheme**: α(μ) at μ = m_e; conversion known to 4-loop
- **Scheme independence**: Physical a_e is scheme-independent; only coefficient split changes

---

### 7. Numerical Uncertainty Budget (2024)

| Source | Uncertainty (×10⁻¹²) |
|--------|---------------------|
| α (fine structure) | 0.76 |
| 5-loop numeric | 0.15 |
| Hadronic VP | 1.8 |
| Hadronic LbL | 0.3 |
| Weak | 0.05 |
| **Total theory** | **2.0** |
| **Experiment (Harvard)** | **0.28** |

**Electron g-2 is theory-limited** — dominated by α uncertainty (Rb recoil measurement).

---

### 8. References

1. Laporta (2000) — IBP algorithm
2. Kinoshita & Nio — 4-loop numeric
3. Aoyama et al. (2024) — 5-loop complete
4. Prime-Electron Foundation §3.4, §4.2
5. PrimeBookOne dir 0.0 (Tile00-Tile188) for gap moments

---

*End of Part 2b — Next: Part 2c — Hadronic Vacuum Polarization*

---

**Status**: Part 2b complete (~95 lines).