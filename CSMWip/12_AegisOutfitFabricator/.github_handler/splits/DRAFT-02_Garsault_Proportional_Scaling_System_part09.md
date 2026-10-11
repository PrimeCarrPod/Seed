```

### 4.4 Seam Matching Validation
```
For each seam pair (Piece_A_edge, Piece_B_edge):
  Length_A = arc_length(Piece_A_edge)
  Length_B = arc_length(Piece_B_edge)
  Match_Error = |Length_A - Length_B| / Length_A
  Require: Match_Error < 0.02 (2% tolerance)
```

### 4.5 Grainline Preservation
```
Grainline vector: g = (cos θ, sin θ)
After scaling: g' = R(θ) × g
Where R(θ) = rotation matrix for piece orientation
Require: |g' · g_warp| > 0.95 (within 18° of warp)
```

## 5. Traceability Matrix — DRAFT-02

| Section | Source Document | Section/Line | Key Values |
|---------|----------------|--------------|------------|
| 1.1 Garsault 1769 | Research Doc 1 | §4.1, Lines 51-52 | Proportional strips |
| 1.2 Strip Algorithm | Research Doc 1 | §4.1 | Scale = Target/Base |
| 1.3 Geometric Construction | Research Doc 1 | §4.1 | Compass/sector method |
| 2.1 Primary Meas | Research Doc 1 | §4.1 | 8+ measurements |
| 2.2 Proportional Ratios | Research Doc 1 | §4.1 | B:W:H = 10:7:9.5 |
| 2.3 Ease Allowances | Research Doc 2 | §2 | 2-10 cm ease |
| 2.4 Height Proportions | Research Doc 1 | §4.1 | NW=0.22×H, etc. |
