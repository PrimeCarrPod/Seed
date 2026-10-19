## 6. Hardware Configuration Management

### 6.1 Part Numbering — AS550 Compliance

Per **SAE AS550** (Part Numbering Standard), all hardware CIs use:

```
PN = [CAGE].[Type].[Series].[Variant].[Revision]
     5-char   2-char   3-char    1-char    2-char
Example: 1ABC2.MT.001.A.01
  1ABC2     = CAGE Code (Government-assigned)
  MT        = Type (MT=Mechanical, EL=Electrical, OP=Optical)
  001       = Series (Sequential within type)
  A         = Variant (A=Production, T=Test, S=Spare)
  01        = Revision (00=Draft, 01=Release, 02+=ECO)
```

**Part Number Categories**:

| Type Code | Category | Examples |
|-----------|----------|----------|
| **MT** | Mechanical | Ceramic tiles, chassis struts, cleats |
| **EL** | Electrical | Batteries, MHD channels, sensors |
| **OP** | Optical | Fiber Bragg gratings, laser diodes |
| **SW** | Software | CSCI loadable software images |
| **DW** | Drawing/Document | ICDs, test procedures, manuals |

### 6.2 Drawing Control — ASME Y14.100 / Y14.24

| Drawing Element | Standard | Control |
|-----------------|----------|---------|
| **Title Block** | ASME Y14.100 | Mandatory fields: PN, Rev, Sheet, Scale |
| **Revision Block** | ASME Y14.35 | ECO number, date, approver, description |
| **Parts List (BOM)** | ASME Y14.24 | Indented, quantity, find number |
| **Geometric Tolerancing** | ASME Y14.5-2018 | GD&T per DOC-11..14, FAB-RM-06 |
| **Model-Based Definition** | ASME Y14.41 | 3D PDF, STEP AP242 (DOC-44 §5) |

### 6.3 ECO Implementation — Hardware

**ECO Effectivity** options per **MIL-STD-973**:

| Effectivity | Use Case | Implementation |
|-------------|----------|----------------|
| **Immediate** | Safety, critical defect | All units, retrofit kit |
| **Next Production Lot** | Cost reduction, improvement | Serial number cutoff |
| **Next Maintenance** | Minor, non-safety | At next Phase C/D inspection |
| **Scrap/Rework** | Non-conforming material | Disposition per MRB |

**ECO Implementation Tracking**:

$$
\text{Implementation \%} = \frac{N_{implemented}}{N_{affected}} \times 100\%
$$

Target: 100% within effectivity window, 0 overdue.

---
