## 1. Anthropometric Accommodation

### 1.1 Morphology Parameter Space — CSMFAB078-A §3

Per **CSMFAB078-A §3**, the AIMES accommodates operators across the **5th–95th percentile** anthropometric range for both male and female populations (ANSUR II database):

| Parameter | 5th %ile Female | 50th %ile Male | 95th %ile Male | Adjustment Range |
|-----------|-----------------|----------------|----------------|------------------|
| **Stature** | 1520 mm | 1755 mm | 1890 mm | ±185 mm (telescoping struts) |
| **Sitting Height** | 800 mm | 915 mm | 1010 mm | ±105 mm (seat pan) |
| **Shoulder Breadth** | 370 mm | 465 mm | 540 mm | ±85 mm (scapular wings) |
| **Chest Depth** | 200 mm | 250 mm | 310 mm | ±55 mm (expandable cuirass) |
| **Arm Length** | 710 mm | 805 mm | 880 mm | ±85 mm (forearm telescoping) |
| **Leg Length** | 760 mm | 910 mm | 1040 mm | ±140 mm (thigh/shank telescoping) |
| **Hand Length** | 170 mm | 195 mm | 220 mm | ±25 mm (glove sizing) |
| **Head Breadth** | 145 mm | 155 mm | 165 mm | ±10 mm (helmet liner) |

### 1.2 Morphing Architecture — 12-Zone Scaling

Per CSMFAB078-A §3.2, the 12-zone morphing system uses **independent scaling factors**:

$$
\mathbf{S} = \text{diag}(s_1, s_2, ..., s_{12}) \in \mathbb{R}^{12 \times 12}
$$

Where zone scaling factors $s_i$ are computed from operator anthropometry $\mathbf{a} \in \mathbb{R}^8$:

$$
s_i = 1 + \mathbf{K}_i \cdot (\mathbf{a} - \mathbf{a}_{50}) \quad \text{for } i = 1..12
$$

$\mathbf{K}_i \in \mathbb{R}^{1 \times 8}$ = zone-to-anthropometry sensitivity matrix (calibrated per DOC-05 §4.3). $\mathbf{a}_{50}$ = 50th percentile reference.

**Zone Mapping**:
| Zone | Anatomical Region | Primary Anthropometry | $s_i$ Range |
|------|-------------------|----------------------|-------------|
| 1 | Head/Helmet | Head breadth, circumference | 0.92–1.08 |
| 2 | Neck/Cervical | Neck circumference | 0.90–1.10 |
| 3 | Shoulders/Scapulae | Shoulder breadth, chest depth | 0.88–1.12 |
| 4 | Thorax/Spine | Chest depth, sitting height | 0.88–1.12 |
| 5 | Abdomen/Lumbar | Waist circumference, stature | 0.85–1.15 |
| 6 | Upper Arms | Arm length, bicep circumference | 0.88–1.12 |
| 7 | Forearms | Forearm length, wrist breadth | 0.90–1.10 |
| 8 | Hands | Hand length, breadth | 0.88–1.12 |
| 9 | Thighs | Leg length, thigh circumference | 0.85–1.15 |
| 10 | Shins | Lower leg length, calf circumference | 0.85–1.15 |
| 11 | Feet/Boots | Foot length, breadth | 0.90–1.10 |
| 12 | Pelvis/Hips | Hip breadth, sitting height | 0.88–1.12 |

### 1.3 Fit Verification — Pressure Mapping

Per ISO 9241-11 and MIL-STD-1472G §5.8.2, fit verified via **capacitive pressure mapping array** (256 sensors, 10 Hz):

$$
P_{max} = \max_{x,y \in ContactArea} p(x,y) \leq 80 \text{ kPa} \quad \text{(sustained)}
$$
$$
P_{peak} = \max_{x,y} p(x,y) \leq 120 \text{ kPa} \quad \text{(transient < 30 min)}
$$

**Pressure Gradient Constraint** (prevent shear injury):
$$
\|\nabla p(x,y)\|_2 \leq 15 \text{ kPa/cm} \quad \forall (x,y)
$$

---
