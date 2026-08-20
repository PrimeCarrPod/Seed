# Document 7: Microring Resonator Physics and Coupled Mode Theory
## Piece 2: Critical Coupling Condition: κ² = 1 - e^(-αL)

---

### 7.2 Critical Coupling Condition: κ² = 1 - e^(-αL)

The critical coupling condition is the fundamental design principle for microring resonators, determining when light is completely transferred from the bus waveguide to the ring (or completely extinguished in the through port). This piece derives the condition from first principles and explores its practical implications.

#### 7.2.1 Power Coupling Coefficient

**Field coupling coefficient**: κ (amplitude)
**Power coupling coefficient**: K = |κ|²
**Transmission coefficient**: T = 1 - K (for lossless coupler)

**Directional coupler** (two parallel waveguides):
Coupled-mode equations:
dA/dz = -jκ B
dB/dz = -jκ A

**Power transfer** after length L_c:
P_B/P_A = sin²(|κ| L_c)
P_A/P_A = cos²(|κ| L_c)

**3dB coupler**: |κ| L_c = π/4 → K = 0.5
**Cross state**: |κ| L_c = π/2 → K = 1

#### 7.2.2 Round-Trip Loss in Ring

**Round-trip amplitude transmission**:
r = e^{-αL/2} (field)
where α = power loss coefficient (dB/cm or 1/m), L = 2πR

**Round-trip power transmission**:
r² = e^{-αL}

**Intrinsic quality factor**:
Q_0 = 2π n_g / (λ α)
where n_g = group index, α in 1/m

**Round-trip phase shift**:
φ = β L = (2π n_eff / λ) L

#### 7.2.3 Resonant Field Buildup

**Single round-trip**:
After one round trip: b_1 = r e^{jφ} κ a_in
After N round trips: b_N = Σ_{n=1}^N r^n e^{jnφ} κ a_in

**Steady-state** (infinite sum):
b = κ a_in Σ_{n=0}^∞ (r e^{jφ})^n
= κ a_in / (1 - r e^{jφ})

**On resonance** (φ = 2πm):
b_res = κ a_in / (1 - r)

**Energy enhancement**:
|b_res|² / |a_in|² = K / (1 - r)²

#### 7.2.4 Through Port Transmission

**Through port field**:
a_out = a_in - κ* b
= a_in [1 - K / (1 - r e^{jφ})]

**Transmission coefficient**:
t(φ) = a_out/a_in = (1 - r e^{jφ} - K) / (1 - r e^{jφ})

**Power transmission**:
T(φ) = |t(φ)|² = |1 - r e^{jφ} - K|² / |1 - r e^{jφ}|²

**On resonance** (φ = 2πm):
T_res = |1 - r - K|² / |1 - r|²
= (1 - r - K)² / (1 - r)²

#### 7.2.5 Critical Coupling Derivation

**Critical coupling**: T_res = 0 (complete extinction)
Condition: 1 - r - K = 0
→ K = 1 - r

**Substitute r = e^{-αL/2}**:
K = 1 - e^{-αL/2}

**Wait** - this is for field coupling. Let's re-derive carefully.

**Power coupling coefficient K** relates to field coupling κ:
K = |κ|²

**Round-trip field attenuation**: r = e^{-αL/2}
**Round-trip power attenuation**: r² = e^{-αL}

**Field after one round trip**: b_1 = r e^{jφ} κ a_in
**Total field**: b = κ a_in / (1 - r e^{jφ})

**Through port**: a_out = a_in - κ* b = a_in - |κ|² a_in / (1 - r e^{jφ})

**On resonance**: a_out = a_in [1 - K/(1 - r)]
T_res = |1 - K/(1 - r)|²

**Critical coupling** (T_res = 0):
1 - K/(1 - r) = 0
→ K = 1 - r

**Since r = e^{-αL/2}**:
K_crit = 1 - e^{-αL/2}

