# A1-14: Worldline Metric From Gaps — Piece 11: Computational Verification

## 23. Algorithm for Metric Extraction from PrimeBookOne

### 23.1 Metric Computation Pipeline

```python
def compute_metric_from_gaps(tile_paths, book_idx):
    """
    Extracts metric components from PrimeBookOne gap data.
    """
    M = 2**20
    gaps = stream_book_gaps(book_idx)  # length M
    
    # Proper time array
    tau = np.cumsum(kappa * gaps)
    
    # Local mean gap (conformal factor)
    window = 1000
    Omega2 = np.convolve(gaps, np.ones(window)/window, mode='valid')
    
    # Metric components
    g_00 = np.ones_like(Omega2)
    g_ij = np.outer(Omega2, np.eye(3))  # isotropic
    
    # Curvature
    Omega = np.sqrt(Omega2)
    R = -6 * (np.gradient(np.gradient(Omega)) / Omega - (np.gradient(Omega)/Omega)**2)
    
    return {
        'tau': tau[window:],
        'Omega2': Omega2,
        'g_00': g_00,
        'g_ij': g_ij,
        'R': R,
        'det_g': Omega2**4
    }
```

### 23.2 Expected Metric Results

| Book $b$ | $\Omega^2 \sim \ln b$ | $R \times \tau_b^2$ | $g_{ij}$ anisotropy |
|----------|----------------------|---------------------|---------------------|
| 1        | ~1                   | ~1                  | ~0.1                |
| 100      | ~4.6                 | ~0.05               | ~0.02               |
| 1000     | ~6.9                 | ~0.02               | ~0.007              |
| 3500     | ~8.1                 | ~0.01               | ~0.002              |

---

## 24. Verification Checks

### 24.1 Conformal Flatness Test

Verify $R_{\mu\nu\rho\sigma} = \text{conformal} + \mathcal{O}(1/\ln^2 n)$:
```python
def test_conformal_flatness(metric):
    R = metric['R']
    # Weyl tensor should vanish for conformally flat
    C = compute_weyl(metric)
    return np.max(np.abs(C)) < 1e-6
```

### 24.2 Light Cone Angle Test

Verify $\tan \theta_{\text{LC}} \approx 1$:
```python
def test_light_cone(metric):
    # Light cone: dtau^2 = g_ij dx^i dx^j
    # For dx = 1 step in space, dtau = sqrt(g_ii)
    dtau_light = np.sqrt(metric['g_ij'][:,0,0])
    dtau_proper = kappa * gaps
    return np.allclose(dtau_light / dtau_proper, 1, rtol=0.5)
```

### 24.3 Einstein Equation Test

Verify $G_{\mu\nu} = 8\pi G T_{\mu\nu}$:
```python
def test_einstein(metric):
    G = compute_einstein(metric)
    T = compute_stress_energy_from_gaps(metric)
    return np.allclose(G, 8*np.pi*G_newton * T, rtol=0.1)
```

---

*End of Piece 11 — Continues in Piece 12: Synthesis and Conclusion*