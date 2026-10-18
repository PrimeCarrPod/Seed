## 3. Biomechanical Joint Torques

### 3.1 Actuator Assist Model — DOC-05 Integration

Per **DOC-05 §5**, AIMES uses **series elastic actuators (SEA)** at 22 joints. Assist torque $\tau_{assist}$:

$$
\tau_{assist,j}(t) = k_{assist,j} \cdot \tau_{human,j}(t) \cdot \eta_{eff,j}
$$

Where:
- $k_{assist,j}$ = assist ratio (0.0–1.5, configurable per mission profile)
- $\tau_{human,j}$ = human voluntary torque (estimated from EMG + kinematics)
- $\eta_{eff,j}$ = transmission efficiency (0.85–0.95)

**Assist Ratio by Joint** (DOC-05 Table 5.3):
| Joint | $k_{assist}$ (Baseline) | $k_{assist}$ (High Load) | $k_{assist}$ (Stealth) |
|-------|------------------------|--------------------------|------------------------|
| Ankle | 0.8 | 1.2 | 0.4 |
| Knee | 1.0 | 1.5 | 0.5 |
| Hip | 0.9 | 1.3 | 0.4 |
| Lumbar | 0.7 | 1.0 | 0.3 |
| Shoulder | 0.6 | 1.0 | 0.3 |
| Elbow | 0.5 | 0.8 | 0.2 |
| Wrist | 0.3 | 0.5 | 0.1 |

### 3.2 Metabolic Cost Reduction

**Metabolic Rate** per **Browning et al. (2017)** exosuit model:

$$
\dot{E}_{met} = \dot{E}_{basal} + \sum_j \left( \frac{|\tau_{human,j} \cdot \omega_j|}{\eta_{muscle}} + \frac{|\tau_{assist,j} \cdot \omega_j|}{\eta_{actuator}} \right) \cdot \frac{1}{\eta_{mech}}
$$

Where $\omega_j$ = joint angular velocity, $\eta_{muscle} \approx 0.25$, $\eta_{actuator} \approx 0.85$, $\eta_{mech} \approx 0.90$.

**Target Reduction**: $\geq 40\%$ metabolic cost vs. unassisted at 5 km/h march with 35 kg load (per CSMFAB078-A §3.4).

### 3.3 Joint Range of Motion (ROM) Preservation

AIMES must not restrict **natural ROM** per MIL-STD-1472G Table 5.1:

| Joint | Natural ROM | AIMES Allowed Restriction | Hard Stop |
|-------|-------------|---------------------------|-----------|
| Ankle (DF/PF) | 20°/45° | ≤ 5° | 25°/50° |
| Knee (Flex/Ext) | 0–135° | ≤ 3° | 140° |
| Hip (Flex/Ext) | 120°/20° | ≤ 5° | 125°/25° |
| Shoulder (Abd/Add) | 180°/50° | ≤ 10° | 190°/60° |
| Elbow (Flex/Ext) | 150°/0° | ≤ 5° | 155° |
| Wrist (Flex/Ext) | 80°/70° | ≤ 10° | 90°/80° |

**ROM Compliance Metric**:

$$
ROM_{compliance} = \frac{1}{N_{joints}} \sum_{j=1}^{N} \mathbb{I}\left( ROM_{AIMES,j} \geq 0.95 \cdot ROM_{natural,j} \right) = 1.0
$$

---
