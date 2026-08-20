# DOC-16: TLV Diffusion Limitations & Ventilator Engineering
## Document 16 of 17 — Pressure Vessels and Human Physiology Deep Research Expansion
## Lines 14101-14200 | Piece 7 of 9 | ~100 Lines

---

#### 16.7 Control Systems & Safety

**16.7.1 Closed-Loop Control Architecture**

**Control Hierarchy:**
```
Supervisory (Physician) → Clinical Goals (P_aCO₂, P_aO₂, Temp)
    ↓
MPC Optimizer (1 Hz) → Gas Blender Setpoints, RR, TV, Temp
    ↓
Low-Level Controllers (1 kHz):
  • Pump Position/Velocity (servo)
  • Gas Blender Valves (proportional)
  • Heat Exchanger Valves (proportional)
  • Oxygenator Sweep Flow (mass flow controller)
    ↓
Sensors (1 kHz):
  • PFC Flow (ultrasonic, ±1%)
  • PFC Pressure (fiber-optic, 0–100 kPa)
  • PFC Temp (RTD, ±0.05°C)
  • Gas O₂/CO₂ (paramagnetic/NDIR, 10 Hz)
  • Arterial Blood Gas (ex vivo, 2 min latency)
  • ¹⁹F MRI (optional, 0.1 Hz)
```

**16.7.2 Primary Control Loops**

**Loop 1: P_aCO₂ → Respiratory Rate (Primary)**
- **Controlled Variable:** P_aCO₂ (target 40 mmHg)
- **Manipulated Variable:** RR (4–20 /min)
- **Controller:** PI with anti-windup
- **Tuning:** K_p = 0.5 /min/mmHg, T_i = 30 s
- **Constraint:** RR_min = 4, RR_max = 20

**Loop 2: P_aO₂ → O₂ Fraction in Gas Blender**
- **Controlled Variable:** P_aO₂ (target 100 mmHg)
- **Manipulated Variable:** F_IO₂ (0.5–1.0)
- **Controller:** PI
- **Constraint:** F_IO₂ ≤ 1.0 (pure O₂ max)

**Loop 3: PFC Temperature → Heat Exchanger Valve**
- **Controlled Variable:** T_PFC_return (target 37.0°C)
- **Manipulated Variable:** Cold water valve position
- **Controller:** PID with feedforward (metabolic heat estimate)
- **Tuning:** K_p = 0.1 %/°C, T_i = 60 s, T_d = 5 s

**Loop 4: PFC Circuit Pressure → Pump Speed (Feedforward)**
- **Controlled Variable:** P_circuit_mean (target 5 kPa)
- **Manipulated Variable:** Pump base speed
- **Feedforward:** Q_demand (from RR × TV)
- **Feedback:** PI on pressure error

**16.7.3 Safety Systems (Independent, Hardwired)**

| Safety Function | Sensor | Trip Point | Action | Response Time |
|-----------------|--------|------------|--------|---------------|
| **Overpressure** | Circuit pressure | > 50 kPa | Vent valve open, pump stop | < 10 ms |
| **Underpressure** | Circuit pressure | < -5 kPa | Pump stop, alarm | < 10 ms |
| **Overtemperature** | PFC temp | > 40°C | Cooling max, RR ↓ | < 1 s |
| **Undertemperature** | PFC temp | < 34°C | Heating max, alarm | < 1 s |
| **Overpressure (Oxygenator)** | Gas pressure | > 100 kPa | Relief valve | < 5 ms |
| **Air/PFC Interface** | Level sensor | Low level | Pump stop, refill | < 100 ms |
| **Flow Failure** | Flow sensor | < 10% commanded | Pump stop, alarm | < 100 ms |
| **Gas Leak (H₂)** | Catalytic sensor | > 1% LEL | Shutdown, purge | < 100 ms |

**16.7.4 Alarm Hierarchy & Operator Interface**

**Alarm Priority:**
1. **CRITICAL (Red):** Immediate threat to life → Auto-shutdown + manual override required
2. **WARNING (Yellow):** Degraded performance → Auto-correct + alert clinician
3. **ADVISORY (Blue):** Info → Log + display

**Operator Interface (Touchscreen, 15"):**
- **Main Screen:** Real-time waveforms (P, Q, V, T), P_aCO₂/P_aO₂ trends
- **Gas Blender:** F_IO₂, F_IHe, F_IN₂ sliders + auto mode
- **Ventilator:** RR, TV, I:E, P_peak, P_mean numeric + trends
- **Thermal:** T_PFC_in/out, T_patient, HX valve position
- **Safety:** Alarm log, mute/acknowledge, emergency stop (hardwired)

**16.7.5 Fail-Safe Modes**

| Failure | Detection | Fail-Safe Mode |
|---------|-----------|----------------|
| **Power Loss** | UPS (30 min) + battery (5 min) | Gravity drain → passive PFC return |
| **Pump Failure** | Encoder stall, current limit | Gravity drain + manual bag ventilation (backup) |
| **Oxygenator Failure** | ΔP_O₂ < threshold | Switch to 100% O₂ gas ventilator (backup) |
| **Gas Blender Failure** | Valve position error | Default to 100% O₂ (safe) |
| **Sensor Failure** | Out of range, frozen | Redundant sensor voting (2oo3) |
| **Software Crash** | Watchdog timeout | Hardware watchdog → hard reset + safe mode |

---

*End of Piece 7 — DOC-16 Lines 14101-14200*
*Next: Piece 8 — Section 16.8 Clinical Translation Pathway*