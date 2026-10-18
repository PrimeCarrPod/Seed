## 3. Technician Course (80 hrs)

### 3.1 Course Structure

| Module | Hours | Description | KSA Focus |
|--------|-------|-------------|-----------|
| **TECH-01** | 8 | AIMES Architecture Deep-Dive (DOC-01..15) | Knowledge: All 12 layers, interfaces |
| **TECH-02** | 12 | O-Level Maintenance: LRU Removal/Installation (DOC-34 §3) | Skill: <15 min/LRU swap |
| **TECH-03** | 16 | I-Level Repair: Module Disassembly/Reassembly (DOC-34 §4) | Skill: Ceramic tile, auxetic foam, MXene |
| **TECH-04** | 12 | NDT Procedures (DOC-32 §3–5) | Skill: UT, ET, IR, ACFM per DOC-32 |
| **TECH-05** | 8 | CBM+ Tools & PHM Interpretation (DOC-29, DOC-30) | Skill: RUL analysis, anomaly classification |
| **TECH-06** | 8 | Firmware & Configuration Management (DOC-30, DOC-33) | Skill: Secure load, version control |
| **TECH-07** | 8 | Supply Chain Interface (DOC-35) | Knowledge: CSP, MEIO, cold chain |
| **TECH-08** | 8 | Assessment: Written + Practical (5 LRUs + 3 NDT) | Evaluation: All KSA at Level 3 |

### 3.2 O-Level LRU Swap — Standard Times

| LRU Category | Target Swap Time | Max Allowable | Tools Required |
|--------------|------------------|---------------|----------------|
| **Power Module** (DOC-28) | 8 min | 12 min | Torque driver, ESD strap |
| **Sensor Pod** (DOC-29) | 10 min | 15 min | Alignment jig, fiber cleaner |
| **Actuator Unit** (DOC-05) | 12 min | 18 min | Joint alignment fixture |
| **Comm Module** (DOC-29) | 6 min | 10 min | RF test set |
| **Environmental Seal** (DOC-27) | 15 min | 20 min | Seal installer, leak tester |

**Swap Time Distribution** (Weibull model per DOC-34 §6.2):

$$
f(t; k, \lambda) = \frac{k}{\lambda} \left( \frac{t}{\lambda} \right)^{k-1} e^{-(t/\lambda)^k}
$$

Typical parameters: $k=1.8$, $\lambda = 1.2 \cdot t_{target}$.

### 3.3 I-Level Repair — Ceramic Tile Re-gilding (DOC-21)

**Process Flow**:
1. **NDT Inspection**: UT phased array (DOC-32 §4.2) → crack map
2. **Tile Removal**: Laser ablation (DOC-34 §4.3.1) → preserve auxetic substrate
3. **Substrate Prep**: Plasma clean (DOC-34 §4.3.2) → roughness $R_a < 0.8 \mu m$
4. **Gilding Application**: Electro-deposition (DOC-21 §5.4) → Au 5μm + TiN 2μm
5. **Cure & Inspect**: Thermal cycle + UT re-scan → bond strength ≥ 85 MPa (ASTM C633)

**Time Standard**: 4 hours/tile (batch of 12 tiles = 48 hours)

### 3.4 PHM Interpretation — RUL Decision Logic

Technicians interpret PHM output per SAE AS6294 §6:

$$
\text{Action} = \begin{cases}
\text{Monitor} & \text{if } RUL > 2 \cdot T_{mission} \\
\text{Schedule Replacement} & \text{if } T_{mission} < RUL \leq 2 \cdot T_{mission} \\
\text{Immediate Replacement} & \text{if } RUL \leq T_{mission} \\
\text{Ground Aircraft/Suit} & \text{if } RUL \leq 0.5 \cdot T_{mission} \land \text{Critical LRU}
\end{cases}
$$

**Confidence Interval Reporting**:

$$
RUL_{reported} = \hat{RUL} \pm z_{0.95} \cdot \sigma_{RUL}
$$

Where $\sigma_{RUL}$ from PHM uncertainty quantification (DOC-30 §5.3).

---
