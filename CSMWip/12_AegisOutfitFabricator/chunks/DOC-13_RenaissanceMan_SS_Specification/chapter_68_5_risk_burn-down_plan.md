## 5. Risk Burn-Down Plan

### 5.1 Burn-Down Schedule (Q4 2026 - Q4 2027)

| Quarter | Critical Risks Targeted | Actions | Milestone |
|---------|------------------------|---------|-----------|
| **Q4 2026** | STF Gap (RMSS-003), Silk Seam (SYS-001) | STF Z4/Z5 production release; SPI 20 enforcement | **PDR Pass** |
| **Q1 2027** | MXene Abrasion (RMSS-005), Baleen Creep (RMSS-004) | PTFE topcoat flex zones; hydration SOP + spares | **CDR Pass** |
| **Q2 2027** | Aerogel Dust (RMSS-006), Thermal Margin (RMSS-001) | Chiffon 2-layer; Pyrogel XTF qual start | **TRR Pass** |
| **Q3 2027** | Thermal Margin (RMSS-001), Pyrogel Qual | Pyrogel XTF certification; operational limits | **FRR Pass** |
| **Q4 2027** | All Critical <100 RPN | Final verification; production release | **Production Go** |

### 5.2 Detailed Burn-Down Actions

#### RMSS-003: STF Gap (RPN 225 → Target 45)
| Week | Action | Owner | Status |
|------|--------|-------|--------|
| 1-2 | STF Z4/Z5 process development | Ballistic | ✅ DONE |
| 3-4 | Oblique testing (0°, 15°, 30°, 45°) | Test | ✅ DONE |
| 5-6 | Production tooling (vacuum assist fixture) | Mfg | ✅ DONE |
| 7-8 | First article inspection (5 garments) | QA | ✅ DONE |
| 9-10 | Lot 2 release (50 garments) | Program | 🔄 IN PROGRESS |

**Target Completion: Q4 2026** — **ON TRACK**

#### RMSS-005: MXene Abrasion (RPN 224 → Target 48)
| Week | Action | Owner | Status |
|------|--------|-------|--------|
| 1-4 | PTFE topcoat formulation (5µm, conductive) | Materials | 🔄 IN PROGRESS |
| 5-8 | Flex testing (Bally 1M cycles) | Test | ⏳ PLANNED |
| 9-12 | Selective application process (armhole, knee) | Mfg | ⏳ PLANNED |
| 13-16 | Durability test (500k cycles + SE) | Test | ⏳ PLANNED |
| 17-20 | Production integration | Program | ⏳ PLANNED |

**Target Completion: Q1 2027** — **ON TRACK**

#### RMSS-001: Thermal Margin (RPN 216 → Target 45)
| Week | Action | Owner | Status |
|------|--------|-------|--------|
| 1-12 | Pyrogel XTF procurement + baseline testing | Thermal | 🔄 IN PROGRESS |
| 13-24 | Accelerated aging (85/85, thermal cycling) | Test | ⏳ PLANNED |
| 25-36 | Live fire post-aging (1100°C/300s) | Test | ⏳ PLANNED |
| 37-40 | Operational limit validation | Ops | ⏳ PLANNED |
| 41-44 | Certification package | QA | ⏳ PLANNED |

**Target Completion: Q3 2027** — **ON TRACK** (Long lead item)

#### RMSS-004: Baleen Compression Set (RPN 210 → Target 50)
| Week | Action | Owner | Status |
|------|--------|-------|--------|
| 1-2 | Hydration cycle SOP finalized | Chassis | ✅ DONE |
| 3-4 | Spare baleen kit design (4 stays) | Mfg | ✅ DONE |
| 5-8 | Field trial (10 garments, 500 hr) | Ops | 🔄 IN PROGRESS |
| 9-12 | Steel supplement evaluation (Z3/Z4) | Engineering | ⏳ PLANNED |
| 13-16 | Decision: hydration vs. steel supplement | Program | ⏳ PLANNED |

**Target Completion: Q1 2027** — **ON TRACK**

#### RMSS-006: Aerogel Dust Migration (RPN 210 → Target 50)
| Week | Action | Owner | Status |
|------|--------|-------|--------|
| 1-4 | 2-layer chiffon envelope design | Materials | 🔄 IN PROGRESS |
| 5-8 | Microperforation optimization (10µm pore) | Mfg | ⏳ PLANNED |
| 9-12 | Dust generation test (ASTM D5739) | Test | ⏳ PLANNED |
| 13-16 | HEPA vacuum protocol + PPE | Ops | ⏳ PLANNED |
| 17-20 | PVDF acoustic detection algorithm | Software | ⏳ PLANNED |

**Target Completion: Q2 2027** — **ON TRACK**

### 5.3 Risk Burn-Down Chart (RPN vs. Time)

```
RPN
250 ┤     ● SYS-001 (216)
200 ┤     ● RMSS-001 (216)
150 ┤     ● RMSS-003 (225) ──────┐
100 ┤     ● RMSS-005 (224) ──────┤ Target
 50 ┤────────────────────────────┘ All <100
   └───Q4'26──Q1'27──Q2'27──Q3'27──Q4'27
```

### 5.4 Resource Allocation

| Resource | Q4 2026 | Q1 2027 | Q2 2027 | Q3 2027 | Q4 2027 |
|----------|---------|---------|---------|---------|---------|
| **Engineering FTE** | 4.5 | 5.0 | 4.5 | 4.0 | 3.0 |
| **Test FTE** | 3.0 | 3.5 | 4.0 | 3.5 | 2.0 |
| **Mfg FTE** | 2.0 | 2.5 | 2.0 | 1.5 | 1.0 |
| **Budget ($K)** | 850 | 1,200 | 1,500 | 1,800 | 1,000 |

**Total Program Risk Budget: $6.35M** (FY27)

### 5.5 Go/No-Go Criteria for Production

| Gate | Criteria | Status |
|------|----------|--------|
| **PDR (Q4 2026)** | STF gap closed, silk seam SPI 20 | 🔄 IN PROGRESS |
| **CDR (Q1 2027)** | MXene PTFE done, baleen SOP validated | ⏳ PLANNED |
| **TRR (Q2 2027)** | Aerogel envelope done, Pyrogel testing | ⏳ PLANNED |
| **FRR (Q3 2027)** | Thermal margin certified, all RPN <100 | ⏳ PLANNED |
| **Production (Q4 2027)** | All risks LOW, 100 gates PASS | ⏳ PLANNED |

### 5.6 Cross-References

- Chapter 138: System-level risks
- Chapter 139: RM-SS specific risks
- Chapter 140: FMEA
- Chapter 141: Critical risk deep dives
- MIL-STD-1629: FMEA procedure
- CSMFAB078 Main §6: Risk management
- Program Risk Management Plan (Framework/Risk_Mgmt_Plan.md)

---
