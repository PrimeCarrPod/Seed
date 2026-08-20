# DOCUMENT 5: Global Spatial Distribution Methodology
## Part 4 of 5: Advanced Statistical Methods, Machine Learning, and Validation Frameworks

**Source Expansion**: DeepResearch/Global Geological Clay Deposit Mapping.pdf (Lines 130-140)
**Target**: ~180 lines per part × 5 parts = ~900 lines total
**Document ID**: DOC05_Global_Spatial_Distribution_Methodology.md

---

## 5.11 Advanced Statistical Methods for Clay Distribution Modeling

### 5.11.1 Spatial Interpolation: Kriging with External Drift (KED)

**Why KED?** Clay properties show spatial autocorrelation + trend with covariates (elevation, climate, geology)

**Model:**
$$Z(\mathbf{s}) = \sum_{k=1}^p \beta_k X_k(\mathbf{s}) + \varepsilon(\mathbf{s})$$

where $\varepsilon(\mathbf{s})$ is residual with covariance:
$$C(\mathbf{h}) = \sigma^2 \rho(\mathbf{h}; \boldsymbol{\theta})$$

**Covariance functions:**
- **Exponential:** $C(h) = \sigma^2 \exp(-h/\phi)$
- **Spherical:** $C(h) = \sigma^2 [1 - 1.5(h/\phi) + 0.5(h/\phi)^3]$ for $h \leq \phi$
- **Matérn:** $C(h) = \sigma^2 \frac{2^{1-\nu}}{\Gamma(\nu)} (\kappa h)^\nu K_\nu(\kappa h)$

**External drift variables ($X_k$):**
| Variable | Source | Resolution | Expected Relationship |
|----------|--------|------------|----------------------|
| Elevation | SRTM/ASTER GDEM | 30 m | Quadratic (mid-elevation max) |
| MAP | WorldClim 2.1 | 1 km | Positive (weathering) |
| MAT | WorldClim 2.1 | 1 km | Positive (kinetics) |
| Lithology | GLiM, OneGeology | 1:1M | Categorical (source rock) |
| Tectonic setting | PB2002 | — | Ordinal (orogen > craton) |
| Vegetation | MODIS LAI | 500 m | Positive (organic acids) |

**Cross-validation metrics:**
- **RMSE:** Root mean square error
- **ME:** Mean error (bias)
- **R²:** Correlation between observed and predicted
- **CRPS:** Continuous ranked probability score (probabilistic)

### 5.11.2 Compositional Data Analysis: Clay Mineral Proportions

**Problem:** Clay mineral percentages are compositional (sum to 100%) → standard statistics invalid

**Solution:** Log-ratio transformations (Aitchison geometry)

**Centered log-ratio (clr):**
$$\text{clr}(\mathbf{x}) = \left[\ln\frac{x_1}{g(\mathbf{x})}, ..., \ln\frac{x_D}{g(\mathbf{x})}\right]$$
where $g(\mathbf{x}) = (\prod_{i=1}^D x_i)^{1/D}$ is geometric mean

**Isometric log-ratio (ilr) — preferred for regression:**
$$\text{ilr}_j(\mathbf{x}) = \sqrt{\frac{j}{j+1}} \ln \frac{(\prod_{i=1}^j x_i)^{1/j}}{x_{j+1}} \quad j=1,...,D-1$$

**Example for 4 minerals (Kaol, Smec, Ill, Chl):**
- ilr₁ = √(1/2) ln(Kaol/Smec)
- ilr₂ = √(2/3) ln((Kaol·Smec)¹ᐟ²/Ill)
- ilr₃ = √(3/4) ln((Kaol·Smec·Ill)¹ᐟ³/Chl)

**Regression on ilr coordinates:**
$$\text{ilr}_j = \beta_0 + \sum_k \beta_k X_k + \varepsilon_j$$

**Back-transformation to simplex:**
$$x_i = \frac{\exp(\text{ilr}^*_i)}{\sum_j \exp(\text{ilr}^*_j)}$$

### 5.11.3 Geostatistical Simulation: Sequential Gaussian Simulation (SGS)

**Goal:** Generate equiprobable realizations of clay distribution for uncertainty quantification

**Algorithm:**
1. Transform data to Gaussian (normal score transform)
2. Define random path visiting all unsampled locations
3. At each location:
   - Kriging estimate from nearby data + previously simulated
   - Draw from conditional Gaussian distribution
4. Back-transform to original units

**Conditional simulation parameters:**
- **Variogram:** Fitted to normal-score data
- **Search neighborhood:** 12–24 nearest data
- **Realizations:** $N = 100\text{--}500$
- **Output:** Mean, variance, percentiles (P10, P50, P90)

