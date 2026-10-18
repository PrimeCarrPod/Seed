## 4. Sensor Fusion and Data Processing

### 4.1 Multi-Modal Fusion Architecture

#### 4.1.1 Kalman Filter for State Estimation
Centralized fusion at gateway combining FBG, OFDR, BOTDA, RF, IMU, physiological:

```
State Vector (per structural element):
  x = [ε₁, ε₂, ..., εₙ, T₁, T₂, ..., Tₙ, p, v, a, q]ᵀ
  n = FBG count per element (typically 10-50)
  p = position, v = velocity, a = acceleration
  q = quaternion (orientation)
  
Process Model:
  x_{k+1} = F_k x_k + G_k w_k
  w_k ~ N(0, Q_k)
  
Measurement Model:
  z_k = H_k x_k + v_k
  v_k ~ N(0, R_k)
  
Where:
  F_k = state transition (structural dynamics)
  H_k = measurement matrix (FBG, OFDR, BOTDA, IMU)
  Q_k = process noise (material property variation)
  R_k = measurement noise (sensor specs)
```

#### 4.1.2 Federated Fusion for Distributed Layers
Layer-local processing reduces bandwidth:

```
Layer-Local Fusion (per layer controller):
  1. FBG array → strain/temperature field (50 points, 1 kHz)
  2. OFDR → continuous profile (2000 points, 100 Hz)
  3. Local KF → compressed state (10 params, 100 Hz)
  4. Transmit to gateway: 10 × 4 bytes × 100 Hz = 4 kbps
  
Gateway Fusion:
  12 layers × 4 kbps = 48 kbps (structural)
  Physiological: 20 kbps
  Environmental: 5 kbps
  Commands/ACK: 2 kbps
  Total: ~75 kbps (well within 1 Mbps budget)
```

### 4.2 Structural Health Monitoring Algorithms

#### 4.2.1 Damage Detection via Strain Field Anomalies
```
Baseline Strain Field (undamaged):
  ε₀(x,y,z) = f_load(F, geometry, material)
  
Damage Indicator:
  D(x,y,z) = |ε_measured - ε_predicted| / σ_ε
  
Threshold:
  D > 3 → Warning
  D > 5 → Critical (structural compromise)
  
Crack Detection (FBG array):
  Δε_local = ε_{i+1} - ε_i > 500 με over 5 mm
  → Matrix crack or delamination
```

#### 4.2.2 Thermal Anomaly Detection
```
Thermal Gradient Monitoring:
  ∇T(x,y,z) = [∂T/∂x, ∂T/∂y, ∂T/∂z]
  
Hotspot Detection:
  |∇T| > 50°C/cm → Localized heating (impact, EMI, chemical)
  Rate: ∂T/∂t > 10°C/s → Flash event (directed energy)
  
Thermal Model Validation:
  T_predicted = T_ambient + P_dissipated × R_th
  Residual: r = T_measured - T_predicted
  |r| > 3σ → Cooling system fault
```

### 4.3 Physiological Monitoring Integration

#### 4.3.1 Vital Signs from Inner Silk Layer (Layer 12)
```
Physiological Sensors (FBG-based):
  - Heart rate: FBG on carotid/radiological pulse points
    f_HR = (1/Δt_peak) from strain waveform
  - Respiration: FBG on thoracic circumference
    f_RR = (1/Δt_peak) from strain envelope
  - Temperature: FBG at core sites (axillary, tympanic)
  - Motion: 3-axis MEMS IMU (co-located with FBG)
  
Signal Processing:
  Bandpass filter: 0.5-5 Hz (HR), 0.1-0.5 Hz (RR)
  Peak detection: Adaptive threshold (Pan-Tompkins variant)
  Artifact rejection: IMU correlation (motion > 0.5g → discard)
```

---
