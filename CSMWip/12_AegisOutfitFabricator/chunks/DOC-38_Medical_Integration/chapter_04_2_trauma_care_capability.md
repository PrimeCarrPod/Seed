## 2. Trauma Care Capability

### 2.1 Integrated Tourniquet System (ITS)

Per **TCCC Guidelines** and **DOC-27 §6**, AIMES incorporates **pneumatic tourniquets** at bilateral proximal thighs and upper arms:

| Parameter | Specification |
|-----------|---------------|
| **Activation Time** | ≤ 3 s (automatic) / ≤ 5 s (manual) |
| **Occlusion Pressure** | 250–300 mmHg (thigh), 150–200 mmHg (arm) |
| **Pressure Regulation** | Closed-loop, ±10 mmHg |
| **Duration Timer** | Auto-alert at 2 hr, auto-release at 2.5 hr (prevent reperfusion injury) |
| **Power** | DOC-28 backup battery (72 hr) |
| **Override** | Mechanical quick-release (DOC-33 §6) |

**Automatic Activation Logic**:

$$
\text{Deploy if } \begin{cases}
\text{Accelerometer} > 50g \land \text{Duration} > 50 \text{ ms} & \text{(blast)} \\
\text{EMG} = 0 \land \text{HR} > 0 \land \text{SpO}_2 < 80\% & \text{(limb amputation)} \\
\text{Operator voice command} & \text{"TOURNIQUET"} \\
\text{Team medic remote command} & \text{(DOC-29 comms)}
\end{cases}
$$

### 2.2 Hemostatic Agent Delivery

**Chitosan-impregnated gauze** (DOC-24 material) auto-deploys from thigh pouches:

| Agent | Capacity | Deployment | Indication |
|-------|----------|------------|------------|
| **Chitosan Gauze** | 2 × 6 in × 48 in | Spring-loaded | Junctional hemorrhage |
| **Kaolin Gauze** | 2 × 6 in × 48 in | Spring-loaded | Deep cavity packing |
| **TXA (Tranexamic Acid)** | 1 g IV auto-injector | Subcutaneous port | Within 3 hr of injury |

**Delivery Confirmation**:

$$
\text{Delivered} = \mathbb{I}(\text{Pressure} > 50 \text{ kPa} \land \text{Duration} > 30 \text{ s}) \land \text{Accelerometer signature}
$$

### 2.3 Airway Management

**Integrated Supraglottic Airway (iSGA)** stored in collar compartment:

- **Type**: i-gel® equivalent, size 3–5 (auto-sized per DOC-37 §1)
- **Deployment**: Single-hand, ≤ 15 s
- **Ventilation**: Compatible with DOC-28 ventilator port (volume-control, 500 mL tidal)
- **Monitoring**: End-tidal CO₂ (capnography) via DOC-29 sensor

### 2.4 Chest Decompression

**Automated Needle Thoracostomy (ANT)** at 2nd ICS midclavicular, bilateral:

- **Trigger**: DOC-30 AI: Tension pneumothorax probability > 0.9 (unilateral breath sounds + hemodynamic collapse)
- **Needle**: 14G × 8 cm, catheter-over-needle
- **Confirmation**: Air rush sound (acoustic sensor) + SpO₂ rise > 5% within 30 s

---
