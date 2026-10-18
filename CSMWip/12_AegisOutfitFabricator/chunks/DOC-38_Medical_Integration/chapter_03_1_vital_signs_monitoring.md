## 1. Vital Signs Monitoring

### 1.1 Continuous Multi-Parameter Monitoring

Per **DOC-29 §4** and **IEEE 11073-10472**, AIMES integrates **continuous non-invasive monitoring** via distributed fiber optic sensors (DOC-29) and textile-integrated electrodes (DOC-07):

| Parameter | Sensor Modality | Range | Accuracy | Update Rate | Clinical Threshold |
|-----------|----------------|-------|----------|-------------|-------------------|
| **Heart Rate (HR)** | ECG (3-lead) + PPG | 30–200 bpm | ±2 bpm | 1 Hz | <50 or >150 bpm |
| **Heart Rate Variability (HRV)** | ECG R-R intervals | 10–200 ms | ±5 ms | 0.1 Hz | SDNN < 20 ms |
| **Respiratory Rate (RR)** | Impedance pneumography | 4–60 br/min | ±2 br/min | 0.2 Hz | <8 or >30 br/min |
| **Core Temperature (Tc)** | Ingestible telemetry pill + DOC-27 skin | 32–42°C | ±0.1°C | 0.1 Hz | >38.5°C / <35°C |
| **SpO₂** | Reflectance PPG (forehead) | 70–100% | ±2% | 1 Hz | <90% |
| **Blood Pressure (est.)** | Pulse Transit Time (PTT) | 60–200 mmHg | ±10 mmHg | 0.1 Hz | MAP < 60 mmHg |
| **Lactate (interstitial)** | Microdialysis + electrochemical | 0.5–25 mmol/L | ±0.5 mmol/L | 0.01 Hz | > 4 mmol/L |
| **Hydration Index** | Bioimpedance (multi-freq) | 40–80% TBW | ±3% | 0.01 Hz | < 55% TBW |

### 1.2 Sensor Fusion — Vital Signs Confidence

Per **DOC-30 §5** and **ISO 80001-1**, multi-modal fusion computes **confidence-weighted estimates**:

$$
\hat{x}(t) = \frac{\sum_{k=1}^K w_k(t) \cdot x_k(t)}{\sum_{k=1}^K w_k(t)}
$$
$$
w_k(t) = \frac{1}{\sigma_k^2(t)} \cdot \mathbb{I}(\text{Sensor}_k \text{ healthy})
$$

Where $x_k$ = measurement from sensor $k$, $\sigma_k^2$ = variance (learned online), $K$ = number of modalities.

**Confidence Metric**:

$$
\text{Confidence} = 1 - \frac{\sqrt{\sum w_k (x_k - \hat{x})^2 / \sum w_k}}{\hat{x}} \quad \text{(target} \geq 0.95\text{)}
$$

### 1.3 Trend Analysis — Early Warning

**Exponential Moving Average (EMA)** with adaptive smoothing:

$$
\text{EMA}_t = \alpha_t \cdot x_t + (1 - \alpha_t) \cdot \text{EMA}_{t-1}
$$
$$
\alpha_t = \min\left( 0.3, \frac{\sigma_{noise}}{\sigma_{signal}(t)} \right)
$$

**Rate of Change Alarm**:

$$
\text{ROC}_t = \frac{\text{EMA}_t - \text{EMA}_{t-\Delta t}}{\Delta t} \quad \text{Alert if } |\text{ROC}_t| > \theta_{ROC}
$$

Thresholds $\theta_{ROC}$ per parameter (e.g., HR: > 5 bpm/min rise, Tc: > 0.5°C/hr rise).

---
