Valid placement: new piece position ∉ NFP with any placed piece
Complexity: O(n²) for n pieces, optimized with spatial hashing
```

### 5.3 Offcut Catalog System

**Minimum Viable Remnant** (DRAFT-05 §4):
```
Size threshold: 100mm × 100mm (below → scrap)
Classification:
- Rectangular: w × h, aspect ratio ∈ [0.5, 2.0]
- L-shape: bounding box minus rectangle
- Irregular: convex hull area / bbox area < 0.7

Reuse mapping:
- Rectangular → pockets, tabs, bias strips (cut on grain)
- L-shape → gussets, underarm squares
- Irregular → interfacing, lining patches

Inventory tracking: Digital remnant database with edition-specific allocation
```

### 5.4 Edition-Specific Nesting Efficiency

| Edition | Pieces | Est. Length (m) | Yield | Offcuts (usable) |
|---------|--------|-----------------|-------|------------------|
| RM-TS | 28 | 11.2 | 96% | 8 rect, 3 L-shape |
| RM-TG | 32 | 13.5 | 94% | 10 rect, 5 L-shape |
| RM-SS | 26 | 9.8 | 97% | 6 rect, 2 L-shape |
| RM-SG | 30 | 12.1 | 95% | 8 rect, 4 L-shape |
| RW-TS | 35 | 14.2 | 95% | 12 rect, 6 L-shape |
| RW-TG | 40 | 16.8 | 93% | 15 rect, 8 L-shape |
| RW-SS | 33 | 12.5 | 96% | 10 rect, 5 L-shape |
| RW-SG | 38 | 15.1 | 94% | 13 rect, 7 L-shape |

*Traceability: Research Doc 1 §4.1; SYNTH-03 §7; DRAFT-05 §2-4; MAT-04 §1.2*

---

## 6. Edition-Specific Pattern Sets

### 6.1 RenaissanceMan Pattern Sets (4 Editions)

**RM-TS (Tall-Skinny)**:
