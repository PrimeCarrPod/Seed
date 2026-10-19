## 5. Model-Based Definition (MBD)

### 5.1 MBD Mandate — ASME Y14.41 / STEP AP242

Per **DoD MBD Mandate (2019)** and **ASME Y14.41**, the AIMES program uses **Model-Based Definition** as the **authoritative product definition** for all hardware CIs. 2D drawings are **reference only** (not authoritative).

**MBD Data Set per CI**:

| MBD Element | Standard | Tool | Purpose |
|-------------|----------|------|---------|
| **3D Annotated Model** | STEP AP242 (ISO 10303-242) | NX, Creo, CATIA | Authoritative geometry + PMI |
| **Product Manufacturing Information (PMI)** | ASME Y14.41, ISO 16792 | NX, Creo | GD&T, notes, BOM, surface finish |
| **Composite 3D PDF** | ISO 14739-1 (3D PDF) | Adobe, Tetra4D | Human-readable, digital signature |
| **BOM** | PLMXML / OPC | DIME/PLM | Structured parts list |
| **Requirements Traceability** | ReqIF (OMG) | DOORS Next | Req → Model → Test |
| **Simulation Models** | FMU (FMI 2.0/3.0) | Simulink, Modelica | Digital twin (DOC-41 §1) |

### 5.2 PMI Completeness — ASME Y14.41 Annex A

| PMI Category | Required | AIMES Status |
|--------------|----------|--------------|
| **Dimensions** | Yes | ✅ All critical dims |
| **Geometric Tolerances (GD&T)** | Yes | ✅ Per DOC-11..14, FAB-RM-06 |
| **Surface Texture** | Yes | ✅ 18-22 SPI (textile), Ra < 0.8μm (ceramic) |
| **Weld/Braid Symbols** | Yes | ✅ Ultrasonic seam (DOC-31) |
| **Edge Condition** | Yes | ✅ Tile edge specs (DOC-21) |
| **Material Specification** | Yes | ✅ MAT-01..04 references |
| **Heat Treatment** | Yes | ✅ Ceramic sintering (FAB-RM-06) |
| **Coating/Finish** | Yes | ✅ YInMn Blue, MXene (DOC-48) |
| **Thread/Insert Specs** | Yes | ✅ Dyneema lacing, MAX Phase cleats |
| **Assembly Instructions** | Yes | ✅ FAB-RM-09, FAB-RW-12 |
| **Inspection Criteria** | Yes | ✅ FAB-RM-10, FAB-RW-13 |
| **Revision History** | Yes | ✅ CM integration (DOC-42) |

### 5.3 Digital Thread — Requirements → Model → Test

The **Digital Thread** connects all lifecycle data per **ASME Y14.41** and **ISO 10303-239 (PLM Services)**:

```
REQUIREMENTS (DOORS Next)
        ↓ ReqIF
ARCHITECTURE (SysML/MBSE)
        ↓ SysML
3D MODEL + PMI (STEP AP242)
        ↓ STEP AP242
MANUFACTURING (CAM, CMM, NDT)
        ↓ QIF (ISO 10303-238)
INSPECTION RESULTS (QIF)
        ↓ QIF
DIGITAL TWIN (FMU)
        ↓ FMU
SUSTAINMENT (PHM, CBM+)
```

**Traceability Verification**:

$$
\text{Digital Thread Complete} \iff \forall \text{Requirement } r: 
\exists \text{Model Element } m, \text{Test Case } t: 
r \xrightarrow{\text{traces}} m \xrightarrow{\text{verifies}} t
$$

Target: 100% traceability at CDR.

---
