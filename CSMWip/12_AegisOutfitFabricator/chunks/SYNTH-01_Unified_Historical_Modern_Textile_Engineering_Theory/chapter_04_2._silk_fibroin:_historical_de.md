## 2. Silk Fibroin: Historical Degummed Silk Mechanics

### 2.1 Macromolecular Structure and Degumming Kinetics

From Research Document 1 §2.1 (Lines 10–15):

The raw silk filament from *Bombyx mori* is a natural composite biopolymer:
- **Fibroin** (structural core): 70–80% of fiber mass, dominated by glycine, alanine, serine forming antiparallel β-sheet crystalline structures
- **Sericin** (envelope): 20–30% of fiber mass, amorphous water-soluble globular protein acting as natural adhesive

**Degumming Process** (Research Doc 1 §2.1, Lines 13–15):
- Alkaline hydrolysis: boiling water + sodium carbonate / Marseilles soap
- Temperature: 95–100°C
- Duration: 60–90 minutes
- Sericin removal: 96% extraction efficiency

**Mechanical Properties of Degummed Silk** (Research Doc 1 §2.1, Line 14):
```
E_silk = 8–12 GPa                    (Young's modulus)
σ_uts = 500–700 MPa                  (Ultimate tensile stress)
ε_break = 15–25%                     (Breaking strain)
```

**True Stress/True Strain Conversion:**
```
σ_true = σ_eng × (1 + ε_eng)
ε_true = ln(1 + ε_eng)
```

**Failure Envelope (Historical Degummed Silk):**
```
σ_uts ∈ [500, 700] MPa
ε_break ∈ [0.15, 0.25]
E ∈ [8, 12] GPa
```

### 2.2 Elasto-Plastic Model with Isotropic Hardening

From Research Doc 1 §2.1, Line 16:
```
σ_y = f(ε_p) = σ_y0 + H × ε_p
```
Where:
- σ_y = yield stress
- ε_p = plastic strain
- H = hardening modulus (silk-specific, TBD:RESEARCH)
- σ_y0 = initial yield stress ≈ 0.4 × σ_uts

### 2.3 Strain-Rate Sensitivity

From Research Doc 1 §2.1, Line 16 and Research Doc 2 §5:
```
σ_y(ε̇) = σ_y0 × (1 + C × ln(ε̇/ε̇₀))
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
