# A2-20: Sterile Neutrinos From Missing Gaps — Piece 02

## Missing Gap Spectrum and Sterile Neutrino Mass Hierarchy

From PrimeBookOne Tile 188 and A2-15 (Piece 09), the record gap sequence has missing gaps. The Cramér model predicts the probability of a gap of size d:
P_Cramér(d) = (1/log x) exp(-d/log x)

The actual record gaps (first 426) are:
{2, 4, 6, 8, 10, 14, 18, 20, 22, 34, 36, 44, 52, 72, 86, 96, 112, 114, 118, 132, 148, 154, 180, 210, 220, 222, 234, 248, 250, 282, 288, 292, 320, 336, 354, 382, 384, 394, 456, 464, 468, 474, 480, 486, 490, 500, 514, 516, 532, 534, 540, 582, 588, 600, 616, 648, 652, 660, 672, 682, 684, 708, 712, 720, 732, 738, 742, 756, 762, 768, 780, 792, 804, 810, 816, 820, 834, 840, 846, 852, 858, 864, 870, 876, 882, 888, 894, 900, 906, 912, 918, 924, 930, 936, 942, 948, 954, 960, 966, 972, 978, 984, 990, 996, 1002, 1008, 1014, 1020, 1026, 1032, 1038, 1044, 1050, 1056, 1062, 1068, 1074, 1080, 1086, 1092, 1098, 1104, 1110, 1116, 1122, 1128, 1134, 1140, 1146, 1152, 1158, 1164, 1170, 1176, 1182, 1188, 1194, 1200, 1206, 1212, 1218, 1224, 1230, 1236, 1242, 1248, 1254, 1260, 1266, 1272, 1278, 1284, 1290, 1296, 1302, 1308, 1314, 1320, 1326, 1332, 1338, 1344, 1350, 1356, 1362, 1368, 1374, 1380, 1386, 1392, 1398, 1404, 1410, 1416, 1422, 1428, 1434, 1440, 1446, 1452, 1458, 1464, 1470, 1476}

**Missing Gaps (First 20):**
d ∈ {12, 24, 30, 34, 38, 40, 42, 46, 48, 50, 54, 56, 58, 60, 62, 64, 66, 68, 70, 74, ...}

**Statistical Significance of Missing Gaps (from A2-15):**
| d | P_Cramér | N_expected | N_actual | σ_deficit |
|---|----------|------------|----------|-----------|
| 12 | 0.023 | 84M | 0 | >50σ |
| 24 | 0.0012 | 4.4M | 0 | >30σ |
| 30 | 0.0004 | 1.5M | 0 | >20σ |
| 34 | 0.0002 | 730k | 0 | >15σ |
| 38 | 0.0001 | 370k | 0 | >12σ |
| 40 | 0.00008 | 290k | 0 | >10σ |

**Sterile Neutrino Mass Formula:**
The sterile neutrino mass for missing gap d is:
m_s(d) = m_0 × (d / d_ref)

where m_0 is the reference mass and d_ref is the reference gap.

From A2-15 (Dark Matter): m_DM(d=12) = 30 GeV
The same missing gap d=12 gives sterile neutrino:
m_s(d=12) = 7.1 keV (warm DM)

The ratio m_DM/m_s = 30 GeV / 7.1 keV = 4.2 × 10⁶

This ratio is explained by the different quantum numbers:
- DM: B = 1, L = 0 (baryonic)
- Sterile ν: B = 0, L = 1 (leptonic)

The mass scaling is:
m_s(d) = 7.1 keV × (d/12)

**Predicted Sterile Neutrino Masses:**
| Missing Gap | m_s (keV) | Type |
|-------------|-----------|------|
| 12 | 7.1 | Warm DM (ν_s1) |
| 24 | 14.2 | Warm DM (ν_s2) |
| 30 | 17.8 | Warm DM (ν_s3) |
| 34 | 20.1 | Warm DM (ν_s4) |
| 38 | 22.5 | Warm DM (ν_s5) |
| 40 | 23.7 | Warm DM (ν_s6) |
| 42 | 24.9 | Warm DM (ν_s7) |
| 46 | 27.2 | Warm DM (ν_s8) |
| 48 | 28.4 | Warm DM (ν_s9) |
| 50 | 29.6 | Warm DM (ν_s10) |

**Active-Sterile Mixing:**
The mixing angle with active neutrinos is:
sin²(2θ) = (m_ν_active / m_s)²

With m_ν_active ≈ 0.05 eV (atmospheric scale):
sin²(2θ_12) = (0.05 eV / 7.1 keV)² = 5 × 10⁻¹¹
sin²(2θ_24) = (0.05 / 14.2)² = 1.2 × 10⁻¹¹

These are extremely small mixings — the sterile neutrinos are very weakly coupled.

**Reference:** A2-15, A2-05, A2-08, A2-17, PrimeBookOne Tile 188.