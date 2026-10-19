## 1. Training System Architecture

### 1.1 Training Vision — Live, Virtual, Constructive (LVC)

The AIMES training system implements a **Live-Virtual-Constructive (LVC)** integrated training environment per **DoDI 1322.26** and **DoDI 4151.22**. The goal: **train as you fight, fight as you train** with seamless transition between domains.

**LVC Integration Model**:

```
LIVE TRAINING (Physical Suits, Ranges)
    ↕ Real-time Data Exchange (DIS/HLA/RPR-FOM)
VIRTUAL TRAINING (Simulators, CSMFAB-TGPU004.htm)
    ↕ Real-time Data Exchange (DIS/HLA/RPR-FOM)
CONSTRUCTIVE TRAINING (CGF, Wargaming, AI Adversary)
```

**Training Continuum**:

| Domain | Fidelity | Latency | Use Case |
|--------|----------|---------|----------|
| **Live** | Physical reality | 0 ms | Final certification, LFT&E, operational readiness |
| **Virtual** | High-fidelity sim (V4.0 Physics) | < 20 ms | Skill acquisition, procedure rehearsal, BIT training |
| **Constructive** | Entity-level, aggregate | < 100 ms | Mission planning, COA analysis, staff training |
| **Gaming** | Serious games, micro-learning | N/A | Knowledge refresh, just-in-time training |

### 1.2 Training System Requirements — DOC-36 Integration

Per **DOC-36** (Training & Certification), the training system supports four certification levels:

| Certification | Training Hours | Sim/Live Ratio | Key Systems |
|---------------|----------------|----------------|-------------|
| **OP (Operator)** | 40 hrs | 40% Sim / 60% Live | Donning trainer, BIT sim, mission sim |
| **TECH (Technician)** | 80 hrs | 40% Sim / 60% Live | LRU swap sim, NDT sim, CBM+ dashboard |
| **INST (Instructor)** | 120 hrs | 33% Sim / 67% Live | Pedagogy sim, scenario authoring, evaluation |
| **DSV (Deep Submergence)** | +60 hrs | 40% Sim / 60% Live | Pressure sim, acoustic comms sim, emergency sim |

### 1.3 Training Data Standards — Interoperability

| Standard | Application | AIMES Implementation |
|----------|-------------|---------------------|
| **DIS (IEEE 1278.1)** | Entity-state PDUs | Live↔Virtual exchange |
| **HLA (IEEE 1516)** | Federation, FOM/RPR-FOM | LVC federation, STE |
| **RPR-FOM (SISO-STD-001)** | Real-time Platform Reference | Cross-domain interop |
| **TENA (TENA SDR)** | Range integration | Live range instrumentation |
| **ADL SCORM 2004** | LMS content packaging | CBT modules, tracking |
| **xAPI (Experience API)** | Learning records | Competency tracking, analytics |
| **CMI5** | LMS↔Sim interoperability | Launch, completion, scoring |

---
