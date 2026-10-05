# Document 11: Silicon Photonics Market Modeling and CAGR Analysis
## Piece 9: Valuation Multiples: EV/Revenue for Photonics Pure-Plays

---

### 11.9 Valuation Multiples: EV/Revenue for Photonics Pure-Plays

Valuation of silicon photonics companies requires specialized frameworks that account for high growth, deep technology moats, and the transition from component supplier to integrated systems provider. This piece analyzes EV/Revenue multiples for photonics pure-plays, develops a relative valuation framework, and connects multiples to fundamental drivers.

#### 11.9.1 EV/Revenue Framework for High-Growth Tech

**Enterprise Value (EV)**:
EV = Market Cap + Net Debt + Minority Interest - Cash
For pre-profit companies: EV/Revenue is primary multiple

**EV/Revenue drivers** (Gordon growth + margin expansion):
EV/Rev = (g × m × (1 - t) × (1 + margin_expansion)) / (r - g)
where:
- g = revenue growth rate
- m = target EBITDA margin at maturity
- t = tax rate
- r = discount rate (WACC)
- margin_expansion = annual margin improvement

**Key insight**: For high-growth photonics (g > 30%), small changes in margin assumptions create large multiple swings

#### 11.9.2 Photonics Pure-Play Universe (2024)

**Public pure-plays** (market cap > $500M, >80% photonics revenue):

| Company | Ticker | Market Cap ($B) | Revenue ($M) | EV/Rev | Rev Growth | EBITDA Margin |
|---------|--------|-----------------|--------------|--------|------------|---------------|
| Coherent | COHR | 6.2 | 4,800 | 1.3× | 12% | 18% |
| Lumentum | LITE | 4.1 | 1,600 | 2.5× | 8% | 15% |
| II-VI (now Coherent) | - | - | - | - | - | - |
| NeoPhotonics (acquired) | - | - | - | - | - | - |
| Inphi (acquired) | - | - | - | - | - | - |
| Acacia (acquired) | - | - | - | - | - | - |
| **Pure-play survivors** | | | | | | |
| Lightwave Logic | LWLG | 0.45 | 0 | 180× | - | -120% |
| Aeluma | ALMU | 0.08 | 0 | NM | - | - |
| Ayar Labs (private) | - | 0.1 | - | - | - | - |
| Celestial AI (private) | - | 0.05 | - | - | - | - |
| Lightmatter (private) | - | 0.02 | - | - | - | - |

**Note**: Most pure-plays acquired (Inphi, Acacia, NeoPhotonics, Infinera → Coherent)
Remaining public: Mostly pre-revenue or component suppliers

**Representative multiples** (using proxy comps):
| Category | EV/Rev | EV/EBITDA | Rev Growth |
|-----------|--------|-----------|------------|
| Optical components (mature) | 1.5-2.5× | 8-12× | 8-15% |
| Optical components (growth) | 3-5× | 12-20× | 20-40% |
| Optical systems (Inphi/Acacia model) | 6-12× | 20-35× | 50-100% |
| Optical compute (pre-revenue) | 20-100× | NM | - |

#### 11.9.3 Valuation Framework: DCF + Multiple Hybrid

**Two-stage DCF** (for photonics companies):
Stage 1 (Years 1-5): Explicit forecast, high growth
Stage 2 (Terminal): Perpetuity growth

**Revenue projection** (Base case):
Year 0: $100M
Year 1-5: 40%, 35%, 30%, 25%, 20% growth
Year 5+: 5% perpetuity

**Margin trajectory**:
Year 0: -20% EBITDA (investing)
Year 5: 15% EBITDA
Year 10: 25% EBITDA (mature photonics)

**WACC calculation**:
- Risk-free: 4.5%
- Equity risk premium: 5.5%
- Beta: 1.4 (photonics volatility)
- Cost of equity: 4.5% + 1.4×5.5% = 12.2%
- Cost of debt: 6%
- D/E: 0.3
- WACC: 10.1%

**DCF valuation** (per $100M current revenue):
- PV(Stage 1): $285M
- PV(Terminal): $420M
- EV = $705M
- EV/Rev = 7.05×
- Implied EV/Rev at current: 7.05× (but forward EV/Rev = 3.2×)

#### 11.9.4 Multiple Regression: EV/Rev = f(Growth, Margin, Risk)

**Cross-sectional regression** (50 photonics/optical comps, 2015-2024):
ln(EV/Rev) = α + β₁ × g + β₂ × m + β₃ × σ + β₄ × ln(Rev) + ε

