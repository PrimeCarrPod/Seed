## 6. Manufacturing and Quality Control

### 6.1 Fiber Embedding Process

#### 6.1.1 Automated Fiber Layup
Based on Research Doc 2 §5 (Sewbo/KSL/TFP, ultrasonic/RF):

```
TFP (Tailored Fiber Placement) for Sensor Fibers:
  - Robot: 6-axis + fiber feed (KSL-style)
  - Fiber tension: 0.05-0.1 N (controlled)
  - Adhesive: UV-curable acrylic (thin, flexible)
  - Path accuracy: ±0.5 mm (vs. SYNTH-03 DXF)
  - Speed: 500 mm/s (placement), 100 mm/s (cure)
  
Ultrasonic Seaming (Research Doc 2 §5):
  - Frequency: 20-40 kHz
  - Amplitude: 20-50 μm
  - Pressure: 0.1-0.5 MPa
  - Fiber protection: Silicone buffer layer (0.2 mm)
```

### 6.2 Quality Assurance Testing

#### 6.2.1 Optical Characterization (per ASTM E1806)
```
FBG Array Acceptance Test:
  1. Reflectivity: R > 90% (all gratings)
  2. Bandwidth: Δλ = 0.2 ± 0.05 nm
  3. Side lobes: >15 dB suppression
  4. Wavelength accuracy: λ_B = 1550 ± 0.5 nm
  5. Temperature calibration: 5 points (-40, 0, 25, 75, 150°C)
  6. Strain calibration: 5 points (0, 2500, 5000, 7500, 10000 με)
  7. Hysteresis: <1 με (load/unload cycle)
  8. Fatigue: 10⁶ cycles at 5000 με (no degradation)
```

#### 6.2.2 RF Network Validation
```
Network Acceptance Test (per IEC 61784, IEEE 802.15.4e):
  1. Single-hop PER: <10⁻⁴ (at -90 dBm)
  2. Multi-hop latency: <10 ms (10 hops, scheduled)
  3. Channel hopping: All 16 channels verified
  4. TSCH schedule: 100% slot utilization (no collisions)
  5. RPL convergence: <5 s (network formation)
  6. Security: DTLS 1.3 handshake <100 ms
  7. CoAP Observe: Notification latency <50 ms
```

---
