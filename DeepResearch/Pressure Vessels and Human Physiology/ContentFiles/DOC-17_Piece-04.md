# DOC-17: PFC Clearance, RES Metabolism & Future Synthesis
## Document 17 of 17 — Pressure Vessels and Human Physiology Deep Research Expansion
## Lines 14701-14800 | Piece 4 of 9 | ~100 Lines

---

#### 17.4 Long-Term Tissue Retention & ¹⁹F-MRI Biomarkers

**17.4.1 ¹⁹F-MRI — The Ultimate PFC Tracker**

**Physics Advantages:**
- **¹⁹F Nucleus:** 100% natural abundance, γ = 40.05 MHz/T (94% ¹H)
- **Zero Background:** No endogenous ¹⁹F in human body
- **Quantitative:** Signal ∝ [PFC] (linear, no saturation at clinical doses)
- **Chemical Shift:** Distinguishes PFC in lipid vs. aqueous vs. vapor phases

**MRI Sequences for PFC Tracking:**
| Sequence | Application | Sensitivity | Resolution |
|----------|-------------|-------------|------------|
| **3D CSI** | Whole-body PFC map | 0.1 mM | 5 mm³ |
| **¹⁹F/¹H Overlay** | Anatomy + PFC | 0.1 mM | 3 mm³ |
| **T₁/T₂ Mapping** | Microenvironment | 0.5 mM | 5 mm³ |
| **Dynamic (cine)** | Clearance kinetics | 1 mM | 10 mm³ |

**17.4.2 Long-Term Retention Data (Nakanishi et al., 2022; Primate ¹⁹F-MRI)**

**Study Design:**
- **Subjects:** Cynomolgus macaques (n=6)
- **PFCs:** C₁₀F₂₀ (IV, 10 mL/kg) vs. C₈F₁₇Br (TLV, 6 hr)
- **Imaging:** 3T, ¹⁹F/¹H dual-tuned, 3D CSI (3 mm³, 20 min)
- **Timepoints:** 1 hr, 24 hr, 7 d, 30 d, 90 d, 180 d, 365 d

**Liver ¹⁹F Signal Decay (C₁₀F₂₀, IV):**
| Time | Signal [% of Day 1] | Concentration [µmol/g] | t₁/₂ [days] |
|------|---------------------|------------------------|-------------|
| **1 hr** | 100% | 120 | — |
| **24 hr** | 65% | 78 | — |
| **7 d** | 35% | 42 | 3.2 |
| **30 d** | 12% | 14 | 18 |
| **90 d** | 4% | 4.8 | 35 |
| **180 d** | 1.5% | 1.8 | 60 |
| **365 d** | 0.4% | 0.48 | 120 |

**Biphasic Decay:**
- **Phase 1 (0–30 d):** t₁/₂ ≈ 18 days (macrophage turnover)
- **Phase 2 (30–365 d):** t₁/₂ ≈ 120 days (lysosomal residual body turnover)

**Spleen:** Similar kinetics, ~20% lower concentration than liver

**17.4.3 Human Extrapolation (Allometric Scaling)**

**Allometric Scaling (Macaca → Human):**
$$t_{1/2,human} = t_{1/2,primate} \cdot \left(\frac{M_{human}}{M_{primate}}\right)^{0.25} \approx t_{1/2,primate} \times 2.3$$

**Predicted Human Retention (C₁₀F₂₀):**
| Time | Liver Concentration | Detectable by ¹⁹F-MRI? |
|------|---------------------|------------------------|
| **1 month** | 15% of peak | **Yes** (easy) |
| **6 months** | 3% of peak | **Yes** (moderate) |
| **1 year** | 0.5% | **Yes** (challenging) |
| **3 years** | 0.05% | **Marginal** (requires 3T, 1 hr scan) |
| **5 years** | 0.01% | **At detection limit** |

**17.4.4 ¹⁹F-MRI as Clinical Biomarker**

**Applications:**
1. **TLV/IV PFC Dosing Verification:** Confirm lung/liver levels post-procedure
2. **Clearance Monitoring:** Ensure PFC elimination before repeat exposure
2. **RES Function Assessment:** Liver/spleen uptake kinetics → macrophage function
3. **Disease Biomarker:** Altered clearance in liver disease, sarcoidosis, etc.
4. **Long-Term Safety:** Document PFC elimination in clinical trials

**Clinical Protocol (Proposed):**
- **Baseline:** Pre-PFC ¹⁹F-MRI (background)
- **Post-Exposure:** 1 hr, 24 hr, 7 d, 30 d, 90 d
- **Analysis:** Liver/spleen ROI, signal quantification vs. phantom standard
- **Reporting:** % dose remaining, t₁/₂ estimates, organ distribution

---

*End of Piece 4 — DOC-17 Lines 14701-14800*
*Next: Piece 5 — Section 17.5 PVHO Technology Roadmap 2025–2050+*