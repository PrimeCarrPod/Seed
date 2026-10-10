## 🔬 MAT-02: STRUCTURAL FOUNDATION MATERIALS — TEMPLATE (CONTINUED)

### 2. Synthetic Baleen Candidates Comparison

| Property | Historical Baleen | PTFE-Fiberglass | PTFE-Quartz | Para-Aramid + SS |
|----------|------------------|-----------------|-------------|------------------|
| **E_long (GPa)** | 2-6 (hydrated) | 70-85 | 70-75 | 80-100 (aramid) + 200 (SS) |
| **E_trans (GPa)** | 1-2 | 15-20 | 15-18 | 5-8 |
| **σ_uts (MPa)** | 150-250 | 1500-2000 | 1200-1500 | 3000-3500 |
| **ε_break (%)** | 15-25 | 3-5 | 2-4 | 2-3 (aramid), 15-20 (SS) |
| **Thermal Limit** | 60-80°C (thermoplastic) | 537°C | 1093°C | >500°C |
| **Density (g/cm³)** | 1.3-1.4 | 2.1-2.2 | 2.2-2.3 | 1.44 (aramid), 7.9 (SS) |
| **Flexibility** | High (thermoplastic) | Low (brittle) | Very Low | Medium-High |
| **Moisture Effect** | Significant plasticization | None | None | Aramid: ~3-5% strength loss |
| **Cost** | N/A (extinct) | $50-100/kg | $100-200/kg | $200-500/kg |
| **Historical Authenticity** | 100% | 0% | 0% | 10% (steel visible) |

**Recommendation:** Hybrid approach — PTFE-fiberglass for high-heat zones, para-aramid/SS for structural stays requiring flexibility, with historical baleen replication for visible elements.

### 3. Spiral Steel Boning Mechanics

**From Research Doc 1 §5.3 (Lines 76-77):**
- Spiral steel: 2D bending within curved channels, longitudinal rigidity
- Spring steel: E ≈ 200 GPa, σ_y ≈ 1200-1500 MPa
- Wire diameter: 1.5-2.5 mm, spiral pitch: 3-5 mm

**Spring Rate (Lateral Bending):**
```
k_lateral = 3 E I / L³  (cantilever)
k_axial = E A / L       (longitudinal, very high)
```

**Hysteresis & Fatigue:**
- Hysteresis loss: ~5-10% per cycle (elastic-plastic transition at tips)
- Fatigue life: >10⁶ cycles at 50% yield stress
- Corrosion: stainless steel 316L recommended for sweat resistance

**Comparison to Baleen:**
| Aspect | Baleen | Spiral Steel |
|--------|--------|--------------|
| Longitudinal E | 2-6 GPa | 200 GPa |
| Lateral Flexibility | High (thermoplastic) | Medium (spiral geometry) |
| Buckling Resistance | Self-limiting (yields) | Catastrophic if exceeded |
| Body Heat Response | Softens at 60-80°C | None |
| Weight | Light | Heavy (×5 density) |

### 4. Cage Crinoline Hoop Architecture

**From Research Doc 1 §5.3 (Lines 77-78):**
- Concentric steel hoops suspended by vertical cotton tapes
- Moment of inertia: I = πr³t (thin-walled cylinder approximation)
- Hoop stress: σ_θ = P × r / t (from internal pressure P)

**Hoop Geometry:**
- Radius progression: r₁ < r₂ < ... < r_n (ellipses, not circles)
- Typical: 4-6 hoops, r_max ≈ 500-800 mm (skirt hem)
- Wall thickness: t ≈ 1-2 mm spring steel wire

**Tape Suspension (Catenary):**
```
y(x) = a cosh(x/a)  where a = H / w
H = horizontal tension, w = weight per unit length
```

**Tension Distribution:**
- Vertical tapes: N tapes sharing total skirt weight W
- Tension per tape: T = W / N (ideal, equal sharing)
- Actual: T_i varies with hoop angle, friction at waistband

**Volumetric Efficiency:**
- Volume enclosed: V ≈ Σ π r_i² × h_i (hoop height segments)
- Mass: M ≈ Σ 2π r_i × t × ρ_steel × h_i
- Ratio V/M maximized by large r, thin t → buckling constraint

### 5. Traceability Matrix — MAT-02

| Section | Source | Location | Key Values |
|---------|--------|----------|------------|
| 1.1 Baleen Props | Research Doc 1 | §5.1, Lines 65-68 | E=2-6 GPa, thermoplastic 60-80°C |
| 1.2 Tensor | Research Doc 1 | §5.1 + §3.1 | Orthotropic, ν₁₂≈0.3-0.4 |
| 1.3 Yield | Research Doc 1 | §5.1, Line 68 | Drucker-Prager α≈0.1-0.2 [TBD] |
| 1.4 Euler Buckling | Research Doc 1 | §5.1, Line 68 | P_cr = π²EI/L² |
| 2. Synthetic Table | Research Doc 2 | §3.4, Lines 62-73 | PTFE-fiberglass 537°C, quartz 1093°C |
| 3. Spiral Steel | Research Doc 1 | §5.3, Lines 76-77 | 2D bending, E=200 GPa |
| 4. Crinoline | Research Doc 1 | §5.3, Lines 77-78 | I=πr³t, catenary tapes |

**Standards:**
- ASTM D3039 (Composite Tensile Properties)
- ASTM D790 (Flexural Properties)
- MIL-STD-810H (Environmental Engineering)
- ISO 12107 (Metallic Materials - Fatigue Testing)
- NFPA 1971 (Protective Ensemble - thermal context)