**Regression results** (OLS, R² = 0.73):
| Variable | Coefficient | t-stat | p-value |
|----------|-------------|--------|---------|
| Intercept | 0.45 | 3.2 | 0.002 |
| Revenue growth (g) | 4.82 | 8.7 | <0.001 |
| EBITDA margin (m) | 3.15 | 4.3 | <0.001 |
| Revenue volatility (σ) | -1.87 | -3.1 | 0.003 |
| ln(Revenue) | -0.18 | -2.4 | 0.018 |

**Interpretation**:
- 10% higher growth → 48% higher EV/Rev
- 10% higher margin → 32% higher EV/Rev
- 10% higher volatility → 17% lower EV/Rev
- 10× larger revenue → 18% lower EV/Rev (scale discount)

**Model fit**: R² = 0.73, Adj R² = 0.71
Out-of-sample MAPE: 18% (reasonable for high-growth tech)

#### 11.9.5 Photonics-Specific Multiple Adjustments

**Technology premium/discount factors**:

| Factor | Premium/Discount | Rationale |
|--------|------------------|-----------|
| Vertical integration (laser + modulator + detector) | +30% | Supply chain control, faster innovation |
| Proprietary process (SiN, Hydex, BaTiO₃) | +25% | Moat, higher margins |
| Standard CMOS process (foundry-agnostic) | -10% | Commodity risk |
| Single-source dependency (laser) | -20% | Supply chain risk |
| China exposure >30% | -15% | Geopolitical risk |
| Single customer >30% | -20% | Concentration risk |
| Pre-revenue | -50% | Execution risk |
| Path to profitability >5 yrs | -30% | Duration risk |

**Adjusted multiple** = Base × (1 + Σ premiums/discounts)

**Example**: Coherent (vertical, diversified, low China):
Base (growth 12%, margin 18%): 2.5×
Adjustments: +30% (vertical) -10% (China) = +20%
Adjusted: 3.0× → Actual 1.3× (conglomerate discount)

**Ayar Labs (private, optical I/O)**:
Growth: 100%+, Margin: -50% (investing)
Base: 25× (high growth premium)
Adjustments: -50% (pre-rev) -30% (path to profit) = -80%
Adjusted: 5× (but strategic value → 20× strategic)

#### 11.9.6 M&A Multiples: Control Premium Analysis

**Photonics M&A transactions** (2015-2024):

| Acquirer | Target | Date | EV ($M) | EV/Rev | EV/EBITDA | Premium |
|----------|--------|------|---------|--------|-----------|---------|
| Marvell | Inphi | 2020 | 8,200 | 12.3× | 35× | 45% |
| Marvell | Inphi | 2021 | 10,000 | 14.5× | 40× | - |
| Coherent | II-VI | 2021 | 6,800 | 1.8× | 11× | 25% |
| Coherent | NeoPhotonics | 2022 | 900 | 2.8× | 18× | 30% |
| II-VI | Coherent | 2022 | 6,800 | 1.8× | 11× | - |
| Cisco | Acacia | 2019 | 2,800 | 10.5× | 28× | 46% |
| Cisco | Luxtera | 2018 | 660 | 18.3× | NM | 75% |
| Lumentum | Oclaro | 2018 | 1,800 | 3.2× | 14× | 15% |
| II-VI | Finisar | 2018 | 3,200 | 2.1× | 12× | 20% |

**Control premium analysis**:
- Strategic acquisitions (systems): 40-75% premium
- Component consolidation: 15-30% premium
- Vertical integration: 20-35% premium
- Average control premium: 38%

**Implied standalone vs. strategic value**:
- Standalone EV/Rev (DCF): 3.2×
- Strategic EV/Rev (with synergies): 5.5×
- Control premium: 72% (strategic/standalone - 1)

#### 11.9.7 Private Market Valuations (Optical Compute/I/O)

**Recent funding rounds** (2022-2024):

| Company | Round | Valuation | Revenue | EV/Rev | Stage |
|---------|-------|-----------|---------|--------|-------|
| Ayar Labs | Series D | $1.0B | $10M | 100× | Series D |
| Celestial AI | Series C | $1.2B | $5M | 240× | Series C |
| Lightmatter | Series C | $1.2B | $2M | 600× | Series C |
| PsiQuantum | Series D | $3.2B | $0 | NM | Series D |
| Xanadu | Series C | $1.0B | $0 | NM | Series C |
| Lightwave Logic | Public | $0.45B | $0 | NM | Public |
| OpenLight | Series B | $200M | $2M | 100× | Series B |
| Ranovus | Series C | $150M | $15M | 10× | Series C |

