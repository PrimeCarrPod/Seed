## 2. Edition Transition Deltas (RM-SS as Source)

### 2.1 Forward Transitions (RM-SS → Other RM Editions)

| Transition | ΔMass (kg) | ΔPanels | ΔPrimary Tiles | ΔBackup Tiles | ΔLES Tension | Time Target | Actual |
|------------|------------|---------|----------------|---------------|--------------|-------------|--------|
| **RM-SS → RM-TS** | +2.74 | +2 | +30 (25mm) | +80 (15mm) | +60 N total | <60 s | 58 s |
| **RM-SS → RM-SG** | +3.48 | +6 | +60 (25mm) | +140 (15mm) | +160 N total | <65 s | 62 s |
| **RM-SS → RM-TG** | +7.15 | +8 | +90 (50mm) | +200 (25mm) | +220 N total | <80 s | 75 s |

### 2.2 Cross-Gender Transitions (RM-SS → RW Editions)

| Transition | ΔMass (kg) | Key Changes | Time Target | Notes |
|------------|------------|-------------|-------------|-------|
| **RM-SS → RW-SS** | -0.51 | Female pattern (bust dart, hip flare), -10 primary tiles | <60 s | Bust dart insertion |
| **RM-SS → RW-TS** | +2.27 | Tall + female, +20 primary tiles | <70 s | Height + gender |
| **RM-SS → RW-SG** | +3.05 | Girthy + female, +50 primary tiles | <75 s | Hip flare + bust |
| **RM-SS → RW-TG** | +6.40 | Tall + girthy + female, +80 primary tiles | <85 s | Maximum change |

### 2.3 Transition Procedure (CSMFAB078-A §3.5.2)

**Standard Transition Kit (per edition pair):**
- Differential tile packs (primary/backup)
- Differential panel inserts
- LES recalibration card
- Chassis modification kit (baleen/steel delta)

**Transition Steps:**
1. **Doff Source** (OG-02: <65 s emergency, ~100 s routine)
2. **Component Swap** (Parallel: tiles, panels, chassis)
   - Tile swap: 15 s per 10 tiles (magnetic alignment)
   - Panel insert: 30 s per panel (Velcro channels)
   - Chassis mod: 60 s (baleen add/remove, steel swap)
3. **Don Target** (OG-01: <95 s)
4. **LES Verify** (Chapter 95: 120 s auto, parallel with don)

**Optimized Parallel Timeline (RM-SS → RM-SG):**
```
t=0s:     Start RM-SS doff (CF pull)
t=20s:    RM-SS clear → Start RM-SG don (parallel tile swap)
t=40s:    Tile swap complete (60 tiles × 0.25s + mag align)
t=45s:    Panel inserts (6 × 30s = 180s but parallel with don)
t=62s:    RM-SG don complete → LES auto-start
t=182s:   LES verify complete (but mission-ready at t=62s)
```
**Mission-Ready Time: 62 s** ✅

### 2.4 Transition Compatibility Matrix

| From \ To | RM-TS | RM-SG | RM-TG | RW-SS | RW-TS | RW-SG | RW-TG |
|-----------|-------|-------|-------|-------|-------|-------|-------|
| **RM-SS** | ✅ 58s | ✅ 62s | ✅ 75s | ✅ 58s | ✅ 68s | ✅ 73s | ⚠️ 85s |
| RM-TS | — | ✅ 45s | ✅ 58s | ⚠️ 70s | ✅ 40s | ✅ 55s | ⚠️ 72s |
| RM-SG | ✅ 45s | — | ✅ 42s | ⚠️ 65s | ⚠️ 68s | ✅ 38s | ✅ 52s |
| RM-TG | ✅ 58s | ✅ 42s | — | ⚠️ 82s | ⚠️ 75s | ✅ 48s | ✅ 35s |

**Legend:** ✅ <65s, ⚠️ 65-85s, ❌ >85s (requires depot)

### 2.5 Cross-References

- CSMFAB078-A §3.5: Transition rules
- Chapter 102: Profile-specific configuration
- Chapter 93: Donning procedure
- Chapter 94: Doffing procedure
- Chapter 95: LES verification
- Chapter 108: Maintenance intervals
- Chapter 128: Edition comparison
- Chapter 130: Reverse transitions
- Chapter 131: LES calibration across editions

---
