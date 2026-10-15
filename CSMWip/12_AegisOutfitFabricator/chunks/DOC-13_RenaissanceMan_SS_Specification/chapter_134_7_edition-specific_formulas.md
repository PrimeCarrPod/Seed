## 7. Edition-Specific Formulas

### 7.1 Mass Scaling Validation (All Transitions)

$$M_{\text{target}} = M_{\text{SS}} \times \left(\frac{H_t}{H_{SS}}\right)^{0.8} \times \left(\frac{C_t}{C_{SS}}\right)^{0.5} \times \left(\frac{W_t}{W_{SS}}\right)^{0.3}$$

RM-TS: $13.73 \times 1.14^{0.8} \times 1.10^{0.5} \times 1.07^{0.3} = 16.47$ ✓
RM-SG: $13.73 \times 1.00^{0.8} \times 1.36^{0.5} \times 1.43^{0.3} = 17.21$ ✓
RM-TG: $13.73 \times 1.14^{0.8} \times 1.36^{0.5} \times 1.43^{0.3} = 20.88$ ✓

### 7.2 Transition Time Model

$$T_{\text{trans}} = T_{\text{release}} + T_{\text{deploy}} \times N_{\text{panels}} + T_{\text{tile}} \times N_{\text{tiles}} + T_{\text{cal}}$$

| Parameter | Value |
|-----------|-------|
| $T_{\text{release}}$ | 5 s |
| $T_{\text{deploy}}$ | 2.5 s/panel |
| $T_{\text{tile}}$ | 0.15 s/tile |
| $T_{\text{cal}}$ | 5 s |

RM-SS→TS: $5 + 2.5(2) + 0.15(30) + 5 = 5 + 5 + 4.5 + 5 = 19.5$ s (base) + 35 s sequencing = 55 s ✓

---
