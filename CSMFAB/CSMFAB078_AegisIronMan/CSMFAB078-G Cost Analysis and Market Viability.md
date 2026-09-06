# CSMFAB078-G — Aegis Iron Man: Cost Analysis & Market Viability
## Bill of Materials, Production Economics, TCO, Competitive Landscape, Funding Strategy
## Version 1.0 | August 2026

---

## 1. Bill of Materials — Tall-Gordo Edition (Highest Cost)

| Category | Item | Qty | Unit Cost | Total | Source |
|----------|------|-----|-----------|-------|--------|
| **CERAMIC ARMOR** | | | | **$48,720** | |
| | ZrB₂-SiC outer tiles (flash sintered) | 56 | $185 | $10,360 | In-house |
| | ZrB₂-SiC inner tiles (flash sintered) | 56 | $148 | $8,288 | In-house |
| | NdFeB N52 magnets (8/tile edge) | 896 | $0.45 | $403 | Commercial |
| | ePTFE gasket | 134 m | $12/m | $1,608 | Commercial |
| | ZrO₂-silicone gasket | 134 m | $18/m | $2,412 | Commercial |
| | MXene Ti₃C₂Tₓ tape (45μm, 12mm) | 269 m | $65/kg | $1,749 | In-house |
| | YInMn Blue + CsPbBr₃ QD coating | 1.5 kg | $120/kg | $180 | In-house* |
| | CoAl₂O₄ interior coating | 1.0 kg | $30/kg | $30 | In-house |
| | Auxetic metamaterial cladding (Ti₃AlC₂ LPBF) | 56 tiles | $45 | $2,520 | In-house |
| **BFRP CHASSIS** | | | | **$5,200** | |
| | Basalt fiber (UD roving) | 52 kg | $2.20/kg | $114 | In-house |
| | Elium® 150 resin | 35 kg | $5/kg | $175 | In-house |
| | VARTM tooling (amortized) | 1 | $4,500 | $4,500 | In-house |
| | Extension struts (pultruded) | 64 | $18 | $1,152 | In-house |
| | Ti₃AlC₂ cleat inserts (M6) | 216 | $1.20 | $259 | In-house |
| **ACTIVE SYSTEMS** | | | | **$12,840** | |
| | MR Fluid (LORD equivalent) | 3.2 L | $35/kg | $112 | In-house |
| | MR bladder assemblies (12 zones) | 12 | $85 | $1,020 | In-house |
| | MR driver coils + Protonic HFET | 12 | $245 | $2,940 | In-house |
| | PVDF-TrFE sensor mesh (240 nodes) | 1 | $320 | $320 | In-house |
| | DSP (Cortex-M7 + FPGA) | 1 | $180 | $180 | Commercial |
| | Battery LiFePO₄ 50Wh | 1 | $120 | $120 | Commercial |
| | Perovskite solar (0.1m², flexible) | 1 | $45 | $45 | Commercial |
| | FEATHER LoRa + Protonic comms | 1 | $850 | $850 | In-house |
| | Haptic drivers (charge pumps) | 1 | $150 | $150 | In-house |
| **LACING & FASTENERS** | | | | **$2,840** | |
| | Dyneema SK99 lace (2.4mm) | 0.52 kg | $42/kg | $22 | Commercial |
| | Ti₃AlC₂ MAX Phase cleats | 54 | $28 | $1,512 | In-house |
| | Ceramic torque wrench (preset) | 1 | $120 | $120 | Commercial |
| | Magnetic alignment fixtures | 56 | $15 | $840 | In-house |
| | Tile storage cassette | 1 | $346 | $346 | In-house |
| **ASSEMBLY & TEST** | | | | **$8,500** | |
| | Labor (40 hrs @ $75/hr) | 40 | $75 | $3,000 | In-house |
| | EMI test (reverb chamber) | 1 | $1,500 | $1,500 | In-house |
| | Thermal manikin test | 1 | $2,000 | $2,000 | In-house |
| | Ballistic witness panel | 1 | $500 | $500 | In-house |
| | Bio-acoustic calibration | 1 | $1,000 | $1,000 | In-house |
| | Documentation & certification | 1 | $500 | $500 | In-house |
| **TOTAL UNIT COST (TG)** | | | | **$78,100** | |

*YInMn with indium-sparing formula (R&D target $85/kg); current commercial $75-100/kg

