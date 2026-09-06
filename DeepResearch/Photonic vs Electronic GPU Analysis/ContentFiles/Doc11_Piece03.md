# Document 11: Silicon Photonics Market Modeling and CAGR Analysis
## Piece 3: Learning Curve (Wright's Law) for Silicon Photonics Cost Reduction

---

### 11.3 Learning Curve (Wright's Law) for Silicon Photonics Cost Reduction

Wright's Law (learning curve) describes how costs decrease as cumulative production volume increases. For silicon photonics, which is transitioning from low-volume custom manufacturing to high-volume CMOS-style production, Wright's Law provides a powerful framework for forecasting cost trajectories and understanding the economics of scale.

#### 11.3.1 Wright's Law Fundamentals

**Original formulation** (1936):
C_n = C_1 × n^{-b}
where:
- C_n = cost of n-th unit
- C_1 = cost of first unit
- n = cumulative production volume
- b = learning exponent (learning rate = 2^{-b})

**Learning rate** (cost reduction per doubling):
LR = C_{2n} / C_n = 2^{-b}
Typical learning rates:
- 90% (b = 0.152): Mature manufacturing
- 85% (b = 0.234): Typical electronics
- 80% (b = 0.322): Rapid learning, new tech
- 75% (b = 0.415): Very rapid learning

**Cumulative average cost**:
C_avg(N) = C_1 × N^{-b} / (1-b)
for b < 1

#### 11.3.2 Wright's Law vs. Moore's Law vs. Bass Model

**Three complementary laws**:
1. **Moore's Law**: Transistor density doubles every 2 years
   - Technology push (supply side)
   - Exponential in time: 2^{t/2}

2. **Wright's Law**: Cost drops with cumulative volume
   - Experience curve (demand side)
   - Power law in volume: V^{-b}

3. **Bass Model**: Adoption fraction over time
   - Market dynamics
   - S-curve in time: S(t)

**Relationship**: 
- Volume V(t) from Bass model
- Cost C(t) = Wright's Law applied to V(t)
- Revenue = Volume × Price, Price = Cost × (1+margin)

**Integration**:
C(t) = C_1 × [V(t)]^{-b}
where V(t) = m × F(t) from Bass model

#### 11.3.3 Wright's Law for Silicon Photonics Components

**Component-level learning curves**:

| Component | Current Cost | Target Cost | Learning Rate | Volume for Target |
|-----------|--------------|-------------|---------------|-------------------|
| DFB Laser | $15 | $3 | 85% | 50× current |
| Mach-Zehnder Modulator | $25 | $5 | 80% | 100× current |
| Ge Photodetector | $8 | $2 | 85% | 30× current |
| AWG Mux/Demux | $50 | $10 | 80% | 50× current |
| Si Photonics Wafer | $5,000 | $1,500 | 80% | 20× current |
| Packaging (per channel) | $10 | $2 | 80% | 50× current |

**Aggregate transceiver cost** (100G PAM-4):
- Current: $150-200
- Target (2028): $50-80
- Learning rate: 82% (composite)

#### 11.3.4 Volume Projections and Cost Trajectories

**Cumulative volume projection** (from Bass model):
| Year | Annual Volume (M units) | Cumulative Volume (M units) |
|------|------------------------|-----------------------------|
| 2024 | 85 | 450 |
| 2025 | 110 | 560 |
| 2026 | 140 | 700 |
| 2027 | 175 | 875 |
| 2028 | 215 | 1,090 |
| 2029 | 260 | 1,350 |
| 2030 | 310 | 1,660 |

**Cost projection** (learning rate 85% per doubling):
C(N) = C_0 × (N/N_0)^{-b}
where b = -log₂(0.85) = 0.234

**Cost trajectory** (transceiver, $):
| Year | Cumulative Vol (M) | Cost ($) | Reduction vs 2024 |
|------|-------------------|----------|-------------------|
| 2024 | 450 | 180 | 1.00× |
| 2025 | 560 | 162 | 0.90× |
| 2026 | 700 | 148 | 0.82× |
| 2027 | 875 | 135 | 0.75× |
| 2028 | 1,090 | 125 | 0.69× |
| 2029 | 1,350 | 117 | 0.65× |
| 2030 | 1,660 | 110 | 0.61× |

**Learning curve validation** (historical):
- 2015-2020: 100G transceiver 200% volume → 35% cost drop (LR ≈ 88%)
- 2020-2024: 400G transceiver 300% volume → 45% cost drop (LR ≈ 85%)

#### 11.3.5 Silicon Photonics Specific Learning Dynamics

**Foundry learning** (wafer cost):
- 300mm SOI wafer: $5,000 → $1,500 (target)
- Drivers: yield improvement (70% → 90%), throughput, larger boules
- Learning rate: 80% (yield-driven)

