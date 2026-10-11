For W_skirt = 5kg, a=600mm, b=428mm, t=1.5mm:
P ≈ 5×9.81 / (π×0.6×0.428) ≈ 6.1 Pa
σ_θ ≈ 6.1 × 0.6 / 0.0015 ≈ 2.4 kPa (well below steel yield)
```

### 4.2 Tape Suspension System (Catenary)

**Catenary Curve** (DRAFT-04 §3; MAT-02 §4):
```
y(x) = a·cosh(x/a), where a = H / w
H = horizontal tension in tape
w = weight per unit length = (W_skirt / N_tapes) / L_tape

N_tapes = 12-16 vertical tapes (evenly spaced)
L_tape ≈ 800-1000mm (waist to hem)
```

**Tension Distribution** (DRAFT-04 §3):
```
At waistband (x=0): T_waist = H·cosh(L/(2a))
At hem (x=L/2): T_hem = H
Friction at waistband: μ ≈ 0.3 (cotton on silk), reduces effective N_tapes
```

### 4.3 Deployment Kinematics

**Collapsed → Expanded Transition** (DRAFT-04 §4):
```
Collapsed diameter: D_collapsed ≈ 50mm (storage)
Expanded diameter: D_expanded ≈ 1000-1600mm (edition-dependent)

Spring energy per hoop: U = ½·k·x²
k = E·I / L³ (bending stiffness), x = deployment displacement
Deployment time target: <5 seconds (DRAFT-04 §4)

Locking mechanism:
- Friction catch: cam lever at waistband
- Magnetic: NdFeB N52 at hoop joints (CSMFAB078 §3.3)
```

*Traceability: Research Doc 1 §5.3; SYNTH-03 §5; DRAFT-04 §2-4; MAT-02 §4; CSMFAB078 §3.3*

---

