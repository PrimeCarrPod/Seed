# A2-20: Sterile Neutrinos From Missing Gaps — Piece 03

## Seesaw Mechanism From Gap Hierarchy

The seesaw mechanism (Minkowski 1977, Yanagida 1979, Gell-Mann-Ramond-Slansky 1979) explains the smallness of active neutrino masses. In the Prime Electron framework, the seesaw emerges from the gap hierarchy between record gaps and missing gaps.

**Gap Hierarchy as Seesaw:**
The record gaps (d_record) correspond to active fermion masses:
m_active ∝ 1/d_record

The missing gaps (d_missing) correspond to sterile fermion masses:
m_sterile ∝ d_missing

The seesaw formula:
m_ν = m_D² / M_R

In gap language:
m_ν = (κ/d_record)² / (κ/d_missing) = κ · (d_missing / d_record²)

For the electron neutrino (d_record = d_2 = 2 for electron mass):
m_ν_e = κ · (d_missing / 4)

With κ = 5.1 × 10⁻³ GeV⁻¹ = 5.1 MeV⁻¹:
m_ν_e = 5.1 MeV⁻¹ × (d_missing / 4)

This gives the wrong scale. Let's use the correct mapping from A2-01 (Gap_To_Energy_Mapping):
E_n = ℏ/(κ·d_n)

For active neutrinos, the Dirac mass comes from the electroweak scale (v = 246 GeV):
m_D = v · (d_weak / d_record)

The Majorana mass comes from the missing gap scale:
M_R = (κ/d_missing) · m_Pl (GUT scale) or M_R = m_weak · (d_missing/d_weak)

**Correct Seesaw from Gap Scales:**
There are two seesaw scales in the Prime Electron framework:

1. **GUT Seesaw (Type I):**
M_R = M_GUT = (κ/d_426) m_Pl = 2 × 10¹⁶ GeV (from A2-14)
m_D = v = 246 GeV (electroweak)
m_ν = v²/M_GUT = (246 GeV)²/(2×10¹⁶ GeV) = 3 × 10⁻³ eV — too small for atmospheric scale.

2. **Missing Gap Seesaw (New):**
The missing gaps provide intermediate-scale Majorana masses:
M_R(d_missing) = m_weak · (d_missing / d_weak)

With d_weak = d_2 = 2 (twin prime, electroweak scale):
M_R(12) = 246 GeV × (12/2) = 1.48 TeV
M_R(24) = 2.95 TeV
M_R(30) = 3.69 TeV

The Dirac masses for neutrinos are:
m_D = v · (d_ν / d_weak) where d_ν is the "neutrino gap"

From A2-09 (Neutrino_Mass_From_Gap_Asymmetry): m_ν ~ 0.05 eV from gap asymmetry.
The active neutrino mass matrix is determined by the gap asymmetry Δd = d_odd - d_even.

**Missing Gap Seesaw Formula:**
m_ν = m_D² / M_R(d_missing)
= [v · (d_ν/2)]² / [246 GeV · (d_missing/2)]
= (v/246 GeV) · (d_ν² / d_missing) · 246 GeV
= d_ν² / d_missing · 246 GeV

For m_ν = 0.05 eV = 5 × 10⁻¹¹ GeV:
5 × 10⁻¹¹ = (d_ν² / d_missing) × 246
d_ν² / d_missing = 2 × 10⁻¹³

With d_missing = 12: d_ν² = 2.4 × 10⁻¹² → d_ν ≈ 1.5 × 10⁻⁶ (not an integer gap)

This suggests the Dirac mass is not from a record gap but from the gap asymmetry (A2-09).

**Unified Gap Seesaw:**
The complete neutrino mass matrix has contributions from:
- Record gaps (Dirac masses for charged leptons)
- Missing gaps (Majorana masses for sterile neutrinos)
- Gap asymmetry (Dirac masses for neutrinos)

The PMNS matrix (A5-02 future) emerges from the overlap of these gap structures.

**Prediction for Sterile Neutrinos:**
The missing gaps d = 12, 24, 30, ... give sterile neutrinos with Majorana masses:
M_R = 1.48, 2.95, 3.69, 4.18, 4.65, 4.92 TeV

These are accessible at future colliders (FCC, muon collider).

**Reference:** A2-01, A2-08, A2-09, A2-14, A2-15, A5-02 (future).