**Yield learning** (Murphy's model):
Y = Y_0 + (1 - Y_0) (1 - e^{-αN})
Y_0 = initial yield, α = learning rate
For Si photonics: Y_0 = 60%, α = 0.0001/wafer
At 10,000 wafers: Y ≈ 85%

**Design learning** (PDK maturity):
- PDK v1.0: 3 spins to production
- PDK v2.0: 1.5 spins
- PDK v3.0: 1.1 spins (right-first-time)

**Design reuse learning**:
- First design: 100% custom
- Platform approach: 70% reuse
- Mature platform: 90% reuse

#### 11.3.6 Economies of Scale vs. Learning Effects

**Decomposition of cost reduction**:
C(t) = C_0 × Scale_effect(t) × Learning_effect(t)

**Scale effect** (economies of scale):
- Larger wafers (200mm → 300mm): 2.25× area → 40% cost reduction
- Larger batches: batch size 25 → 50 → 15% reduction
- Automation: manual → full auto → 50% labor reduction

**Learning effect** (Wright's Law):
- Cumulative volume doubling → 15-20% cost reduction
- Independent of scale

**Relative contribution** (2024-2030):
- Scale effects: 35% of cost reduction
- Learning effects: 65% of cost reduction
- **Learning dominates** for emerging technologies

#### 11.3.7 Learning Curve for Advanced Packaging

**Packaging cost learning** (per channel):
- Current: $10/channel (active alignment)
- Target: $2/channel (passive alignment)
- Learning rate: 80%
- Volume for target: 100× current

**Alignment technology learning**:
- Active alignment: $5/channel, slow learning (mature)
- Passive alignment: $1/channel, rapid learning (new)
- Self-aligning structures: $0.50/channel, rapid learning

**Hybrid bonding learning**:
- Current: $500/wafer (low volume)
- Target: $100/wafer (high volume)
- Learning rate: 75% (rapid)

#### 11.3.8 Learning Curve for III-V on Si Integration

**Transfer printing learning** (μTP):
- Current yield: 99.5% per device
- Target: 99.99% (for 1000-device modules)
- Learning rate: 85% per doubling of devices printed

**Wafer bonding learning**:
- Current yield: 95% (die-level)
- Target: 99.9% (wafer-level)
- Learning rate: 80%

**Heterogeneous integration cost breakdown** (per channel):
| Element | Current $ | Target $ | Learning Rate |
|---------|-----------|----------|---------------|
| III-V die | $15 | $5 | 85% |
| Transfer print | $3 | $0.50 | 80% |
| Hybrid bond | $8 | $2 | 80% |
| Test/KGD | $5 | $1 | 85% |
| **Total** | **$31** | **$8.50** | **82%** |

#### 11.3.9 Strategic Implications of Learning Curves

**Investment timing** (optimal capacity investment):
- Invest when: d²C/dV² < 0 (learning curve convex)
- For 85% LR: invest early (curve convex initially)
- Delay investment if: demand uncertain, learning rate low

**Pricing strategy** (learning curve pricing):
- Price = Current_cost × (1 + margin) / (1 - learning_rate)^{log₂(V_future/V_now)}
- Forward pricing captures future cost reductions
- Risk: volume shortfall → margin erosion

**Competitive dynamics**:
- First mover: captures learning, builds volume
- Fast follower: benefits from pioneer's learning
- Optimal: co-invest in foundry (shared learning)

**Policy implications**:
- Subsidies should target: early volume (accelerate learning)
- R&D tax credits: increase learning rate (b)
- Export controls: may slow global learning (fragmentation)

#### 11.3.10 Limitations and Extensions

**Limitations of Wright's Law**:
- Assumes constant learning rate
- Ignores technology discontinuities
- No supply constraints
- Single product focus

**Extensions for silicon photonics**:
1. **Segmented learning curves**: Different rates per technology generation
2. **Supply-constrained Wright**: Volume limited by foundry capacity
3. **Multi-product learning**: Spillovers across product lines
3. **Stochastic Wright**: Learning rate as random process

**Segmented learning curve** (per generation):
Gen 1 (2015-2020): LR = 90% (early, low volume)
Gen 2 (2020-2025): LR = 85% (volume ramp)
Gen 3 (2025-2030): LR = 80% (mature, AI-driven)
Gen 4 (2030+): LR = 75% (optical compute, new paradigm)

**Composite learning curve**:
C(N) = Σ w_i C_i(N_i)
where w_i = volume fraction of generation i

---

*End of Piece 3. Next: Piece 4 - Total Addressable Market (TAM) Segmentation: Datacom, Compute, Sensing*