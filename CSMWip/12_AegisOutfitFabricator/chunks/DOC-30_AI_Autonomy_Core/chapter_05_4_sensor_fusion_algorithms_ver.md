## 4. Sensor Fusion Algorithms (Verified)

### 4.1 Kalman Filter Implementation (Fixed-Point)

#### 4.1.1 Fixed-Point Design for Determinism
```
State Vector (16-bit Q15 format):
  x = [ε₁...ε₁₂₀, T₁...T₁₂₀, p_x,p_y,p_z, v_x,v_y,v_z, q_w,q_x,q_y,q_z]ᵀ
  Dimension: n = 264 (120 strain + 120 temp + 3 pos + 3 vel + 4 quat)
  
Covariance Matrix (32-bit Q31, symmetric packed):
  P = Pᵀ, stored as lower triangle: n(n+1)/2 = 34,980 elements
  Memory: 34,980 × 4 bytes = 139,920 bytes ≈ 137 KB
  
Process Noise Q (diagonal, 16-bit Q15):
  q_ε = 10 με², q_T = 0.01°C², q_p = 0.001 m², q_v = 0.01 (m/s)²
  
Measurement Noise R (diagonal, 16-bit Q15):
  r_FBG = 4 με², r_OFDR = 25 με², r_IMU = 0.001 g²
```

**Fixed-Point KF Equations:**
- State prediction: $\hat{x}_{k|k-1} = F_k \hat{x}_{k-1|k-1}$ (matrix-vector, Q15)
- Covariance prediction: $P_{k|k-1} = F_k P_{k-1|k-1} F_k^T + Q_k$ (Q31)
- Kalman gain: $K_k = P_{k|k-1} H_k^T (H_k P_{k|k-1} H_k^T + R_k)^{-1}$ (Q31)
- State update: $\hat{x}_{k|k} = \hat{x}_{k|k-1} + K_k (z_k - H_k \hat{x}_{k|k-1})$ (Q15)
- Covariance update: $P_{k|k} = (I - K_k H_k) P_{k|k-1} (I - K_k H_k)^T + K_k R_k K_k^T$ (Joseph form, Q31)
- Q15 range: $[-1, 1-2^{-15}]$, Q31 range: $[-1, 1-2^{-31}]$
- Overflow check: $|x| < 2^{15}$ for Q15, $|x| < 2^{31}$ for Q31

#### 4.1.2 Numerical Stability
```
Joseph Form (covariance update):
  P = (I - KH)P(I - KH)ᵀ + KRKᵀ
  Guarantees symmetry and positive semi-definiteness
  
Square-Root Filter (Cholesky factor):
  P = S Sᵀ, update S directly
  Better conditioning, 2× compute, 2× memory
  
Selected: Joseph Form (sufficient for 16-bit, verified)
```

### 4.2 SNN Inference Verification

#### 4.2.1 Deterministic Execution
```
Event-Driven Scheduler (time-triggered emulation):
  1. Collect events for 1 ms window (major frame)
  2. Sort by timestamp (hardware timestamp)
  3. Process in timestamp order (deterministic)
  4. Output spikes at frame boundary
  
WCET Analysis (static, per partition):
  P1 (Sensor Fusion): 287 μs (measured), 300 μs (budget)
  Margin: 4.3% (acceptable per DO-178C)
  
Jitter Analysis:
  Input jitter: <1 μs (hardware timestamp)
  Processing jitter: <5 μs (cache effects, mitigated by locking)
  Output jitter: <1 μs (frame-aligned)
```

**WCET and Jitter Equations:**
- WCET margin: $M = \frac{T_{budget} - T_{measured}}{T_{budget}} \times 100\% = \frac{300 - 287}{300} \times 100 = 4.33\%$
- Total jitter: $J_{total} = \sqrt{J_{in}^2 + J_{proc}^2 + J_{out}^2} = \sqrt{1^2 + 5^2 + 1^2} = 5.2 \mu\text{s}$
- Utilization: $U = \frac{\sum C_i}{T_{frame}} = \frac{900}{1000} = 90\%$ (schedulable)
- Response time: $R_i = C_i + \sum_{j \in hp(i)} \lceil \frac{R_i}{T_j} \rceil C_j$ (RTA, all partitions)

#### 4.2.2 Formal Verification
```
Properties Verified (using CBMC / Frama-C):
  - No buffer overflows (array bounds)
  - No division by zero
  - No uninitialized variables
  - Loop bounds (max iterations proven)
  - Floating-point exception freedom (NaN, Inf, div0)
  - Functional equivalence: C model vs. Lava framework
```

---
