## 1. Donning Procedure (Target: <100 s)

### 1.1 Pre-Donning Checklist (5 s)
1. Verify all 28 eyelets intact
2. Check lacing cords (2×) for fraying
3. Confirm MXene tape on seams
4. Verify PVDF sensor Bluetooth pairing

### 1.2 Donning Sequence (93 s)

| Step | Action | Time | Details |
|------|--------|------|---------|
| 1 | **Step into hose** | 18 s | Pull up to waist, align knee gussets |
| 2 | **Secure hose waist** | 12 s | Lace cartridge pleats (24 eyelets) |
| 3 | **Don doublet** | 22 s | Arms through sleeves, center front align |
| 4 | **Lace center front** | 22 s | 8 eyelets, top-to-bottom, tension 55-65 N |
| 5 | **Lace side seams** | 18 s | 4+4 eyelets, tension 65 N |
| 6 | **Secure collar** | 5 s | 2 hooks, align MXene thread |
| 7 | **System check** | 5 s | PVDF telemetry, LES tension verify |

**Total: 98 s** (Target <100 s) ✅

### 1.3 Donning Optimization (vs. RM-SS)

| Step | RM-SS | RM-SG | Difference | Reason |
|------|-------|-------|------------|--------|
| Hose waist | 15 s | 18 s | +3 s | 24 vs 20 eyelets |
| CF lacing | 20 s | 22 s | +2 s | Higher tension (55-65N vs 50-60N) |
| Side lacing | 15 s | 18 s | +3 s | Higher tension (65N vs 55N) |
| **Total** | **90 s** | **98 s** | **+8 s** | **Girth + protection** |

---

## 2. Doffing Procedure (Target: <65 s)

### 2.1 Emergency Doffing Sequence (Combat/Casualty)

| Step | Action | Time | Details |
|------|--------|------|---------|
| 1 | **CF Quick-Release Pull** | 3 s | Single red tab → magnetic cleats release all 8 eyelets |
| 2 | **Side Seam Breakaway** | 2 s | 5 N release stitch at bottom → spiral lacing opens |
| 3 | **Hose Waist Release** | 6 s | Velcro backup under cartridge pleats → peel open |
| 4 | **Hose Drop** | 10 s | Gravity + shake → hose falls to ankles |
| 5 | **Doublet Removal** | 18 s | Arms out, over head (CF open) |
| 6 | **Clear Body** | 5 s | Step out of hose, clear area |
| 7 | **System Safe** | 5 s | PVDF telemetry confirms full release |

**Total Emergency Doff: 49 s** (Target <65 s) ✅

### 2.2 Routine Doffing Sequence (End of Shift)

| Step | Action | Time | Details |
|------|--------|------|---------|
| 1 | Unlace hose waist (cartridge) | 24 s | Individual pleat release |
| 2 | Unlace hose knee gussets | 12 s | Quick-toggle cleats |
| 3 | Unlace doublet CF | 18 s | Standard unlacing |
| 4 | Unlace doublet sides | 12 s | Spiral release |
| 5 | Unhook collar | 5 s | Magnetic hooks |
| 6 | Remove doublet | 12 s | Arms out |
| 7 | Remove hose | 18 s | Step out |
| 8 | Hang/store | 18 s | Proper hanger, ventilation |

**Total Routine Doff: 119 s** (No hard target, thorough)

### 2.3 Quick-Release Hardware Specification

| Component | Type | Release Force | Cycles | Standard |
|-----------|------|---------------|--------|----------|
| **CF Cleats** | MAX Phase Magnetic | 8 N (pull tab) | >5,000 | Custom |
| **Side Seams** | Breakaway Stitch | 5 N | >1,000 | ISO 13934-1 |
| **Hose Waist** | Velcro® Brand | 15 N (peel) | >10,000 | ASTM D5169 |
| **Knee Gusset** | MAX Phase Toggle | 10 N | >5,000 | Custom |
| **Collar** | Magnetic Hook | 2 N | >10,000 | Custom |

### 2.4 Doffing with Casualty (Assisted)

**Scenario:** Wearer incapacitated, requires full removal for medical access

| Step | Rescuer Action | Time | Notes |
|------|----------------|------|-------|
| 1 | Pull CF quick-release | 3 s | Red tab, anterior |
| 2 | Cut side seams (trauma shears) | 5 s | Backup if breakaway fails |
| 3 | Cut hose waist Velcro | 5 s | Lateral access |
| 4 | Remove garment | 24 s | Log-roll if spinal precaution |
| **Total** | | **37 s** | **<65 s target** ✅ |

### 2.4 Post-Doffing Procedures

1. **Garment Inspection:** Visual check for damage, tile cracks, MXene delamination
2. **Tile Check:** Tap test each primary tile (audible ring = intact)
3. **MXene Continuity:** Multimeter check at 3 seam points (<1 Ω)
4. **PVDF Data Download:** Bluetooth sync to tablet (auto on doff)
5. **Ventilation:** Hang on articulated hanger, 30 min minimum
6. **LES Reset:** Auto-calibration on next donning

