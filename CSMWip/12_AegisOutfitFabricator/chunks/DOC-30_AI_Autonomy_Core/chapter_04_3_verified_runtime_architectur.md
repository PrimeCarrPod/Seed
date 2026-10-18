## 3. Verified Runtime Architecture

### 3.1 ARINC 653 Partitioning

#### 3.1.1 Partition Layout
```
Major Frame: 1 ms (1000 Hz)
Partitions (8 total):

| Partition | Name | Budget | Period | Criticality | Function |
|-----------|------|--------|--------|-------------|----------|
| P0 | Health Monitor | 50 μs | 1 ms | DAL A | Watchdog, BIST, fault reporting |
| P1 | Sensor Fusion | 300 μs | 1 ms | DAL A | SNN inference, state estimation |
| P2 | Threat Assessment | 100 μs | 10 ms | DAL A | Classification, decision |
| P3 | Actuation Control | 100 μs | 1 ms | DAL A | MR fluid, seals, thermal valves |
| P4 | Comm Management | 50 μs | 10 ms | DAL B | RF mesh, backup CAN/AFDX |
| P5 | Power/Thermal Mgmt | 50 μs | 100 ms | DAL C | Battery, heat pump, MHD |
| P6 | Logging/Telemetry | 50 μs | 100 ms | DAL D | Data recording, downlink |
| P7 | Spare/Recovery | 200 μs | 1 ms | DAL A | Partition restart, failover |

Total per major frame: 900 μs (90% utilization, 10% margin)
```

#### 3.1.2 Inter-Partition Communication
```
Sampling Ports (deterministic, no blocking):
  P1 → P2: State vector (120 floats, 480 bytes) @ 1 kHz
  P2 → P3: Threat class + response params (64 bytes) @ 100 Hz
  P3 → P1: Actuator feedback (32 floats) @ 1 kHz
  P4 → P1: RF mesh health (16 bytes) @ 10 Hz
  P5 → P1: Power/thermal state (24 bytes) @ 10 Hz

Queuing Ports (asynchronous, bounded):
  P6 ← all: Log entries (variable, max 1 KB/frame)
  P7 → P0: Restart requests (event-driven)
```

### 3.2 DO-178C Level A Verification

#### 3.2.1 Verification Process
```
Planning:
  PSAC (Plan for Software Aspects of Certification)
  VP (Verification Plan) - MC/DC coverage targets
  VP (Validation Plan) - Requirements-based testing

Development:
  Requirements → Architecture → Code → Integration
  Each level: Requirements, Design, Code, Test traceability

Verification (MC/DC - Modified Condition/Decision Coverage):
  - Every decision takes all outcomes
  - Every condition independently affects decision
  - Entry/exit points all invoked
  
Coverage Targets:
  Statement: 100%
  Decision: 100%
  MC/DC: 100%
  Function call: 100%
```

#### 3.2.2 Tool Qualification (DO-330)
```
Qualified Tools:
  - Compiler: LLVM/Clang (TQL-1, qualified for DO-178C)
  - Static Analysis: Polyspace (TQL-1)
  - Test Automation: LDRA (TQL-1)
  - Requirements: DOORS (TQL-2)
  - Configuration: Git (custom qualification)
  
Evidence:
  Tool Qualification Plan (TQP)
  Tool Operational Requirements (TOR)
  Tool Verification Plan (TVP)
  Tool Verification Results (TVR)
```

### 3.3 ISO 26262 ASIL-D / IEC 61508 SIL-3

#### 3.3.1 Safety Goal Derivation
```
Top-Level Safety Goals (from CSMFAB078 Main §4.8):
  SG1: Prevent uncontrolled MR fluid activation (ASIL-D)
  SG2: Prevent premature seal deployment (ASIL-D)
  SG3: Detect and mitigate processor faults (ASIL-D)
  SG4: Maintain sensor fusion integrity (ASIL-C)
  SG5: Ensure graceful degradation (ASIL-B)
```

#### 3.3.2 Hardware Architecture Metrics
```
Safety Mechanisms (per ISO 26262-5):
  - ECC on all memories (SEC-DED, scrubbing 1 Hz)
  - Lockstep cores (2× Loihi 2, compare voter)
  - Watchdog: Independent windowed (external, 10 ms window)
  - Clock monitor: Dual oscillator (external + internal)
  - Voltage monitor: Brown-out detection (±5%)
  - Temperature monitor: On-die thermal sensors (4 zones)
  
Metrics (target):
  SPFM (Single Point Fault Metric): ≥99% (ASIL-D)
  LFM (Latent Fault Metric): ≥90% (ASIL-D)
  PMHF (Probabilistic Metric for HW Failures): ≤10⁻⁸/h (ASIL-D)
```

#### 3.3.3 Software Safety Requirements
```
Safety Requirements (allocated to partitions):
  SR-P0-01: Watchdog shall reset partition on missed deadline
  SR-P1-01: SNN output shall be range-checked [0,1]
  SR-P1-02: NaN/Inf detection on all floating-point
  SR-P2-01: Threat classification confidence > 0.9 required
  SR-P3-01: Actuator command shall be rate-limited
  SR-P3-02: Dual-channel actuation (primary + backup)
```

---
