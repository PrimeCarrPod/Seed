# Document 7: Microring Resonator Physics and Coupled Mode Theory
## Piece 9: Active Thermal Stabilization: PID Control Loop Design

---

### 7.9 Active Thermal Stabilization: PID Control Loop Design

Microring resonators are extremely sensitive to temperature fluctuations, with resonance wavelengths shifting at ~68 pm/K (8.8 GHz/K). For WDM systems with 50 GHz channel spacing, temperature must be stabilized to < 1 K, preferably < 0.1 K, requiring active thermal control loops.

#### 7.9.1 Thermal Plant Model

**Thermal circuit** (per ring heater):
- Heater power P(t) → temperature ΔT(t)
- Thermal resistance R_th (K/W)
- Thermal capacitance C_th (J/K)
- Transfer function: G_th(s) = ΔT(s)/P(s) = R_th/(1 + sτ)
- τ = R_th C_th ≈ 1-10 μs

**Resonance shift**:
Δλ(s) = (dλ/dT) ΔT(s) = K_th ΔT(s)
K_th = 68 pm/K = 8.8 GHz/K

**Open-loop transfer function**:
G_ol(s) = K_th R_th / (1 + sτ)

**Disturbance rejection**:
Ambient temperature T_amb(t) → ΔT_dist(s) = T_amb(s)/(1 + sτ_amb)
τ_amb ≈ 1-10 ms (package/board level)

#### 7.9.2 PID Controller Design

**PID transfer function**:
C(s) = K_p + K_i/s + K_d s
= K_p (1 + 1/(T_i s) + T_d s)

**Closed-loop transfer function** (setpoint tracking):
T(s) = C(s)G(s) / (1 + C(s)G(s))
G(s) = K_th R_th / (1 + sτ)

**Disturbance rejection**:
S(s) = 1 / (1 + C(s)G(s)) (sensitivity function)

**Design specifications**:
- Settling time < 1 ms
- Overshoot < 10%
- Steady-state error < 1 pm
- Disturbance rejection > 40 dB at 1 Hz

#### 7.9.3 PID Tuning Methods

**Ziegler-Nichols (ultimate gain)**:
1. Set K_i = K_d = 0
2. Increase K_p until sustained oscillations (K_u)
3. Measure oscillation period T_u
4. K_p = 0.6 K_u, T_i = 0.5 T_u, T_d = 0.125 T_u

**Cohen-Coon (for first-order + delay)**:
For G(s) = K e^{-Ls}/(τs+1):
K_p = (τ/K L) (1.33 + τ/(4L))
T_i = L (2.5 + 1.5 L/τ) / (1 + 0.6 L/τ)
T_d = 0.37 L / (1 + 0.2 L/τ)

**For thermal plant (L ≈ 0, τ = 10 μs)**:
Z-N: K_u ≈ 2π/(K_th R_th) ≈ 1.5 mW/pm
K_p = 0.9 mW/pm, T_i = 10 μs, T_d = 1.25 μs

**Practical tuning** (accounting for discretization):
K_p = 0.5-1 mW/pm
K_i = 100-500 mW/pm/s
K_d = 1-10 nW·s/pm

#### 7.9.4 Digital PID Implementation

**Discrete PID** (Tustin/bilinear):
u[k] = u[k-1] + K_p(e[k] - e[k-1])
+ K_i T_s/2 (e[k] + e[k-1])
+ K_d/T_s (e[k] - 2e[k-1] + e[k-2])

**Sampling period**: T_s = 1-10 μs
Anti-windup: Clamp integral term
Derivative filter: K_d/(1 + sT_f), T_f = T_s/2

**Fixed-point implementation** (for FPGA/ASIC):
Q16.16 format for coefficients
Saturation arithmetic for output
Integral anti-windup: back-calculation

**FPGA resources** (per ring):
- 1 DSP slice (multiply-accumulate)
- 4 registers (state)
- 2 BRAMs (lookup tables)
< 1% of small FPGA

#### 7.9.5 Sensor Requirements

**Resonance monitoring methods**:
1. **Dither locking**: Sinusoidal dither + synchronous detection
   - Modulate heater at f_dither (1-10 kHz)
   - Demodulate transmission at f_dither
   - Error signal = derivative of resonance
   - Resolution: < 1 fm

2. **Side-of-filter locking**:
   - Operate at 50% transmission point
   - ΔT ∝ ΔP_trans
   - Simple but 50% power loss

3. **Wavelength monitor** (external):
   - Arrayed waveguide grating + photodiodes
   - Measures absolute wavelength
   - Calibration-free

