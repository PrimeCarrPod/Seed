## 4. Phase-Change Layer

### 4.1 Material Selection and Properties
The phase-change layer absorbs thermal energy through latent heat of fusion:

```
Selected PCM: Paraffin wax (C₂₅H₅₂) with graphite nanoparticles
Melting Point: 58°C ±2°C
Latent Heat: 200 kJ/kg
Specific Heat (solid): 2.5 kJ/kg·K
Specific Heat (liquid): 3.2 kJ/kg·K
Density: 900 kg/m³
Thermal Conductivity: 0.4 W/m·K (with 5wt% graphite)
```

### 4.2 Thermal Protection Mechanism
Energy absorption occurs during phase transition:

```
Energy Absorbed: $Q = m \cdot L$  (where $L$ = latent heat)
Temperature Stabilization: $T \approx T_{\text{melt}}$ during phase change
Heat Flux Handling: $q_{\max} = \frac{k \Delta T}{d}$  (conduction through layer)
```
For 5 mm thickness and $\Delta T = 50^\circ$C, $q_{\max} \approx 4$ kW/cm² (conduction limit).

**Stefan Number:**
```
$Ste = \frac{c_p \Delta T}{L_f}$
```

**Fourier Number:**
```
$Fo = \frac{\alpha t}{L^2}$  where $\alpha = k/(\rho c_p)$
```

**Neumann Solution (Moving Boundary):**
```
$s(t) = 2\lambda \sqrt{\alpha t}$  where $\lambda$ solves $\lambda e^{\lambda^2} \text{erf}(\lambda) = \frac{Ste}{\sqrt{\pi}}$
```

### 4.3 Nanoparticle Enhancement
Graphite nanoparticles improve thermal conductivity and stability:

```
Thermal Conductivity Increase: $k_{\text{eff}} = k_m \left(1 + \frac{3\phi(k_p - k_m)}{k_p + 2k_m}\right)$
where φ = nanoparticle volume fraction (0.05)
k_p = 1500 W/m·K (graphite), k_m = 0.2 W/m·K (paraffin)
k_eff ≈ 0.4 W/m·K (100% increase)

**Effective Medium Theory (Bruggeman):**
```
$\frac{\phi}{k_p - k_{eff}} + \frac{1-\phi}{k_m - k_{eff}} = 0$
```

**Percolation Threshold:**
```
$\phi_c \approx 0.16$  (for 3D random network)
```

Prevents localized overheating and improves heat spreading.
