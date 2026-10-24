## 4. Activation Protocol — System Boot Sequence

### 4.1 Activation State Machine
```
ACTIVATION STATES:
  S0: POWER_OFF          → No power, MR fluid at rest
  S1: POWER_ON           → 28 VDC bus live, controllers boot
  S2: SENSOR_INIT        → PVDF-TrFE, OFS, RF mesh, BIT
  S3: MR_PRIME           → MR fluid circulation, field calibration
  S4: MHD_SPINUP         → MHD generator → 500 W continuous
  S5: THERMAL_LOOP       → Heat pump activation, temp stabilization
  S6: SEAL_VERIFY        → Hermetic seal integrity (DOC-27)
  S7: AI_CORE_BOOT       → Neuromorphic processor (DOC-30)
  S8: OPERATIONAL        → All systems green, mission-ready
  
  TRANSITION TIMES:
  S0→S1:  2s   (bus capacitor charge)
  S1→S2:  5s   (controller POST)
  S2→S3:  10s  (sensor network discovery)
  S3→S4:  15s  (MR pump prime, field ramp)
  S4→S5:  20s  (MHD → 28VDC stable)
  S5→S6:  30s  (thermal loop ΔT <2°C)
  S6→S7:  10s  (seal pressure test)
  S7→S8:  15s  (AI core boot + model load)
  TOTAL:  107s ≈ 2 minutes (cold start)
```

### 4.2 MHD Generator Spin-Up Sequence (Layer 8 → 28 VDC Bus)
From **DOC-28 §2.4**, MHD generator extracts power from MR fluid circulation:

```
MHD SPIN-UP PROCEDURE:
  1. MR Pump Start (Protonic HFET):
     - Target flow: 2.0 L/min (v = 2.0 m/s in 600 channels)
     - Ramp rate: 0.5 L/min/s (cavitation avoidance)
     - Pressure rise: 0→50 kPa in 10s
  
  2. Magnetic Field Energization:
     - NdFeB N52 Halbach array (permanent, no energization)
     - Field verification: Hall sensor array (B = 0.8T ±5%)
  
  3. Electrical Output Build:
     - Channel voltage: E = v×B = 0.32 VAC per channel
     - 600 channels parallel → 0.32 VAC, 1536 A theoretical
     - Active rectifier (SiC MOSFET): 0.5 VDC → 28 VDC boost
     - Voltage regulation: PID loop, 10 kHz bandwidth
  
  4. Power Quality Verification:
     - Ripple: <100 mVpp @ 28 VDC
     - Regulation: ±2% (27.44-28.56 V)
     - Efficiency: >90% (end-to-end)
     - Fault: Overcurrent >60A → latch-off, retry 3×
```

### 4.3 Thermal Loop Activation (DOC-28 §3-4)
Heat pump loop for thermal rejection (500W vacuum, 300W atmospheric):

```
THERMAL LOOP STARTUP:
  1. Coolant Circulation:
     - Fluid: HFE-7100 (dielectric, -80°C to +120°C)
     - Pump: Brushless DC, 50 W, 2 L/min
     - Loop pressure: 150 kPa (design)
  
  2. Heat Pump Compressor:
     - Type: Scroll (oil-free, magnetic bearing)
     - Refrigerant: R-1234yf (GWP <1)
     - COP target: ≥3.0 (heating), ≥4.0 (cooling)
     - Startup: Soft-start VFD, 0→3600 RPM in 5s
  
  3. Radiator Deployment (Cape-integrated):
     - Area: 0.5 m² (deployable, shape-memory alloy)
     - Deployment time: 15s (thermal actuation)
     - Emissivity: ε = 0.92 (ZrO₂ coating)
  
  4. Temperature Stabilization:
     - Setpoint: 22°C ±0.5°C (electronics bay)
     - Control: PID + feedforward (MR fluid temp)
     - Stabilization time: <30s to ±2°C
```

### 4.4 Environmental Seal Verification (DOC-27 §2)
Hermetic closure integrity per **NASA-STD-3001** and **MIL-STD-282**:

```
SEAL VERIFICATION PROTOCOL:
  1. Helium Leak Test (All 8 Interfaces):
     - Test gas: 10% He / 90% N₂ @ 150 kPa
     - Detector: Mass spectrometer (sniffer mode)
     - Acceptance: ≤1×10⁻⁶ cm³/s per interface
     - Time: 30s per interface (parallel test = 30s total)
  
  2. CBRN Agent Challenge (MIL-STD-282):
     - Simulant: DIMP (sarin simulant) 10 g/m³
     - Exposure: 10 min
     - Detection: Internal IMS (ion mobility spectrometer)
     - Acceptance: <0.1 μg/cm²/min permeation
     - Protection Factor: ≥10,000
  
  3. Vacuum Compatibility:
     - Chamber: 0.01 kPa (LEO equivalent)
     - Duration: 60s
     - Leak rate: ≤1×10⁻⁶ cm³/s (aggregate)
  
  4. Pressure Cycling:
     - Cycles: 100 (0→101 kPa)
     - Rate: 1 cycle/min
     - Leak rate drift: <10% from baseline
```

### 4.5 AI/Autonomy Core Boot (DOC-30)
Neuromorphic processor initialization and verified runtime loading:

```
AI CORE BOOT SEQUENCE:
  1. Hardware Initialization:
     - Neuromorphic ASIC: 128k neurons, 256M synapses
     - SRAM: 64 MB (weights), 8 MB (state)
     - Power: 5W (active), 50mW (sleep)
  
  2. Verified Runtime Load (seL4-based):
     - Kernel: seL4 (formally verified)
     - Load time: <5s (from MRAM, 200 MB/s)
     - Integrity: SHA-384 hash verification
  
  3. Model Loading:
     - Threat classifier: 2.3M parameters (quantized INT8)
     - Bio-acoustic model: 890k parameters
     - Control policy: 1.1M parameters (MR bladder control)
     - Total load: <3s
  
  4. Self-Test:
     - Inference latency: <1ms (single forward pass)
     - Accuracy: >99.5% on validation set
     - Adversarial robustness: Certified (CROWN-IBP)
     - Watchdog: Hardware timer (100ms deadline)
```

---
