# Document 11: Silicon Photonics Market Modeling and CAGR Analysis
## Piece 10: Sensitivity Analysis: Tornado Diagram for Key Drivers

---

### 11.10 Sensitivity Analysis: Tornado Diagram for Key Drivers

Sensitivity analysis quantifies how uncertainty in input parameters propagates to uncertainty in market forecasts. The tornado diagram visualizes the relative impact of each driver on the 2030 revenue forecast, enabling prioritization of risk mitigation and data collection efforts.

#### 11.10.1 Sensitivity Analysis Framework

**Base case** (2030 revenue): $84.5B
**Method**: One-at-a-time (OAT) sensitivity ±2σ from base
**Range**: ±2 standard deviations from base case
**Output metric**: 2030 revenue ($B)

**Parameters tested** (20 key drivers):

| Category | Parameter | Base | -2σ | +2σ | Distribution |
|----------|-----------|------|-----|-----|--------------|
| **Market** | TAM (m) | $28B | $22B | $34B | Normal |
| | Imitation (q) | 0.41 | 0.31 | 0.51 | Beta |
| | Innovation (p) | 0.011 | 0.005 | 0.017 | LogNormal |
| | AI Boom probability | 18% | 5% | 35% | Beta |
| **Tech** | Learning rate (LR) | 85% | 80% | 90% | Beta |
| | Optical compute breakthrough | 20% | 5% | 40% | Beta |
| | Co-packaged optics adoption | 60% | 30% | 85% | Beta |
| | Optical compute TAM | $5B | $1B | $15B | LogNormal |
| **Econ** | ASP erosion rate | 8%/yr | 4%/yr | 14%/yr | Normal |
| | Hyperscale capex growth | 15% | 5% | 25% | Normal |
| | Semiconductor capex | $180B | $140B | $220B | Normal |
| **Geo** | China risk (revenue loss) | 15% | 5% | 35% | Beta |
| | Taiwan contingency | 5% | 1% | 15% | Beta |
| | Export controls tightening | 30% | 10% | 50% | Beta |
| **Supply** | EUV availability | 90% | 60% | 98% | Beta |
| | Foundry capacity (SiPh wafers) | 200K wpm | 120K | 300K | Normal |
| | III-V supply (lasers) | 95% | 80% | 99% | Beta |
| **Competitive** | New entrant probability | 15% | 5% | 30% | Beta |
| | M&A consolidation rate | 2/yr | 0.5/yr | 4/yr | Poisson |
| | Patent litigation frequency | 3/yr | 1/yr | 6/yr | Poisson |

#### 11.10.2 One-at-a-Time (OAT) Sensitivity Results

**Revenue impact** (ΔRevenue_2030 = Revenue(±2σ) - Base):

| Rank | Parameter | -2σ Impact ($B) | +2σ Impact ($B) | Swing ($B) | % of Base |
|------|-----------|-----------------|-----------------|------------|-----------|
| 1 | TAM (m) | -18.2 | +19.8 | 38.0 | 45.0% |
| 2 | Imitation coefficient (q) | -12.4 | +15.8 | 28.2 | 33.4% |
| 3 | AI Boom probability | -9.8 | +12.4 | 22.2 | 26.3% |
| 4 | China risk | -11.2 | +8.4 | 19.6 | 23.2% |
| 5 | Optical compute TAM | -7.5 | +11.3 | 18.8 | 22.3% |
| 6 | Optical compute breakthrough | -6.8 | +10.2 | 17.0 | 20.1% |
| 7 | Co-packaged optics adoption | -6.2 | +9.8 | 16.0 | 18.9% |
| 8 | Learning rate (LR) | -5.8 | +8.9 | 14.7 | 17.4% |
| 9 | China risk (revenue loss) | -8.9 | +5.6 | 14.5 | 17.2% |
| 10 | ASP erosion rate | -5.4 | +7.8 | 13.2 | 15.6% |
| 11 | Hyperscale capex growth | -4.8 | +7.2 | 12.0 | 14.2% |
| 12 | Foundry capacity | -4.2 | +6.8 | 11.0 | 13.0% |
| 13 | Export controls tightening | -5.1 | +4.3 | 9.4 | 11.1% |
| 14 | Imitation (q) - innovation (p) interaction | -3.8 | +5.2 | 9.0 | 10.6% |
| 15 | Innovation coefficient (p) | -3.2 | +4.1 | 7.3 | 8.6% |
| 16 | Foundry capacity constraint | -3.1 | +4.5 | 7.6 | 9.0% |
| 17 | III-V supply (lasers) | -2.8 | +3.9 | 6.7 | 7.9% |
| 18 | Taiwan contingency | -3.5 | +2.1 | 5.6 | 6.6% |
| 19 | New entrant probability | -2.4 | +3.1 | 5.5 | 6.5% |
| 20 | M&A consolidation rate | -1.8 | +2.6 | 4.4 | 5.2% |

