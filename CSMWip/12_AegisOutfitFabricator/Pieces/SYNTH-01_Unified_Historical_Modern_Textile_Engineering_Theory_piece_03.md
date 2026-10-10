```
Where:
- C ≈ 0.05–0.08 for silk fibroin [TBD:RESEARCH - exact value from literature]
- ε̇₀ = reference strain rate = 10⁻³ s⁻¹ (quasi-static)
- ε̇ = applied strain rate

### 2.4 Environmental Aging Models

**UV Degradation** (Research Doc 1 §2.1, Line 15):
Complete sericin removal → UV vulnerability
```
k_uv = A × exp(-E_a/RT) × I_uv
σ(t) = σ₀ × exp(-k_uv × t)
```

**Humidity Effects** (Research Doc 1 §2.1, Line 13):
- Moisture regain: 11% at 65% RH
- Plasticization: E decreases ~15% at high humidity
- Swelling strain: ε_sw = β × ΔMC (β ≈ 0.003 per % moisture content)

**Thermal Cycling:**
- Glass transition: T_g ≈ 170–180°C (dry), decreases with moisture
- Thermal degradation onset: ~250°C (chars, no melt)
- Cycling fatigue: ΔE/E₀ = f(N_cycles, ΔT, T_max)

## 3. Orthotropic Elasticity Tensor for Silk Fibroin

From Research Doc 1 §3.1 (Lines 34–41) and Research Doc 2 §5 (Lines 97–102):

Silk fibroin exhibits transverse isotropy in the fiber direction. The 6×6 stiffness matrix in Voigt notation:

