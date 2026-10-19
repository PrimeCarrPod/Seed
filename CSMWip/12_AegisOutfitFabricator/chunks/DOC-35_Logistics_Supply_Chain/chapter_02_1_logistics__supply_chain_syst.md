## 1. Logistics & Supply Chain System Overview

### 1.1 Sustainment Scope
The AIMES logistics program provides **20-year global sustainment** for the complete fleet of 8 Leaf Editions (LE-TS, LE-TG, LE-SS, LE-SG × RenaissanceMan/RenaissanceWoMan) across all operational theaters. The supply chain architecture follows **DoDI 4151.22** Condition-Based Maintenance Plus (CBM+) principles integrated with **ISO 13374** Open Architecture for Prognostics and Health Management, **SAE AS6294** PHM Data Standards, and **MIL-STD-1540** Test Requirements.

### 1.2 Logistics Performance Targets (Derived from CSMFAB078 Main §8, CSMFAB078-B §3)

| Parameter | Target | Verification Method |
|-----------|--------|---------------------|
| **Operational Availability (Ao)** | ≥0.95 | Ao = MTBF/(MTBF+MTTR) per DoDI 4151.22 |
| **Materiel Availability (Am)** | ≥0.92 | Am = MTBM/(MTBM+MDT) |
| **Supply Response Time (O-Level)** | ≤4 hours | Spares pre-positioning |
| **Supply Response Time (I-Level)** | ≤72 hours | Regional hub distribution |
| **Supply Response Time (D-Level)** | ≤2 weeks | Depot-level rebuild |
| **DMSMS Resolution Time** | ≤180 days | SAE AS6294 LOTB process |
| **Phoenix Protocol Recovery Rate** | ≥85% | CSMFAB078 §8 mass balance |
| **Shelf-Life Compliance** | 100% | DOC-34 §7.2 monitoring |
| **Lifecycle Cost (LCC)** | ≤10% procurement/yr | CBM+ optimization |

### 1.3 Fleet Composition & Spares Demand Model
The global AIMES fleet consists of **240 operational systems** (30 per Leaf Edition × 8 editions) distributed across **6 regional commands**. Annual operating tempo: 1,200 hours/system/year.

```
FLEET SPARS DEMAND MODEL (Per System Per Year):
┌─────────────────────┬──────────┬────────────┬────────────┬────────────┐
│ LRU Category        │ Qty/Sys  │ Annual OFR │ Annual Qty │ Stock Level│
├─────────────────────┼──────────┼────────────┼────────────┼────────────┤
│ Ceramic Tile Set    │ 184      │ 0.08       │ 14.7       │ 45 (3×)    │
│ MR Fluid Reservoir  │ 12       │ 0.15       │ 1.8        │ 6 (3.3×)   │
│ Battery Module      │ 8        │ 0.10       │ 0.8        │ 4 (5×)     │
│ Aerogel Panel       │ 24       │ 0.05       │ 1.2        │ 5 (4×)     │
│ MXene FSS Module    │ 6        │ 0.07       │ 0.42       │ 2 (4.7×)   │
│ Baleen Framework    │ 1        │ 0.02       │ 0.02       │ 1 (50×)    │
│ PVDF-TrFE Sensor    │ 240      │ 0.03       │ 7.2        │ 24 (3.3×)  │
│ Seal Gasket Set     │ 8        │ 0.20       │ 1.6        │ 8 (5×)     │
│ MHD Generator Cell  │ 1        │ 0.01       │ 0.01       │ 1 (100×)   │
│ Neuromorphic ASIC   │ 1        │ 0.005      │ 0.005      │ 1 (200×)   │
└─────────────────────┴──────────┴────────────┴────────────┴────────────┘

OFR = Operational Failure Rate (failures/operating hour)
Stock Level = Safety stock = OFR × Fleet × Operating Hours × Coverage Factor
Coverage Factor = 3.0 (O-Level), 2.5 (I-Level), 2.0 (D-Level)
```

---
