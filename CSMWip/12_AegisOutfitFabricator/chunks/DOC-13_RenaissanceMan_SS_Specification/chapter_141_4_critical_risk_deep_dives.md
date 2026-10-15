## 4. Critical Risk Deep Dives

### 4.1 RM-SS-01: EMI Marginal at 1 GHz (RPN 147)

**Root Cause:** Thinner MXene coating (20µm vs 30µm RM-TS) + smaller aperture density

**Quantitative Analysis:**
- Base SE (L3+L6): 58.5 dB @ 1 GHz
- Requirement: 60 dB @ 1 GHz (MIL-STD-461G RS103)
- Gap: -1.5 dB

**Mitigation Layers:**
1. **Design:** MXene tape at all 15 seams (10mm × 5mm overlap) → +3.2 dB
2. **Operational:** Pre-mission seam tape verification (checklist item)
3. **Monitoring:** PVDF sensors detect EMI ingress >55 dB threshold
4. **Fallback:** If tape degraded, reduce mission duration in >1 GHz threat environment

**Validation:** Post-tape SE = 61.7 dB @ 1 GHz ✓

### 4.2 RM-SS-02: Thin Aerogel Thermal Margin (RPN 128)

**Root Cause:** 2mm aerogel (R=0.143) vs 3mm baseline (R=0.214) → 33% less insulation

**Quantitative Analysis:**
- Required: T_skin < 60°C @ 1100°C/300s
- Achieved: T_skin = 58°C (2°C margin)
- Aerogel contribution: ΔT = 7,150°C theoretical (radiation limited)

**Mitigation Layers:**
1. **Design:** YInMn Blue 95% NIR reflect rejects 38% incident flux pre-stack
2. **Design:** Ceramic tiles (L2/L7) radiative sharing at high temp
3. **Operational:** Chimney ventilation (20 baleen channels) → 2.5 L/min airflow
4. **Monitoring:** Skin temp telemetry, auto-alert at 55°C

**Validation:** Transient FEM confirms 58°C @ 300s ✓

### 4.3 RM-SS-03: 20mm Tile Multi-Hit (RPN 90)

**Root Cause:** Thinner tiles (20mm vs 25mm RM-TS) → less fracture energy absorption

**Quantitative Analysis:**
- Single-tile V₅₀: 920 m/s (vs 955 m/s RM-TS)
- Edge tile V₅₀: 880 m/s (vs 920 m/s RM-TS)
- Backup tile (15mm): V₅₀ = 620 m/s

**Mitigation Layers:**
1. **Design:** 3-hit capability (2 primary adjacent + 1 backup)
2. **Design:** Magnetic confinement + gasket + clamps → edge V₅₀ +100 m/s
3. **Material:** ZrB₂-SiC 99.5% density, 18 GPa hardness
4. **Test:** NIJ multi-hit protocol (3 shots, 50mm spacing) ✓

### 4.4 RM-SS-05: Fewer Baleen Stays (RPN 96)

**Root Cause:** 20 stays vs 24 RM-TS → 20% fewer, higher per-stay load

**Quantitative Analysis:**
- CF stay load: 60 N × 2 lacing = 120 N
- CF stay P_cr: 764 N (Euler, L=380mm)
- SF = 6.4 (vs 6.0 requirement) ✓

**Mitigation Layers:**
1. **Design:** Steel spirals at 4 high-stress locations (sleeve, side, back, waist)
2. **Design:** Tapered stays (10-20% taper) optimize buckling
3. **Monitoring:** Strain gauges on CF/CB stays, alert at 80% P_cr
4. **Maintenance:** Monthly hydration maintains E=4.2 GPa

---
