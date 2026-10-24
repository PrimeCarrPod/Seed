## 5. Power Distribution Architecture

### 5.1 Primary Bus (28 VDC)
```
Source Priority:
  1. MHD Generator (500 W continuous, when MR fluid flowing)
  2. Li-S Battery (primary storage)
  3. LTO Reserve (emergency only)

Bus Regulation:
  - Voltage: 28 VDC ±2% (27.44-28.56 V)
  - Ripple: <50 mVpp (20 MHz BW)
  - Current Limit: 80 A (peak), 25 A (continuous)
  - Fault Protection: Solid-state circuit breakers (×12 zones)
```

### 5.2 Derived Rails
```
±12 VDC: Isolated DC-DC (2× 50W modules)
  - Output: ±12V ±3%, 4.2A each
  - Isolation: 500 VDC (input/output)
  - Efficiency: 94%

5 VDC: Isolated DC-DC (100W module)
  - Output: 5V ±2%, 20A
  - Isolation: 500 VDC
  - Efficiency: 94%

3.3 VDC: Non-isolated POL (point-of-load)
  - Output: 3.3V ±1.5%, 15A
  - Input: 5V or 12V
  - Efficiency: 96%
```

### 5.3 Power Management
```
Smart Power Controller (SPC):
  - MCU: Radiation-hardened ARM Cortex-R52 (dual-core lockstep)
  - Functions: Source selection, load shedding, fault management
  - Communication: SpaceWire + CAN-FD (redundant)
  - Telemetry: 1 kHz (V, I, T, status per zone)
  - Mass: 0.5 kg
```

### 5.4 EMI/EMC Mitigation
```
Conducted Emissions (CE102):
  - Input filter: 3-stage (CM choke + DM choke + Y-cap)
  - Switching frequency: 500 kHz (spread spectrum ±5%)
  - Layout: Star ground, separate power/signal planes

Radiated Emissions (RE102):
  - Enclosure: Aluminum (6061-T6), 2mm wall, conductive gaskets
  - Cable: Twisted shielded (MIL-DTL-38999 backshells)
  - Ferrites: On all cables >30 cm

Susceptibility (CS101/CS114/RS103):
  - Transient protection: TVS + MOV + GDT (per MIL-STD-1275)
  - Conducted immunity: 10V (10 kHz-200 MHz)
  - Radiated immunity: 200 V/m (2 MHz-18 GHz)
```
