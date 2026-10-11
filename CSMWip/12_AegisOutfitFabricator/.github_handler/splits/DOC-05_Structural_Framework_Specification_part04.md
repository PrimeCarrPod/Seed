
**Moment of Inertia per Hoop** (DRAFT-04 §2; MAT-02 §4):
```
Thin-walled ellipse:
I_x(i) ≈ π·a_i·b_i³·t / 4  (frontal plane bending)
I_y(i) ≈ π·a_i³·b_i·t / 4  (sagittal plane bending)

For RW-TG Hoop 4: a=640mm, b=457mm, t=1.5mm
I_x ≈ π×640×457³×1.5/4 ≈ 1.52×10¹⁰ mm⁴
I_y ≈ π×640³×457×1.5/4 ≈ 3.01×10¹⁰ mm⁴
```

**Buckling Modes** (MAT-02 §4):
```
Euler buckling (vertical load): P_cr = π²·E·I_min / L²
L = hoop circumference ≈ π·(a+b) ≈ 3.5m (for hoop 4)
I_min = I_x ≈ 1.52×10¹⁰ mm⁴
P_cr ≈ π² × 200×10⁹ × 1.52×10⁻² / 3.5² ≈ 245 kN (far exceeds skirt weight)

Ovalization buckling (local): Critical pressure p_cr = 3·E·I / (a³·t)
For hoop 4: p_cr ≈ 3 × 200×10⁹ × 1.52×10⁻² / (0.64³ × 0.0015) ≈ 14.5 MPa
Skirt pressure: P = W/(πab) ≈ 50N/(π×0.64×0.457) ≈ 5.4 Pa
Safety factor: > 10⁶ (local buckling not a concern)
```

### 2.2 Tape Suspension Catenary System

**Catenary Curve Mechanics** (DRAFT-04 §3; MAT-02 §4):
```
Vertical tapes: N = 12-16 (evenly spaced, 22.5°-30° increments)
Total skirt weight: W = 5-8 kg (edition-dependent)
Tape length: L = 800-1000mm (waist to hem)

Catenary parameter: a = H / w
H = horizontal tension (constant along tape)
w = weight per unit length = (W/N) / L

