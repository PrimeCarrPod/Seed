## 6. Manufacturing and Quality Control

### 6.1 Production Flow
```
1. Chassis Machining → Baleen/steel → O-ring grooves → CMM inspection
2. O-ring Installation → Viton GF-600S → Magnetic ring assembly → Compression test
3. Fabric Tunnel Sewing → Brocade/lining → VHB tape application → Leak test
4. Feedthrough Assembly → Glass-to-metal → Helium leak test (≤1×10⁻⁹)
5. MOF Bed Packing → Mg-MOF-74 → Vibration settling → Capacity test
6. SOEC Stack Assembly → YSZ cells → Interconnect brazing → Electrochemical test
7. System Integration → Vacuum chamber → Full leak test → Functional test
```

### 6.2 Leak Testing Protocol
```
Helium Leak Test (per NASA-STD-3001):
  1. Evacuate suit to 0.1 kPa
  2. Backfill with 10% He / 90% N₂ at 101 kPa
  3. Sniffer probe scan (all seals, feedthroughs, seams)
  4. Acceptance: ≤1×10⁻⁶ cm³/s total, ≤1×10⁻⁷ cm³/s per interface
  5. Pressure decay test: 24h at 101 kPa, ΔP ≤ 0.5 kPa

CBRN Agent Test (per MIL-STD-282):
  1. Challenge: Sarin (GB) or Mustard (HD) vapor, 10 mg/m³
  2. Exposure: 8 hours, 30 L/min flow
  3. Detection: Inside suit (DAAMS tubes, GC-MS)
  4. Acceptance: Protection factor ≥10,000
```
