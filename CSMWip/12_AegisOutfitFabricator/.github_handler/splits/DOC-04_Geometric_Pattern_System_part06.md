Linen thread: high tensile, low abrasion
Beeswax coating: reduces kinetic friction coefficient μ_k by 40-50%
Binds fibers against torque fraying
Thermal sink: beeswax k ≈ 0.25 W/m·K absorbs needle friction heat

Thread construction: Z-twist single → S-twist plied (prevents untwisting)
SPI: 18-22 in high-stress areas (vs 10-12 modern)
```

*Traceability: Research Doc 1 §4.2, §6.1-6.2; Research Doc 2 §3.3; SYNTH-03 §3; DRAFT-03 §1-3; MAT-01 §1.5*

---

## 4. Farthingale/Pannier Hoop Architecture (from DRAFT-04)

### 4.1 Hoop Geometry Mathematics

**Concentric Elliptical Hoops** (Research Doc 1 §5.3; DRAFT-04 §2; SYNTH-03 §5):
```
Hoop i (i = 1..N): x²/a_i² + y²/b_i² = 1
Where: a_i > b_i (front-fullness), a_i/b_i ≈ 1.3-1.5

Radius progression (front semi-axis):
a_1 = 150mm (waist), a_2 = 300mm, a_3 = 450mm, a_4 = 600mm, a_5 = 750mm
b_i = a_i / 1.4  (rear semi-axis)

Wall thickness: t = 1.5-2.0 mm spring steel wire (E = 200 GPa)
```

**Moment of Inertia** (DRAFT-04 §2; Research Doc 1 §5.3):
```
Thin-walled ellipse approximation:
I_x ≈ π·a·b³·t / 4  (bending in frontal plane)
I_y ≈ π·a³·b·t / 4  (bending in sagittal plane)

For a=600mm, b=428mm, t=1.5mm:
I_x ≈ π×600×428³×1.5/4 ≈ 1.15×10¹⁰ mm⁴
I_y ≈ π×600³×428×1.5/4 ≈ 2.24×10¹⁰ mm⁴
```

**Hoop Stress Under Skirt Load** (DRAFT-04 §2):
```
Internal pressure from skirt weight: P = W_skirt / (π·a·b)  (distributed)
Hoop stress: σ_θ = P·a / t  (thin-walled, max at front apex)
