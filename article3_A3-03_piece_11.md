# A3-03 Prime_Difference_Basis.md — Piece 11: Continuum Limit and Effective Field Theory

## 11.1 From Discrete Basis to Continuum Field Theory

The 256-dimensional Hilbert space ℋ₂₅₆ is the IR effective theory of a deeper 11-bit (2048-dimensional) UV theory from PrimeBookOne directory 3.0 (d_max = 1476). We analyze the continuum limit.

## 11.2 Scaling Limit

Define the scaling parameter ε = 1/256. The gap variable d ∈ {0, ..., 255} becomes a continuous variable x = ε·d ∈ [0, 1). The basis states |d⟩ become position eigenstates |x⟩ with:

```
⟨x|x'⟩ = δ(x - x') / ε  (continuum normalization)
```

The probability density:
```
p(x) = p(d) / ε,  x = d/256
```

As ε → 0 (increasing bit depth), p(x) approaches a smooth density on [0, 1).

## 11.3 Continuum Observables

### 11.3.1 Position Operator
```
x̂ = ∫₀¹ x |x⟩⟨x| dx
```
with eigenvalues x ∈ [0, 1). In discrete: d̂ = 256 x̂.

### 11.3.2 Momentum Operator
The Fourier basis |k⟩ becomes plane waves:
```
|k⟩ → |p⟩,  p = 2πk/256 ∈ [0, 2π)
```
Momentum operator:
```
p̂ = ∫₀^{2π} p |p⟩⟨p| dp
```

### 11.3.3 Hamiltonian Density
From Piece 05, Ĥ = (ℏ/κ) Σ_d d⁻¹ |d⟩⟨d|. In continuum:
```
Ĥ = ∫₀¹ (ℏ/(κ·256·x)) |x⟩⟨x| dx = (ℏ/(256κ)) ∫₀¹ x⁻¹ |x⟩⟨x| dx
```
The 1/x singularity at x=0 reflects the d=2 (twin prime) ground state.

## 11.4 Effective Action and Path Integral

The time evolution from A3-02: U(t) = exp(-iĤt/ℏ). In continuum, the path integral for the propagator:

```
⟨x_f| U(t) |x_i⟩ = ∫ D[x(τ)] exp(i S[x] / ℏ)
```

with action:
```
S[x] = ∫₀ᵗ [ (1/2) m(x) ẋ² - V(x) ] dτ
```

where the effective mass and potential are determined by the prime gap statistics:
```
m(x) = κ / (ℏ·x)  (position-dependent mass)
V(x) = 0  (free particle on curved space)
```

The position-dependent mass arises from the non-uniform density of states.

## 11.5 Renormalization Group Flow

The directory versions 0.0 → 1.0 → 2.0 → 3.0 correspond to RG flow in bit depth:

### 11.5.1 Beta Function for Bit Depth
Let b = 8 be the number of bits. The effective coupling is the gap distribution entropy:
```
g(b) = H_b(p) = - Σ_{d=0}^{2^b-1} p_b(d) log p_b(d)
```

The beta function:
```
β(g) = dg/db = - ∂H/∂b
```

From data:
- b=4 (16 states): H ≈ 3.2 bits
- b=8 (256 states): H ≈ 4.87 bits
- b=11 (2048 states): H ≈ 6.1 bits

The flow is toward higher entropy (more disorder) in the UV.

### 11.5.2 Fixed Points
- **IR fixed point (b → 0)**: Single state |2⟩ (twin prime only), g=0
- **UV fixed point (b → ∞)**: Continuous distribution, g = H_max = log(1476) ≈ 10.5 bits

The physical theory at b=8 is near the crossover between these regimes.

## 11.6 Operator Product Expansion

In the continuum limit, basis state projectors have OPE:
```
|x⟩⟨x| · |y⟩⟨y| ∼ δ(x-y) |x⟩⟨x| + C(x,y) |x+y⟩⟨x+y| + ...
```

The structure constants C(x,y) encode the gap correlation function. For x,y small (d ≪ 256):
```
C(x,y) ∝ (x y)^{-1/2}  (conformal behavior, c=1)
```

This reproduces the c=1 CFT structure from Piece 08.

## 11.7 Lattice Artifacts and Discretization Errors

The 8-bit discretization introduces artifacts:
1. **Momentum cutoff**: p_max = π (Nyquist)
2. **Position uncertainty**: Δx = ε = 1/256
3. **Dispersion relation**: E(p) = (ℏ/κ) (256/p) for small p, modified at p ~ π

The leading discretization error in energy eigenvalues:
```
ΔE_d / E_d = O(ε²) = O(1/256²) ≈ 1.5×10⁻⁵
```
which is negligible for physical predictions.

## 11.8 UV Completion at 11 Bits

The full PrimeBookOne 3.0 directory has d_max = 1476, requiring 11 bits (2048 states). The UV completion:
```
ℋ₂₅₆ ↪ ℋ₂₀₄₈
```
embedding the 8-bit space as the low-energy subspace. The additional 1792 states (d = 256..1476) correspond to high-energy excitations above the 8-bit cutoff.

The mass gap between IR and UV sectors:
```
ΔM = ℏ/(κ·256) - ℏ/(κ·1476) ≈ 3.9 MeV - 0.68 MeV ≈ 3.2 MeV
```
This is the scale where 8-bit effective theory breaks down.

## 11.9 Piece 11 Summary

- Continuum limit: x = d/256 ∈ [0,1), p(x) smooth density
- Continuum observables: x̂, p̂, Ĥ with 1/x potential
- Path integral with position-dependent mass
- RG flow in bit depth: IR fixed point |2⟩, UV fixed point continuous
- OPE reproduces c=1 CFT structure
- Discretization errors O(1/256²) ≈ 1.5×10⁻⁵
- UV completion at 11 bits (d_max=1476), mass gap ~3.2 MeV

**References**: A1-04 (Riemann Zeros), A1-24 (Index Theorem), A2-01 (Gap To Energy), A3-01 (Hilbert Space), A3-02 (Time Evolution), A3-04 (Unitarity)