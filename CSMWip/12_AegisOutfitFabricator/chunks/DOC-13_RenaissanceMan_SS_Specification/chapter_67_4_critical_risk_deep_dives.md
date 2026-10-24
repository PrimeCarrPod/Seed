## 4. Critical Risk Deep Dives

### 4.1 RMSS-CRIT-001: Thermal Margin Exhaustion (RPN 216)

**Failure Mode:** Aerogel thermal degradation → interior temperature exceeds 58°C limit during 1100°C/300s exposure

**Detailed Physics:**
- Current: Silica aerogel λ = 0.014 W/m·K, t = 2mm → R = 0.143 m²K/W
- Heat flux: 50 kW/m² (1100°C radiative + convective)
- Steady-state ΔT across L5: 7,150°C (theoretical, radiation limited)
- Actual interior: 56.8°C (transient, 300s) — **margin 1.2°C**

**Degradation Pathways:**
| Mechanism | λ Increase | Timeframe | Detection |
|-----------|------------|-----------|-----------|
| Moisture ingress | +0.002 W/m·K (14%) | 6 months (humid) | λ measurement |
| Mechanical compression | +0.003 W/m·K (21%) | 500 hr | Thickness gauge |
| Silica sintering | +0.005 W/m·K (36%) | 2000 hr @ 200°C | λ measurement |
| Dust contamination | +0.001 W/m·K (7%) | 1 year | Visual + λ |

**Worst-Case (All Combined):**
- λ_final = 0.014 + 0.011 = 0.025 W/m·K
- R_final = 0.002 / 0.025 = 0.08 m²K/W (44% loss)
- Interior temp increase: ΔT = 56.8 × (0.143/0.08 - 1) ≈ **45°C** → **102°C (FAIL)**

**Mitigation Effectiveness:**
| Mitigation | λ Reduction | Margin Recovery | TRL |
|------------|-------------|-----------------|-----|
| Pyrogel XTF (λ=0.012) | -0.002 | +0.8°C | 7 |
| 2-layer chiffon envelope | -0.001 (dust) | +0.4°C | 8 |
| Hydrophobic TMCS + silane | -0.0015 (moisture) | +0.6°C | 7 |
| Operational limits (30°C/3.5 met) | — | +1.5°C | 9 |

**Combined Recovery:** +3.3°C margin → **Total margin: 4.5°C** ✅

**Verification Plan:**
1. Accelerated aging: 85°C/85% RH, 1000 hr → λ measurement
2. Thermal cycling: -40°C to +85°C, 500 cycles → λ + thickness
3. Live fire: 1100°C/300s post-aging → interior temp
4. Field trial: 6 months, 3 climates → telemetry correlation

**Residual Risk:** RPN 216 → **Target 45** (S=9, O=3, D=2 with monitoring)

### 4.2 RMSS-CRIT-002: Zone-Selective STF Gap (RPN 225)

**Failure Mode:** Oblique impact at Z4 (chest) or Z5 (waist) → penetration due to no STF

**Ballistic Analysis:**
- Normal impact (0°): Ceramic L2 stops 7.62 AP, L7 catches spall — PASS
- Oblique 30°: Effective thickness reduced 13% → V₅₀ drops ~10%
- At Z4 (chest): 20mm tile + no STF → V₅₀ = 850 m/s (vs 942 req) — **MARGINAL**
- At Z5 (waist): Tile gap at side seam → projectile deflection into torso

**Test Data (Oblique 30°, 7.62×63 AP):**
| Zone | Configuration | V₅₀ (m/s) | BFS (mm) | Result |
|------|---------------|-----------|----------|--------|
| Z3 (STF) | L2+L8+L9 | 955 | 41 | PASS |
| Z4 (No STF) | L2+L9 | 850 | 48 | **FAIL** |
| Z5 (No STF) | L2+L9 | 840 | 49 | **FAIL** |
| Z4 (With STF) | L2+L8+L9 | 945 | 42 | PASS |

**STF Expansion Impact:**
| Change | Mass Delta | V₅₀ Recovery | Cost Delta |
|--------|------------|--------------|------------|
| Add STF Z4 | +0.06 kg | +95 m/s | +$800 |
| Add STF Z5 | +0.06 kg | +95 m/s | +$800 |
| **Total** | **+0.12 kg** | **Full recovery** | **+$1,600** |

**Cost-Benefit:** $1,600/garment for full NIJ IV compliance at all angles — **APPROVED**

**Implementation:** Production Lot 2 (Q3 2026) — STF Z4/Z5 standard

**Residual Risk:** RPN 225 → **Target 45** (S=9, O=3, D=2 with STF)

### 4.3 RMSS-CRIT-003: MXene Abrasion at Flex Zones (RPN 224)

**Failure Mode:** MXene delamination at high-flex seams (armhole, knee) → SE drops below 50 dB

**Mechanism:**
- Cyclic bending (arm raise: 2 Hz, 120°) → shear at MXene/silk interface
- After 200 hr: MXene crack density 12 cracks/mm² → percolation loss
- SE drop: 58 dB → 48 dB (10 dB loss) — **below 50 dB requirement**

**Accelerated Test (Bally Flex, 5 Hz, 90° bend):**
| Cycles | SE @ 1 GHz (dB) | MXene Coverage (%) |
|--------|-----------------|-------------------|
| 0 | 58.5 | 100% |
| 50,000 | 56.2 | 92% |
| 100,000 | 53.1 | 81% |
| 200,000 | 48.3 | 65% |
| 500,000 | 41.2 | 42% |

**PTFE Topcoat Mitigation (5 µm):**
| Cycles | SE @ 1 GHz (dB) | MXene Coverage (%) |
|--------|-----------------|-------------------|
| 0 | 58.5 | 100% |
| 200,000 | 56.8 | 96% |
| 500,000 | 54.2 | 89% |
| 1,000,000 | 51.5 | 78% |

**PTFE Extends Life 5×** — **SE >50 dB at 500,000 cycles (operational life)**

**Trade-off:**
- PTFE adds 5 µm thickness (negligible mass)
- PTFE reduces drape 3% (acceptable)
- PTFE cost: +$200/garment
- Application: Selective at flex zones only (armhole, knee, collar)

**Residual Risk:** RPN 224 → **Target 48** (S=8, O=4, D=2 with PTFE)

### 4.4 Cross-References

- Chapter 138: System-level risks
- Chapter 139: RM-SS specific risks
- Chapter 140: FMEA
- Chapter 142: Burn-down plan
- Chapter 65: Aerogel thermal
- Chapter 17/18: STF zones
- Chapter 56: MXene durability
- Chapter 77: Tile articulation
- Chapter 142: Burn-down plan

---
