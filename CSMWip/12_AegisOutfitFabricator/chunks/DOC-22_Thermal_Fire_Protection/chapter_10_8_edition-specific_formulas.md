## 8. Edition-Specific Formulas

### 8.1 Aerogel Batting Thickness Scaling

```
t_batting = t_base × (Mₑ/M_ref)^0.5 × (1 + αₑ)
t_base = 15mm (RM-TS reference)
Mₑ/M_ref = edition mass scaling
αₑ = morphology exponent (MAT-04)
```

### 8.2 Effective Thermal Resistance

```
R_total = R_UHTC + R_ceramic1 + R_aerogel + R_ceramic2 + R_MR + R_PCM + R_STF
R_UHTC ≈ 0 (thin coating)
R_ceramic = L/k = 0.006/65 = 9.2×10⁻⁵ m²K/W (negligible)
R_aerogel = t_batting / λ_eff
R_PCM = t_PCM / k_PCM (sensible) + Q_latent / q_flux (latent)
```

### 8.3 UHTC Coating Mass

```
m_UHTC = A_coated × (ρ_YInMn × t_YInMn + ρ_QD × t_QD)
ρ_YInMn = 5.2 g/cm³, ρ_QD = 4.8 g/cm³
A_coated = tile area + panel area (edition-specific)
```

### 8.4 PCM Thermal Capacity

```
Q_latent = m''_PCM × ΔH_fus × A_PCM
m''_PCM = 3.2 kg/m² (RT27HC)
ΔH_fus = 250 kJ/kg
A_PCM = edition coverage area
```

### 8.5 Thermal Time Constant

```
τ = ρ × c × L² / k (per layer)
System τ_eff = Σ τ_i (series)
Transient response: T(t) = T_ext × (1 - exp(-t/τ_eff)) + T_PCM(t)
```

---
