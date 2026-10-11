# MAT-02: Structural Foundation Materials
## AegisOutfitFabricator Material Science Bridge Document 2

## 1. Baleen (Keratin) Full Tensor Properties

### 1.1 Mechanical Properties (Research Doc 1 §5.1, Lines 65-68)
From Research Doc 1: Baleen is keratinous plate from *Balaena mysticetus*
- Young's modulus: E = 2-6 GPa (hydrated), varies with hydration & temperature
- Thermoplastic transition: 60-80°C (yields to body heat)
- Density: ρ ≈ 1.3-1.4 g/cm³
- Tensile strength: σ_uts ≈ 150-250 MPa (longitudinal)
- Compressive strength: σ_comp ≈ 200-300 MPa

**Strain Rate Sensitivity of Baleen:**
```
σ_y(ε̇) = σ_y₀ × (1 + C_baleen × ln(ε̇/ε̇₀))
C_baleen ≈ 0.03-0.05 [TBD:RESEARCH]
ε̇₀ = 10⁻³ s⁻¹ (quasi-static reference)
```

**Hydration-Dependent Modulus:**
```
E(φ) = E_dry × (1 - β_h × φ)
β_h ≈ 0.6-0.8 (hydration sensitivity)
φ = moisture content (0-0.25)
E_dry ≈ 8-10 GPa, E_hydrated ≈ 2-6 GPa
```

### 1.2 Orthotropic Elasticity Tensor for Baleen
Baleen has tubular microstructure → transverse isotropy:
