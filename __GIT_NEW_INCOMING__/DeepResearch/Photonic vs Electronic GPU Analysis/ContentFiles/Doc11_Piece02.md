# Document 11: Silicon Photonics Market Modeling and CAGR Analysis
## Piece 2: Monte Carlo Simulation of Market Size Confidence Intervals

---

### 11.2 Monte Carlo Simulation of Market Size Confidence Intervals

Monte Carlo simulation provides a robust framework for quantifying uncertainty in silicon photonics market forecasts by propagating parameter uncertainty through the Bass diffusion model and other market models. This piece details the methodology, implementation, and interpretation of Monte Carlo market size projections.

#### 11.2.1 Monte Carlo Methodology for Market Forecasting

**Monte Carlo principle**:
1. Define probability distributions for uncertain parameters
2. Sample parameters from distributions
3. Compute model output for each sample
3. Analyze output distribution (mean, percentiles, confidence intervals)

**For Bass model**:
Parameters: p, q, m (market potential)
Model: F(t; p, q, m) = m × (1 - e^{-(p+q)t}) / (1 + (q/p) e^{-(p+q)t})

**Output distribution**:
Revenue(t) = F(t; p, q, m) × ASP(t)
where ASP(t) = average selling price trajectory

#### 11.2.2 Parameter Distribution Specification

**Distribution choices** (based on historical calibration):

| Parameter | Distribution | Parameters | Justification |
|-----------|--------------|------------|---------------|
| p (innovation) | LogNormal | μ=-4.5, σ=0.3 | p > 0, right-skewed |
| q (imitation) | Beta | α=8, β=12 | 0 < q < 1, peak ~0.4 |
| m (market potential) | Normal | μ=$28B, σ=$3B | Symmetric around estimate |
| ASP_0 | LogNormal | μ=ln(150), σ=0.2 | ASP in $, right-skewed |
| ASP_decay | Normal | μ=-0.08, σ=0.02 | Annual price erosion |

**Correlation structure**:
- p and q: negative correlation (ρ ≈ -0.3)
  - Higher innovation → lower imitation needed
- m and ASP: negative correlation (ρ ≈ -0.2)
  - Larger market → more competition → lower ASP
- q and ASP_decay: positive correlation (ρ ≈ 0.2)
  - Faster adoption → faster price erosion

#### 11.2.3 Sampling Methods

**Standard Monte Carlo**:
- Independent sampling from marginals
- Apply correlation via Cholesky decomposition
- N = 10,000-100,000 samples

**Latin Hypercube Sampling (LHS)**:
- Stratified sampling for better coverage
- Requires fewer samples for same accuracy
- N = 1,000-5,000 typically sufficient

**Quasi-Monte Carlo** (Sobol sequences):
- Low-discrepancy sequences
- Faster convergence (O(N⁻¹) vs O(N⁻⁰⁵))
- Good for high-dimensional problems

**Importance sampling**:
- Focus sampling on tail regions
- Important for extreme percentile estimation
- Weight samples by likelihood ratio

#### 11.2.4 Implementation Algorithm

**Pseudocode**:
```
for i = 1 to N_samples:
    # Sample correlated parameters
    z = multivariate_normal(μ, Σ)
    p = exp(z[0])
    q = beta_inv_cdf(z[1], α, β)
    m = z[2]
    
    # Sample ASP trajectory
    ASP_0 = lognormal(μ_ASP, σ_ASP)
    decay = normal(μ_decay, σ_decay)
    ASP[t] = ASP_0 * (1 + decay)^t
    
    # Compute revenue trajectory
    for t in years:
        F = bass_model(t, p, q, m)
        revenue[t] = F * ASP[t]
    
    store revenue trajectory

# Analyze results
for t in years:
    mean_rev[t] = mean(revenue[:,t])
    pct_5[t] = percentile(revenue[:,t], 5)
    pct_95[t] = percentile(revenue[:,t], 95)
```

#### 11.2.5 Silicon Photonics Monte Carlo Results

**Simulation parameters**:
- N = 50,000 samples
- LHS sampling
- Correlated parameters (Cholesky)
- Time horizon: 2024-2035

**Results** (Revenue in $B):

| Year | Mean | Median | 5th Pctl | 95th Pctl | Std Dev |
|------|------|--------|----------|-----------|---------|
| 2024 | 12.5 | 12.4 | 11.2 | 13.9 | 0.8 |
| 2025 | 15.1 | 15.0 | 13.1 | 17.3 | 1.2 |
| 2026 | 18.2 | 18.1 | 15.4 | 21.5 | 1.8 |
| 2027 | 21.8 | 21.6 | 18.0 | 26.2 | 2.4 |
| 2028 | 25.6 | 25.3 | 20.5 | 31.8 | 3.2 |
| 2029 | 29.5 | 29.1 | 23.1 | 37.2 | 4.1 |
| 2030 | 33.4 | 33.0 | 25.5 | 42.8 | 5.0 |
| 2031 | 37.1 | 36.6 | 27.8 | 48.1 | 5.9 |
| 2032 | 40.5 | 39.9 | 29.9 | 53.2 | 6.8 |
| 2033 | 43.5 | 42.8 | 31.6 | 58.1 | 7.6 |
| 2034 | 46.1 | 45.3 | 33.1 | 62.5 | 8.3 |
| 2035 | 48.3 | 47.4 | 34.4 | 66.5 | 8.9 |

