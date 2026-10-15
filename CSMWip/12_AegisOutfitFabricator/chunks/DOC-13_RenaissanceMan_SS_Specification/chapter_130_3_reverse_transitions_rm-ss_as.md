## 3. Reverse Transitions (RM-SS as Target)

### 3.1 Reverse Transition Deltas (Other → RM-SS)

| Transition | ΔMass (kg) | Components Removed | Time Target | Notes |
|------------|------------|-------------------|-------------|-------|
| **RM-TS → RM-SS** | -2.74 | -2 panels, -30 primary (25→20mm), -80 backup | <55 s | Downsize tiles |
| **RM-SG → RM-SS** | -3.48 | -6 panels, -60 primary, -140 backup | <60 s | Major downsize |
| **RM-TG → RM-SS** | -7.15 | -8 panels, -90 primary (50→20mm), -200 backup (25→15mm) | <70 s | Maximum reduction |

### 3.2 Cross-Gender Reverse (RW → RM-SS)

| Transition | ΔMass (kg) | Key Removals | Time Target |
|------------|------------|--------------|-------------|
| **RW-SS → RM-SS** | +0.51 | Remove bust dart, hip flare, +10 primary tiles | <55 s |
| **RW-TS → RM-SS** | -2.27 | Remove height + gender diff, -20 primary | <60 s |
| **RW-SG → RM-SS** | -3.05 | Remove hip/bust + girth, -50 primary | <65 s |
| **RW-TG → RM-SS** | -6.40 | Maximum reduction, -80 primary | <75 s |

### 3.3 Reverse Transition Procedure

**Key Differences from Forward:**
1. **Tile Removal Faster:** Magnetic release → pull tile (0.15s/tile vs 0.25s install)
2. **Panel Removal:** Velcro release → fold flat (20s/panel vs 30s insert)
3. **Chassis Simplification:** Baleen/steel removal only (no add)
4. **LES Recalibration:** Lower tensions — auto-relax via SMA (5s)

**Optimized Timeline (RM-SG → RM-SS):**
```
t=0s:     Start RM-SG doff
t=18s:    RM-SG clear → Start tile removal (60 tiles × 0.15s = 9s)
t=30s:    Tiles removed → Panel removal (6 × 20s = 120s parallel)
t=35s:    Start RM-SS don (tiles already removed)
t=55s:    RM-SS don complete → LES auto-relax (5s)
t=60s:    Mission-ready (LES at RM-SS baseline)
```

### 3.4 Reverse Transition Compatibility

| From \ To | **RM-SS** | RM-TS | RM-SG | RM-TG |
|-----------|-----------|-------|-------|-------|
| **RM-TS** | ✅ 50s | — | ✅ 40s | ✅ 52s |
| **RM-SG** | ✅ 55s | ✅ 40s | — | ✅ 38s |
| **RM-TG** | ✅ 65s | ✅ 52s | ✅ 38s | — |
| **RW-SS** | ✅ 52s | ⚠️ 68s | ⚠️ 70s | ⚠️ 80s |
| **RW-TS** | ✅ 58s | ✅ 38s | ⚠️ 62s | ⚠️ 70s |
| **RW-SG** | ✅ 60s | ⚠️ 65s | ✅ 35s | ✅ 48s |
| **RW-TG** | ✅ 70s | ⚠️ 72s | ✅ 45s | ✅ 32s |

**RM-SS is universal downsize target** — all editions can transition to RM-SS in ≤70s

### 3.5 Cross-References

- CSMFAB078-A §3.5: Transition rules (bidirectional)
- Chapter 129: Forward transitions
- Chapter 128: Edition comparison
- Chapter 131: LES calibration across editions
- Chapter 93/94: Don/doff procedures
- Chapter 95: LES verification
- Chapter 131: LES tension calibration across editions

---