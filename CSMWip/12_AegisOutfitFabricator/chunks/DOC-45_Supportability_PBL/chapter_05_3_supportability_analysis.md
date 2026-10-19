## 3. Supportability Analysis

### 3.1 Level of Repair Analysis (LORA)

Per **MIL-STD-1388-2A** and **MIL-HDBK-502**, LORA determines optimal repair level for each LRU:

**LORA Decision Model**:

$$
\text{Minimize } C_{total} = \sum_{j \in LRUs} \sum_{i \in \{O,I,D\}} x_{i,j} \cdot C_{i,j}
$$

Subject to:
$$
\sum_{i} x_{i,j} = 1 \quad \forall j
$$
$$
\text{Availability}(x) \geq 0.95
$$
$$
\text{Response Time}(x) \leq \text{Requirement}
$$

Where $x_{i,j} = 1$ if LRU $j$ repaired at level $i$, $C_{i,j}$ = cost per repair at level $i$.

**AIMES LORA Results** (representative):

| LRU | O-Level | I-Level | D-Level | Rationale |
|-----|---------|---------|---------|-----------|
| **Ceramic Tile** | ✅ Replace | — | ✅ Re-gild | High frequency, low complexity replace; specialized re-gild |
| **MR Fluid Bladder** | ✅ Replace | ✅ Service | — | O-Level swap, I-Level fluid service |
| **Battery Module** | ✅ Replace | ✅ Cell Balance | ✅ Rebuild | O-Level swap, I-Level balance, D-Level cell replace |
| **MHD Channel** | — | ✅ Clean/Inspect | ✅ Rebuild | I-Level PM, D-Level re-coat |
| **Neuromorphic ASIC** | — | — | ✅ Replace | No repair, security controls |
| **MXene Textile Panel** | — | ✅ Re-coat | ✅ Re-weave | I-Level spray, D-Level loom |
| **Aerogel Panel** | ✅ Replace | — | — | O-Level snap-fit, no repair |
| **Seal/Gasket Kit** | ✅ Replace | — | — | O-Level, consumable |

### 3.2 Reliability-Centered Maintenance (RCM) — CBM+ Integration

Per **DoDI 4151.22** and **SAE JA1011/1012**, RCM analysis defines maintenance tasks:

**RCM Decision Logic** (per SAE JA1011):

```
FUNCTION → FUNCTIONAL FAILURE → FAILURE MODE → FAILURE EFFECT → 
  CONSEQUENCE → TASK SELECTION → TASK INTERVAL
```

**Task Selection Criteria**:

| Consequence | Task Type | Example |
|-------------|-----------|---------|
| **Safety** (Hidden) | Condition-Based (CBM) | Seal leak rate monitoring (DOC-27) |
| **Safety** (Evident) | Condition-Based + Redundancy | Tile integrity via PHM (DOC-31) |
| **Operational** | Condition-Based | MR fluid yield stress (DOC-28) |
| **Non-Operational** | Run-to-Failure | Cosmetic coating (YInMn Blue) |
| **Hidden Non-Safety** | Failure Finding | BIT integrity (DOC-33) |

**CBM+ Task Intervals** (derived from PHM data, DOC-29):

| Parameter | Sensor | Algorithm | Interval |
|-----------|--------|-----------|----------|
| **Seal Leak Rate** | He mass spec | Trend > 5×10⁻⁷ cm³/s | Continuous |
| **MR Fluid Yield** | Rheometer (embedded) | Drift > 15% | Continuous |
| **Tile Health** | PVDF-TrFE + UT | Crack detection | Continuous |
| **Battery SOC/Health** | BMS | Cell ΔV > 50mV, RUL | Continuous |
| **EMI Shielding** | RF mesh | SE drop > 10 dB | Continuous |
| **Aerogel Compression** | Force sensor | Springback < 90% | Phase A (30 days) |

### 3.3 Support Equipment & Test Program Sets (TPS)

Per **MIL-STD-1388-2A** and **MIL-STD-1540**, support equipment is minimized through **Common Support Equipment (CSE)** and **Automatic Test Equipment (ATE)**:

| Equipment | Type | Supported LRUs | Qty per RMH |
|-----------|------|----------------|-------------|
| **BIT Terminal** | CSE | All (via suit connector) | 4 |
| **Seal Leak Tester** | CSE | All seal interfaces | 2 |
| **MR Fluid Service Cart** | CSE | MR bladder (DOC-28) | 1 |
| **Battery Analyzer** | CSE | Battery modules (DOC-28) | 2 |
| **RF Mesh Analyzer** | CSE | Comm/sensor suite (DOC-29) | 1 |
| **UT Phased Array** | ATE | Ceramic tiles (DOC-31) | 1 |
| **MXene Conductivity Mapper** | ATE | Textile panels (DOC-22) | 1 |
| **Ceramic Re-gild Station** | Depot Only | Tiles (DOC-21) | 2 (Depot) |
| **Loom Re-weave Cell** | Depot Only | MXene textiles (DOC-45) | 1 (Depot) |

---
