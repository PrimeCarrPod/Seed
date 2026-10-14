## 6. Computational Implementation Architecture

### 6.1 HAS/PES Evaluation Pipeline

```python
def evaluate_design(x: DesignVector, edition: Edition) -> Tuple[float, float]:
    """
    Evaluate Historical Authenticity Score and Protection Efficacy Score.
    Returns: (HAS, PES) in [0, 1] × [0, 1]
    """
    # Decode design vector
    layer_thicknesses = decode_thicknesses(x[:12])
    material_choices = decode_materials(x[12:24])
    les_tensions = x[24:36]
    scaling_factors = x[36:39]
    au_density = x[39]
    
    # HAS computation (12 features)
    has_features = compute_historical_features(
        layer_thicknesses, material_choices, les_tensions, 
        scaling_factors, au_density, edition
    )
    has = sum(w * f for w, f in zip(HAS_WEIGHTS, has_features))
    
    # PES computation (5 threats)
    pes_scores = compute_protection_scores(
        layer_thicknesses, material_choices, les_tensions, edition
    )
    pes = sum(min(1.0, s / req) for s, req in zip(pes_scores, PES_REQUIREMENTS)) / 5.0
    
    return has, pes
```

### 6.2 Constraint Jacobian for Gradient-Based Refinement

For local refinement after NSGA-II global search:

$$\mathbf{J}_g = \frac{\partial \mathbf{g}}{\partial \mathbf{x}} \in \mathbb{R}^{N_c \times N_x}, \quad \mathbf{J}_h = \frac{\partial \mathbf{h}}{\partial \mathbf{x}} \in \mathbb{R}^{N_e \times N_x}$$

Where $N_c = 18$ (inequality constraints), $N_e = 7$ (equality constraints), $N_x = 40$ (decision variables).

**Key Constraint Gradients:**

$$\frac{\partial g_{\text{mass}}}{\partial t_k} = \rho_k \cdot A_k, \quad \frac{\partial g_{\text{mass}}}{\partial m_k} = \Delta\rho_k \cdot A_k$$

$$\frac{\partial g_{\text{thickness}}}{\partial t_k} = 1, \quad \sum t_k \leq T_{\text{max}} = 25\text{ mm}$$

$$\frac{\partial h_{\text{LES}}}{\partial T_z} = 1, \quad \sum_{z=1}^{12} T_z \cdot \mathbf{r}_z = \mathbf{0} \quad \text{(moment balance)}$$

### 6.3 Historical Feature Extraction from Extant Garments

**Measurement Protocol (per V&A Conservation Standards):**

| Feature | Measurement Method | Uncertainty | Sample Size (n) |
|---------|-------------------|-------------|-----------------|
| Bodice suppression curve | 3D laser scan, B-spline fit | ±0.5 mm | 47 (1600-1700) |
| Farthingale hoop progression | CT scan + manual measurement | ±1.0 mm | 23 |
| Watteau pleat depth/spacing | Photogrammetry + image analysis | ±0.3 mm | 31 |
| Cartridge pleat S-curve | Micro-CT of pleat cross-section | ±0.2 mm | 18 |
| Metallic thread cross-section | SEM-EDS, 5000× magnification | ±2 μm | 156 threads |
| Silk yarn twist (T/m) | ASTM D1423, automated twist tester | ±5 T/m | 89 samples |

**Statistical Historical Baselines:**

$$\mu_{\text{feature}}, \sigma_{\text{feature}} = \text{Mean, StdDev from extant corpus}$$

Used in HAS similarity metric: $\text{Sim} = \exp(-|P - \mu|^2 / 2\sigma^2)$.

---
