# DOCUMENT 5: Global Spatial Distribution Methodology
## Part 2 of 5: Remote Sensing Calibration, Uncertainty Quantification, and Paleoclimatic Proxy Validation

**Source Expansion**: DeepResearch/Global Geological Clay Deposit Mapping.pdf (Lines 130-140)
**Target**: ~180 lines per part × 5 parts = ~900 lines total
**Document ID**: DOC05_Global_Spatial_Distribution_Methodology.md

---

## 5.5 Remote Sensing Calibration: Hyperspectral Clay Mineral Mapping

### 5.5.1 Spectral Signatures of Clay Minerals (SWIR: 2.0–2.5 μm)

**Key absorption features (Hunt & Salisbury, 1970; Clark et al., 1990):**

| Mineral | Al-OH (μm) | Mg-OH (μm) | Fe-OH (μm) | H₂O/OH (μm) | Diagnostic |
|---------|------------|------------|------------|-------------|------------|
| **Kaolinite** | 2.165, 2.205 | — | — | 1.4, 1.9 | Double Al-OH |
| **Dickite** | 2.168, 2.208 | — | — | 1.4, 1.9 | Sharper doublet |
| **Halloysite** | 2.165, 2.205 | — | — | 1.4, 1.9 | Broader, 1.4 μm strong |
| **Montmorillonite** | 2.200 | 2.325 | — | 1.4, 1.9 | Al-OH + Mg-OH |
| **Nontronite** | — | — | 2.295 | 1.4, 1.9 | Fe-OH only |
| **Illite** | 2.200 | — | — | 1.4, 1.9 | Al-OH, no Mg-OH |
| **Chlorite** | — | 2.335, 2.355 | 2.255 | 1.4, 1.9 | Mg-OH + Fe-OH |
| **Palygorskite** | — | 2.320 | — | 1.4, 1.9, 2.4 | Mg-OH + 2.4 μm |
| **Sepiolite** | — | 2.315 | — | 1.4, 1.9, 2.4 | Mg-OH + 2.4 μm |

### 5.5.2 Sensor Systems for Clay Mapping

| Sensor | Platform | Bands (SWIR) | Spatial Res. | Revisit | Status |
|--------|----------|--------------|--------------|---------|--------|
| **ASTER** | Terra | 6 (2.145–2.430) | 30 m | 16 days | Operational |
| **PRISMA** | ASI | 80+ (contiguous) | 30 m | ~7 days | Operational |
| **EnMAP** | DLR | 80+ (contiguous) | 30 m | ~4 days | Operational |
| **EMIT** | ISS | 80+ (contiguous) | 60 m | ~3 days | Operational |
| **CHIME** | Copernicus | 80+ (contiguous) | 30 m | ~10 days | Planned (2028) |
| **SBG** | NASA | 80+ (contiguous) | 30 m | ~16 days | Planned (2027) |
| **AVIRIS-NG** | Aircraft | 400+ (contiguous) | 1–5 m | On-demand | Campaign |

### 5.5.3 Spectral Unmixing for Clay Abundance

**Linear Mixture Model (LMM):**
$$\mathbf{r} = \sum_{i=1}^M f_i \mathbf{e}_i + \mathbf{\epsilon}$$

where $\mathbf{r}$ = observed reflectance, $\mathbf{e}_i$ = endmember spectra, $f_i$ = fractions ($\sum f_i = 1, f_i \geq 0$)

**Endmember selection:**
1. **Library-based:** USGS spectral library (clark et al.)
2. **Image-derived:** PPI, N-FINDR, vertex component analysis
3. **Field-measured:** ASD FieldSpec (350–2500 nm)

**Clay-specific unmixing:**
- Endmembers: Kaolinite, Smectite, Illite, Chlorite, Quartz, Fe-oxides, Vegetation, Soil continuum
- Constraint: Clay fractions sum to clay% from field data
- Validation: Cross-validation with field XRD (R² target > 0.7)

### 5.5.4 Spectral Indices for Quick Clay Mapping

**Kaolinite Index (KI):**
$$\text{KI} = \frac{R_{2.165} - R_{2.205}}{R_{2.165} + R_{2.205}}$$

