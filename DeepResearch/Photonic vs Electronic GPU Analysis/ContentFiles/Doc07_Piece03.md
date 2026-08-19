# Document 7: Microring Resonator Physics and Coupled Mode Theory
## Piece 3: Free Spectral Range (FSR) and Vernier Effect for Channel Selection

---

### 7.3 Free Spectral Range (FSR) and Vernier Effect for Channel Selection

The Free Spectral Range (FSR) is the wavelength spacing between adjacent resonance peaks of a microring resonator. For WDM applications, understanding FSR and the Vernier effect (using two rings with slightly different FSRs) is essential for channel selection and filtering.

#### 7.3.1 FSR Fundamentals

**Resonance condition**:
m λ_m = n_eff L
where m = integer mode number, L = 2πR (circumference)

**Wavelength spacing** between adjacent modes:
Δλ = λ_m - λ_{m+1}

**FSR in wavelength**:
FSR_λ = λ² / (n_g L)
where n_g = n_eff - λ dn_eff/dλ (group index)

**FSR in frequency**:
FSR_f = c / (n_g L)

**Typical values** (SOI, R = 10 μm, n_g = 4.2):
L = 62.8 μm
FSR_λ = 1550² / (4.2 × 62.8) ≈ 9.1 nm (1130 GHz)
FSR_f = 3×10⁸ / (4.2 × 62.8×10⁻⁶) ≈ 1.13 THz

**FSR scaling**:
FSR ∝ 1/R (larger rings → smaller FSR)
FSR ∝ 1/n_g

#### 7.3.2 Channel Spacing and FSR Matching

**ITU-T grid**: 50 GHz (0.4 nm), 100 GHz (0.8 nm), 200 GHz (1.6 nm)

**FSR matching requirement**:
For single-ring channel dropping:
FSR must be > signal bandwidth + guard band

**Example**: 100 GHz channels, 32 channels
Signal bandwidth: 32 × 100 GHz = 3.2 THz
Required FSR > 3.2 THz
→ R < c/(n_g FSR) = 3e8/(4.2 × 3.2e12) ≈ 22 μm

**Trade-off**:
Small R → large FSR (good for many channels)
But small R → high bending loss, large α
Practical range: R = 5-20 μm for SOI

#### 7.3.3 Vernier Effect: Dual-Ring Channel Selection

**Principle**: Two rings with slightly different FSRs
Ring 1: FSR₁ = c/(n_g L₁)
Ring 2: FSR₂ = c/(n_g L₂)

**Vernier FSR** (coincidence period):
FSR_V = FSR₁ FSR₂ / |FSR₁ - FSR₂|

**Effective FSR enhancement**:
FSR_V / FSR₁ = FSR₂ / |FSR₁ - FSR₂| ≫ 1

**Example**:
FSR₁ = 1000 GHz, FSR₂ = 1010 GHz
FSR_V = 1000×1010/10 = 101,000 GHz = 101 THz
100× enhancement!

**Channel selection**:
Only wavelengths where both rings resonate simultaneously pass through
All other channels suppressed

#### 7.3.4 Vernier Ring Design Equations

**Ring lengths**:
L₁ = m₁ λ / n_eff
L₂ = m₂ λ / n_eff

**FSR ratio**:
FSR₁/FSR₂ = L₂/L₁ = m₂/m₁

**Vernier order**:
N = m₂ - m₁ (difference in mode numbers)

**FSR_V**:
FSR_V = FSR₁ / N = FSR₂ / (N-1) (for m₂ = m₁ + N)

**Channel spacing**:
Δλ_ch = FSR₁ / M (M = number of channels per FSR)
Vernier channels: every N-th channel of ring 1

#### 7.3.5 Cascaded Vernier Rings

**Two rings in series** (add-drop):
Input → Ring 1 → Ring 2 → Through
Drop port: only when both resonate

**Transfer function**:
T(ω) = T₁(ω) T₂(ω)
Peaks only at coincident resonances

**Extinction ratio**:
ER = ER₁ × ER₂
Typical single ring ER: 20-30 dB
Vernier ER: 40-60 dB

**Bandwidth**:
Individual ring: Δλ_FWHM
Vernier passband: Δλ_V ≈ Δλ_FWHM (same)
But only every N-th channel

#### 7.3.6 Vernier Effect for Wavelength Tuning

**Tuning one ring**:
Δλ_T = λ (dn/dT) ΔT / n_g
Shift one ring's resonances relative to the other

**Channel switching**:
Vernier order N channels
Tuning range: Δλ_T = FSR₁ (full channel spacing)
Switches which channel is selected

**Tuning efficiency**:
ΔT per channel = FSR₁ / (dλ/dT)
For FSR₁ = 1000 GHz, dλ/dT = 0.1 nm/°C:
ΔT = 0.8 nm / 0.1 nm/°C = 8°C per channel

**Power consumption**:
P = C_th ΔT / τ
C_th ≈ 10⁻¹⁰ J/K, τ = 1 μs
P ≈ 0.8 mW per channel switch

#### 7.3.7 Fabrication Tolerance for Vernier

**Length mismatch**:
ΔL = L₂ - L₁
Required precision: ΔL < λ/(10 n_g)

**For λ = 1550 nm, n_g = 4.2**:
ΔL < 37 nm

**Mode number error**:
If m₁, m₂ integers, L₁/L₂ = m₁/m₂
Fabrication error → non-integer ratio → phase drift

**Phase matching condition**:
φ₁ + φ₂ = 2π integer at target λ
Δφ = (2π/λ) n_g ΔL < π/10

**Practical tolerance**:
Length control: ±5 nm (EUV)
Angle control: ±0.1°

#### 7.3.8 Multi-Vernier Cascades

**Three rings** (two Vernier stages):
FSR_V,eff = FSR_V₁ FSR_V₂ / |FSR_V₁ - FSR_V₂|
Enormous effective FSR (THz → PHz)

**Applications**:
- Ultra-narrow filtering
- Single-channel selection from 100+ channels
- Optical signal processing (format conversion)

**Complexity**:
- More rings = more loss
- Alignment sensitivity increases
- Tuning complexity: multi-dimensional

#### 7.3.9 Vernier in MRR Weight Banks

**Weight bank architecture**:
N rings with slightly different radii
Each ring tuned to different channel
Vernier effect separates channels

**Broadcast-and-weight**:
Single bus waveguide
N rings side-coupled
Each ring extracts one wavelength

**Crosstalk**:
Adjacent ring coupling
Vernier suppression of unwanted channels
ER ≈ 30-40 dB per ring
Cascaded: ER_total = ER^N

#### 7.3.10 Future: Active Vernier and Reconfigurable FSR

**Active FSR tuning**:
Carrier injection → Δn_eff → ΔFSR
ΔFSR/FSR = -Δn_g/n_g

**Reconfigurable channel spacing**:
Electrically adjust Vernier order
Change number of channels dynamically

**Integrated Vernier on SOI**:
- Two rings with microheaters
- Independent thermal control
- Channel selection in < 10 μs

**Quantum applications**:
Vernier for photon pair filtering
Entanglement purification via spectral filtering

---

*End of Piece 3. Next: Piece 4 - Thermo-Optic Coefficient: dn/dT = 1.86×10⁻⁴ K⁻¹ (Si)*