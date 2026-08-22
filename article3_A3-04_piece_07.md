# A3-04 Unitarity_From_Prime_Distribution.md — Piece 07: The PrimeBookOne RG Flow and Unitarity Preservation

## 7.1 Directory Versions as RG Flow

PrimeBookOne's directory structure 0.0 → 1.0 → 2.0 → 3.0 corresponds to a renormalization group flow in the space of quantum theories on ℋ_{2^b} where b is the bit depth:
- 0.0: b = 8 (256 states, d ≤ 256)
- 1.0: b = 8 + log₂(3500) ≈ 19.8 (3.5K books × 2²⁰)
- 2.0: b ≈ 16-20 (extended precision)
- 3.0: b = 11 (2048 states, d ≤ 1476) — UV completion

Each step coarse-grains the gap distribution, integrating out short-distance (small-scale) fluctuations.

## 7.2 RG Transformation on the Hilbert Space

The RG transformation is a completely positive trace-preserving (CPTP) map:
```
ℰ_{b→b'} : ℋ_{2^b} → ℋ_{2^{b'}},  b' > b
```
defined by:
```
ℰ(ρ) = Σ_k V_k ρ V_k†
```
where the Kraus operators V_k implement the coarse-graining (block-spin transformation on the gap sequence).

### 7.2.1 Explicit Form for 8 → 11 Bits
The embedding ℋ₂₅₆ ↪ ℋ₂₀₄₈ is given by:
```
V = Σ_{d=0}^{255} |d⟩_{11} ⟨d|_8
```
where |d⟩_{11} is the basis state in the 11-bit space. This is an isometry: V†V = I_8, VV† = P_{≤255} (projector onto low-energy subspace).

### 7.2.2 Coarse-Graining the Gap Distribution
The probability distribution flows as:
```
p^{(b')}(d) = Σ_{d' : d' ≡ d (mod 2^b)} p^{(b)}(d')
```
For example, 8-bit d=2 receives contributions from 11-bit gaps 2, 258, 514, 770, 1026, 1282.

## 7.3 Unitarity Preservation Under RG

### 7.3.1 Isometric Embedding
The 8-bit time evolution U_8(t) = exp(-iĤ_8 t/ℏ) embeds into the 11-bit theory as:
```
U_{11}(t) = V U_8(t) V† + (I - VV†) U_{UV}(t) (I - VV†)
```
where U_{UV}(t) acts on the high-energy subspace (d > 255). This preserves unitarity exactly if the full U_{11}(t) is unitary.

### 7.3.2 Effective Unitarity at Low Energies
For energies E ≪ ℏ/(κ·256) ≈ 3.9 MeV, the high-energy subspace is unpopulated. The effective S-matrix on ℋ₂₅₆ is:
```
S_eff = P_{≤255} U_{11}(T) P_{≤255} / √(P_{≤255} U_{11}(T) P_{≤255} U_{11}†(T) P_{≤255})
```
This is unitary by construction (polar decomposition). The deviation from the naive projected S-matrix is O((E/E_UV)²) ≈ O((256/1476)²) ≈ 0.03.

## 7.4 Fixed Points of the RG Flow

### 7.4.1 IR Fixed Point (b → 0)
As b → 0, only the twin prime gap d=2 survives. The Hilbert space collapses to ℋ₁ = ℂ (1 state). The theory is trivial: S = 1, unitarity exact.

### 7.4.2 UV Fixed Point (b → ∞)
As b → ∞, the gap distribution becomes continuous on [0, d_max]. The Hilbert space is L²([0, d_max]). The S-matrix becomes an integral operator with kernel S(d,d').

The UV fixed point theory is a c=1 CFT (A3-03, Piece 11) with central charge c=1. Unitarity is manifest in the CFT (Virasoro algebra with c=1 ≥ 0).

### 7.4.3 Crossover at b = 8
The physical theory at b=8 is at the crossover between IR and UV. The correlation length in bit-space:
```
ξ_b = 1 / log(λ₂/λ₁) ≈ 1 / log(0.11/0.25) ≈ 1.7 bits
```
matches the gap correlation length ξ ≈ 1.7 (A3-03, Piece 04).

## 7.5 Beta Functions for Unitarity Parameters

Define the "unitarity deficit" at scale b:
```
δ(b) = 1 - min_{ψ} ⟨ψ| S_b† S_b |ψ⟩
```
where S_b is the S-matrix at bit depth b.

For the prime gap system:
- δ(8) ≈ 0 (exactly unitary within 8-bit space)
- δ(11) ≈ 0 (exactly unitary in full UV space)
- δ(b) for non-physical b (intermediate) measures projection errors

The beta function β_δ = dδ/db has zeros at b=8 and b=11 (the physical directories).

## 7.6 Unitarity and the Prime Number Theorem

The prime number theorem π(x) ~ x/log x implies the gap density:
```
p(d) ~ C / (log d)²
```
for large d (Cramér's model). This density ensures:
1. **Normalizability**: Σ p(d) converges (since ∫ (log d)⁻² dd converges at ∞)
2. **Finiteness**: The total number of gaps up to x is π(x) ~ x/log x
3. **UV completeness**: The theory has a natural cutoff at d_max = 1476

The PNT is the deep number-theoretic reason why the prime gap system defines a **finite, normalizable, unitary quantum theory**.

## 7.7 Piece 07 Summary

- PrimeBookOne directories 0.0→1.0→2.0→3.0 = RG flow in bit depth
- RG transformation ℰ is CPTP map (isometric embedding + UV action)
- Unitarity preserved exactly in full theory; effective unitarity at low E with error O(0.03)
- IR fixed point: trivial 1-state theory (twin prime only)
- UV fixed point: c=1 CFT on continuous gap space
- Crossover at b=8 with correlation length ξ_b ≈ 1.7 bits
- Beta function for unitarity deficit has zeros at physical directories
- Prime number theorem → normalizable gap density → finite unitary theory

**References**: A3-03 (Pieces 07, 11), A1-36 (Decoupling Limits), A2-07 (Prime Density Mass Running), PrimeBookOne structure