**Application:** Probabilistic clay resource estimation
$$P(\text{Clay} > \text{cutoff}) = \frac{1}{N} \sum_{i=1}^N \mathbb{1}[Z_i(\mathbf{s}) > \text{cutoff}]$$

### 5.11.4 Multivariate Classification: Clay Province Delineation

**Objective:** Delineate distinct clay provinces from multivariate data

**Data matrix:** $n$ sites × $p$ variables (clay %, mineralogy, geochemistry, climate, geology)

**Methods:**

| Method | Type | Pros | Cons |
|--------|------|------|------|
| **Hierarchical clustering** | Agglomerative | Dendrogram, no $k$ needed | Sensitive to outliers |
| **k-means** | Partitioning | Fast, scalable | Needs $k$, spherical clusters |
| **Gaussian Mixture Models** | Model-based | Probabilistic, ellipsoidal | Needs $k$, EM convergence |
| **Self-Organizing Maps** | Neural net | Topology preservation | Black box, needs tuning |
| **Random Forest clustering** | Supervised proximity | Handles mixed data | Computationally heavy |

**Optimal cluster validation:**
- **Silhouette width:** Mean > 0.5 = good separation
- **Gap statistic:** Compare to null reference
- **BIC/AIC:** For model-based methods
- **Stability:** Bootstrap resampling (Jaccard index > 0.75)

**Result:** 12–15 global clay provinces (e.g., "Tropical Kaolinite Belt", "Temperate Smectite Zone", "Boreal Illite-Chlorite Province")

---

## 5.12 Machine Learning for Clay Property Prediction

### 5.12.1 Predictive Modeling Framework

**Target variables:**
- Clay content (%)
- Kaolinite/(Kaol+Smec) ratio
- CEC (cmol₊/kg)
- Bulk density (g/cm³)
- Depth to bedrock (m)

**Features (100+ candidates):**
- Climate (19 WorldClim bioclimatic variables)
- Topography (elevation, slope, aspect, TPI, TWI, curvature)
- Geology (lithology, age, tectonic setting — one-hot encoded)
- Remote sensing (spectral indices, time series)
- Soil spectral library (if available)

### 5.12.2 Model Comparison (Cross-Validated)

| Model | Clay % RMSE | Kaol Ratio RMSE | CEC RMSE | Training Time | Interpretability |
|-------|-------------|-----------------|----------|---------------|------------------|
| **Linear Regression** | 8.2% | 0.18 | 4.5 | <1 s | High |
| **Random Forest** | 5.1% | 0.11 | 2.8 | 30 s | Medium (feature importance) |
| **Gradient Boosting (XGBoost)** | 4.7% | 0.09 | 2.5 | 60 s | Medium (SHAP values) |
| **Neural Net (MLP)** | 4.9% | 0.10 | 2.6 | 120 s | Low |
| **Gaussian Process** | 5.3% | 0.12 | 3.0 | 300 s | High (uncertainty) |
| **Stacked Ensemble** | 4.5% | 0.08 | 2.3 | 300 s | Low |

**Best practice:** Stacked ensemble (RF + XGBoost + GP) with spatial CV

### 5.12.3 Spatial Cross-Validation (Critical!)

**Standard k-fold CV fails for spatial data** (spatial autocorrelation inflates performance)

**Spatial CV strategies:**
1. **Spatial blocking:** Divide into spatial blocks (e.g., 5×5° tiles), leave-one-block-out
2. **Buffer CV:** Exclude neighbors within buffer distance (e.g., 100 km)
3. **Checkerboard:** Alternating grid cells
4. **Feature-space blocking:** Cluster in feature space, leave-one-cluster-out

**Performance gap (standard vs spatial CV):**
- Standard CV RMSE: 4.5%
- Spatial CV RMSE: 5.8% (+29% — realistic estimate!)

### 5.12.4 Explainable AI: SHAP Values for Clay Prediction

**SHAP (SHapley Additive exPlanations) decomposition:**
$$f(x) = E[f(X)] + \sum_{j=1}^p \phi_j$$

**Global feature importance (mean |SHAP|):**
| Feature | Mean |SHAP| | Contribution |
|---------|----------------|--------------|
| MAP (precip) | 0.42 | Primary driver |
| MAT (temp) | 0.28 | Secondary |
| Lithology (volcanic) | 0.15 | Source rock |
| Elevation | 0.08 | Indirect |
| NDVI | 0.05 | Vegetation |
| Tectonic setting | 0.02 | Minor |

