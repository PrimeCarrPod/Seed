## 6. Lacing Topology: Alcega + LES Integration (DRAFT-01 §5, DRAFT-02 §4, CSMFAB078-A §3.3)

### 6.1 Historical Lacing Patterns (Alcega 1589)

**Center Front (CF) — Straight Lacing:**
```
Eyelet 1 (top)  ●───────●  Eyelet 1
Eyelet 2        ●───────●  Eyelet 2
Eyelet 3        ●───────●  Eyelet 3
Eyelet 4        ●───────●  Eyelet 4
Eyelet 5        ●───────●  Eyelet 5
Eyelet 6        ●───────●  Eyelet 6
Eyelet 7        ●───────●  Eyelet 7
Eyelet 8 (bottom) ●───────●  Eyelet 8
```
- **Pattern:** Parallel, top-to-bottom
- **Tension:** 55-65 N per eyelet (Z1-Z4)
- **Cord:** Single continuous, 2.5 m length

**Side Seams — Spiral Lacing (Alcega Plate 12):**
```
Front panel          Back panel
    ●───────────────●
     ●─────────────●
      ●───────────●
       ●─────────●
```
- **Pattern:** Offset spiral, single cord
- **Tension:** 65 N per eyelet (Z3, Z5, Z6)
- **Cord:** Two cords (left/right), 1.8 m each

**Hose Waist — Cartridge Pleat Lacing (DRAFT-03 §3.3):**
- **Pattern:** Individual pleat anchoring (not continuous)
- **Eyelets:** 24 per side (48 total)
- **Tension:** 62 N per pleat anchor

### 6.2 RM-SG Lacing Map (28 Eyelets Total)

| Location | Eyelets | Cord Type | Tension | Zones Served |
|----------|---------|-----------|---------|--------------|
| Center Front | 8 | Single continuous | 55-65 N | Z1, Z2, Z3, Z4 |
| Side Front (L/R) | 4+4 | Spiral, 2 cords | 65 N | Z3, Z5, Z6 |
| Collar | 2 | Hook/eye | 35 N | Z1 |
| Hose Waist | 24 (cartridge) | Individual | 62 N | Z5, Z6 |
| Hose Knee | 4 | Individual | 35 N | Z10 |

### 6.3 MXene Conductive Thread Integration

**Purpose:** Maintain EMI continuity across lacing gaps

- **Thread:** Silk + MXene coating (2.5 mm Ø, same as lacing cord)
- **Path:** Woven through lacing stitches at each eyelet
- **Continuity:** CF cord → side cords → hose waist → knee → ground
- **Resistance:** <1 Ω per eyelet junction
- **Shielding Contribution:** +4 dB SE at lacing gaps

### 6.4 Lacing Sequence (Optimized for Donning Speed)

**Target: <100 s total**

| Step | Action | Eyelets | Time | Technique |
|------|--------|---------|------|-----------|
| 1 | Hose waist (cartridge) | 24 | 18 s | Pre-threaded, simultaneous |
| 2 | Hose knee gussets | 4 | 5 s | Quick-toggle |
| 3 | Doublet CF (top→bottom) | 8 | 22 s | Single pull, lock-off |
| 4 | Doublet sides (spiral) | 8 | 18 s | Two-handed parallel |
| 5 | Collar hooks | 2 | 5 s | Magnetic assist |
| 6 | Final tension check | — | 5 s | PVDF verify |

**Total: 73 s active lacing + 25 s donning = 98 s**

### 6.5 Emergency Doffing (Target: <65 s)

**Quick-Release System:**
1. **CF Cord:** Single pull-tab releases all 8 eyelets (magnetic cleats)
2. **Side Cords:** Breakaway stitch at bottom (5 N release)
3. **Hose Waist:** Velcro backup under cartridge pleats
4. **Collar:** Magnetic hooks (2 N release)

**Doffing Sequence:** CF pull (3 s) → sides release (2 s) → hose drop (5 s) → clear (10 s) = **20 s**

### 6.6 Cross-References

- DRAFT-01 §5: Alcega lacing plates
- DRAFT-02 §4: Garsault lacing proportions
- DRAFT-03 §3.3: Cartridge pleat lacing
- CSMFAB078-A §3.3: LES zone lacing
- SYNTH-01 §4.2: Unified lacing model
- Chapter 38: LES zone tensions
- Chapter 55: EMI continuity
- Chapter 84: Donning procedure
- Chapter 85: Doffing procedure

---