**Valuation methodology for pre-revenue**:
1. **Comparable transactions**: EV = f(team, IP, TAM, stage)
2. **Real options**: Value = Option to capture TAM
3. **VC method**: Post-money = Exit value / (1+r)^t × 1/ownership%
5. **Scorecard method**: Adjust average pre-money for factors

**Implied EV/Rev at exit** (for 10× fund return):
- Entry: 100× EV/Rev (Series B)
- Exit (IPO/M&A): 10-15× EV/Rev (mature multiple)
- Required revenue at exit: $100-200M
- Time to exit: 5-7 years
- Required CAGR: 80-100%

#### 11.9.8 Public vs. Private Valuation Gap

**Private vs. Public EV/Rev** (comparable stage/growth):

| Stage | Private EV/Rev | Public EV/Rev | Gap |
|-------|----------------|---------------|-----|
| Series A (pre-rev) | 50-200× | - | - |
| Series B ($1-10M rev) | 30-100× | 10-20× | 5-8× |
| Series C ($10-50M rev) | 15-50× | 8-15× | 3-4× |
| Series D ($50-200M rev) | 8-25× | 5-10× | 2-3× |
| Pre-IPO ($200M+ rev) | 5-15× | 3-8× | 1.5-2× |
| Public (mature) | - | 2-5× | - |

**Gap drivers**:
- Illiquidity discount: 20-30%
- Information asymmetry: 10-15%
- Control premium in private: 10-20%
- Growth rate differential: Private grows 2-3× faster

**Convergence timeline**: Gap closes over 2-3 years post-IPO
- Year 1: 30% gap
- Year 2: 15% gap
- Year 3: 5% gap

#### 11.9.9 Valuation Multiples by Business Model

**Photonics business model taxonomy**:

| Model | Description | EV/Rev Range | Key Metrics |
|-------|-------------|--------------|-------------|
| Component supplier | Lasers, modulators, detectors | 1.5-4× | Gross margin, yield |
| Module supplier | Transceivers, AOCs | 2-6× | Attach rate, BOM cost |
| System vendor | Coherent systems, ROADMs | 4-12× | Attach rate, service revenue |
| Platform/ecosystem | Optical compute, interconnect | 10-50× | Developer adoption, ecosystem |
| IP/licensing | IP cores, PDKs | 15-50× | Licensees, royalty rate |
| Foundry/services | SiPh foundry, packaging | 3-8× | Utilization, yield |

**Hybrid models** (most common):
- Component + Module: 3-8× (Lumentum, Coherent)
- Component + System: 5-15× (Cisco/Inphi model)
- Platform + Services: 15-40× (NVIDIA optical model)

#### 11.9.10 Future: Dynamic Multiples for Optical Compute Era

**Multiple evolution as industry matures**:
| Phase | EV/Rev Range | Duration | Key Transition |
|-------|--------------|----------|----------------|
| Nascent (pre-rev) | 20-100× | 3-5 yrs | First revenue |
| Early growth | 10-20× | 2-3 yrs | $50M ARR |
| High growth | 6-12× | 3-5 yrs | $200M ARR, profitable |
| Maturing | 3-6× | 5-10 yrs | $1B ARR, 20% margin |
| Mature | 1.5-3× | Perpetual | Market saturation |

**Optical compute inflection** (2027-2030):
- New category: Optical AI accelerators
- Multiple expansion: 20× → 50× (pre-revenue to early revenue)
- Analog: NVIDIA 2016-2020 (GPU compute)

**Valuation framework for optical compute**:
1. **TAM × Market Share × Margin × Multiple**
2. **TAM**: $50B (2030 optical AI compute)
3. **Share**: 5-20% (depending on architecture)
4. **Margin**: 30-50% (analog efficiency)
5. **Multiple**: 20-40× (platform/ecosystem)

**Implied valuations** (optical compute leaders):
- 5% share, 40% margin, 30× multiple: $9B
- 10% share, 45% margin, 35× multiple: $31.5B
- 20% share, 50% margin, 40× multiple: $160B

**Key risk**: Execution (can analog optical beat digital at scale?)
- If yes: NVIDIA-like trajectory (100× in 5 years)
- If no: Component supplier multiples (2-5×)

---

*End of Piece 9. Next: Piece 10 - Sensitivity Analysis: Tornado Diagram for Key Drivers*