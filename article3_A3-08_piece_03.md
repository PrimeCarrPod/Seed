# A3-08 Error_Correction_Twin_Primes.md — Piece 03: The Middle Code — Modular Sector Protection

## 3.1 Modular Sectors as a Quantum Code

The prime gap distribution modulo 6 partitions the 128 even gaps into three sectors:

| Sector | Residue mod 6 | Gaps | Total Weight | Key Gaps |
|--------|---------------|------|--------------|----------|
| S₀ | 0 | {6, 12, 18, 24, 30, 36, ...} | ~0.333 | 6, 30, 42, 60, 90 |
| S₂ | 2 | {2, 8, 14, 20, 26, 32, ...} | ~0.500 | **2** (0.500), 8, 14, 20 |
| S₄ | 4 | {4, 10, 16, 22, 28, 34, ...} | ~0.167 | 4, 10, 16, 28, 40 |

The twin prime sector S₂ dominates with 50% weight, almost entirely from d=2. This is the **logical qubit subspace**. The other two sectors S₀, S₄ form the **error space**.

## 3.2 Sector Projection Operators

The sector projectors are:
```
Π₀ = Σ_{d≡0(6)} |d⟩⟨d|,  Π₂ = Σ_{d≡2(6)} |d⟩⟨d|,  Π₄ = Σ_{d≡4(6)} |d⟩⟨d|
```
These satisfy:
- Π₀ + Π₂ + Π₄ = I (on even gaps)
- Πᵢ Πⱼ = δᵢⱼ Πᵢ
- Tr(Π₂) = 1 (only d=2 has significant weight in S₂)

The logical projector is Π_L = Π₂ = |2⟩⟨2| (approximately, since d=8,14,20... have negligible weight).

## 3.3 Modular Selection Rules and Error Suppression

From A3-05 and A3-06, the gap correlation matrix C(d,d') shows that transitions **within** a sector are enhanced, while transitions **between** sectors are suppressed.

### Transition Amplitudes
From PrimeBookOne conditional probabilities p(d'|d):
- **Within S₀**: p(30|6) ~ 0.08, p(42|30) ~ 0.05 (enhanced by factor ~3)
- **Within S₂**: p(8|2) ~ 10⁻⁴, p(14|8) ~ 0.02 (strongly suppressed for d=2)
- **Within S₄**: p(10|4) ~ 0.03, p(16|10) ~ 0.02
- **S₂ → S₀**: p(6|2) ~ 5×10⁻⁵, p(30|2) ~ 10⁻⁵
- **S₂ → S₄**: p(4|2) ~ 3×10⁻⁵, p(10|2) ~ 10⁻⁵
- **S₀ ↔ S₄**: p(4|6) ~ 0.01, p(10|12) ~ 0.02

The **modular selection rule**: Transitions between different mod 6 sectors are suppressed by 3-4 orders of magnitude compared to within-sector transitions.

## 3.4 The Modular Code as a Subsystem Code

The modular sector structure defines a **subsystem code** (Bacon-Shor type):
- Gauge group: G = ⟨Π₀, Π₄⟩ (sector projectors)
- Logical operators: Z_L = Π₂ - (Π₀ + Π₄), X_L connects Π₂ ↔ (Π₀ + Π₄)
- The gauge qubits are the within-sector degrees of freedom
- The logical qubit is the sector label

### Gauge Fixing
Fixing the gauge means choosing a specific gap within each sector:
```
|0_L⟩ = |2⟩ ∈ S₂ (fixed)
|1_L⟩ = √w₀ |ψ₀⟩ + √w₄ |ψ₄⟩ ∈ S₀ ⊕ S₄
```
where |ψ₀⟩ = Σ_{d∈S₀} √(μ₈(d)/w₀) |d⟩, w₀ = Tr(Π₀), similarly for S₄.

The gauge freedom allows error correction to act on sectors without resolving individual gaps.

## 3.5 Syndrome Measurement for Modular Code

The syndrome is the **mod 6 sector measurement**:
```
M_mod6 = Σ_{r∈{0,2,4}} r · Π_r
```
This is implemented by measuring the operator:
```
O_mod6 = Σ_d (d mod 6) |d⟩⟨d|
```
In the 8-bit basis, d mod 6 can be computed from the bits:
- d mod 2 = bit 0 (always 0 for physical gaps)
- d mod 3 = (bit 0 + 2·bit 1 + 4·bit 2 + 8·bit 3 + ...) mod 3
- d mod 6 combines both

The measurement circuit uses a **modular Fourier transform** (A3-04, Piece 09) followed by measurement in the computational basis.

## 3.6 Error Correction at Modular Level

### Error Model
Errors are gap transitions. Classified by sector change:
- **Type I (Within-sector)**: d → d' with d ≡ d' (mod 6). Correctable by inner code.
- **Type II (Adjacent sector)**: d → d' with d ≡ d' ± 2 (mod 6). Detected by S₃ or S₄ flip.
- **Type III (Opposite sector)**: d → d' with d ≡ d' + 4 (mod 6) (i.e., 0↔4). Detected by both S₃ and S₄ flip.

### Correction Procedure
1. Measure mod 6 sector (S₃, S₄)
2. If sector = S₂ (syndrome +,+): No error (logical |0_L⟩)
3. If sector = S₀ (syndrome -,+): Apply recovery R₀ mapping S₀ → S₂
4. If sector = S₄ (syndrome +,-): Apply recovery R₄ mapping S₄ → S₂

The recovery operators are conditional unitaries:
```
R₀ = Σ_{d∈S₀} |2⟩⟨d| + Σ_{d∉S₀} |d⟩⟨d|
R₄ = Σ_{d∈S₄} |2⟩⟨d| + Σ_{d∉S₄} |d⟩⟨d|
```

## 3.7 Effective Distance and Threshold

The modular code alone has distance d = 2 (it detects any sector change but cannot correct two sector changes without inner code). However, combined with the inner code:

### Concatenated Inner ⊗ Modular
- Inner code corrects within-sector errors (distance 3)
- Modular code corrects between-sector errors (detects 1 sector change)
- Combined: corrects 1 within-sector + 1 between-sector error

### Threshold Calculation
Physical between-sector error rate: ε_mod ~ 10⁻⁴ (from selection rules)
Physical within-sector error rate: ε_inner ~ 5×10⁻⁵ (effective, after DFS)

The concatenated code threshold for independent errors:
```
ε_th ≈ 0.1 (inner) × 0.5 (modular) ~ 0.05
```
Actual error rates ε_mod, ε_inner ≪ ε_th — **deep in the fault-tolerant regime**.

## 3.8 Piece 03 Summary

- Mod 6 sectors S₀, S₂, S₄ form a natural subsystem code
- Twin prime sector S₂ = logical |0_L⟩ (weight 0.5, dominated by d=2)
- Modular selection rules suppress inter-sector transitions by 10⁻⁴
- Syndrome = mod 6 measurement (O_mod6 = Σ (d mod 6)|d⟩⟨d|)
- Recovery maps S₀, S₄ back to S₂ via conditional unitaries
- Combined with inner code: corrects 1 within + 1 between sector error
- Error rates ~10⁻⁴ ≪ threshold ~0.05 — deep fault-tolerant regime

**References**: A3-05 (Modular Correlations, Piece 02, 03, 04), A3-06 (Decoherence, Selection Rules), A3-04 (Modular Fourier Transform), A1-35 (Inner Code), Subsystem Codes (Bacon-Shor)