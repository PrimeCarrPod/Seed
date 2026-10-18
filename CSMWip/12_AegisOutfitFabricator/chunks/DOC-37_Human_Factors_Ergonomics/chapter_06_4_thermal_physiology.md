## 4. Thermal Physiology

### 4.1 Microclimate Model — DOC-28 Integration

Per **DOC-28 §6**, the AIMES thermal management system maintains **microclimate** between skin and base layer:

$$
\frac{dT_{skin}}{dt} = \frac{1}{C_{skin}} \left( \dot{Q}_{met} - \dot{Q}_{dry} - \dot{Q}_{evap} - \dot{Q}_{respir} - \dot{Q}_{cooling} \right)
$$

Where:
- $C_{skin}$ = skin thermal capacitance ≈ 3.5 kJ/(m²·K)
- $\dot{Q}_{met}$ = metabolic heat (W/m²) from §3.2
- $\dot{Q}_{dry} = h_{conv} (T_{skin} - T_{air}) + \epsilon \sigma (T_{skin}^4 - T_{rad}^4)$
- $\dot{Q}_{evap} = h_{evap} (P_{skin} - P_{air}) \cdot w$ (w = skin wettedness)
- $\dot{Q}_{cooling}$ = active cooling from DOC-28 heat pump loop

### 4.2 Physiological Strain Index (PSI)

Per **Moran et al. (1998)** and **ISO 9886**:

$$
PSI = 5 \cdot \frac{T_{re}(t) - T_{re}(0)}{39.5 - T_{re}(0)} + 5 \cdot \frac{HR(t) - HR(0)}{180 - HR(0)}
$$

Where $T_{re}$ = rectal/core temperature, $HR$ = heart rate.

**PSI Zones**:
| PSI | Zone | Action |
|-----|------|--------|
| 0–2 | Low | Normal ops |
| 2–4 | Moderate | Increase cooling (DOC-28) |
| 4–6 | High | Reduce workload, mandatory rest |
| 6–8 | Very High | Mission abort, medical eval |
| 8–10 | Extreme | Emergency egress (DOC-33 §6) |

### 4.3 Sweat Rate & Hydration Model

**Sweat Rate** (g/min) per **Shapiro et al. (1982)**:

$$
\dot{m}_{sweat} = 147 \cdot e^{0.032 \cdot T_{core}} \cdot e^{0.016 \cdot T_{skin}} \cdot (1 - 0.015 \cdot RH)
$$

**Hydration Requirement** (L/hr):
$$
\dot{V}_{fluid} = \frac{\dot{m}_{sweat}}{1000} \cdot (1 + 0.2) \quad \text{(+20% safety margin)}
$$

AIMES integrates **subcutaneous hydration bladder** (DOC-27 §4) with capacity 2.5 L, refillable at O-Level.

---
