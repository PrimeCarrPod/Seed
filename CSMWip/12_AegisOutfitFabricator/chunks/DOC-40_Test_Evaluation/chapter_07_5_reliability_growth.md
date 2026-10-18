## 5. Reliability Growth

### 5.1 Reliability Program — DoDI 4151.22 CBM+

Per **DoDI 4151.22** and **MIL-HDBK-189**, reliability growth managed via **Duane/AMSAA** model:

**Duane Model** (cumulative MTBF):

$$
MTBF_c(t) = \frac{t}{\sum_{i=1}^{N(t)} 1} = \frac{t}{N(t)}
$$

Where $N(t)$ = cumulative failures by time $t$.

**AMSAA Model** (failure intensity):

$$
\lambda(t) = \lambda_0 \cdot t^{\beta-1}
$$

Where $\beta < 1$ = improving, $\beta = 1$ = constant, $\beta > 1$ = degrading.

**Growth Target**: $\beta \leq 0.7$ by DT-3 completion (30% improvement per 2× test time).

### 5.2 MTBF Demonstration — Sequential Test

Per **MIL-HDBK-781A** and **DOC-32 §6**:

$$
\text{Test Time } T = \frac{2 \cdot \chi^2_{1-\alpha, 2(r+1)}}{\lambda_0}
$$

For $\alpha=0.1$ (producer risk), $\beta=0.1$ (consumer risk), $MTBF_{req} = 500$ hrs, $r=2$ failures allowed:

$$
T = \frac{2 \cdot \chi^2_{0.90, 6}}{1/500} \approx 2 \cdot 10.64 \cdot 500 = 10,640 \text{ hrs}
$$

**Accelerated Test** (Arrhenius, DOC-28 thermal):

$$
AF = \exp\left[ \frac{E_a}{k_B} \left( \frac{1}{T_{use}} - \frac{1}{T_{test}} \right) \right]
$$

Typical $E_a = 0.7$ eV (electronics), $AF \approx 8$ at +55°C vs +25°C.

### 5.3 CBM+ Integration — PHM-Driven Reliability

Per **DOC-30 PHM** and **SAE AS6294**, reliability updated in real-time:

$$
\hat{R}(t) = \exp\left( -\int_0^t \hat{\lambda}(\tau) d\tau \right)
$$

Where $\hat{\lambda}(t)$ = PHM-estimated failure intensity from sensor data.

**Condition-Based MTBF**:

$$
MTBF_{CBM}(t) = \frac{1}{\hat{\lambda}(t)} \quad \text{vs. } MTBF_{traditional} = \frac{1}{\lambda_0}
$$

---