---

## 2. Cost by Edition

| Edition | Tiles | Chassis Struts | Mass (kg) | Unit Cost | Cost/kg |
|---------|-------|----------------|-----------|-----------|---------|
| LE-TS (Tall-Skinny) | 42+42 | 52 | 18.5 | $62,400 | $3,373 |
| LE-TG (Tall-Gordo) | 56+56 | 64 | 26.0 | $78,100 | $3,004 |
| LE-SS (Short-Skinny) | 36+36 | 44 | 15.8 | $55,800 | $3,532 |
| LE-SG (Short-Gordo) | 48+48 | 56 | 22.3 | $70,200 | $3,148 |

**Edition Delta:** ±$8-12k from TG baseline (tile count drives 65% of cost)

---

## 3. Production Volume Economics

### 3.1 Learning Curve & Volume Discounts

| Annual Volume | Unit Cost (TG) | Basalt Fiber | ZrB₂ SHS | MXene | Elium® | Aerogel | Labor | Fixed Overhead |
|---------------|----------------|--------------|----------|-------|--------|---------|-------|----------------|
| 12 (Pilot) | $78,100 | $2.20 | $100 | $65 | $5 | $68 | $75/hr | $1.2M/yr |
| 48 (Low Rate) | $62,400 | $1.95 | $85 | $58 | $4.50 | $60 | $65/hr | $1.2M/yr |
| 144 (Full Rate) | $48,700 | $1.80 | $75 | $50 | $4 | $55 | $55/hr | $1.5M/yr |
| 360 (Surge) | $39,200 | $1.70 | $68 | $42 | $3.80 | $50 | $48/hr | $2.0M/yr |

**Cost Reduction Drivers at 144/yr:**
- Basalt fiber: -$21/unit (volume energy)
- ZrB₂ SHS: -$1,400/unit (furnace utilization)
- MXene: -$2,100/unit (reactor scale)
- Elium®: -$70/unit (MMA volume pricing)
- Aerogel: -$1,200/unit (dryer utilization)
- Labor: -$3,200/unit (learning curve 85%)
- Overhead absorption: -$8,300/unit

---

## 4. Total Cost of Ownership (TCO) — 10 Year

### 4.1 Per Suit Lifecycle

| Cost Element | Year 1 | Years 2-5 | Years 6-10 | Total 10yr |
|--------------|--------|-----------|------------|------------|
| Acquisition | $78,100 | — | — | $78,100 |
| Annual inspection (40 hrs) | $3,000 | $12,000 | $15,000 | $30,000 |
| Tile replacement (10%/yr) | $7,800 | $31,200 | $39,000 | $78,000 |
| MR fluid refresh (annual) | $500 | $2,000 | $2,500 | $5,000 |
| Battery replacement (yr 5, 10) | — | $120 | $120 | $240 |
| Firmware updates | $200 | $800 | $1,000 | $2,000 |
| Training recert (24 hrs/yr) | $1,800 | $7,200 | $9,000 | $18,000 |
| Phoenix Protocol recycling (EOL) | — | — | -$15,000 | -$15,000 |
| **TOTAL 10-YR TCO** | **$91,400** | **$53,320** | **$51,620** | **$196,340** |

**Annualized TCO:** $19,634/yr per suit
**Cost per Mission (50 missions/yr):** $393/mission

---

## 5. Competitive Landscape

| System | Ballistic | Thermal | Electrical | Weight | Cost | GIC/EM Shield | Bio-Acoustic |
|--------|-----------|---------|------------|--------|------|---------------|--------------|
| **AIMES TG** | **NIJ IV** | **1100°C/300s** | **148dB SE** | **26 kg** | **$78k** | **YES** | **YES** |
| Ceramic Plate Carrier + Turnout | NIJ IV | 600°C/60s | None | 35 kg | $18k | NO | NO |
| EOD Bomb Suit (NP Aerospace) | NIJ IV+ | 200°C | Limited | 38 kg | $85k | Partial | NO |
| Firefighter Turnout (Globe) | None | 600°C/60s | None | 22 kg | $8k | NO | NO |
| HazMat Level A (Kappler) | None | 100°C | None | 18 kg | $3k | NO | NO |
| Military IHPS (Avon) | NIJ IV | 200°C | None | 11 kg | $1.2k | NO | NO |
| Exoskeleton (Sarcos) | None | None | None | 24 kg | $150k | NO | NO |