**For small αL**: e^{-αL/2} ≈ 1 - αL/2
K_crit ≈ αL/2

**Alternative form** (using power round-trip):
Let ρ = r² = e^{-αL} (power round-trip)
K_crit = 1 - √ρ = 1 - e^{-αL/2}

This is the standard critical coupling condition!

#### 7.2.6 Critical Coupling in Terms of Q-Factors

**Loaded Q**: Q_L = ω_0 / (γ_0 + γ_c)
**Intrinsic Q**: Q_0 = ω_0 / γ_0
**Coupling Q**: Q_c = ω_0 / γ_c

**Critical coupling**: γ_c = γ_0
→ Q_c = Q_0
→ 1/Q_L = 1/Q_0 + 1/Q_0 = 2/Q_0
→ Q_L = Q_0/2

**Coupling coefficient**:
K = γ_c / (γ_0 + γ_c) = Q_L / Q_c

**At critical coupling**: K = 1/2 (for symmetric add-drop)
For all-pass: K_crit = 1 - e^{-αL/2}

#### 7.2.7 Practical Design Implications

**Loss-limited coupling**:
For α = 3 dB/cm = 690 1/m, R = 10 μm (L = 62.8 μm):
αL = 690 × 62.8×10⁻⁶ = 0.043
K_crit = 1 - e^{-0.043/2} = 1 - 0.979 = 0.021 (2.1%)

**Low-loss ring** (α = 0.1 dB/cm):
αL = 0.0043
K_crit = 0.00215 (0.2%)

**High-loss ring** (α = 10 dB/cm):
αL = 0.14
K_crit = 0.067 (6.7%)

**Design rule**: Lower loss → weaker coupling needed for critical coupling

#### 7.2.8 Fabrication Tolerance Analysis

**Coupling sensitivity**:
dK/dg = -K/g_0 (exponential gap dependence)
g_0 ≈ 30-50 nm

**Critical gap**:
g_crit = g_0 ln(K_0/K_crit)

**Gap variation** (σ_g = 2 nm):
σ_K/K = σ_g/g_0 ≈ 4-7%

**Critical coupling tolerance**:
For K_crit = 0.02, σ_K = 0.0008
ΔT_res/T_max ≈ 2(ΔK/K_crit) ≈ 8% per nm gap error

**Wavelength sensitivity**:
dλ_crit/dK = λ/(2Q_c) ≈ 0.1 nm/%

#### 7.2.9 Active Critical Coupling Tuning

**Thermo-optic tuning**:
dn/dT = 1.86×10⁻⁴ K⁻¹
Δn = 1.86×10⁻⁴ ΔT
ΔK/K ≈ 2 Δn/n ≈ 10⁻⁴/°C

**Carrier injection tuning**:
Δn = -8.8×10⁻²² ΔN_e
ΔK/K ≈ 2|Δn|/n

**MEMS tuning**:
Physical gap change Δg
ΔK/K = -Δg/g_0

**Closed-loop control**:
Monitor through-port power
PID adjust heater/current to maintain T=0

#### 7.2.10 Critical Coupling in Add-Drop Filters

**Add-drop configuration**:
Through: T = |(1 - r - K₁)|² / |1 - r|²
Drop: D = 4 K₁ K₂ / |1 - r|² (on resonance)

**Critical coupling for drop port**:
Maximize D → dD/dK₁ = 0 with K₂ fixed
K₁ = 1 - r (same as all-pass!)

**Symmetric add-drop** (K₁ = K₂ = K):
D_max = K² / (1 - r)²
At critical: K = 1 - r → D_max = 1 (100% drop efficiency)

**Over-coupled add-drop**:
K > 1 - r → D < 1, T > 0
Through port not fully extinguished

**Under-coupled add-drop**:
K < 1 - r → D < 1, T > 0
Drop port not fully populated

---

*End of Piece 2. Next: Piece 3 - Free Spectral Range (FSR) and Vernier Effect for Channel Selection*