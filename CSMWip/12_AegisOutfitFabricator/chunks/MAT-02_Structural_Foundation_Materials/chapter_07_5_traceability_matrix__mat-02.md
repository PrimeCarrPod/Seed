## 5. Traceability Matrix — MAT-02

| Section | Source | Location | Key Values |
|---------|--------|----------|------------|
| 1.1 Baleen

**Keratin Mechanics:**
```
$E_{\text{wet}} = 2-6 \text{ GPa}$  (hydrated)
```
```
$\sigma_y = 50-80 \text{ MPa}$
```
```
$\varepsilon_{\text{break}} = 15-25\%$
```
```
$T_g = 60-80^\circ\text{C}$  (thermoplastic transition)
```

**Euler Buckling (Baleen Stays):**
```
$P_{cr} = \frac{\pi^2 E I}{(K L)^2}$  where $I = \frac{b h^3}{12}$
```

 Props | Research Doc 1 | §5.1, Lines 65-68 | E=2-6 GPa, thermoplastic 60-80°C |
| 1.1 Strain Rate | Research Doc 1 | §5.1, Line 68 | C_baleen≈0.03-0.05 [TBD] |
| 1.1 Hydration | Research Doc 1 | §5.1, Line 66 | β_h≈0.6-0.8 |
| 1.2 Tensor | Research Doc 1 | §5.1 + §3.1 | Orthotropic, ν₁₂≈0.3-0.4 |
| 1.3 Yield | Research Doc 1 | §5.1, Line 68 | Drucker-Prager α≈0.1-0.2 [TBD] |
| 1.4 Euler Buckling | Research Doc 1 | §5.1, Line 68 | P_cr = π²EI/L² |
| 1.5 Viscoelastic | Research Doc 2 | §5, Lines 97-102 | Prony series, creep |
| 2. Synthetic Table | Research Doc 2 | §3.4, Lines 62-73 | PTFE-fiberglass 537°C, quartz 1093°C |
| 3.1 Spiral Steel

**Spiral Boning Bending Stiffness:**
```
$EI_{\text{eff}} = \frac{E I_{\text{wire}}}{1 + (p/\pi d)^2}$
```
```
$I_{\text{wire}} = \frac{\pi d^4}{64}$
```
```
$\text{Fatigue Life: } N_f = \left(\frac{\sigma_f'}{\sigma_a}\right)^{1/b}$
```

 | Research Doc 1 | §5.3, Lines 76-77 | 2D bending, E=200 GPa |
| 3.2 Spring Rate | Research Doc 1 | §5.3, Line 76 | k_lateral = 3EI/L³ |
| 3.3 Fatigue | Research Doc 2 | §3.4, Lines 62-73 | >10⁶ cycles at 50% σ_y |
| 3.5 Thermomech | Research Doc 2 | §3.4, Lines 62-73 | α_k≈0.001/°C |
| 4.1 Hoop Geometry | Research Doc 1 | §5.3, Lines 77-78 | I=πr³t, ellipses |
| 4.2 Catenary | Research Doc 1 | §5.3, Line 78 | y(x)=a cosh(x/a) |
| 4.3 Volumetric | Research Doc 1 | §5.3, Line 78 | V/M optimization |
| 4.4 Deployment | CSMFAB078-A | §3.3 | Spring energy, <5s target |

**Standards Referenced:**
- ASTM D3039 (Composite Tensile Properties)
- ASTM D790 (Flexural Properties)
- MIL-STD-810H (Environmental Engineering)
- ISO 12107 (Metallic Materials - Fatigue Testing)
- NFPA 1971 (Protective Ensemble - thermal context)
- ASTM D638 (Tensile Properties of Plastics)
- ISO 14125 (Composites - Flexural Properties)
- ASTM E139 (Creep/Creep-Rupture Testing)
- ASTM D2990 (Thermoplastic Creep)
- ISO 10350 (Plastics - Single-Point Data)

