## 3. NDT Re-Inspection Schedule (Per DOC-32 Baseline)

### 3.1 NDT Method Matrix

| Method | Target Defects | Frequency | Coverage | Resolution | DOC-32 Ref |
|--------|----------------|-----------|----------|------------|------------|
| **UT-PA** | Delamination, cracks, voids in ceramic | Phase C (180d) | 100% tiles | 0.5mm | §4.2 |
| **IR Thermography** | Disbonds, thermal anomalies | Phase B (90d) | 100% surface | 1mm | §4.3 |
| **CT Scan** | Internal delamination, inclusion | Phase D (360d) | 10% sampling | 50µm | §4.4 |
| **ECT** | Framework cracks, baleen fatigue | Phase C (180d) | 100% metal | 0.1mm | §4.5 |
| **Acoustic Emission** | Active cracking during proof test | Phase E (720d) | 100% | N/A | §4.6 |
| **Shearography** | Near-surface disbonds | Phase C (180d) | 100% panels | 1mm | §4.7 |
| **Holographic Interferometry** | Seal deformation under pressure | Phase B (90d) | 8 interfaces | 1µm | §4.8 |

### 3.2 NDT Data Management (ISO 13374 Compliant)

```
NDT DATA ARCHITECTURE:
  Format: DICONDE (ASTM E2339) + JSON metadata
  Storage: WORM archive (10-year retention)
  Database: TimescaleDB (time-series + blob)
  Access: Role-based (Operator/Engineer/Depot/OEM)
  
TRACEABILITY:
  Each inspection → Suit ID, Date, Inspector Cert, Equipment Cal Cert
  Baseline comparison: Automated registration to as-built model
  Trend analysis: Automated (Python/ML pipeline, DOC-32 algorithms)
  Alert generation: CBM+ rules engine (Drools, 100+ rules)
```

---