**Smectite Index (SI):**
$$\text{SI} = \frac{R_{2.200} - R_{2.325}}{R_{2.200} + R_{2.325}}$$

**Illite Crystallinity Index (ICI):**
$$\text{ICI} = \frac{R_{2.200} - R_{2.350}}{R_{2.200} + R_{2.350}}$$

**Clay Mineral Ratio (CMR):**
$$\text{CMR} = \frac{\text{KI}}{\text{SI} + 0.01}$$

### 5.5.5 Atmospheric Correction and Validation

**Atmospheric correction chain:**
1. **Radiometric calibration:** DN → radiance
2. **Atmospheric correction:** FLAASH, ATCOR, QUAC, or 6S
3. **Topographic correction:** C-correction, Minnaert
4. **BRDF correction:** Kernel-driven models (Ross-Li)

**Validation protocol:**
- **Field spectra:** Coincident ASD measurements (±1 hr overpass)
- **Sample collection:** GPS-located, <2 μm XRD
- **Statistics:** RMSE, bias, R² per mineral
- **Target:** RMSE < 10% absolute clay fraction

---

## 5.6 Uncertainty Quantification: Monte Carlo Propagation of Measurement Errors

### 5.6.1 Error Sources and Distributions

| Parameter | Error Source | Distribution | Typical Magnitude |
|-----------|--------------|--------------|-------------------|
| **Bulk density** | Core volume, mass | Normal | ±0.02 g/cm³ |
| **Thickness** | Auger depth, boundary | Log-normal | ±5–10% |
| **Depth to bedrock** | Auger refusal, geophysics | Uniform | ±10–30% |
| **Clay % (field)** | Texture by feel | Triangular | ±5–15% |
| **Clay % (lab)** | Pipette/hydrometer | Normal | ±2–3% |
| **XRD mineral %** | RIR, peak overlap | Normal | ±3–5% |
| **VES resistivity** | Contact, noise | Log-normal | ±10–20% |
| **Spectral unmixing** | Endmember, atmosphere | Normal | ±5–15% |

### 5.6.2 Monte Carlo Framework

**Algorithm:**
```python
def monte_carlo_propagate(params, n_iter=10000):
    """
    params: dict of {name: (mean, std, distribution)}
    Returns: distribution of derived quantities
    """
    samples = {}
    for name, (mean, std, dist) in params.items():
        if dist == 'normal':
            samples[name] = np.random.normal(mean, std, n_iter)
        elif dist == 'lognormal':
            samples[name] = np.random.lognormal(np.log(mean), std, n_iter)
        # ... other distributions
    
    # Compute derived quantities for each iteration
    derived = {}
    for i in range(n_iter):
        # e.g., porosity = 1 - rho_b/rho_s
        derived['porosity'].append(1 - samples['rho_b'][i]/samples['rho_s'][i])
        # e.g., clay_mass = thickness * area * rho_b * clay_fraction
        derived['clay_mass'].append(samples['thickness'][i] * area * 
                                     samples['rho_b'][i] * samples['clay_frac'][i])
    return derived
```

### 5.6.3 Sensitivity Analysis: Sobol Indices

**First-order index (main effect):**
$$S_i = \frac{V[E(Y|X_i)]}{V(Y)}$$

**Total-order index (including interactions):**
$$S_{Ti} = 1 - \frac{V[E(Y|X_{\sim i})]}{V(Y)}$$

**Typical results for clay mass estimate:**
| Parameter | $S_i$ | $S_{Ti}$ | Interpretation |
|-----------|-------|----------|----------------|
| Thickness | 0.45 | 0.52 | Dominant |
| Clay fraction | 0.30 | 0.38 | Major |
| Bulk density | 0.15 | 0.18 | Moderate |
| Area | 0.05 | 0.05 | Minor |
| Interactions | — | 0.15 | Non-negligible |

### 5.6.4 Uncertainty Reporting Standards

