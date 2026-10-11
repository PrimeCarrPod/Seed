Short editions (SS/SG): Compressed vertical → higher tension density
Gordo editions (TG/SG): Larger circumferences → higher absolute tensions
```

### 3.3 Tension Sequence & Transition

**Transition Protocol** (CSMFAB078-A §4; MAT-04 §4.4):
```
Phase 1: De-tension (15s) — Release all 12 zone levers simultaneously
Phase 2: Panel reconfiguration (45s) — Add/remove ceramic tiles, magnetic alignment
Phase 3: Re-tension (25s) — Engage levers in sequence:
  Z3→Z4→Z5→Z6→Z1→Z2→Z7→Z8→Z9→Z10→Z11→Z12
  (Core → Upper → Lower → Extremities)
Phase 4: Validation (5s) — SE spot-check, STF pressure, bio-acoustic baseline

Total target: <90 seconds (matching AIMES LES)
```

*Traceability: CSMFAB078-A §3.3, §4; MAT-04 §4.4; SYNTH-02 §3; DOC-01 §2.2.1*

---

## 4. Deployment & Locking Mechanisms

### 4.1 Ceramic Tile Magnetic Alignment

**NdFeB N52 Magnet Specification** (CSMFAB078 §3.3; MAT-03 §1.2):
```
Magnet: NdFeB N52, 8×3mm disc, N/S on flat faces
B_r = 1.48 T, H_c = 1050 kA/m, (BH)_max = 52 MGOe
Operating temp: ≤80°C (Curie temp 310°C, but reversible loss at 80°C)

Placement: 2 magnets per tile edge (4 per tile), alternating polarity
Alignment force: F ≈ B_r²·A / (2·μ₀·g²)
A = 8×3mm = 24 mm², g = 0.5mm gap
F ≈ (1.48)² × 24×10⁻⁶ / (2 × 4π×10⁻⁷ × 0.5×10⁻³²) ≈ 42 N per magnet pair
```