**AIMES Unique Value Proposition:**
- **Only system** combining NIJ IV + 1100°C thermal + 148dB EMI/GIC + bio-acoustic
- **Modular leaf editions** fit 95th percentile male to 5th percentile female
- **Circular economy** (Phoenix Protocol) → 95% material recovery
- **Underwater spiral** (AIMES-DSV) → future-proof investment

---

## 6. Market Sizing & Revenue Projection

### 6.1 Addressable Markets (US + Allied Nations)

| Segment | Population | Penetration Target | Units | Revenue @ $78k | Revenue @ $48k (Full Rate) |
|---------|------------|-------------------|-------|----------------|----------------------------|
| Structural Fire (Career) | 350,000 | 2% (specialty) | 7,000 | $546M | $336M |
| Wildland Fire (Hotshots) | 15,000 | 20% | 3,000 | $234M | $144M |
| HazMat Teams (Tier 1) | 5,000 | 40% | 2,000 | $156M | $96M |
| Electrical Utilities (Live Line) | 25,000 | 10% | 2,500 | $195M | $120M |
| Military SOF / EOD | 50,000 | 5% | 2,500 | $195M | $120M |
| **TOTAL ADDRESSABLE** | | | **17,000** | **$1.33B** | **$816M** |

### 6.2 Revenue Ramp (Conservative)

| Year | Units Sold | Avg Price | Revenue | Cumulative |
|------|------------|-----------|---------|------------|
| 2027 (Pilot) | 12 | $78k | $0.94M | $0.94M |
| 2028 (Low Rate) | 48 | $68k | $3.26M | $4.2M |
| 2029 (Full Rate) | 144 | $52k | $7.49M | $11.7M |
| 2030 (Growth) | 288 | $48k | $13.8M | $25.5M |
| 2031 (Scale) | 500 | $45k | $22.5M | $48.0M |
| 2032 (Mature) | 800 | $42k | $33.6M | $81.6M |

**Break-even:** Year 3 (2029) at 144 units/yr
**IRR (10yr):** 34% (conservative, no DSV revenue)

---

## 7. Funding Strategy

### 7.1 Capital Requirements

| Phase | Timeline | CapEx | OpEx/yr | Total | Source |
|-------|----------|-------|---------|-------|--------|
| Pilot Facility | Q3 2026 | $2.8M | $1.2M | $4.0M | Seed + SBIR |
| Low Rate Expansion | Q1 2027 | $1.2M | $1.5M | $2.7M | Series A |
| Full Rate Facility | Q3 2027 | $3.5M | $2.0M | $5.5M | Series B |
| DSV Development | 2028-2030 | $8.0M | $3.0M/yr | $17.0M | Series C + Gov |
| **TOTAL (5yr)** | | **$15.5M** | **$25.5M** | **$41.0M** | |

### 7.2 Non-Dilutive Funding Targets

| Program | Agency | Amount | Timeline | Status |
|---------|--------|--------|----------|--------|
| SBIR Phase I/II | DOE / DARPA | $1.75M | 2026-2027 | Applying |
| FIRE Act Grant | FEMA | $2.0M | 2027 | Planned |
| JPO CBRNE | DoD | $5.0M | 2027-2028 | Planned |
| Grid Resilience | DOE GDO | $3.0M | 2027 | Planned |
| **TARGET NON-DILUTIVE** | | **$11.75M** | | **29% of 5yr need** |

---

## 8. Sensitivity Analysis

| Variable | -20% | Base | +20% | Impact on Unit Cost |
|----------|------|------|------|---------------------|
| Basalt fiber cost | $1.44 | $1.80 | $2.16 | ±$1,040 |
| ZrB₂ SHS yield | 85% | 90% | 95% | ±$870 |
| MXene reactor yield | 70% | 80% | 90% | ±$1,320 |
| Labor rate | $44 | $55 | $66 | ±$2,800 |
| Volume (units/yr) | 115 | 144 | 173 | ±$4,200 |
| Indium price (YInMn) | $160 | $200 | $240 | ±$650 |

**Most Sensitive:** Labor rate, production volume
**Least Sensitive:** Indium price (indium-sparing formula mitigates)

---

*CSMFAB078-G | Version 1.0 | Cost Analysis & Market Viability*
*Carrington Storm Motors / Safe Pod Engineering Company*