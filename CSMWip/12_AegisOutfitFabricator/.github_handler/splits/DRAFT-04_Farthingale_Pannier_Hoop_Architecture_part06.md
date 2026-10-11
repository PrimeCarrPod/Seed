I = m r² (moment of inertia)
c = damping (air + internal friction)
θ(0) = θ_collapsed, θ̇(0) = 0
```

**Deployment Time:**
```
τ = √(I/k)  (natural period)
Target: θ(t_deploy) ≈ 0.95 × θ_expanded
t_deploy < 5 seconds
```

### 4.4 Locking Mechanism
**Friction Catch:**
```
Locking torque: T_lock = μ_lock × F_normal × r_lock
μ_lock ≈ 0.3-0.5 (steel on steel)
F_normal = spring preload
```

**Magnetic Latch (Modern Alternative):**
```
Force: F_mag = B² A / (2μ₀)
B ≈ 0.5 T (NdFeB), A ≈ 100 mm²
F_mag ≈ 10 N per latch
```

### 4.5 Deployment Sequence
```
Stage 1: Waistband hoop deploys (t=0-0.5s)