---

## 3. LES Zone Verification Post-Donning (CSMFAB078-A §3.3, DOC-10 §4.4)

### 3.1 Verification Protocol (Automated + Manual)

**Automated (PVDF Telemetry — L11):**
1. Bluetooth connects on collar closure (reed switch)
2. 12-zone tension sweep: 10 s per zone, 120 s total
3. Real-time display on wrist module / tablet
4. Pass/Fail per zone (green/red)
5. Auto-log to mission data recorder

**Manual (Backup — Load Cell):**
1. Digital tension gauge (Shimpo FGV-0.5, ±0.5% FS)
2. Measure at each lacing point (28 points)
3. Cross-reference with PVDF data
4. Required if Bluetooth fails

### 3.2 Zone Verification Targets (RM-SG)

| Zone | Target (N) | Tolerance | Auto Pass | Manual Pass | Critical |
|------|------------|-----------|-----------|-------------|----------|
| Z1 (Neck) | 55 | ±5 N | 50-60 N | 50-60 N | Yes |
| Z2 (Shoulder) | 60 | ±5 N | 55-65 N | 55-65 N | Yes |
| Z3 (Up. Torso) | 65 | ±5 N | 60-70 N | 60-70 N | Yes |
| Z4 (Chest) | 65 | ±5 N | 60-70 N | 60-70 N | Yes |
| Z5 (Waist) | 65 | ±5 N | 60-70 N | 60-70 N | Yes |
| Z6 (Hip) | 60 | ±5 N | 55-65 N | 55-65 N | Yes |
| Z7 (Deltoid) | 55 | ±5 N | 50-60 N | 50-60 N | Yes |
| Z8 (Forearm) | 50 | ±5 N | 45-55 N | 45-55 N | No |
| Z9 (Thigh) | 45 | ±5 N | 40-50 N | 40-50 N | No |
| Z10 (Knee) | 40 | ±5 N | 35-45 N | 35-45 N | No |
| Z11 (Calf) | 35 | ±5 N | 30-40 N | 30-40 N | No |
| Z12 (Ankle) | 30 | ±5 N | 25-35 N | 25-35 N | No |

**Critical Zones (Z1-Z7):** Must pass for mission go
**Non-Critical (Z8-Z12):** Warning only, mission continues

### 3.3 Verification Sequence (Integrated with Donning)

| Donning Step | LES Check | Time |
|--------------|-----------|------|
| 1. Hose on | — | — |
| 2. Hose waist laced | Z5, Z6 auto-start | +12 s |
| 3. Doublet on | — | — |
| 4. CF laced (top→bottom) | Z1-Z4 auto-start | +22 s |
| 5. Sides laced | Z3, Z5, Z6 update | +18 s |
| 6. Collar hooked | Z1, Z7 start | +5 s |
| 7. **System Check** | **All 12 zones sweep** | **+120 s** |
| **Total Added** | | **~5 s** (parallel with donning) |

### 3.4 Failure Modes & Responses

| Failure | Detection | Response |
|---------|-----------|----------|
| **Zone OOR (Critical)** | Red on wrist/module | Re-lace specific zone, re-verify |
| **Zone OOR (Non-Critical)** | Yellow warning | Log, continue mission |
| **Bluetooth Fail** | No auto-data | Switch to manual gauge (carry in pouch) |
| **PVDF Sensor Fail** | No signal zone | Manual verify, flag for maintenance |
| **Total Tension >700 N** | Sum alarm | Loosen CF 1-2 eyelets, re-verify |

### 3.5 Data Logging (Mission Recorder)

**Per-Donning Log Entry:**
```json
{
  "timestamp": "2026-10-14T08:00:00Z",
  "serial": "RMSG-2026-XXXX",
  "wearer_id": "OP-7741",
  "les_zones": {
    "Z1": 56, "Z2": 61, "Z3": 66, "Z4": 66,
    "Z5": 66, "Z6": 61, "Z7": 56, "Z8": 51,
    "Z9": 46, "Z10": 41, "Z11": 36, "Z12": 31
  },
  "total_tension": 635,
  "all_critical_pass": true,
  "donning_time_s": 98,
  "battery_pct": 92
}
```

### 3.6 Trend Analysis (Long-Term)

**Per-Wearer Baseline:** 10 donning cycles establish personal baseline
**Drift Detection:** >10% deviation from baseline → maintenance flag
**Chassis Fatigue:** Progressive tension increase → baleen compression set
**Cycle Life:** 500 don/doff cycles before chassis inspection

### 3.7 Cross-References

- CSMFAB078-A §3.3: LES calibration
- DOC-10 §4.4: Post-donning verification
- Chapter 38: LES zone tensions
- Chapter 39: Lacing topology
- Chapter 17: Layer 11 (PVDF) specification
- Chapter 84: Donning procedure
- Chapter 99: Maintenance intervals

---