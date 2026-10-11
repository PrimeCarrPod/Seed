Calves: 10-20 N (ankle motion)
Arms: 10-20 N (full ROM)
```

**Tension Distribution Matrix:**
```
T_i = T_nominal × (1 + k_edition × Δ_edition + k_morphology × Δ_morphology)
k_edition = 0.15 (TG vs TS), k_morphology = 0.20 (SG vs SS)
```

### 4.5 Articulation Index (AI) Metric
```
AI = Σ (ROM_achieved / ROM_required) × w_joint
w_shoulder = 0.20, w_elbow = 0.15, w_hip = 0.20, w_knee = 0.20, w_ankle = 0.15, w_wrist = 0.10
Target AI ≥ 0.90 for all editions
```

## 5. Traceability Matrix — MAT-04

| Section | Source | Location | Key Values |
|---------|--------|----------|------------|
| 1.1 MOO Framework | SYNTH-01,02,03 | All | HAS/PES definitions, weights |
| 1.1 AHP Weights | SYNTH-01 | §2 | w_visual=0.30, w_material=0.25 |
| 1.2 Pareto | CSMFAB078 | §3.3, §7 | Edition tile counts, mass targets |
| 1.2 NSGA-II | CSMFAB078 | §7 | 500 gen, pop 100 |
| 1.3 Constraints | CSMFAB078 | §3.3 | Weight ≤26kg, Cost ≤$50k |
| 2.1 AIMES Weight | CSMFAB078 | §3.3, Line 47 | 18-26 kg, tile counts |
| 2.2 Renaissance Weight | SYNTH-02 | §2, §3 | Material substitutions |
| 2.3 RM/RW Budget | SYNTH-03 | §2 | Edition-specific masses |
| 3.1 Metabolic | Research Doc 2 | §5, Lines 97-102 | Hyperelastic models for comfort |
