## 6. Built-In Test (BIT) — MIL-STD-2173 Compliance

### 6.1 BIT Architecture
Per **MIL-STD-2173** (Aircraft/Stores Electrical Test) adapted for wearable system:

```
BIT LEVELS:
  PBIT (Power-Up BIT):    Automated at S1→S8 transition (<120s)
  CBIT (Continuous BIT):  Background monitoring (1 Hz)
  IBIT (Initiated BIT):   Operator-commanded, full coverage
  
COVERAGE TARGETS:
  Critical Functions:  100% (life support, seal, ballistic)
  Essential Functions: ≥95% (comms, sensors, thermal)
  Non-Essential:       ≥80% (diagnostics, logging, UI)
  
FAULT ISOLATION:
  LRU (Line Replaceable Unit) level: ≤4 LRUs per fault
  Fault codes: 16-bit (MIL-STD-1553 compatible)
  False alarm rate: <0.1% per flight hour equivalent
```

### 6.2 PBIT Test Vectors (Automated at Activation)

```
PBIT TEST SEQUENCE (120s max):

TEST 01: Power Bus Integrity
  - 28 VDC: 27.44-28.56V, ripple <100mVpp
  - ±12V: ±11.4-12.6V, ripple <50mVpp
  - 5V/3.3V: ±3%, ripple <30mVpp
  - Pass/Fail: GO/NO-GO

TEST 02: MHD Generator Output
  - Open-circuit voltage: 0.30-0.35 VAC
  - Short-circuit current: 1400-1600 A
  - Load regulation: 492W @ 28V, 17.6A
  - Efficiency: >90%

TEST 03: Battery Health (Li-S Pack)
  - SOC: >20% (emergency reserve)
  - Cell balance: ΔV <50mV
  - Temperature: -20°C to +60°C
  - Impedance: <5mΩ per cell

TEST 04: MR Fluid System
  - Pressure: 0.5±0.05 bar (12 zones)
  - Flow: 2.0±0.2 L/min
  - Yield stress: 80±8 kPa @ 250 kA/m
  - Leak test: <0.1 mL/min

TEST 05: PVDF-TrFE Sensor Network
  - Node count: 240/240 reporting
  - Noise floor: <5 μV/√Hz
  - Crosstalk: <-60 dB
  - Self-test pattern: 16 frequencies

TEST 06: Distributed Fiber Optic (DOC-29)
  - Fiber continuity: 4/4 channels
  - Spatial resolution: ≤1cm
  - Strain sensitivity: ≤1 με
  - Temp sensitivity: ≤0.1°C

TEST 07: RF Mesh Network (DOC-29)
  - Node discovery: 24/24
  - Mesh depth: ≤4 hops
  - Latency: <50ms (95th percentile)
  - Packet delivery: >99.9%

TEST 08: Environmental Seal (DOC-27)
  - He leak rate: ≤1×10⁻⁶ cm³/s (8 interfaces)
  - CO₂ scrubber: Dual bed cycling
  - O₂ supply: Pressure >500 kPa
  - Humidity: 30-60% RH

TEST 09: Thermal Loop (DOC-28)
  - Coolant flow: 2.0±0.2 L/min
  - ΔT evaporator-condenser: <10°C
  - Compressor: 3600±100 RPM
  - Radiator: Deployed, ε>0.9

TEST 10: AI Core (DOC-30)
  - Inference latency: <1ms
  - Model hash: SHA-384 match
  - Watchdog: Armed, 100ms
  - Adversarial cert: Valid

TEST 11: Communication Stack
  - FEATHER LoRa: Mesh formed
  - Protonic: Optical link sync
  - BLE 5.2: 240 sensors connected
  - UHF/VHF: Audio test tone

TEST 12: Lacing & Morphology
  - 12 zones: Force ±5% target
  - Cleat function: All 54 operational
  - Transition: <90s (simulated)
```

### 6.3 GO/NO-GO Criteria by Threat Class
From **CSMFAB078-E §2** and **MIL-STD-2173**:

```
MISSION READINESS MATRIX:

THREAT CLASS: STRUCTURAL FIREFIGHTING (NFPA 1971)
  REQUIRED: PBIT 01-12 ALL PASS
  CRITICAL: Thermal loop, seal, MR fluid, MHD
  MARGINAL: RF mesh, AI core (degraded mode OK)
  NO-GO IF: Any critical FAIL

THREAT CLASS: HAZMAT/CBRNE (NFPA 1994)
  REQUIRED: PBIT 01-12 ALL PASS
  CRITICAL: Seal (CBRN), CO₂ scrubber, O₂, comms
  MARGINAL: Thermal, MHD, AI core
  NO-GO IF: Seal FAIL or CO₂/O₂ FAIL

THREAT CLASS: ELECTRICAL UTILITY (NFPA 70E)
  REQUIRED: PBIT 01-12 ALL PASS
  CRITICAL: EMI SE (MXene), dielectric isolation, GIC immunity
  MARGINAL: Thermal, MR fluid, seal
  NO-GO IF: EMI SE <120 dB or dielectric <10kV

THREAT CLASS: MILITARY/TACTICAL (NIJ IV + MIL-STD-810H)
  REQUIRED: PBIT 01-12 ALL PASS
  CRITICAL: Ballistic (tile inventory), blast (MR), comms
  MARGINAL: Thermal, seal, AI core
  NO-GO IF: Tile count mismatch or MR yield stress FAIL
```

---