**Report for each mapped unit:**
- **Clay volume:** $V = 1.2 \times 10^9\ \text{m}^3\ (95\%\ \text{CI}: 0.9\text{--}1.6 \times 10^9)$
- **Clay mass:** $M = 2.4 \times 10^{12}\ \text{kg}\ (95\%\ \text{CI}: 1.8\text{--}3.2 \times 10^{12})$
- **Dominant uncertainty:** Thickness (45%), Clay fraction (30%)
- **Confidence level:** 95% (Monte Carlo, 10⁴ iterations)

---

## 5.7 Paleoclimatic Proxy Validation: Clay Mineralogy vs Independent Climate Records

### 5.7.1 Clay Minerals as Paleoclimate Proxies

**Proxy relationships (Chamley, 1989; Robert & Chamley, 1991):**

| Climate Parameter | Clay Proxy | Relationship | Calibration |
|-------------------|------------|--------------|-------------|
| **Mean Annual Temp (MAT)** | Kaolinite/(Kaol+Smec) | Positive (r = 0.78) | MAT = 12.5×KI + 8.2 (R²=0.61) |
| **Mean Annual Precip (MAP)** | Smectite/Kaolinite | Negative (r = -0.72) | MAP = -450×SI + 1800 (R²=0.52) |
| **Seasonality** | Illite/Smectite | Positive (r = 0.65) | Seasonality = 3.2×(Ill/Smec) + 0.4 |
| **Aridity** | Palygorskite presence | Threshold | >5% = Arid (MAP < 400 mm) |
| **Glacial/Interglacial** | Chlorite/Illite | Glacial: high Chl/Ill | Chl/Ill > 0.5 = Glacial |

### 5.7.2 Independent Validation Records

| Archive | Proxy | Temporal Res. | Climate Variable |
|---------|-------|---------------|------------------|
| **Ice cores** | δ¹⁸O, δD, CH₄, CO₂ | Annual–decadal | Temp, GHG |
| **Marine cores** | Foram δ¹⁸O, Mg/Ca, alkenones | Centennial–millennial | SST, ice volume |
| **Speleothems** | δ¹⁸O, δ¹³C, trace elements | Annual–decadal | Precip, temp |
| **Tree rings** | Ring width, δ¹³C, δ¹⁸O | Annual | Precip, temp |
| **Lake varves** | Thickness, composition | Annual | Precip, productivity |

### 5.7.3 Quantitative Validation: Marine Core MD03-2607 (Congo Fan)

**Site:** 6°S, 11°E, 3000 m water depth
**Core length:** 40 m (last 200 kyr)
**Sampling:** 2 cm (≈100 yr resolution)

**Clay record vs independent proxies:**

| Time (ka) | Kaol/(Kaol+Smec) | Foram δ¹⁸O (global ice) | Alkenone SST | Pollen (rainforest %) | Consistency |
|-----------|------------------|------------------------|--------------|----------------------|-------------|
| 0 (Holocene) | 0.85 | 3.2‰ | 27°C | 95% | ✓ Warm/wet |
| 20 (LGM) | 0.45 | 4.8‰ | 23°C | 40% | ✓ Cool/dry |
| 70 (MIS 4) | 0.55 | 4.5‰ | 24°C | 50% | ✓ |
| 125 (Eemian) | 0.90 | 3.0‰ | 28°C | 98% | ✓ Warmer/wetter |

**Correlation coefficients (200 kyr):**
- Kaol/(Kaol+Smec) vs SST: r = 0.82***
- Kaol/(Kaol+Smec) vs Rainforest %: r = 0.79***
- Smectite/Kaolinite vs δ¹⁸O: r = 0.75***

### 5.7.4 Validation Uncertainty and Non-Climatic Factors

**Non-climatic influences on clay mineralogy:**
1. **Source rock changes:** Tectonics, unroofing
2. **Transport sorting:** Hydrodynamic fractionation
3. **Diagenesis:** Burial alteration (smectite→illite)
4. **Reworking:** Older sediments mixed in

**Quantifying non-climatic noise:**
- **Variance decomposition:** Climate = 55%, Source = 25%, Diagenesis = 15%, Noise = 5%
- **Mitigation:** Multi-proxy approach, source-rock tracing (Zr, Ti, REE)

---

*End of Part 2 — Continue to Part 3: Tectonic Overprint Assessment, Data Management Schema, and Interoperability*