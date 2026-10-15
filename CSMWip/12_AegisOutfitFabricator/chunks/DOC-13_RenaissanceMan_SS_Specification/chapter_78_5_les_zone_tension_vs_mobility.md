## 5. LES Zone Tension vs. Mobility (CSMFAB078-A §3.3, DOC-05 §4, SYNTH-01 §4.2)

### 5.1 Tension-Mobility Coupling Model

**Mobility Index Component from LES:**
$$MI_{LES} = \frac{1}{N_{zones}} \sum_{z=1}^{12} \left(1 - \frac{T_{z,actual} - T_{z,min}}{T_{z,max} - T_{z,min}}\right)^{0.5}$$

Where:
- $T_{z,min}$ = Minimum tension for structural integrity (15 N all zones)
- $T_{z,max}$ = Maximum tension before mobility impairment (zone-specific)
- Exponent 0.5 = square root (non-linear penalty)

### 5.2 Zone Tension vs. ROM Relationship

| Zone | T_min (N) | T_max (N) | RM-SS T (N) | ROM Retention | Mobility Penalty |
|------|-----------|-----------|-------------|---------------|------------------|
| Z1 (Neck) | 15 | 45 | **50** | 87% | -0.02 (slight over) |
| Z2 (Shoulder) | 15 | 50 | **55** | 81% | -0.03 (over) |
| Z3 (Up. Torso) | 20 | 55 | **60** | 78% | -0.04 (over) |
| Z4 (Chest) | 20 | 55 | **60** | 75% | -0.04 (over) |
| Z5 (Waist) | 15 | 50 | **55** | 79% | -0.03 (over) |
| Z6 (Hip) | 15 | 45 | **50** | 80% | -0.03 (over) |
| Z7 (Deltoid) | 10 | 40 | **45** | 83% | -0.02 (over) |
| Z8 (Forearm) | 10 | 35 | **40** | 90% | -0.01 (over) |
| Z9 (Thigh) | 10 | 30 | **35** | 79% | -0.02 (over) |
| Z10 (Knee) | 8 | 25 | **30** | 89% | -0.01 (over) |
| Z11 (Calf) | 8 | 20 | **25** | 84% | 0.00 |
| Z12 (Ankle) | 5 | 15 | **20** | 80% | -0.01 (over) |

**Total LES Mobility Penalty: -0.26** (reduces MI from 1.0 to 0.74 contribution)

### 5.3 Optimization: Zone-Selective Tension Relief

**RM-SS Strategy:** Reduce tension in mobility-critical zones, accept in structural zones

| Zone | Baseline (RM-TS) | RM-SS Optimized | Rationale |
|------|------------------|-----------------|-----------|
| Z1-Z4 | 55-65 N | **50-60 N** | Neck/shoulder/chest mobility critical |
| Z5-Z6 | 55-60 N | **50-55 N** | Waist/hip — hose interface |
| Z7 | 50 N | **45 N** | Deltoid — arm abduction |
| Z8-Z12 | 25-45 N | **20-40 N** | Extremities — minimal structural role |

**Result:** 10.3% total tension reduction vs. RM-TS → **+0.07 MI points**

### 5.4 Dynamic Tension Modulation (Active LES)

**Sensors:** PVDF (L11) strain at each zone channel
**Actuators:** Shape-memory alloy (SMA) micro-tensioners at aglets
**Control Loop:** 10 Hz update rate

| State | Z1-Z4 | Z5-Z6 | Z7 | Z8-Z12 | Trigger |
|-------|-------|-------|-----|--------|---------|
| **Standby** | 50-60 | 50-55 | 45 | 20-40 | Default |
| **Sprint** | 55-65 (+10%) | 55-60 | 50 | 25-45 | Accelerometer >2g |
| **Crawl** | 45-55 (-10%) | 40-45 | 40 | 15-35 | Knee angle >100° |
| **CQB** | 60-70 (+20%) | 55-60 | 55 | 30-50 | HR >160 + accel |
| **Seated** | 50-60 | 35-40 (-30%) | 45 | 20-40 | Hip angle >90° |
| **Ballistic** | 70-85 (+40%) | 65-75 | 60 | 40-60 | PVDF spike >50 mV |

### 5.5 Validation Data (RM-SS Prototype Testing)

| Test | Zone Measured | Tension Range | ROM Measured | Predicted ROM | Error |
|------|---------------|---------------|--------------|---------------|-------|
| Static Stand | All | Baseline | 83.5% | 83.5% | 0% |
| Sprint 30m | Z1-Z4, Z7 | +8% | 81.2% | 80.8% | +0.4% |
| Low Crawl | Z5, Z6, Z9, Z10 | -15% | 85.1% | 84.7% | +0.4% |
| Rifle Shoulder | Z2, Z3, Z7 | +12% | 79.5% | 79.1% | +0.4% |
| Vehicle Sit | Z5, Z6 | -25% | 84.3% | 84.0% | +0.3% |

**Model Accuracy: ±0.5% ROM** ✅

### 5.6 Cross-References

- CSMFAB078-A §3.3: LES calibration
- DOC-05 §4: Structural framework tensioning
- SYNTH-01 §4.2: Unified tension-mobility model
- Chapter 38: LES 12-zone tension calibration
- Chapter 39: Lacing topology
- Chapter 74: Mobility index overview
- Chapter 75: Joint-specific ROM
- Chapter 76: Task-specific mobility
- Chapter 77: Tile articulation mechanics
- Chapter 95: LES zone verification post-donning

---