## 5. LES Zone Tension vs. Mobility (CSMFAB078-A §3.3, DOC-05 §4, SYNTH-01 §4.2)

### 5.1 Tension-Mobility Coupling Model

**Mobility Index Component from LES:**
$$MI_{LES} = \frac{1}{N_{zones}} \sum_{z=1}^{12} \left(1 - \frac{T_{z,actual} - T_{z,min}}{T_{z,max} - T_{z,min}}\right)^{0.5}$$

Where:
- $T_{z,min}$ = Minimum tension for structural integrity (15 N all zones)
- $T_{z,max}$ = Maximum tension before mobility impairment (zone-specific)
- Exponent 0.5 = square root (non-linear penalty)

### 5.2 Zone Tension vs. ROM Relationship

| Zone | T_min (N) | T_max (N) | RM-SG T (N) | ROM Retention | Mobility Penalty |
|------|-----------|-----------|-------------|---------------|------------------|
| Z1 (Neck) | 15 | 45 | **55** | 80% | -0.05 (over) |
| Z2 (Shoulder) | 15 | 50 | **60** | 72% | -0.06 (over) |
| Z3 (Up. Torso) | 20 | 55 | **65** | 70% | -0.08 (over) |
| Z4 (Chest) | 20 | 55 | **65** | 67% | -0.08 (over) |
| Z5 (Waist) | 15 | 50 | **65** | 71% | -0.07 (over) |
| Z6 (Hip) | 15 | 45 | **60** | 71% | -0.07 (over) |
| Z7 (Deltoid) | 10 | 40 | **55** | 76% | -0.05 (over) |
| Z8 (Forearm) | 10 | 35 | **50** | 85% | -0.02 (over) |
| Z9 (Thigh) | 10 | 30 | **45** | 71% | -0.04 (over) |
| Z10 (Knee) | 8 | 25 | **40** | 82% | -0.02 (over) |
| Z11 (Calf) | 8 | 20 | **35** | 76% | 0.00 |
| Z12 (Ankle) | 5 | 15 | **30** | 70% | -0.02 (over) |

**Total LES Mobility Penalty: -0.56** (reduces MI from 1.0 to 0.44 contribution)

### 5.3 Optimization: Zone-Selective Tension Relief

**RM-SG Strategy:** Accept higher tensions in structural zones, relieve in mobility-critical zones

| Zone | Baseline (RM-TS) | RM-SG Optimized | Rationale |
|------|------------------|-----------------|-----------|
| Z1-Z4 | 55-65 N | **55-65 N** | Neck/shoulder/chest — accept for protection |
| Z5-Z6 | 55-60 N | **60-65 N** | Waist/hip — girth requires higher tension |
| Z7 | 50 N | **55 N** | Deltoid — arm abduction, accept slight over |
| Z8-Z12 | 25-45 N | **30-50 N** | Extremities — minimal structural role |

**Result:** Tensions match RM-TS baseline for Z1-Z4, elevated for girth zones — **protection priority**

### 5.4 Dynamic Tension Modulation (Active LES)

**Sensors:** PVDF (L11) strain at each zone channel
**Actuators:** Shape-memory alloy (SMA) micro-tensioners at aglets
**Control Loop:** 10 Hz update rate

| State | Z1-Z4 | Z5-Z6 | Z7 | Z8-Z12 | Trigger |
|-------|-------|-------|-----|--------|---------|
| **Standby** | 55-65 | 60-65 | 55 | 30-50 | Default |
| **Sprint** | 60-70 (+10%) | 65-70 | 60 | 35-55 | Accelerometer >2g |
| **Crawl** | 50-60 (-10%) | 50-55 | 50 | 25-45 | Knee angle >100° |
| **CQB** | 65-75 (+20%) | 70-75 | 65 | 40-60 | HR >160 + accel |
| **Seated** | 55-65 | 45-50 (-30%) | 55 | 30-50 | Hip angle >90° |
| **Ballistic** | 75-85 (+40%) | 75-85 | 70 | 50-70 | PVDF spike >50 mV |

### 5.5 Validation Data (RM-SG Prototype Testing)

| Test | Zone Measured | Tension Range | ROM Measured | Predicted ROM | Error |
|------|---------------|---------------|--------------|---------------|-------|
| Static Stand | All | Baseline | 74.5% | 74.5% | 0% |
| Sprint 30m | Z1-Z4, Z7 | +8% | 72.1% | 71.8% | +0.3% |
| Low Crawl | Z5, Z6, Z9, Z10 | -15% | 76.2% | 75.9% | +0.3% |
| Rifle Shoulder | Z2, Z3, Z7 | +12% | 70.5% | 70.1% | +0.4% |
| Vehicle Sit | Z5, Z6 | -25% | 75.8% | 75.5% | +0.3% |

**Model Accuracy: ±0.5% ROM** ✅

### 5.6 Cross-References

- CSMFAB078-A §3.3: LES calibration
- DOC-05 §4: Structural framework tensioning
- SYNTH-01 §4.2: Unified tension-mobility model
- Chapter 38: LES 12-zone tension calibration
- Chapter 39: Lacing topology
- Chapter 65: Mobility index overview
- Chapter 66: Joint-specific ROM
- Chapter 67: Task-specific mobility
- Chapter 68: Tile articulation mechanics
- Chapter 86: LES zone verification post-donning

---
