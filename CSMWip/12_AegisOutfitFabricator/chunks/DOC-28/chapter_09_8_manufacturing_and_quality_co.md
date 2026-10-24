## 8. Manufacturing and Quality Control

### 8.1 Production Flow
```
1. MHD Channel Fabrication → Graphite electrode EDM → Magnet assembly → Leak test
2. MR Fluid Preparation → CI particle synthesis → Dispersion → Conductivity verification
3. Battery Cell Assembly → Electrode coating → Stacking → Formation cycling → Grading
4. Pack Integration → Cell tab welding → BMS soldering → Potting → Hi-pot test
5. Heat Pump Assembly → Compressor test → Braze joints → Leak test → Charge → Performance map
5. Thermal Loop → Cold plate machining → Braze → Pressure test → Flush → Fill
6. Power Electronics → PCB assembly → Conformal coat → Burn-in → EMC pre-scan
7. System Integration → Harness routing → SPC programming → Full functional test
```

### 8.2 Testing Protocol
```
MHD Generator:
  - Open circuit voltage vs. flow (0-3 m/s)
  - Short circuit current vs. B-field (0-1T)
  - Power vs. load (MPPT tracking)
  - Efficiency map (η vs. P, v, B)
  - Endurance: 1000h continuous

Battery:
  - Capacity (C/3, 25°C)
  - Rate capability (C/10 to 2C)
  - Thermal runaway (nail penetration, overcharge)
  - Cycle life (accelerated, 45°C)
  - Vibration/shock (MIL-STD-810H)

Heat Pump:
  - COP map (T_cond, T_evap, compressor speed)
  - Capacity map (heating/cooling)
  - Transient response (step load)
  - Freeze/thaw (-40°C startup)
  - Sublimator water consumption

Power Distribution:
  - Regulation (load step 0-100%)
  - Ripple/noise (CE102)
  - Fault response (short, overload, arc)
  - Efficiency (end-to-end)
  - EMC full suite (MIL-STD-461G)
```
