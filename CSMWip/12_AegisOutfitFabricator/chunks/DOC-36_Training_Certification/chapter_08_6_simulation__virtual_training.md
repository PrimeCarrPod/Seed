## 6. Simulation & Virtual Training

### 6.1 CSMFAB-TGPU004.htm — Training GPU Architecture

Per CSMFAB078-E §5.5, the training system uses **CSMFAB-TGPU004.htm** (V4.0 Physics Engine):

| Component | Specification |
|-----------|---------------|
| **Physics Engine** | V4.0 — Real-time FEM + CFD coupling |
| **Fidelity** | 1mm spatial, 1ms temporal (operator); 0.1mm/0.1ms (technician) |
| **Scenarios** | 200+ pre-built (combat, contingency, maintenance) |
| **AI Adversary** | DOC-30 neuromorphic core (red force) |
| **After Action Review (AAR)** | 4D playback (3D space + time) with PHM overlay |

### 6.2 Simulation Training Hours Allocation

| Certification | Sim Hours | Live Hours | Ratio |
|---------------|-----------|------------|-------|
| **OP** | 16 | 24 | 40% sim |
| **TECH** | 32 | 48 | 40% sim |
| **INST** | 40 | 80 | 33% sim |
| **DSV** | 24 | 36 | 40% sim |

### 6.3 Scenario Library — Core Scenarios

| Scenario ID | Description | Duration | Learning Objectives |
|-------------|-------------|----------|---------------------|
| **SIM-OP-01** | Normal Donning + BIT + 2hr Mission | 3 hrs | OP-01..06 proficiency |
| **SIM-OP-02** | Emergency Egress (Fire + Seal Breach) | 1 hr | OP-04 emergency procedures |
| **SIM-TECH-01** | O-Level: 5 LRU Swaps + BIT Verify | 4 hrs | TECH-02 proficiency |
| **SIM-TECH-02** | I-Level: Ceramic Tile Re-gild + NDT | 6 hrs | TECH-03, TECH-04 |
| **SIM-DSV-01** | 200m Dive + Comms Loss + Emergency Ascent | 2 hrs | DSV-01..05 |

### 6.4 AAR Metrics — Automated Scoring

$$
\text{Score} = \sum_{i} w_i \cdot \left( 1 - \frac{|t_{actual,i} - t_{target,i}|}{t_{target,i}} \right) \cdot \mathbb{I}(\text{Procedure Correct}_i)
$$

Where $w_i$ = task weight, $t$ = time. Minimum passing score: 0.85.

---
