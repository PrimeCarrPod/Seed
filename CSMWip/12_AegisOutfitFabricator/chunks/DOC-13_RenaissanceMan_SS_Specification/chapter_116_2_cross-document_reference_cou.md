## 2. Cross-Document Reference Coupling Analysis

### 2.1 Coupling Strength Matrix (DOC-13 ↔ Other Documents)

| Document | Coupling Strength | Shared Requirements | Interface Type |
|----------|------------------|---------------------|----------------|
| **CSMFAB078-A** | **CRITICAL** | Edition params, LES, scaling, transitions | Direct (normative) |
| **CSMFAB078 Main** | **CRITICAL** | 12-layer stack, mission profiles, perf targets | Direct (normative) |
| **CSMFAB078-B** | **CRITICAL** | Threat validation, quality gates | Direct (normative) |
| **DOC-01** | **HIGH** | Mass budget, CoG, standards, architecture | Direct (derived) |
| **DOC-02** | **HIGH** | Historical authenticity, terminology | Indirect (design basis) |
| **DOC-04** | **HIGH** | Pattern system, geometry | Direct (derived) |
| **DOC-05** | **HIGH** | Chassis, LES zones | Direct (derived) |
| **DOC-06** | **HIGH** | Protective layers (thermal/EMI/ballistic) | Direct (derived) |
| **DOC-07** | **MEDIUM** | Textile/seam specs | Indirect (material basis) |
| **DOC-08** | **MEDIUM** | Manufacturing process | Indirect (process basis) |
| **DOC-09** | **HIGH** | QA test procedures, gate definitions | Direct (verification) |
| **DOC-10** | **HIGH** | Don/doff/ops procedures | Direct (operational) |
| **DOC-11** | **MEDIUM** | RM-TS baseline | Reference (comparison) |
| **DOC-12** | **MEDIUM** | RM-TG baseline | Reference (comparison) |
| **MAT-01** | **HIGH** | Silk material properties | Direct (material spec) |
| **MAT-02** | **HIGH** | Baleen/steel/MAX properties | Direct (material spec) |
| **MAT-03** | **CRITICAL** | Ceramic/MXene/aerogel/STF properties | Direct (material spec) |
| **MAT-04** | **MEDIUM** | Cross-property validation | Reference (validation) |
| **SYNTH-01** | **HIGH** | Unified EMI/mobility models | Direct (analysis basis) |
| **SYNTH-02** | **CRITICAL** | AIMES→Renaissance layer mapping | Direct (design basis) |
| **SYNTH-03** | **HIGH** | Geometric drafting kernels | Direct (algorithm basis) |
| **DRAFT-01** | **HIGH** | Alcega developable surfaces | Direct (algorithm) |
| **DRAFT-02** | **HIGH** | Garsault proportional scaling | Direct (algorithm) |
| **DRAFT-03** | **HIGH** | Pleating kernels | Direct (algorithm) |
| **DRAFT-04** | **NONE** | Farthingale/hoop (female only) | N/A |
| **DRAFT-05** | **HIGH** | Zero-waste nesting optimizer | Direct (algorithm) |

### 2.2 Interface Control Documents (ICDs)

| ICD ID | Between | Interface Definition | Change Control |
|--------|---------|---------------------|----------------|
| ICD-13-078A | DOC-13 ↔ CSMFAB078-A | Edition parameters, LES, transitions | CCB Level 1 |
| ICD-13-078M | DOC-13 ↔ CSMFAB078 Main | Layer stack, mission profiles | CCB Level 1 |
| ICD-13-078B | DOC-13 ↔ CSMFAB078-B | Threat validation, QA gates | CCB Level 1 |
| ICD-13-01 | DOC-13 ↔ DOC-01 | Mass, CoG, architecture | CCB Level 2 |
| ICD-13-04 | DOC-13 ↔ DOC-04 | Pattern geometry | CCB Level 2 |
| ICD-13-05 | DOC-13 ↔ DOC-05 | Chassis + LES | CCB Level 2 |
| ICD-13-06 | DOC-13 ↔ DOC-06 | Protective layer interfaces | CCB Level 2 |
| ICD-13-10 | DOC-13 ↔ DOC-10 | Don/doff/LES verify | CCB Level 2 |
| ICD-13-M3 | DOC-13 ↔ MAT-03 | Ceramic/MXene/STF/aerogel specs | CCB Level 1 |
| ICD-13-SY2 | DOC-13 ↔ SYNTH-02 | AIMES layer mapping | CCB Level 1 |

### 2.3 Change Impact Analysis

| Change Source | Affected DOC-13 Chapters | Impact Level | Mitigation |
|---------------|-------------------------|--------------|------------|
| CSMFAB078-A αₑ change | 02, 05, 06, 11, 28, 38, 84, 86, 128 | **HIGH** | Recalculate all scaling |
| CSMFAB078 Main layer add/remove | 17-19, 55-73, 118 | **CRITICAL** | Full redesign |
| MAT-03 ceramic property change | 17, 18, 77, 84, 86 | **HIGH** | Re-run ballistic/thermal |
| SYNTH-02 mapping change | 17, 18, 19, 20, 115 | **HIGH** | Update traceability |
| DRAFT-01 algorithm change | 11, 25, 28, 115 | **MEDIUM** | Regenerate patterns |
| DRAFT-03 pleating change | 45, 46, 47, 48, 115 | **MEDIUM** | Re-validate ROM |

### 2.4 Configuration Management Coupling

| CM Item | DOC-13 Control | External Dependency |
|---------|----------------|---------------------|
| Edition Definition | RM-SS parameters frozen | CSMFAB078-A §3.1 |
| Layer Stack | 12 layers fixed | CSMFAB078 Main §4 |
| Material Specs | Frozen per MAT-01/02/03 | MAT-01/02/03 rev control |
| Pattern Geometry | Frozen per DRAFT-01/02/05 | DRAFT rev control |
| QA Gates | Frozen per DOC-09 | DOC-09 rev control |
| Mission Profiles | Frozen per CSMFAB078 Main §2 | Main rev control |

---