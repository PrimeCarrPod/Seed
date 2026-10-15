## 4. Formulas (Maintenance Chapters 108-114)

### 4.1 Wear Rate Models

**Ceramic Tile Crack Accumulation:**
$$N_{crack}(t) = N_0 + k_{impact} \cdot t + k_{flex} \cdot \theta_{rms}^2 \cdot t$$

**MXene Shielding Degradation:**
$$SE(t) = SE_0 \cdot e^{-k_{flex} \cdot N_{cycles} - k_{abrasion} \cdot d_{wear}}$$

**Baleen Modulus Decay (Hydration Cycling):**
$$E(t) = E_0 \cdot (1 - k_{hyd} \cdot N_{cycles}^{0.5})$$

**Steel Boning Fatigue:**
$$\sigma_{yield}(N) = \sigma_0 \cdot \left(\frac{N}{N_f}\right)^{-b}$$

### 4.2 Maintenance Interval Optimization

**Interval Selection (RCM):**
$$T_{interval} = \min\left(\frac{L_{wear}}{R_{wear}}, T_{max}\right) \times SF_{safety}$$

Where $L_{wear}$ = wear limit, $R_{wear}$ = wear rate, $SF_{safety}$ = 0.5

### 4.3 Life Prediction

**Remaining Useful Life (RUL):**
$$RUL = \frac{L_{limit} - W_{current}}{R_{wear}}$$

**Component-Level RUL (RM-SS at 250 hr):**
| Component | Current Wear | Limit | Rate/hr | RUL (hr) |
|-----------|--------------|-------|---------|----------|
| Primary Tiles | 4% | 20% | 0.016% | 1,000 |
| MXene L3/L6 | 6% SE loss | 25% | 0.024% | 790 |
| Baleen | 5% E loss | 20% | 0.020% | 750 |
| Steel Boning | 2.5% yield loss | 15% | 0.010% | 1,250 |
| Aerogel | 4% λ increase | 25% | 0.016% | 1,310 |

**System RUL (Weakest Link): ~750 hr** (Baleen/MXene)

### 4.4 Cost Model

$$C_{total} = C_{preventive} \cdot \frac{T_{life}}{T_{interval}} + C_{corrective} \cdot P_{failure} \cdot T_{life}$$

Optimize $T_{interval}$ to minimize $C_{total}$.

---