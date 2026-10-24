## 5. Power-Up Sequence — Layer-by-Layer Energy Activation

### 5.1 Power Architecture Overview
From **DOC-28** and **CSMFAB078 Main §4.6**:

```
POWER BUS TOPOLOGY:
  
  PRIMARY BUS: 28 VDC (±2%)
    │
    ├── MHD Generator (Layer 8) — 500 W continuous
    ├── Li-S Battery (Bay 6) — 1.55 kWh (280 Wh/kg pack)
    └── Solar DIM (Optional) — 200 W (perovskite 0.1m²)
    │
    ├── DERIVED RAILS (Isolated DC-DC):
    │   ├── ±12 VDC (MR actuators, ±5%)
    │   ├── 5 VDC (Logic, sensors, ±3%)
    │   └── 3.3 VDC (MCU, RF, ±3%)
    │
    └── HIGH VOLTAGE (DIM):
        └── 400 VDC (Plasma window, optional)

POWER-UP SEQUENCE (Priority Order):
  1. 28 VDC Bus (MHD + Battery parallel)
  2. 5 VDC / 3.3 VDC (Logic, comms, sensors)
  3. ±12 VDC (MR actuators, Protonic HFET)
  4. 400 VDC (Optional DIMs)
```

### 5.2 Layer Power Dependencies

| Layer | Subsystem | Power Rail | Power Budget | Activation Order |
|-------|-----------|------------|--------------|------------------|
| L8 | MR Fluid Pump | ±12 VDC | 15 W | 1 (enables MHD) |
| L8 | MHD Generator | 28 VDC (out) | 500 W (gen) | 2 |
| L11 | PVDF-TrFE Mesh | 3.3 VDC | 2 W | 3 |
| L11 | Protonic HFET (12×) | 5 VDC | 12 W | 3 |
| L11 | OFS Interrogator | 5 VDC | 8 W | 3 |
| L11 | RF Mesh Nodes (24×) | 3.3 VDC | 12 W | 3 |
| L27 | CO₂ Scrubber Heater | 28 VDC | 85 W | 4 |
| L27 | Vacuum Pump | 28 VDC | 25 W | 4 |
| L28 | Heat Pump Compressor | 28 VDC | 200 W | 5 |
| L28 | Coolant Pump | 12 VDC | 50 W | 5 |
| L28 | Radiator Deploy | 12 VDC | 10 W (peak) | 5 |
| L30 | Neuromorphic ASIC | 1.8 VDC (local) | 5 W | 6 |
| L30 | SRAM/MRAM | 3.3 VDC | 3 W | 6 |
| L1 | YInMn Fluorescence | 5 VDC (LED) | 1 W | 7 |
| **TOTAL** | | | **~928 W** | |

### 5.3 Power-Up Timing Diagram
```
TIME (seconds):
  0    2    5    10   15   20   30   40   50   60   70   80   90  100  110
  │    │    │    │    │    │    │    │    │    │    │    │    │    │    │
  ├───┤    │    │    │    │    │    │    │    │    │    │    │    │    │
  │5V/3.3V│    │    │    │    │    │    │    │    │    │    │    │    │
  │  ON  │    │    │    │    │    │    │    │    │    │    │    │    │
  ├───┤    │    │    │    │    │    │    │    │    │    │    │    │    │
       ├───┤    │    │    │    │    │    │    │    │    │    │    │    │
       │±12V│    │    │    │    │    │    │    │    │    │    │    │    │
       │ ON │    │    │    │    │    │    │    │    │    │    │    │    │
       ├───┤    │    │    │    │    │    │    │    │    │    │    │    │
            ├───┤    │    │    │    │    │    │    │    │    │    │    │
            │MR │    │    │    │    │    │    │    │    │    │    │    │
            │PUMP│    │    │    │    │    │    │    │    │    │    │    │
            ├───┤    │    │    │    │    │    │    │    │    │    │    │
                 ├───┤    │    │    │    │    │    │    │    │    │    │
                 │MHD│    │    │    │    │    │    │    │    │    │    │
                 │GEN│    │    │    │    │    │    │    │    │    │    │
                 ├───┤    │    │    │    │    │    │    │    │    │    │
                      ├───┤    │    │    │    │    │    │    │    │    │
                      │28V│    │    │    │    │    │    │    │    │    │
                      │BUS│    │    │    │    │    │    │    │    │    │
                      ├───┤    │    │    │    │    │    │    │    │    │
                           ├───┤    │    │    │    │    │    │    │    │
                           │THM│    │    │    │    │    │    │    │    │
                           │LOOP│    │    │    │    │    │    │    │    │
                           ├───┤    │    │    │    │    │    │    │    │
                                ├───┤    │    │    │    │    │    │    │
                                │AI │    │    │    │    │    │    │    │
                                │CORE│    │    │    │    │    │    │    │
                                ├───┤    │    │    │    │    │    │    │
                                     ├───┤    │    │    │    │    │    │
                                     │SEAL│    │    │    │    │    │    │
                                     │VER │    │    │    │    │    │    │
                                     ├───┤    │    │    │    │    │    │
                                          ├───┤    │    │    │    │    │
                                          │OP │    │    │    │    │    │
                                          │READY│   │    │    │    │    │
                                          └─────┘    │    │    │    │
```

---
