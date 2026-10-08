# Mathematical_Compendium_Computational_Protocols — Piece 03/13
## Article A2: A2-12 — Appendix: Mathematical Compendium & Computational Protocols
**Piece:** 03 of 13  
**Author:** Jason Isaac Brodsky (California 1976) — Conducier  
**Generated:** 2026-10-08 02:18:00 UTC

---

## PIECE 03: CAUSAL SET SPRINKLING & DIMENSION ESTIMATION CODE

### 3.1 From Prime Gaps to Causal Sets: The Sprinkling Algorithm

Section 2 established that the prime gap sequence {dₙ} generates a causal set (C, ≺) where C = {pₙ} and pₘ ≺ pₙ ⇔ m < n. The physical sprinkling density is ρ = 1/κ = 2mₑc²/ℏ ≈ 1.55×10²¹ s⁻¹. This piece provides the computational implementation for generating causal sets from π(x) and estimating their dimension.

### 3.2 Sprinkling Algorithm: Prime Lattice → Causal Set

**Algorithm PRIME_CAUSAL_SET(N_max, κ):**
```
Input: N_max (number of elements), κ (conversion constant)
Output: Causal set (elements, links)

1. // Generate first N_max primes
2. primes ← SIEVE_PRIMES(N_max * log(N_max) * 1.2)  // Rosser's bound
3. elements ← primes[0:N_max]
4. 
5. // Compute proper times τₙ = κ·(pₙ - 2)
6. proper_times ← [κ * (p - 2) for p in elements]
7. 
8. // Build link matrix (causal relations)
9. // pₘ ≺ pₙ iff m < n, but links only for "nearest" relations
10. links ← empty adjacency list
11. For n = 0 to N_max-1:
12.     For m = n+1 to min(n + MAX_LINK_DISTANCE, N_max-1):
13.         // Link if no intermediate element is causally between
14.         If IS_LINK(elements, n, m):
15.             links.add(n, m)
16. 
17. Return CausalSet(elements, proper_times, links)

Function IS_LINK(elements, n, m):
    // In prime causal set, link iff no prime between pₙ and pₘ
    // i.e., m = n+1 (only consecutive primes are linked)
    Return m == n + 1
```

**Note:** The causal set from primes is a **total order** (chain) — every element is linked only to its immediate successor. The non-trivial causal structure emerges from the **coarse-graining** procedure (Section 2, Piece 6).

### 3.3 Coarse-Graining: Recovering Lorentzian Geometry

The fundamental causal set is 1-dimensional (a chain). To recover d=4 Lorentzian geometry, we apply the **sprinkling into Minkowski space** procedure:

**Algorithm SPRINKLE_INTO_MINKOWSKI(ρ, volume, dimension=4):**
```
1. N ← Poisson(ρ * volume)
2. points ← random_points_in_Minkowski(N, volume)
3. // Causal relation: x ≺ y iff y - x is future timelike
4. links ← empty
5. For each pair (i, j) with i ≠ j:
6.     If IS_TIMELIKE_SEPARATED(points[i], points[j]):
7.         links.add(i, j)
8. Return CausalSet(points, links)
```

But in our framework, the **prime gaps themselves are the sprinkling** — we don't sprinkle into a pre-existing manifold. Instead, we compute dimension estimators directly on the prime causal set.

### 3.4 Myrheim-Meyer Dimension Estimator

For a causal set (C, ≺), the Myrheim-Meyer dimension is:

d_MM = 2 * log(R) / log(2) where R = N₀ / N₁

N₀ = number of elements (|C|)
N₁ = number of links (relations)

For a chain: N₁ = N₀ - 1, so R ≈ 1, giving d_MM ≈ 0 — incorrect!

**Resolution:** The estimator must be applied to **intervals** [pₘ, pₙ] in the causal set, not the whole chain.

**Algorithm MYRHEIM_MEYER_DIMENSION(causal_set, interval_size):**
```
1. dimensions ← []
2. For each interval [a, b] of size interval_size:
3.     N₀ ← count elements in [a, b]
4.     N₁ ← count links in [a, b]
4.     If N₁ > 0:
5.         R ← N₀ / N₁
6.         d ← 2 * log(R) / log(2)
7.         dimensions.append(d)
8. Return mean(dimensions), std(dimensions)
```

