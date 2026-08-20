# A1-18: Worldline Path Integral — Piece 08
## Numerical Evaluation from PrimeBookOne Data

The path integral can be evaluated numerically using the PrimeBookOne gap data. The algorithm for computing the propagator K(x_f, x_i; N) is:

```
function compute_propagator(directory_level, x_i, x_f):
    gaps = load_gaps(directory_level)  # array of d_n
    N = len(gaps)
    
    # Classical path
    x_cl = classical_path(x_i, x_f, gaps)
    
    # Classical action
    S_cl = 0
    for n in range(N):
        d = gaps[n]
        Omega = sqrt(1 + lambda * correlation(gaps, n))
        v = (x_cl[n+1] - x_cl[n]) / d
        S_cl += (m_e * c / 2) * d * Omega * dot(v, v)
    
    # Van Vleck determinant
    det_VV = van_vleck_determinant(gaps, x_cl)
    
    # Propagator
    K = det_VV^{1/2} * exp(i * S_cl / hbar)
    
    # Loop corrections (self-energy, vertex)
    K = K * loop_corrections(gaps, x_cl)
    
    return K
```

For directory 0.0 (94,500 gaps), the classical path can be found by solving the discrete geodesic equation from A1-15. The loop corrections involve sums over the gap distribution.

The partition function Z(β) = Tr(exp(-β H)) from A1-17 Piece 08 is computed as:
```
function compute_partition_function(directory_level, beta):
    gaps = load_gaps(directory_level)
    Z = 0
    for d in gaps:
        Z += exp(-beta * m_e * c**2 / d)
    return Z
```

The running coupling α(μ) is extracted from the vertex function:
```
function compute_running_coupling(directory_level):
    gaps = load_gaps(directory_level)
    # Vertex function at scale mu = 1/d
    alpha = {}
    for d in unique(gaps):
        mu = 1/d
        alpha[mu] = vertex_function(gaps, mu)
    return alpha
```

The numerical results from PrimeBookOne data at directory levels 0.0, 1.0, 2.0, 3.0 should show:
1. Convergence of the propagator as directory level increases
2. Running coupling α(μ) matching QED β-function
3. Spectral fluctuations matching Riemann zero resonances (A1-04)
4. Partition function Z(β) matching thermodynamic quantities from A1-17

The numerical evaluation provides the empirical test of the entire framework.