4. **Integrated photodiode** (drop/thru ratio):
   - Monitor drop/thru power ratio
   - Ratio = f(Δλ)
   - Common-mode rejection of input power fluctuations

**Noise requirements**:
- Shot noise limited: Δλ < 1 fm
- For 1 mW, 10 MHz BW: 100 photons/μs → 1% noise
- Need > 10 μW for < 1 fm resolution

#### 7.9.6 Multi-Ring Control Strategies

**Independent control**:
- One PID per ring
- Simple but ignores crosstalk
- Works if crosstalk < 5%

**Decoupled control**:
- Measure crosstalk matrix C
- Decouple: P = C⁻¹ P_desired
- Requires accurate C matrix

**Hierarchical control**:
- Global: wafer temperature (slow, high power)
- Local: ring heaters (fast, low power)
- Two-time-scale separation

**Coordinated control** (for Vernier rings):
- Master ring: reference (fixed)
- Slave ring: tuned to match
- Error = master resonance - slave resonance

**Model predictive control (MPC)**:
- Predict thermal evolution
- Optimize heater powers over horizon
- Handles constraints (power, temp limits)
- Computationally intensive

#### 7.9.7 Stability Analysis

**Loop gain**:
L(s) = C(s)G(s) = K_p K_th R_th (1 + 1/T_i s + T_d s)/(1 + sτ)

**Phase margin**:
PM = 180° + ∠L(jω_c)
Target: PM > 45°

**Gain margin**:
GM = 1/|L(jω_180)|
Target: GM > 6 dB

**Routh-Hurwitz** (characteristic equation):
(1 + sτ)(T_i s) + K_p K_th R_th T_i (1 + T_i s + T_d T_i s²) = 0

**Stability conditions**:
K_p > 0, K_i > 0, K_d > 0
K_p K_th R_th τ > T_i (1 + K_p K_th R_th)

**Robustness to parameter variation**:
τ varies ±50% (process)
K_th varies ±10% (wavelength)
Controller must remain stable

#### 7.9.8 Performance Metrics

**Settling time** (2% criterion):
t_s ≈ 4/(ζ ω_n)
ζ = damping, ω_n = natural frequency
For PM = 60°: ζ ≈ 0.6, t_s ≈ 7/ω_n

**Steady-state error**:
e_ss = 0 (integral action)
Ramp error: e_ss = 1/K_v
K_v = lim_{s→0} s C(s)G(s) = K_p K_i K_th R_th / T_i

**Disturbance rejection**:
|S(jω)| = |1/(1 + L(jω))|
At ω = 1 Hz: |S| < 0.01 (40 dB)
Requires |L(1 Hz)| > 100

**Integral of squared error (ISE)**:
ISE = ∫ e²(t) dt
Minimized by optimal PID tuning

#### 7.9.9 Multi-Objective Optimization

**Objectives**:
1. Minimize settling time
2. Minimize overshoot
3. Minimize control effort (power)
4. Maximize robustness

**Pareto front**: Trade-offs between objectives
K_p ↑ → faster but more overshoot
K_i ↑ → better disturbance rejection but slower
K_d ↑ → better damping but noise sensitive

**Optimization** (genetic algorithm, gradient-based):
J = w_1 t_s + w_2 OS + w_3 ∫u²dt + w_4 (1/PM)

**Adaptive PID**:
Gain scheduling based on operating point
K_p(T_amb), K_i(P_optical)
Online adaptation to workload

#### 7.9.10 Advanced Control Techniques

**Feedforward + Feedback**:
- Feedforward: Predict disturbance from workload
- Feedback: Correct residual error
- Reduces integral windup

**Smith predictor** (for delay):
Compensates for measurement delay
T_d = sensor + ADC + compute delay
Predicts plant output T_d seconds ahead

**Sliding mode control**:
Robust to parameter variations
Chattering at high frequency
Good for nonlinear plant

**Adaptive control**:
Recursive least squares for plant ID
Update controller gains online
Handles aging, process variation

**Machine learning control**:
Neural network controller
Trained on simulation + experimental data
Handles complex multi-ring interactions

**Quantum-limited control**:
Fundamental limit: thermodynamic uncertainty
ΔT ΔE ≥ k_B T²/C_th
Best possible stabilization: ΔT ≈ √(k_B T²/C_th)

---

*End of Piece 9. Next: Piece 10 - Noise Figure: Spontaneous Emission Factor in Resonant Enhancement*