## 2. AI/ML Model Security

### 2.1 Threat Model — DOC-30 Neuromorphic Core

Per **DOC-30 §8** and **NIST AI RMF (AI 100-1)**, threat vectors:

| Attack Vector | Impact | Likelihood | Mitigation |
|---------------|--------|------------|------------|
| **Adversarial Examples** | Misclassification (threat/target) | High | Adversarial training, certified defenses |
| **Model Extraction** | IP theft, evasion | Medium | Query limiting, watermarking |
| **Data Poisoning** | Backdoor, bias | Low (air-gapped train) | Provenance, anomaly detection |
| **Trojan/Backdoor** | Triggered misbehavior | Medium | Formal verification, runtime monitors |
| **Side-Channel** | Model architecture leak | High (neuromorphic) | Constant-time, power masking |
| **Inference Attacks** | Training data recovery | Low | Differential privacy, federated |

### 2.2 Adversarial Robustness — Certified Defenses

**Randomized Smoothing** (Cohen et al., 2019) per DOC-30 neuromorphic accelerator:

$$
g(x) = \arg\max_c \mathbb{P}_{\epsilon \sim \mathcal{N}(0,\sigma^2 I)} (f(x+\epsilon) = c)
$$

**Certified Radius**:

$$
R_{cert} = \frac{\sigma}{2} \left( \Phi^{-1}(p_A) - \Phi^{-1}(p_B) \right)
$$

Where $p_A$ = top class probability, $p_B$ = runner-up. Target: $R_{cert} \geq 0.5$ ($\ell_2$ norm, normalized input).

**Adversarial Training** (Madry et al., 2018):

$$
\min_\theta \mathbb{E}_{(x,y)} \left[ \max_{\|\delta\|_p \leq \epsilon} \mathcal{L}(f_\theta(x+\delta), y) \right]
$$

$\epsilon = 0.03$ ($\ell_\infty$), $\epsilon = 0.5$ ($\ell_2$) — covers projected threat models.

### 2.3 Model Watermarking — IP Protection

Per **Zhang et al. (2018)** and **DOC-35 §5 DMSMS**:

**Embedding**: Trigger set $\mathcal{T} = \{(x_i, y_i^*)\}$ where $y_i^*$ = watermark label.

**Verification**:

$$
\text{Watermark Present} = \mathbb{I}\left( \frac{1}{|\mathcal{T}|} \sum_{(x,y^*) \in \mathcal{T}} \mathbb{I}(f(x) = y^*) \geq 0.95 \right)
$$

**Extraction Resistance**: Watermark capacity $C \approx 128$ bits, false positive $< 10^{-6}$.

### 2.4 Runtime Verification — DOC-30 Integration

Per **DOC-30 §6**, neuromorphic core includes **runtime assurance monitor**:

| Monitor | Check | Frequency | Action on Fail |
|---------|-------|-----------|----------------|
| **Output Range** | $f(x) \in [0,1]^C$ | Every inference | Safe fallback |
| **Latency** | $t_{infer} < 5$ ms | Every inference | Degrade gracefully |
| **Power Profile** | $P(t) \in [P_{min}, P_{max}]$ | 1 kHz | Throttle / alert |
| **Spike Count** | $\sum spikes \in [S_{min}, S_{max}]$ | 100 Hz | Anomaly alert |
| **Memory Integrity** | CRC32 weights | 1 Hz | Reload from ROM |
| **Control Flow** | CFI bitmap | Every inference | Trap / reset |

**Formal Property** (Temporal Logic):

$$
\square \left( \text{Input Valid} \implies \lozenge_{\leq 5\text{ms}} \text{Output Valid} \right)
$$

---