**Critical insight from Section 2:** The interval [pₘ, pₙ] has N₀ = n - m + 1 elements and N₁ = n - m links (since it's a sub-chain). But the **volume** of the interval in the emergent geometry is not N₀ — it's the proper time τ = κ·(pₙ - pₘ). The sprinkling density ρ relates N₀ to volume: N₀ = ρ·V + fluctuations.

So we compute:
- V_est = N₀ / ρ
- V_actual = τ = κ·(pₙ - pₘ)
- The ratio V_est/V_actual → 1 as interval size → ∞ (by Prime Number Theorem)

**Corrected Algorithm:**
```
1. For each interval [m, n] of proper time τ:
2.     N₀ ← n - m + 1
3.     V ← κ * (pₙ - pₘ)
4.     ρ_est ← N₀ / V
5.     // Dimension from volume-scaling of sub-intervals
6.     For sub-interval sizes s = 1, 2, 4, 8, ...:
7.         Count N₀(s) and V(s) for sub-intervals
8.         Fit V(s) ∝ N₀(s)^{d/4} → extract d
```

### 3.5 Volume-Chain Scaling: Enforcing d=4

Section 2, Piece 5 proved that volume-chain scaling enforces d=4. Computationally:

**Algorithm VOLUME_CHAIN_SCALING(causal_set):**
```
1. // Chain length = proper time τ = κ·(pₙ - pₘ)
2. // Volume = number of elements N₀
3. For interval sizes L = 10, 100, 1000, ...:
4.     samples ← random intervals of chain length L
5.     For each sample:
6.         τ ← proper_time_length(sample)
7.         N₀ ← element_count(sample)
8.         V_est ← N₀ / ρ
9.     Fit log(V_est) = (d/4)*log(τ) + constant
10.    d_est ← 4 * slope
11. Return d_est(L) for each L
```

**Expected result:** d_est(L) → 4 as L → ∞

### 3.6 Benincasa-Dowker Action Numerical Evaluation

The BD action for a causal set is:

S_BD = Σ_{x∈C} [N₀(x) - 9N₁(x) + 16N₂(x) - 8N₃(x)]

where N_k(x) = number of elements y ≺ x with exactly k links in the interval [y, x].

For the prime causal set (a chain), intervals are also chains. In a chain of length L:
- N₀ = L+1
- N₁ = L
- N₂ = L-1
- N₃ = L-2

So each element contributes: (L+1) - 9L + 16(L-1) - 8(L-2) = -2L + 1

**Algorithm BD_ACTION(causal_set):**
```
1. total ← 0
2. For each element x in causal_set:
3.     L ← chain_length_to_origin(x)  // Number of elements before x
4.     total ← total + (-2*L + 1)
5. Return total
```

For the emergent geometry, we must coarse-grain first (see Section 2, Piece 6).

### 3.7 Dimension Estimator Code: Complete Implementation

```python
import numpy as np
from math import log, sqrt

class PrimeCausalSet:
    def __init__(self, N_max, kappa=1.55e21):
        self.kappa = kappa
        self.primes = self._generate_primes(N_max)
        self.proper_times = [kappa * (p - 2) for p in self.primes]
        self.N = len(self.primes)
    
    def _generate_primes(self, n):
        # Segmented sieve for large n
        limit = int(n * (log(n) + log(log(n)))) + 10
        sieve = bytearray(b'\x01') * (limit + 1)
        sieve[0:2] = b'\x00\x00'
        for i in range(2, int(sqrt(limit)) + 1):
            if sieve[i]:
                sieve[i*i:limit+1:i] = b'\x00' * ((limit - i*i)//i + 1)
        return [i for i, is_prime in enumerate(sieve) if is_prime][:n]
    
    def myrheim_meyer_interval(self, start_idx, end_idx):
        N0 = end_idx - start_idx + 1
        N1 = end_idx - start_idx  # Chain: consecutive links
        if N1 == 0:
            return None
        R = N0 / N1
        return 2 * log(R) / log(2)
    
    def volume_chain_dimension(self, interval_sizes):
        results = []
        for L in interval_sizes:
            dims = []
            for start in range(0, self.N - L, L//10):
                end = start + L
                tau = self.proper_times[end] - self.proper_times[start]
                N0 = end - start + 1
                V_est = N0 / self.kappa  # Wait: κ is time per gap, not density
                # Correct: ρ = 1/κ gaps per unit time
                # Volume in 4D: V ∝ τ⁴
                # N0 = ρ * V = V/κ
                V_est = N0 * self.kappa  # This is the estimated volume
                dims.append(4 * log(V_est) / log(tau))
            results.append((L, np.mean(dims), np.std(dims)))
        return results
    
    def bd_action_coarse_grained(self, coarse_grain_factor=10):
        # Coarse-grain by grouping consecutive elements
        coarse_elements = self.proper_times[::coarse_grain_factor]
        N_coarse = len(coarse_elements)
        total = 0
        for i in range(N_coarse):
            # Count elements in past interval [0, i]
            L = i
            total += (-2*L + 1)
        return total * coarse_grain_factor**2  # Scale back

# Usage
causal_set = PrimeCausalSet(100000)
print("MM dimensions:", causal_set.volume_chain_dimension([100, 1000, 10000]))
```

---

*End of Piece 03 — Causal Set Sprinkling & Dimension Estimation*