#### 11.10.3 Tornado Diagram Visualization

```
REVENUE IMPACT ON 2030 FORECAST ($B)
Swing = Revenue(+2σ) - Revenue(-2σ)

TAM (m)                    ████████████████████████████████ 38.0
Imitation coefficient (q)  ████████████████████████ 28.2
AI Boom probability        ████████████████████ 22.2
China risk                 ██████████████████ 19.6
Optical compute TAM        █████████████████ 18.8
Optical compute breakthrough████████████████ 17.0
Co-packaged optics adoption ███████████████ 16.0
Learning rate (LR)         ██████████████ 14.7
China risk (revenue loss)  █████████████ 14.5
ASP erosion rate           ████████████ 13.2
Hyperscale capex growth    ███████████ 12.0
Foundry capacity           ██████████ 11.0
Export controls tightening █████████ 9.4
Innovation coefficient (p) ████████ 7.3
Foundry capacity constraint ███████ 7.6
III-V supply (lasers)      ██████ 6.7
Taiwan contingency         █████ 5.6
New entrant probability    ████ 5.5
M&A consolidation rate     ███ 4.4
Patent litigation          ███ 4.1
```

#### 11.10.3 Global Sensitivity Analysis (Sobol Indices)

**Variance-based decomposition** (10,000 Monte Carlo samples):

**First-order indices** (S_i = direct effect):
| Parameter | S_i | Contribution |
|-----------|-----|--------------|
| TAM (m) | 0.42 | 42% |
| Imitation (q) | 0.24 | 24% |
| AI Boom prob | 0.11 | 11% |
| China risk | 0.08 | 8% |
| Optical compute TAM | 0.07 | 7% |
| Optical compute breakthrough | 0.05 | 5% |
| Co-packaged optics | 0.04 | 4% |
| Learning rate | 0.03 | 3% |
| Others | 0.06 | 6% |

**Total-order indices** (S_Ti = direct + interactions):
| Parameter | S_Ti | Interaction Effect |
|-----------|------|-------------------|
| TAM (m) | 0.48 | 6% |
| Imitation (q) | 0.32 | 8% |
| AI Boom prob | 0.18 | 7% |
| China risk | 0.14 | 6% |
| Optical compute TAM | 0.12 | 5% |
| Optical compute breakthrough | 0.10 | 5% |
| Co-packaged optics | 0.08 | 4% |
| Learning rate | 0.06 | 3% |

**Key insight**: TAM and imitation coefficient dominate; interactions account for ~15% of total variance

#### 11.10.3 Interaction Effects Analysis

**Significant two-way interactions** (ΔS = S_Ti - S_i):

| Parameter Pair | Interaction Strength | Nature |
|----------------|---------------------|--------|
| q × AI Boom | +0.07 | Synergistic: AI boom amplifies imitation |
| m × q | +0.06 | Larger market amplifies network effects |
| China risk × Export controls | +0.05 | Compounding geopolitical risk |
| Optical compute TAM × Breakthrough | +0.05 | Synergistic: breakthrough expands TAM |
| LR × Optical compute | +0.03 | Learning accelerates compute adoption |
| China risk × Taiwan contingency | +0.04 | Correlated geopolitical risk |
| q × LR | +0.03 | Imitation accelerates learning |

**Three-way interaction** (q × AI Boom × Optical compute): +0.02
- Triple interaction: AI boom drives both imitation and compute demand

#### 11.10.4 Scenario-Based Sensitivity

**Scenario-weighted sensitivity** (probability-weighted):

| Scenario | Probability | Key Sensitivities (Top 3) |
|----------|-------------|---------------------------|
| Base (50%) | 50% | m, q, AI Boom |
| AI Boom (25%) | 25% | Optical compute TAM, Breakthrough, q |
| AI Bust (15%) | 15% | m, China risk, ASP erosion |
| Supply Constrained (20%) | 20% | Foundry capacity, III-V supply, LR |
| Geopolitical Crisis (10%) | 10% | China risk, Taiwan, Export controls |

**Conditional sensitivities** (E[ΔRevenue | Scenario]):
| Parameter | Base | AI Boom | AI Bust | Supply Constrained |
|-----------|------|---------|---------|-------------------|
| m | 1.0 | 1.3 | 0.7 | 0.9 |
| q | 1.0 | 1.5 | 0.6 | 0.8 |
| Optical compute TAM | 1.0 | 2.2 | 0.3 | 0.9 |
| Breakthrough | 1.0 | 2.5 | 0.2 | 1.1 |
| Foundry capacity | 1.0 | 1.2 | 0.8 | 2.5 |

