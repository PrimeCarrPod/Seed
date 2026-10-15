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
2. Measure at each lacing point (24 points)
3. Cross-reference with PVDF data
4. Required if Bluetooth fails

### 3.2 Zone Verification Targets (RM-SS)

| Zone | Target (N) | Tolerance | Auto Pass | Manual Pass | Critical |
|------|------------|-----------|-----------|-------------|----------|
| Z1 (Neck) | 50 | ±5 N | 45-55 N | 45-55 N | Yes |
| Z2 (Shoulder) | 55 | ±5 N | 50-60 N | 50-60 N | Yes |
| Z3 (Up. Torso) | 60 | ±5 N | 55-65 N | 55-65 N | Yes |
| Z4 (Chest) | 60 | ±5 N | 55-65 N | 55-65 N | Yes |
| Z5 (Waist) | 55 | ±5 N | 50-60 N | 50-60 N | Yes |
| Z6 (Hip) | 50 | ±5 N | 45-55 N | 45-55 N | Yes |
| Z7 (Deltoid) | 45 | ±5 N | 40-50 N | 40-50 N | Yes |
| Z8 (Forearm) | 40 | ±5 N | 35-45 N | 35-45 N | No |
| Z9 (Thigh) | 35 | ±5 N | 30-40 N | 30-40 N | No |
| Z10 (Knee) | 30 | ±5 N | 25-35 N | 25-35 N | No |
| Z11 (Calf) | 25 | ±5 N | 20-30 N | 20-30 N | No |
| Z12 (Ankle) | 20 | ±5 N | 15-25 N | 15-25 N | No |

**Critical Zones (Z1-Z7):** Must pass for mission go
**Non-Critical (Z8-Z12):** Warning only, mission continues

### 3.3 Verification Sequence (Integrated with Donning)

| Donning Step | LES Check | Time |
|--------------|-----------|------|
| 1. Hose on | — | — |
| 2. Hose waist laced | Z5, Z6 auto-start | +10 s |
| 3. Doublet on | — | — |
| 4. CF laced (top→bottom) | Z1-Z4 auto-start | +20 s |
| 5. Sides laced | Z3, Z5, Z6 update | +15 s |
| 6. Collar hooked | Z1, Z7 start | +5 s |
| 7. **System Check** | **All 12 zones sweep** | **+120 s** |
| **Total Added** | | **~5 s** (parallel with donning) |

**Note:** Auto-sweep runs during Steps 4-6; Step 7 is confirmation only

### 3.4 Failure Modes & Responses

| Failure | Detection | Response |
|---------|-----------|----------|
| **Zone OOR (Critical)** | Red on wrist/module | Re-lace specific zone, re-verify |
| **Zone OOR (Non-Critical)** | Yellow warning | Log, continue mission |
| **Bluetooth Fail** | No auto-data | Switch to manual gauge (carry in pouch) |
| **PVDF Sensor Fail** | No signal zone | Manual verify, flag for maintenance |
| **Total Tension >600 N** | Sum alarm | Loosen CF 1-2 eyelets, re-verify |

### 3.5 Data Logging (Mission Recorder)

**Per-Donning Log Entry:**
```json
{
  "timestamp": "2026-10-14T08:00:00Z",
  "serial": "RMSS-2026-0042",
  "wearer_id": "OP-7741",
  "les_zones": {
    "Z1": 51, "Z2": 56, "Z3": 61, "Z4": 60,
    "Z5": 54, "Z6": 50, "Z7": 46, "Z8": 41,
    "Z9": 36, "Z10": 31, "Z11": 26, "Z12": 21
  },
  "total_tension": 533,
  "all_critical_pass": true,
  "donning_time_s": 88,
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
- Chapter 93: Donning procedure
- Chapter 108: Maintenance intervals

---