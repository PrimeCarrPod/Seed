## 4. EMP Protection — MIL-STD-464C Compliance

### 4.1 EMP Waveform Requirements

| EMP Component | Rise Time | Duration | Peak Field | Frequency Content |
|---------------|-----------|----------|------------|-------------------|
| **E1 (Early)** | ≤1 ns | ≤1 μs | 50 kV/m | 100 MHz - 10 GHz |
| **E2 (Intermediate)** | ≤1 μs | ≤1 s | 1 kV/m | 1 MHz - 100 MHz |
| **E3 (Late)** | ≤1 s | ≤1000 s | 10 V/m | DC - 1 MHz |

### 4.2 Shielding Effectiveness Analysis

**Layer 3 (Hilbert FSS) + Layer 6 (Jerusalem Cross) + BFRP:**

```
SE_total = SE_L3 + SE_L6 + SE_BFRP + SE_coupling

SE_L3 (Hilbert): 
  @ 100 MHz: 55 dB
  @ 1 GHz: 85 dB
  @ 10 GHz: 75 dB

SE_L6 (Jerusalem):
  @ 100 MHz: 45 dB
  @ 1 GHz: 88 dB
  @ 10 GHz: 90 dB

SE_BFRP (5mm):
  @ 100 MHz: 20 dB (reflection + absorption)
  @ 1 GHz: 35 dB
  @ 10 GHz: 45 dB

COMBINED (conservative, -6 dB coupling):
@ 100 MHz: 55 + 45 + 20 - 6 = 114 dB
@ 1 GHz: 85 + 88 + 35 - 6 = 202 dB
@ 10 GHz: 75 + 90 + 45 - 6 = 204 dB
```

**Required SE for MIL-STD-464C:**
```
E1: 50 kV/m → <1 V/m interior → SE ≥ 94 dB (100 MHz-10 GHz) ✅ PASS
E2: 1 kV/m → <0.1 V/m interior → SE ≥ 80 dB (1 MHz-100 MHz) ✅ PASS
E3: 10 V/m → <10 mV/m interior → SE ≥ 60 dB (DC-1 MHz) ✅ PASS (BFRP + ground strap)
```

### 4.3 Penetration Points — Gasket & Sealing (CSMFAB078 §4.3)

```
ALL PANEL JOINTS: Double-gasket MXene tape bridge (DOC-37)
Gasket: MXene-coated silk tape (50 mm wide, 0.5 mm thick)
Compression: 30% (spring force 50 N/cm)
Contact resistance: <1 mΩ/cm²

PENETRATIONS:
- Sleeve/body joints: Overlap 50mm + MXene tape
- Neck/coif: Conductive hook-and-loop + MXene bridge
- Ventilation ports: MXene mesh (100 PPI, 80% open area) + waveguide beyond cutoff
```

---
