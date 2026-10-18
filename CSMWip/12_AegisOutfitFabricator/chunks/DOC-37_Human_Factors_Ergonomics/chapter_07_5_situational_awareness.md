## 5. Situational Awareness

### 5.1 Sensor Fusion — DOC-29 & DOC-30 Integration

Per **Endsley (1995)** three-level SA model, AIMES provides:

| SA Level | AIMES Implementation | Update Rate |
|----------|---------------------|-------------|
| **Level 1** (Perception) | DOC-29 fiber optic + RF mesh raw data | 100 Hz |
| **Level 2** (Comprehension) | DOC-30 neuromorphic fusion: threat ID, terrain, team status | 20 Hz |
| **Level 3** (Projection) | DOC-30 predictive AI: 30-s trajectory forecasts | 10 Hz |

### 5.2 Helmet-Mounted Display (HMD) — Information Layout

Per **MIL-STD-1472G §5.12** and **ISO 9241-400**:

| Region | Content | Visual Angle | Refresh |
|--------|---------|--------------|---------|
| **Central (0–10°)** | Primary flight/task symbology | 10° × 8° | 90 Hz |
| **Near Peripheral (10–30°)** | Threat cues, waypoints, team | 40° × 30° | 60 Hz |
| **Far Peripheral (30–60°)** | Ambient awareness, warnings | 120° × 90° | 30 Hz |

**Symbology Density Limit** (per ISO 9241-400):

$$
\rho_{sym} = \frac{N_{symbols}}{A_{FOV}} \leq 0.8 \text{ symbols/deg}^2
$$

### 5.3 Auditory Display — 3D Audio

Per **SAE ARP 5519** and **NATO HFM-200**:

- **HRTF-based spatialization**: 128-tap FIR per ear, updated at 100 Hz
- **Threat direction accuracy**: ≤ 3° azimuth, ≤ 5° elevation
- **Speech intelligibility**: STI ≥ 0.75 in 100 dB SPL noise
- **Alert prioritization**: 4-level (Immediate, Urgent, Routine, Deferred) with distinct auditory icons

---
