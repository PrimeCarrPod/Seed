## 6. Safety Case — Goal Structuring Notation (GSN)

### 6.1 GSN Structure — Top-Level Goal

The AIMES Safety Case uses **Goal Structuring Notation (GSN)** per **ISO 15026** and **UK MoD DEF STAN 00-56**.

```
G0: AIMES is acceptably safe for 20-year operational deployment
├── G1: Life support integrity maintained in all operational environments
│   ├── G1.1: Environmental seal integrity ≥ 99.999%
│   │   ├── S1.1.1: Seal design (DOC-27) — Analysis, Test
│   │   ├── S1.1.2: APC reliability > 0.9999 (DOC-27 §5) — Test
│   │   └── S1.1.3: Donning verification (DOC-33) — Demonstration
│   ├── G1.2: Atmosphere management reliable
│   │   ├── S1.2.1: CO₂ scrubber capacity (DOC-27) — Analysis, Test
│   │   ├── S1.2.2: O₂ generation redundancy (DOC-28) — Analysis
│   │   └── S1.2.3: PHM monitoring (DOC-29) — Test
│   └── G1.3: Thermal regulation safe
│       ├── S1.3.1: Heat pump COP > 3.0 (DOC-28) — Test
│       ├── S1.3.2: MR fluid thermal stability (DOC-28) — Analysis
│       └── S1.3.3: Burn protection (DOC-32) — Test
├── G2: Protection systems defeat defined threats without creating new hazards
│   ├── G2.1: Ballistic protection (DOC-31) — No spall, no BABT > 44mm
│   ├── G2.2: Thermal/Fire protection (DOC-32) — No burn > 2nd degree
│   ├── G2.3: Electrical protection (DOC-33) — No arc flash, no neural interference
│   ├── G2.4: Directed energy (DOC-34) — No ocular/skin injury
│   ├── G2.5: Blast protection (DOC-26) — No TBI, no auditory damage
│   └── G2.6: Chem/Bio (DOC-37) — No permeation > IDLH
├── G3: Autonomous functions do not create unacceptable risk
│   ├── G3.1: Neuromorphic runtime verified (DOC-30) — Formal methods
│   ├── G3.2: Watchdog independence (DOC-30) — Analysis, Test
│   ├── G3.3: Adversarial robustness (DOC-30, DOC-39) — Red team
│   └── G3.4: Human override authority (DOC-33, DOC-37) — Demonstration
├── G4: Sustainment activities do not degrade safety
│   ├── G4.1: Maintenance procedures safe (DOC-34, DOC-36) — Analysis
│   ├── G4.2: Supply chain integrity (DOC-35) — Audit
│   └── G4.3: Circular economy safe (DOC-50) — Analysis
└── G5: Cyber-physical security protects safety functions
    ├── G5.1: Zero-trust architecture (DOC-39) — Analysis, Test
    ├── G5.2: SBOM + runtime attestation (DOC-39, DOC-42) — Demonstration
    └── G5.3: Supply chain security (DOC-35) — Audit
```

### 6.2 GSN Evidence Mapping

| Goal | Strategy | Evidence (Artifact) | Verification Method |
|------|----------|---------------------|---------------------|
| G1.1 | Redundant seals + APC + verification | DOC-27, DOC-33 test report | Test, Analysis |
| G2.1 | Auxetic backing + trauma pad | DOC-26, DOC-31 LFT&E report | Test (NIJ 0101.07) |
| G3.1 | Formal verification of runtime | DOC-30 §4, Coq/Isabelle proofs | Formal Analysis |
| G4.1 | Procedural controls + training | DOC-34, DOC-36 curriculum | Inspection, Audit |
| G5.1 | Zero-trust + microsegmentation | DOC-39 architecture, pen test | Test, Analysis |

---