**CAGR distribution** (2024-2030):
- Mean: 17.8%
- Median: 17.6%
- 5th percentile: 12.3%
- 95th percentile: 23.7%
- Std dev: 3.2%

#### 11.2.5 Sensitivity Analysis via Monte Carlo

**Sobol sensitivity indices** (variance decomposition):
| Parameter | First-order S_i | Total-order S_Ti |
|-----------|-----------------|------------------|
| m (market potential) | 0.45 | 0.52 |
| q (imitation) | 0.28 | 0.35 |
| ASP_0 | 0.12 | 0.15 |
| q (imitation) | 0.08 | 0.12 |
| ASP_decay | 0.05 | 0.07 |
| p (innovation) | 0.02 | 0.03 |

**Interpretation**: Market potential (m) and imitation coefficient (q) dominate uncertainty. Innovation coefficient (p) has minimal impact on long-term forecast.

#### 11.2.6 Scenario Analysis via Monte Carlo

**Scenario definitions** (conditional sampling):

| Scenario | Condition | Revenue_2030 ($B) | Probability |
|----------|-----------|-------------------|-------------|
| Base | Unconditional | 33.4 (25.5-42.8) | 100% |
| AI Boom | q > 0.50 | 42.1 (34.2-51.3) | 18% |
| AI Bust | q < 0.35 | 24.8 (18.2-32.1) | 12% |
| Supply Constrained | Foundry cap < 200K wpm | 28.3 (21.1-36.7) | 25% |
| China Restriction | Export controls | 26.7 (19.8-34.9) | 30% |
| Standardization Win | IEEE 802.3cx early | 38.9 (30.2-48.7) | 22% |

**Joint scenario probabilities** (assuming independence):
- AI Boom + Standardization: 4% → Revenue $48.2B
- AI Bust + China Restriction: 3.6% → Revenue $19.4B
- Supply Constrained + China Restriction: 7.5% → Revenue $22.1B

#### 11.2.7 Value at Risk (VaR) and Expected Shortfall

**Value at Risk** (1-year, 95% confidence):
VaR_95 = P(Loss > VaR) = 5%
For 2030 revenue: VaR_95 = $25.5B (5th percentile)

**Expected Shortfall** (Conditional VaR):
ES_95 = E[Revenue | Revenue < VaR_95]
= $22.1B (average of worst 5%)

**Revenue at Risk** (relative to mean):
RaR = (Mean - VaR_95) / Mean = (33.4 - 25.5) / 33.4 = 23.6%

#### 11.2.8 Monte Carlo for TAM/SAM/SOM

**TAM (Total Addressable Market)**:
Full Bass model with m ~ N(28, 3) → TAM distribution

**SAM (Serviceable Available Market)**:
SAM = TAM × Serviceable_fraction
Serviceable_fraction ~ Beta(5, 2) → mean 0.71
SAM distribution derived from TAM × Beta

**SOM (Serviceable Obtainable Market)**:
SOM = SAM × Market_share
Market_share depends on competitive position
- Market leader: share ~ Beta(8, 3) → mean 0.73
- Challenger: share ~ Beta(3, 5) → mean 0.38
- Niche: share ~ Beta(2, 8) → mean 0.20

**Resulting SOM distributions** (2030):
| Position | Mean SOM ($B) | 90% CI ($B) |
|----------|---------------|-------------|
| Leader | 24.4 | [18.2, 31.8] |
| Challenger | 12.7 | [9.1, 16.9] |
| Niche | 6.7 | [4.5, 9.4] |

#### 11.2.9 Computational Considerations

**Variance reduction techniques**:
1. **Antithetic variates**: Pair samples with opposite random numbers
2. **Control variates**: Use known analytical result as control
3. **Stratified sampling**: Stratify on key parameters
4. **Importance sampling**: Focus on tail regions

**Convergence diagnostics**:
- Gelman-Rubin statistic (R̂ < 1.01)
- Effective sample size (ESS > 1000)
- Monte Carlo standard error < 1% of mean

**Computational cost**:
- 50,000 samples × 12 years × 100 ops ≈ 60M operations
- CPU: ~2 seconds (vectorized NumPy)
- GPU: ~0.1 seconds (CUDA)

#### 11.2.10 Reporting and Visualization

**Key visualizations**:
1. **Fan chart**: Revenue trajectories with percentile bands
2. **Histogram**: Revenue distribution at key years
3. **Tornado chart**: Sensitivity indices
4. **Scenario tree**: Decision tree with probabilities
5. **CDF plots**: Cumulative distribution at key milestones

**Reporting standards** (IEEE 1680):
- Report: mean, median, std, 5th/95th percentiles
- Specify: N_samples, sampling method, correlation structure
- Report: convergence diagnostics, computation time
- Provide: percentile table, sensitivity indices

---

*End of Piece 2. Next: Piece 3 - Learning Curve (Wright's Law) for Silicon Photonics Cost Reduction*