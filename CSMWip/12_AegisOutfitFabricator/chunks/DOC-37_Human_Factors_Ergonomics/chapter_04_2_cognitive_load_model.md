## 2. Cognitive Load Model

### 2.1 Wickens Multiple Resource Theory (MRT) Integration

Per **Wickens (2008)** and **NATO HFM-251**, AIMES cognitive architecture partitions resources across **four dimensions**:

| Dimension | Channels | AIMES Allocation |
|-----------|----------|------------------|
| **Processing Stage** | Perceptual, Cognitive, Motor | Perceptual: DOC-29 sensors; Cognitive: DOC-30 AI; Motor: DOC-05 actuators |
| **Processing Code** | Spatial, Verbal | Spatial: HMD/navigation; Verbal: COMMS/alerts |
| **Visual Modality** | Focal, Ambient | Focal: HMD symbology; Ambient: peripheral threat cues |
| **Auditory Modality** | Focal, Ambient | Focal: radio; Ambient: 3D audio threat direction |

### 2.2 NASA-TLX Real-Time Estimation

AIMES computes **real-time Task Load Index (TLX)** per **Hart & Staveland (1988)**:

$$
TLX(t) = \frac{1}{15} \sum_{i=1}^{6} w_i \cdot r_i(t)
$$

Where weights $w_i$ (sum = 15) and ratings $r_i \in [0, 100]$:
| Subscale | Weight $w_i$ | Source |
|----------|--------------|--------|
| Mental Demand | 3 | DOC-30 AI workload estimator |
| Physical Demand | 2 | DOC-05 actuator torque feedback |
| Temporal Demand | 3 | Mission timeline + DOC-30 predictor |
| Performance | 2 | BIT + PHM self-assessment |
| Effort | 2 | Physiological (HRV, DOC-28) |
| Frustration | 3 | Error rates + voice stress (DOC-29) |

**TLX Thresholds**:
| TLX Range | State | AIMES Response |
|-----------|-------|----------------|
| 0–30 | Low | Autonomous mode encouraged |
| 31–50 | Moderate | Adaptive aiding active |
| 51–70 | High | Workload shedding (DOC-30 §6) |
| 71–100 | Overload | Forced autonomy, alert chain |

### 2.3 Cognitive Throughput Model

**Information Processing Rate** (bits/s) per **Kahneman (1973)** capacity model:

$$
C(t) = C_{max} \cdot \left( 1 - \frac{TLX(t)}{100} \right)^\alpha \cdot \eta_{arousal}(t)
$$

Where $C_{max} \approx 50$ bits/s (human channel capacity), $\alpha \approx 1.2$ (nonlinearity), $\eta_{arousal}$ = Yerkes-Dodson inverted-U factor from HRV.

**Mission-Critical Decision Latency**:

$$
L_{decision} = \frac{H_{task}}{C(t)} + L_{sensor} + L_{AI} + L_{actuator}
$$

Target: $L_{decision} \leq 2.0$ s for emergency procedures (DOC-33 §6).

---
