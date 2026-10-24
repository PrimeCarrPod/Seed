## 10. Edition Identification — RM-SG

### 10.1 Edition Designation System

**Official Designation:** RenaissanceMan Short-Girthy (RM-SG)
**Internal Code:** CSMFAB078-A-RM-SG-001
**Configuration ID:** RM-SG-v1.3-20261014

### 10.2 Morphology Identification Parameters

| Parameter | Symbol | RM-SG Range | Nominal | Units |
|-----------|--------|-------------|---------|-------|
| Height | H | 155-170 | 162.5 | cm |
| Chest Circumference | C | 105-115 | 110 | cm |
| Waist Circumference | W | 95-105 | 100 | cm |
| Morphology Factor | αₑ | — | +0.08 | — |
| Mass Ratio | Mₑ/M_ref | — | 1.05 | — |

### 10.3 Edition Discriminators (vs. Other RM Editions)

| Feature | RM-SG | RM-SS | RM-TS | RM-TG |
|---------|-------|-------|-------|-------|
| **Height Class** | Short (155-170) | Short (155-170) | Tall (185-195) | Tall (185-195) |
| **Girth Class** | Girthy (105-115) | Skinny (76-86) | Skinny (85-95) | Girthy (110-120) |
| **αₑ Sign** | Positive (+0.08) | Negative (-0.15) | Zero (0.00) | Positive (+0.25) |
| **Tile Thickness** | 25/15 mm | 20/10 mm | 25/15 mm | 50/25 mm |
| **Aerogel Thickness** | 3 mm | 2 mm | 3 mm | 5 mm |
| **Chassis** | 24 baleen + 12 steel | 20 + 8 | 24 + 12 | 30 + 18 |

### 10.4 Identification Markings

**Physical Labels (per CSMFAB078-A §3.1.5):**
- **Neck Label:** "AEGIS RM-SG | SN: [serial] | MFG: [date] | LOT: [lot]"
- **Hose Waistband:** "RM-SG | W=100cm | LACE: 24 eyelets"
- **Internal LES Tag:** "Z1:55N Z2:60N Z3:65N Z4:65N Z5:60N Z6:55N Z7:55N Z8:50N Z9:45N Z10:40N Z11:35N Z12:30N"

**Digital Identification (PVDF Telemetry):**
```json
{
  "edition": "RM-SG",
  "version": "1.3",
  "serial": "RMSG-2026-XXXX",
  "morphology": {"H": 162.5, "C": 110, "W": 100},
  "mass_kg": 17.21,
  "tiles_primary": 210,
  "tiles_backup": 340,
  "les_zones": 12,
  "firmware": "LES-v2.1"
}
```

### 10.5 Configuration Management

| Config Item | RM-SG Value | Change Control |
|-------------|-------------|----------------|
| Primary Tile Count | 210 | CCB approval required |
| Primary Tile Size | 25×25×3 mm | CCB approval required |
| Backup Tile Count | 340 | CCB approval required |
| Backup Tile Size | 15×15×2 mm | CCB approval required |
| Aerogel Thickness | 3 mm | CCB approval required |
| MXene Coating | 30 µm | CCB approval required |
| Baleen Count | 24 | Engineering change |
| Steel Boning Count | 12 | Engineering change |
| Panel Count | 30 | Pattern change |
| LES Base Tensions | Per Ch. 38 table | Calibration change |

### 10.6 Cross-References

- CSMFAB078-A §3.1: Edition definition framework
- CSMFAB078-A §3.5: Edition transition rules
- DOC-13 Piece 01: RM-SS edition identification
- DOC-11 Piece 01: RM-TS edition identification
- DOC-12 Piece 01: RM-TG edition identification
- Framework/config_schema.json: Digital ID schema

---
