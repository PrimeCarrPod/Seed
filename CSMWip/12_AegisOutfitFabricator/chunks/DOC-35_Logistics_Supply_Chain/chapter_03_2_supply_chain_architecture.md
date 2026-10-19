## 2. Supply Chain Architecture

### 2.1 Tiered Supply Network Topology

```
GLOBAL SUPPLY NETWORK (12 Regional Hubs + 3 Depot Facilities):

TIER 1 — OEM / QUALIFIED SOURCES (Single/Sole Source Management):
  ├── Ceramic Tiles (Al₂O₃/TiB₂)     → CoorsTek, Morgan Advanced Materials
  ├── MR Fluid (MRF-132DG)            → Lord Corporation (sole source)
  ├── MXene Ink (Ti₃C₂Tₓ)             → Drexel Univ. licensed / 2D Materials
  ├── Aerogel Blankets (Pyrogel XTE)  → Aspen Aerogels
  ├── Baleen (Synthetic)              → CSM Materials Lab (internal)
  ├── Neuromorphic ASIC               → Intel Loihi-3 (qualified foundry)
  ├── MHD Generator Stack             → CSM Propulsion (internal)
  └── Dyneema SK99                    → DSM (qualified lot)

TIER 2 — SUB-ASSEMBLY INTEGRATORS:
  ├── Tile Array Modules              → CSM Regional Hubs (I-Level)
  ├── MR Fluid Distribution Manifolds → CSM Regional Hubs
  ├── Battery Module Packs            → CSM Regional Hubs (cold chain)
  ├── Framework Sub-Assemblies        → CSM Regional Hubs
  └── Seal Kits                       → CSM Regional Hubs

TIER 3 — REGIONAL HUBS (12 Global — I-Level):
  HUB-NA-01 (CONUS East)    HUB-NA-02 (CONUS West)    HUB-EU-01 (Germany)
  HUB-EU-02 (UK)            HUB-ME-01 (UAE)           HUB-AP-01 (Japan)
  HUB-AP-02 (Australia)     HUB-AP-03 (Singapore)     HUB-SA-01 (Brazil)
  HUB-AF-01 (South Africa)  HUB-AR-01 (Alaska)        HUB-OC-01 (Hawaii)

TIER 4 — FORWARD BASES (O-Level — 500+ locations):
  - Unit-level storage: 30-day O-Level demand
  - Automated reorder points via PHM integration (DOC-34 §3.2)
  - RFID-tracked inventory with blockchain ledger (ISO 22301 §8.2)

TIER 5 — DEPOT FACILITIES (3 Global — D-Level):
  DEPOT-CONUS (Arizona)     DEPOT-EU (Germany)         DEPOT-AP (Japan)
  - Full rebuild capability
  - Strategic reserve: 2-year demand
  - DMSMS engineering cell
  - Phoenix Protocol recovery line
```

### 2.2 Information Flow Architecture (ISO 13374 Compliant)

```
PHM DATA FLOW (Continuous):
  AIMES Unit (500+ sensors)
    │
    ▼
  Edge Gateway (CSM-EDGE-07) — Protocol: MQTT-SN / CoAP / 5G NR
    │
    ▼
  Regional Hub CBM+ Server — ISO 13374-40:2021 OPC-UA
    │  ├── Health Index (HI) computation per LRU
    │  ├── Remaining Useful Life (RUL) prediction
    │  ├── Spares demand forecast (Prophet/ARIMA models)
    │  └── Auto-generated work orders → O/I-Level
    │
    ▼
  Global Logistics Orchestrator (GLO) — Kubernetes, Kafka, TimescaleDB
    │  ├── Cross-hub load balancing
    │  ├── Strategic airlift/sealift scheduling
    │  ├── DMSMS alerts (SAE AS6294)
    │  └── Circular economy tracking (Phoenix Protocol)
    │
    ▼
  CSM Enterprise ERP (SAP S/4HANA Defense) — MIL-STD-1540 traceable
```

**Data Latency Requirements:**
$$t_{latency} \leq \begin{cases}
5 \text{ sec} & \text{(PHM → Hub)} \\
30 \text{ sec} & \text{(Hub → GLO)} \\
5 \text{ min} & \text{(GLO → ERP)}
\end{cases}$$

---
