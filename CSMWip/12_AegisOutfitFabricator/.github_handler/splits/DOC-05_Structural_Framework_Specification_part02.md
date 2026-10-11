Wire diameter: d = 1.5-2.5 mm
Spiral pitch: p = 3-5 mm (2D flexibility, longitudinal rigidity)
```

**Spring Rates** (MAT-02 §3):
```
Lateral bending (cantilever): k_lat = 3·E·I / L³
I = π·d⁴/64 = π×(2mm)⁴/64 ≈ 0.785 mm⁴
For L = 150mm: k_lat ≈ 3 × 200×10⁹ × 0.785×10⁻¹² / 0.15³ ≈ 1.4 N/mm

Axial stiffness: k_ax = E·A / L = 200×10⁹ × π×(2mm)²/4 / 0.15 ≈ 4.2×10⁶ N/m
Ratio k_ax / k_lat ≈ 3×10⁶ (extreme anisotropy)
```

**Hysteresis & Fatigue** (MAT-02 §3):
```
Hysteresis loss: 5-10% per cycle (elastic-plastic at spiral transitions)
Fatigue life: >10⁶ cycles at 50% σ_y (≈ 600 MPa)
Corrosion: 316L stainless recommended (sweat resistance, CREvice corrosion)
```

### 1.4 Hybrid Chassis Architecture

**Baleen-Steel Composite Stays** (SYNTH-02 §4; MAT-04 §4.4):
```
Hybrid stay construction:
[Baleen core: 15×2mm] + [Spiral steel wrap: 1.5mm wire, 4mm pitch]
OR: Alternating baleen/steel stays in channel

Effective properties:
E_eff_long = V_baleen·E_baleen + V_steel·E_steel
For V_baleen=0.6, V_steel=0.4: E_eff ≈ 0.6×4 + 0.4×200 = 82.4 GPa
P_cr_hybrid = π²·E_eff·I_total / L²
I_total = I_baleen + I_steel + A_steel·d² (parallel axis)
Target P_cr_hybrid > 500 N (SF > 2.5 vs lacing tension)
```

