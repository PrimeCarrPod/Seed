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