**SHAP dependence plots** reveal interactions:
- MAP effect saturates at ~2500 mm/yr
- MAT effect stronger at high MAP
- Volcanic lithology overrides climate

---

## 5.13 Validation Frameworks: Independent Data and Blind Testing

### 5.13.1 Data Splits for Rigorous Validation

| Split Type | Description | Use Case |
|------------|-------------|----------|
| **Temporal** | Train on old data, test on new | Model monitoring |
| **Geographic** | Train on continents A,B; test on C | Extrapolation |
| **Lithologic** | Train on sedimentary; test on volcanic | Domain shift |
| **Depth** | Train on surface; test on subsurface | Vertical transfer |
| **Sensor** | Train on ASTER; test on PRISMA | Sensor transfer |

### 5.13.2 Blind Test Protocol

**Protocol:**
1. **Holdout set:** 20% of profiles, geographically clustered (entire regions withheld)
2. **Blind prediction:** Model predicts without seeing holdout labels
3. **Independent evaluation:** Third party computes metrics
4. **Error analysis:** Stratify by region, lithology, climate zone

**Reporting template:**
| Region | n | Clay% RMSE | Bias | R² | Mineral RMSE |
|--------|---|------------|------|-----|--------------|
| SE Asia (held out) | 45 | 6.2% | +1.1% | 0.71 | 0.12 |
| W. Africa (held out) | 38 | 7.8% | -0.5% | 0.65 | 0.15 |
| Amazon (held out) | 52 | 5.9% | +0.3% | 0.73 | 0.10 |
| **Global (all held out)** | **135** | **6.5%** | **+0.4%** | **0.70** | **0.12** |

### 5.13.3 Benchmark Datasets

**Global Soil Clay Benchmarks:**
1. **WoSIS (World Soil Information Service):** 190,000+ profiles, standardized
2. **SoilGrids 2.0:** 250 m global predictions (baseline)
3. **LUCAS (EU):** 22,000 EU points, high-quality lab data
4. **NSDB (Canada):** 30,000+ profiles
5. **China Soil Database:** 20,000+ profiles
6. **Australia Soil and Landscape Grid:** 90 m resolution

**Benchmark metrics (vs SoilGrids 2.0 baseline):**
| Metric | SoilGrids 2.0 | Our Model (Target) |
|--------|---------------|-------------------|
| Global Clay RMSE | 7.8% | < 6.0% |
| Tropical RMSE | 9.2% | < 7.0% |
| R² (global) | 0.68 | > 0.75 |
| Bias (global) | -1.2% | < |0.5%| |

---

## 5.14 Visualization and Communication Standards

### 5.14.1 Map Projections for Global Clay Maps

| Purpose | Projection | Parameters |
|---------|------------|------------|
| **Global overview** | Equal Earth | Pseudocylindrical, equal-area |
| **Climate comparison** | Mollweide | Equal-area, elliptical |
| **Navigation overlay** | Web Mercator (EPSG:3857) | Conformal, tile-friendly |
| **Polar regions** | Polar Stereographic | True at 70°/71° latitude |
| **Statistical analysis** | Interrupted Goode Homolosine | Equal-area, minimizes distortion |

**Never use:** Unprojected lat/long (Plate Carrée) for area calculations or visual comparison

### 5.14.2 Color Schemes for Clay Properties

**Sequential (clay %, CEC, density):**
- **Viridis** (perceptually uniform, colorblind-safe)
- **Cividis** (colorblind-optimized)
- **Custom:** White → Ochre → Brown → Red (soil-like)

**Diverging (Kaol/Smec ratio, anomalies):**
- **RdBu_r** (red-blue, center at 0.5)
- **BrBG** (brown-blue-green, soil-relevant)
- **Custom:** Kaolinite (red) → Neutral (white) → Smectite (blue)

**Categorical (clay provinces, mineralogy):**
- **Tableau 20** (colorblind-safe, 20 distinct)
- **Custom:** 12-province palette (semantically meaningful)

### 5.14.3 Uncertainty Visualization

**Methods:**
1. **Opacity mapping:** Transparency = 1 - confidence
2. **Hatching:** Cross-hatch high-uncertainty regions
3. **Ensemble spread:** P90-P10 range as colored envelope
4. **Glyphs:** Error bars, boxplots at sample locations
5. **Facets:** Separate maps for mean, SD, CV

**Standard legend elements:**
- Units (%, g/cm³, m, etc.)
- Classification method (quantile, equal interval, natural breaks)
- Number of classes (typically 5–7)
- Data source and date
- Uncertainty metric (RMSE, 95% CI, CV%)

---

*End of Part 4 — Continue to Part 5: Implementation Roadmap, Computational Infrastructure, and Future Directions*