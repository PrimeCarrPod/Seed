## 10. Edition Identification — RW-TS

### 10.1 Edition Designation System

**Official Designation:** RenaissanceWoMan Tall-Skinny (RW-TS)
**Internal Code:** CSMFAB078-A-RW-TS-001
**Configuration ID:** RW-TS-v1.3-20261014

### 10.2 Morphology Identification Parameters

| Parameter | Symbol | RW-TS Range | Nominal | Units |
|-----------|--------|-------------|---------|-------|
| Height | H | 170-185 | 175 | cm |
| Bust Circumference | B | 88-98 | 92 | cm |
| Waist Circumference | W | 60-70 | 65 | cm |
| Hip Circumference | H_p | 90-100 | 95 | cm |
| Morphology Factor | αₑ | — | +0.05 | — |
| Mass Ratio | Mₑ/M_ref | — | 1.03 | — |

### 10.3 Edition Discriminators (vs. Other RW Editions)

| Feature | RW-TS | RW-SS | RW-SG | RW-TG |
|---------|-------|-------|-------|-------|
| **Height Class** | Tall (170-185) | Short (145-160) | Short (145-160) | Tall (170-185) |
| **Girth Class** | Skinny (88-98) | Skinny (82-92) | Girthy (105-115) | Girthy (110-120) |
| **αₑ Sign** | Positive (+0.05) | Negative (-0.12) | Positive (+0.20) | Positive (+0.30) |
| **Tile Thickness** | 25/15 mm | 20/10 mm | 25/15 mm | 50/25 mm |
| **Aerogel Thickness** | 3 mm | 2 mm | 3 mm | 5 mm |
| **Chassis** | 22 baleen + 10 steel | 18 + 8 | 22 + 10 | 28 + 14 |

### 10.4 Identification Markings

**Physical Labels (per CSMFAB078-A §3.1.5):**
- **Neck Label:** "AEGIS RW-TS | SN: [serial] | MFG: [date] | LOT: [lot]"
- **Skirt Waistband:** "RW-TS | W=65cm | H_p=95cm | HOOP: 12"
- **Internal LES Tag:** "Z1:50N Z2:55N Z3:60N Z4:60N Z5:55N Z6:50N Z7:55N Z8:45N Z9:40N Z10:35N Z11:30N Z12:25N"

**Digital Identification (PVDF Telemetry):**
```json
{
  "edition": "RW-TS",
  "version": "1.3",
  "serial": "RWTS-2026-XXXX",
  "morphology": {"H": 175, "B": 92, "W": 65, "H_p": 95},
  "mass_kg": 16.00,
  "tiles_primary": 170,
  "tiles_backup": 280,
  "les_zones": 12,
  "farthingale_hoops": 12,
  "firmware": "LES-v2.1"
}
```

### 10.5 Configuration Management

| Config Item | RW-TS Value | Change Control |
|-------------|-------------|----------------|
| Primary Tile Count | 170 | CCB approval required |
| Primary Tile Size | 25×25×3 mm | CCB approval required |
| Backup Tile Count | 280 | CCB approval required |
| Backup Tile Size | 15×15×2 mm | CCB approval required |
| Aerogel Thickness | 3 mm | CCB approval required |
| MXene Coating | 30 µm | CCB approval required |
| Baleen Count | 22 | Engineering change |
| Steel Boning Count | 10 | Engineering change |
| Panel Count | 32 | Pattern change |
| Farthingale Hoops | 12 | Engineering change |
| LES Base Tensions | Per Ch. 39 table | Calibration change |

### 10.6 Cross-References

- CSMFAB078-A §3.1: Edition definition framework
- CSMFAB078-A §3.5: Edition transition rules
- DOC-13 Piece 01: RM-SS edition identification
- DOC-14 Piece 01: RM-SG edition identification
- DOC-11 Piece 01: RM-TS edition identification
- Framework/config_schema.json: Digital ID schema

---
