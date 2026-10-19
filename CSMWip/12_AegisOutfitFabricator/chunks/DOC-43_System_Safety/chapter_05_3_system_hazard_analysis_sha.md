## 3. System Hazard Analysis (SHA)

### 3.1 SHA Scope — Integration Hazards

Per **MIL-STD-882E** Task 203, SHA analyzes hazards arising from **subsystem interactions**, **software-hardware interfaces**, **human-system integration**, and **operational environment**.

**SHA Methods**:
- **System FTA**: Top-down from system-level hazardous events
- **Interface Analysis**: ICD hazard analysis (DOC-42)
- **Human Factors Integration**: DOC-37 cognitive/biomechanical
- **Software Safety**: DOC-30 neuromorphic, IEC 61508 SIL 3
- **Cyber-Physical**: DOC-39 attack trees on safety functions

### 3.2 System-Level Fault Tree — Top Events

**Top Event 1: Loss of Life Support (TE-LLS)**

```
TE-LLS
├── Seal Failure (PHA-004)
│   ├── Gasket degradation (DOC-27)
│   ├── APC failure (DOC-27 §5)
│   └── Donning error (DOC-33)
├── CO₂ Scrubber Failure (DOC-27)
│   ├── MOF saturation (DOC-34)
│   ├── Regeneration failure
│   └── Flow blockage
├── O₂ Supply Failure (DOC-28)
│   ├── MHD power loss
│   ├── Electrolysis failure
│   └── Tank leak
└── Control System Failure
    ├── PHM false negative (DOC-29)
    ├── BIT false pass (DOC-33)
    └── AI autonomy fault (DOC-30)
```

**Top Event 2: Uncontrolled Actuation (TE-UA)**

```
TE-UA
├── AI Command Error (DOC-30)
│   ├── Neuromorphic drift
│   ├── Adversarial input
│   └── Reward hacking
├── Sensor Fusion Error (DOC-29)
│   ├── OFS spoofing
│   ├── IMU bias
│   └── Voting logic failure
├── Actuator Hardware Fault (DOC-05)
│   ├── MR fluid valve stuck
│   ├── Motor short
│   └── Encoder failure
└── Cyber Intrusion (DOC-39)
    ├── Command injection
    ├── Firmware modification
    └── Replay attack
```

**Top Event 3: Catastrophic Structural Failure (TE-CSF)**

```
TE-CSF
├── Ballistic Overmatch (DOC-31)
├── Blast Overpressure (DOC-26)
├── Thermal Structural Failure (DOC-32)
├── Fatigue Crack Growth (DOC-32, DOC-34)
├── Corrosion/Environmental (DOC-38)
└── Manufacturing Defect (DOC-31, FAB-RM-10)
```

### 3.3 Software Safety — IEC 61508 / ISO 26262 Alignment

The AIMES safety-critical software (CSCI-01 Neuromorphic Runtime, CSCI-02 PHM Algorithms, CSCI-03 BIT) targets **IEC 61508 SIL 3** (equivalent to **ISO 26262 ASIL D**).

**Safety Integrity Level (SIL) Requirements**:

| SIL | PFH (1/h) | PFDavg | AIMES Target |
|-----|-----------|--------|--------------|
| **SIL 1** | 10⁻⁵ – 10⁻⁶ | 10⁻² – 10⁻¹ | — |
| **SIL 2** | 10⁻⁶ – 10⁻⁷ | 10⁻³ – 10⁻² | — |
| **SIL 3** | **10⁻⁷ – 10⁻⁸** | **10⁻⁴ – 10⁻³** | **CSCI-01, 02, 03** |
| **SIL 4** | 10⁻⁸ – 10⁻⁹ | 10⁻⁵ – 10⁻⁴ | — |

**Software Safety Activities per IEC 61508-3**:

| Lifecycle Phase | Activity | AIMES Artifact |
|-----------------|----------|----------------|
| **Requirements** | Safety requirements specification | SRS v1.0 (CSCI-01..03) |
| **Design** | Architecture, partitioning, diversity | SAD, FTA, diversity analysis |
| **Implementation** | Coding standard (MISRA C++), formal methods | Verified runtime (DOC-30 §4) |
| **Verification** | Unit test (100% MC/DC), integration, system | Test reports (DOC-40) |
| **Validation** | HIL simulation, field trials | CSMFAB-TGPU004.htm, OT |
| **Operation** | Monitoring, update process, decommission | CBM+ (DOC-34), PBL (DOC-35) |

---
