## 4. Deployment Kinematics

### 4.1 Collapsed vs Expanded State
```
Collapsed diameter: D_collapsed ≈ 50mm (storage)
Expanded diameter: D_expanded ≈ 1000-1600mm (skirt hem)
Expansion ratio: D_expanded / D_collapsed ≈ 20-30×
```

### 4.2 Spring Energy Storage
**Per Hoop (Torsional Spring):**
```
U = ½ k θ²
k = G J / L  (torsional stiffness)
J = π r³ t  (thin-walled torsional constant)
G = E / (2(1+ν)) ≈ 77 GPa (steel)
L = hoop circumference ≈ 2πr
```

**Total System Energy:**
```
U_total = Σ U_i (all hoops)
U_total ≈ 50-200 J (edition dependent)
```

### 4.3 Deployment Dynamics
**Equation of Motion (Single Hoop):**
```
I θ̈ + c θ̇ + k θ = 0
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
Stage 2: Intermediate hoops cascade (t=0.5-2.0s)
Stage 3: Hem hoop deploys (t=2.0-4.0s)
Stage 4: Locking engages (t=4.0-5.0s)
```