#### 11.10.4 Critical Thresholds and Tipping Points

**Tipping point analysis** (parameter value where forecast changes qualitatively):

| Parameter | Tipping Point | Effect if Crossed |
|-----------|---------------|-------------------|
| q (imitation) | 0.55 | Market shifts from linear to exponential adoption |
| Optical compute TAM | $15B | Optical compute becomes largest segment |
| China revenue loss | 30% | TAM reduces below $60B (bear case) |
| Foundry capacity | 150K wpm | SiPh becomes supply-constrained, ASPs rise |
| LR (learning rate) | 80% | Cost reduction outpaces ASP erosion → margin expansion |
| Co-packaged optics | 80% adoption | Optical I/O becomes standard, copper displaced |

**Early warning indicators** (monitor for tipping):
| Indicator | Threshold | Action |
|-----------|-----------|--------|
| q > 0.55 | Quarterly | Accelerate capacity investment |
| Optical compute revenue > $2B/yr | Annual | Accelerate optical compute R&D |
| China revenue < 10% of TAM | Quarterly | Activate supply chain diversification |
| EUV lead time > 12 months | Monthly | Activate DUV fallback recipes |

#### 11.10.4 Risk Mitigation Prioritization

**Risk mitigation ROI** (Risk reduction per $M invested):

| Mitigation | Cost ($M) | Risk Reduction ($B) | ROI |
|------------|-----------|---------------------|-----|
| Dual-source EUV (Canon/Nikon) | $15,000 | $12.4 | 827× |
| Domestic III-V foundry | $5,000 | $4.2 | 840× |
| Optical compute R&D | $2,000 | $8.7 | 4,350× |
| Co-packaged optics standard | $500 | $3.1 | 6,200× |
| Domestic packaging capacity | $3,000 | $2.8 | 933× |
| Workforce development | $500 | $1.2 | 2,400× |
| Alternative EUV (NIL/DSA) | $3,000 | $2.1 | 700× |
| Supply chain digital twin | $500 | $0.8 | 1,600× |

**Prioritization matrix** (Impact vs. Feasibility):
```
High Impact, High Feasibility → DO NOW
├── Co-packaged optics standardization
├── Domestic packaging capacity
├── Workforce development
├── Optical compute R&D

High Impact, Low Feasibility → STRATEGIC BETS
├── Domestic EUV alternative
├── Optical compute breakthrough
├── Domestic III-V foundry

Low Impact, High Feasibility → QUICK WINS
├── Supply chain digital twin
├── Pellicle/resist dual-sourcing
├── Patent portfolio strengthening

Low Impact, Low Feasibility → MONITOR
├── Patent litigation defense
├── M&A consolidation tracking
```

#### 11.10.5 Decision Rules Under Uncertainty

**Robust decision rules** (minimax regret):

1. **Capacity investment**: Invest if P(demand > capacity) > 30%
   - Current P = 65% → Invest

2. **R&D allocation**: Allocate to optical compute if P(breakthrough) > 15%
   - Current P = 20% → Allocate $2B

3. **Supply chain diversification**: Activate if China risk > 25%
   - Current P = 35% → Activate diversification

4. **M&A strategy**: Acquire if strategic fit score > 80th percentile
   - Current pipeline: 3 targets above threshold

**Real options triggers**:
- **Expand domestic fab**: Trigger when utilization > 85% for 2 consecutive quarters
- **Acquire optical compute startup**: Trigger when technical milestone achieved (BER < 1e-15)
- **Build domestic III-V foundry**: Trigger when import dependency > 50% for > 4 quarters

#### 11.10.6 Communicating Uncertainty to Stakeholders

**Communication framework**:

**For Board/Investors**:
- "Base case: $84.5B (90% CI: $58-112B)"
- "Key swing factors: AI adoption (60% of variance), China risk (15%), Supply chain (10%)"
- "Mitigation ROI: $1 invested in resilience saves $7 in expected losses"

**For Operations/Engineering**:
- "Critical path: Optical compute TAM validation by 2026"
- "Supply chain risk: Pellicles and EUV tools are top single points of failure"
- "Technical debt: DUV fallback recipes need completion by 2025"

**For Policy/Government**:
- "National security gap: 100% EUV dependency on single foreign supplier"
- "Investment needed: $28.5B over 5 years for supply chain resilience"
- "Expected return: 7:1 (resilience investment : avoided losses)"

**For Customers (Hyperscalers)**:
- "Supply assurance: 99.9% delivery reliability target"
- "Price predictability: 8% annual erosion committed through 2028"
- "Innovation roadmap: 1.6T optical I/O by 2027, 3.2T by 2030"

---

*End of Piece 10. Document 11 complete (10 pieces). Next: Glue pieces into Doc11_Final.md*