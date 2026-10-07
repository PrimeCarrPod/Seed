# Spectral_Form_Factors_Dip_Ramp_Plateau_Holographic_Wormholes — Piece 07/13
## Article A6: A6-07 — Spectral Form Factors Dip Ramp Plateau Holographic Wormholes
**Piece:** 07 of 13  
**Generated:** 2026-10-07 01:35:00 UTC  
**Author:** Jason Isaac Brodsky (California 1976) — Conducier

---

## 9. Double-Trumpet Geometry: Connecting Asymptotic Boundaries in the Prime Electron

The double-trumpet (cylinder) geometry is the central holographic object responsible for the linear ramp in the SFF. In the prime electron framework, this geometry has a direct interpretation as the analytic continuation of the worldline's self-intersection structure, connecting the forward-time (electron) and backward-time (positron) asymptotic boundaries.

### 9.1 Double-Trumpet as Analytic Continuation of Worldline Self-Intersection

The prime electron worldline γ: ℝ → ℳ⁴ is a single continuous curve with self-intersections. In Lorentzian signature, a self-intersection occurs when γ(τ₁) = γ(τ₂) for τ₁ ≠ τ₂. The worldline crosses itself, creating a vertex where the electron interacts with its own past/future.

Under Wick rotation τ → iτ_E, the worldline becomes a Euclidean path. The self-intersection becomes a Euclidean wormhole — a handle connecting two points on the boundary. The double-trumpet is the simplest such wormhole with two asymptotic boundaries.

The two boundaries correspond to:
- **Boundary 1 (β₁)**: The forward-time electron worldline segment
- **Boundary 2 (β₂)**: The backward-time positron worldline segment

The double-trumpet geometry interpolates between these two boundaries, representing the pair creation/annihilation process. The modulus b of the double-trumpet is the proper-time distance between the pair creation and annihilation events.

### 9.2 JT Gravity on the Double-Trumpet

The JT gravity action on the double-trumpet (cylinder) with boundaries of lengths β₁, β₂ is:

I = −2π√b (β₁ + β₂) + 2 log sinh(2π√b) + ...

The path integral over the modulus b gives:

Z(β₁, β₂) = ∫_0^∞ db (b/2) sinh(2π√b) e^{-2π√b (β₁+β₂)}

For the SFF, we set β₁ = β + it/2, β₂ = β − it/2, so β₁ + β₂ = 2β, and the oscillatory factor is e^{i t b}. The SFF is:

K(t) = |Z(β + it/2, β − it/2)|² / |Z(β, β)|²

The integral over b produces the ramp:

K_ramp(t) = ∫_0^∞ db (b/2) sinh(2π√b) e^{-2β√b} cos(t b)

At low temperatures (β → ∞), the integral is dominated by small b, and sinh(2π√b) ≈ 2π√b. The integral gives:

K_ramp(t) ~ ∫_0^∞ db b^{3/2} e^{-2β√b} cos(t b) ~ t (for t < 1)

This is the universal linear ramp.

### 9.3 Prime Gap Sequence as Double-Trumpet Moduli

In the prime electron, the modulus b is quantized by the prime gap sequence. The proper-time interval between pair creation and annihilation is:

Δτ = κ dₙ

The Euclidean length of the wormhole is bₙ = log(κ dₙ) (or simply log dₙ up to a constant). The sum over gaps replaces the integral over b:

K(t) = Σₙ w(dₙ) e^{i t log dₙ}

where w(d) is the weight from the JT measure. For the prime gap sequence, the weight is:

w(d) = d · sinh(2π√{log d}) ≈ d · 2π√{log d} (for small log d)

The sum Σₙ w(dₙ) e^{i t log dₙ} is a discrete analog of the JT gravity integral. The discreteness of the prime gaps (even integers) provides a natural UV cutoff and a lattice structure on the moduli space.

The double-trumpet moduli space for the prime electron is therefore the set {log 2, log 4, log 6, ..., log 254} with weights w(dₙ). The ramp emerges from the interference of these discrete modes.

### 9.4 Asymptotic Boundaries and the Electron/Positron Distinction

The two asymptotic boundaries of the double-trumpet have a clear physical interpretation in the one-electron universe:

- **Boundary 1 (Electron)**: Forward-time propagation, lepton number L = +1, charge Q = −e
- **Boundary 2 (Positron)**: Backward-time propagation, lepton number L = −1, charge Q = +e

The double-trumpet connects these boundaries, representing the process where an electron worldline turns around in time (pair annihilation) or a positron turns around (pair creation). The proper-time interval for this process is the prime gap dₙ.

The boundary lengths β₁, β₂ are the inverse temperatures of the electron/positron thermal ensembles. In the prime electron, the "temperature" is the proper-time scale κ, and the boundaries have lengths:

β₁ = β₂ = 1/κ (in natural units)

The SFF computes the correlation between the electron and positron partition functions:

K(τ) = ⟨Z_e(β + iτ/2) Z_p(β − iτ/2)⟩ / ⟨Z_e(β) Z_p(β)⟩

where Z_e = Tr e^{-βH} is the electron partition function and Z_p = Tr e^{-βH} is the positron partition function (same Hamiltonian, but traced over the backward-time Hilbert space).

### 9.5 Double-Trumpet and the Spectral Form Factor Phases

The phase factor e^{i t b} in the JT integral becomes, for the prime electron:

e^{i τ log dₙ} = dₙ^{iτ}

The SFF is the sum over gaps:

K(τ) = |Σₙ w(dₙ) dₙ^{iτ}|² / |Σₙ w(dₙ)|²

This is a Dirichlet series evaluated at imaginary exponent. The linear ramp arises from the statistical properties of the sequence {log dₙ}.

For the prime gap sequence, the logarithms log dₙ are approximately uniformly distributed modulo 2π (by the equidistribution of prime gaps). The sum Σ dₙ^{iτ} behaves like a random walk in the complex plane for intermediate τ, giving the linear ramp |Σ|² ~ τ.

At very large τ, the phases become completely random, and the sum saturates at the number of terms (the plateau). At very small τ, all phases are near 1, giving the dip.

### 9.6 Geometry of the Prime Electron Double-Trumpet

The double-trumpet geometry for the prime electron can be visualized as follows:

```
    Electron Boundary (β₁)          Positron Boundary (β₂)
    ╭─────────────────────╮         ╭─────────────────────╮
    │                     │         │                     │
    │   ┌─────────────┐   │         │   ┌─────────────┐   │
    │   │   dₙ = 2    │   │         │   │   dₙ = 2    │   │
    │   │  (twin)     │   │    ~    │   │  (twin)     │   │
    │   └─────────────┘   │         │   └─────────────┘   │
    │       │             │         │             │       │
    │       ▼             │         │             ▼       │
    │   ┌─────────────┐   │         │   ┌─────────────┐   │
    │   │   dₙ = 4    │   │         │   │   dₙ = 4    │   │
    │   └─────────────┘   │         │   └─────────────┘   │
    │       │             │         │             │       │
    ╰───────│─────────────╯         ╰───────│─────────────╯
            │                         │
            ▼                         ▼
       Double-Trumpet Waist (modulus b)
            │
            ▼
       Sum over all dₙ
```

Each gap dₙ corresponds to a "layer" in the double-trumpet. The twin prime gaps (d = 2) are the thinnest waist (smallest b = log 2), while the record gaps (d = 254) are the thickest. The JT measure weights each layer by w(d) ~ d sinh(2π√{log d}).

The sum over all gaps constructs the full double-trumpet geometry. The ramp is the interference pattern of all these layers.

### 9.7 Replica Wormholes and the Page Curve

The double-trumpet is the n = 2 replica wormhole. For the Page curve of entanglement entropy, one needs the n-replica wormhole for general n. The n-boundary wormhole has genus g = n − 1 and gives the n-th Rényi entropy:

S_n = (1/(1−n)) log Tr ρⁿ

For the prime electron, the replica wormholes are constructed from n copies of the prime gap sequence, connected by cyclic permutations. The partition function on the n-replica wormhole is:

Z_n = Σ_{d₁,...,dₙ} ∏ w(dᵢ) e^{iτ Σ log dᵢ} (cyclic condition)

This computes the Rényi entropies of the worldline density matrix. The Page curve emerges from the transition between disconnected and connected replica geometries as a function of time.

The prime electron's Page curve will be derived in Piece 11.

---