## 2. Operator Course (40 hrs)

### 2.1 Course Structure

| Module | Hours | Description | KSA Focus |
|--------|-------|-------------|-----------|
| **OP-01** | 4 | AIMES System Overview (DOC-01, SYNTH-01) | Knowledge: Architecture, 12-layer stack |
| **OP-02** | 6 | Donning/Doffing Procedures (CSMFAB078-E §5.1) | Skill: <3 min donning, <2 min doffing |
| **OP-03** | 8 | Built-In Test (BIT) Execution (DOC-33 §7) | Skill: Full BIT, interpret results |
| **OP-04** | 6 | Emergency Procedures (CSMFAB078-E §5.3) | Ability: Egress, manual override, comms fail |
| **OP-05** | 8 | Mission Profiles & Configurations (DOC-33 §8) | Knowledge: Edition selection, loadout planning |
| **OP-06** | 4 | CBM+ Interface & PHM Awareness (DOC-29, DOC-30) | Skill: Read PHM dashboard, report anomalies |
| **OP-07** | 4 | Assessment: Written + Practical | Evaluation: All KSA at Level 3 |

### 2.2 Donning Procedure — Performance Standard

**Objective**: Don AIMES from storage to mission-ready in ≤ 180 seconds.

**Steps & Timing**:

| Step | Action | Target Time | Tolerance |
|------|--------|-------------|-----------|
| 1 | Pre-don inspection (visual, seals, connectors) | 30 s | ±5 s |
| 2 | Base layer donning (textile, DOC-07) | 45 s | ±10 s |
| 3 | Structural framework engagement (DOC-05) | 35 s | ±5 s |
| 4 | Protective layer closure (DOC-06) | 40 s | ±5 s |
| 5 | Systems activation (DOC-33 §6) | 20 s | ±5 s |
| 6 | BIT initiation & verification (DOC-33 §7) | 10 s | ±5 s |
| **Total** | | **180 s** | **≤ 195 s** |

**Failure Criteria**: Any step > tolerance, BIT FAIL, seal integrity < 99.9%.

### 2.3 BIT Execution — Operator Level

Per DOC-33 §7, operator BIT sequence:

```
BIT Sequence:
1. Power-On Self-Test (POST) — 15 s
2. Sensor Suite Health (DOC-29) — 30 s
3. Power & Thermal (DOC-28) — 20 s
4. Comms & RF Mesh (DOC-29 §4) — 15 s
5. Actuator & Joint Encoders (DOC-05) — 30 s
6. Environmental Seal Integrity (DOC-27) — 20 s
7. Threat Protection Status (DOC-21..26) — 30 s
8. AI Core Sanity Check (DOC-30) — 10 s
Total: ~170 s (target ≤ 180 s)
```

**BIT Result Interpretation**:

$$
\text{BIT Status} = \begin{cases}
\text{PASS} & \text{if } \forall i: \text{Test}_i = \text{PASS} \\
\text{DEGRADED} & \text{if } \exists i: \text{Test}_i = \text{MARGINAL} \land \text{Mission Capable} \\
\text{FAIL} & \text{if } \exists i: \text{Test}_i = \text{FAIL} \lor \text{Safety Critical FAIL}
\end{cases}
$$

---
