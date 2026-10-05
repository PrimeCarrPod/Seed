# Document 9: ADC/DAC Quantization Theory and Analog Tax
## Piece 8: Quantization-Aware Training: Straight-Through Estimator Gradient

---

### 9.8 Quantization-Aware Training: Straight-Through Estimator Gradient

Quantization-aware training (QAT) is essential for deploying neural networks on low-precision hardware, including optical neural networks where weight and activation precision is fundamentally limited by ADC/DAC resolution and phase shifter quantization. The Straight-Through Estimator (STE) is the key technique enabling gradient-based optimization through non-differentiable quantization operations.

#### 9.8.1 Quantization in Neural Networks

**Forward quantization**:
x_q = Q(x) = Δ · round(x/Δ)
Δ = 2^(-N+1) (for symmetric range [-1, 1))

**Backward problem**:
∂x_q/∂x = 0 almost everywhere (step function)
Standard backprop fails: ∂L/∂x = ∂L/∂x_q · ∂x_q/∂x = 0

**Naive solutions** (don't work):
- Ignore quantization in backward pass: ∂x_q/∂x = 1
- Use subgradient: ∂x_q/∂x = 0 or 1

#### 9.8.2 Straight-Through Estimator (STE)

**Core idea** (Bengio et al., 2013):
Forward: x_q = Q(x) (true quantization)
Backward: ∂x_q/∂x = 1 (identity)

**Implementation**:
```python
def quantize_ste(x):
    x_q = torch.round(x / Δ) * Δ
    return x_q - x.detach() + x  # STE: gradient = 1
```

**Gradient flow**:
∂L/∂x = ∂L/∂x_q · ∂x_q/∂x = ∂L/∂x_q · 1 = ∂L/∂x_q

**Why it works**:
- Provides non-zero gradient
- Approximates ∂Q/∂x ≈ 1 in regions where Q(x) ≈ x
- Equivalent to assuming Q(x) ≈ x + noise

**Theoretical justification** (Courbariaux et al.):
STE ≈ E[∂Q/∂x] under input noise
If input has noise σ² ≫ Δ², Q is locally linear

#### 9.8.3 STE Variants and Improvements

**1. STE with clipping**:
Forward: x_q = clip(Q(x), -1+Δ, 1-Δ)
Backward: ∂x_q/∂x = 1 (inside range), 0 (outside)

**2. STE with scaled gradient**:
∂x_q/∂x = α (α < 1 for stability)
α = 1 / (1 + Δ²/12σ²) ≈ 1 - Δ²/(12σ²)

**3. STE with noise injection** (training-time only):
Forward: x_q = Q(x + ε), ε ~ Uniform(-Δ/2, Δ/2)
Backward: STE
Equivalent to adding quantization noise during training

**4. Gumbel-Softmax relaxation** (for discrete weights):
x_q = Σ_k π_k w_k
π_k = softmax((log α_k + g_k)/τ)
τ → 0 during training

#### 9.8.4 Quantization-Aware Training (QAT) Flow

**Full QAT pipeline**:
1. Pre-trained FP32 model
2. Insert fake quantization nodes:
   - After conv/linear: quantize weights
   - After activation: quantize activations
2. Fine-tune with STE (1-10 epochs)
3. Freeze BN statistics
4. Export quantized model

**Per-channel quantization** (weights):
Separate Δ per output channel
Better accuracy than per-tensor

**Asymmetric quantization** (activations):
Range [min, max] not symmetric
Zero-point: z = -round(min/Δ)

#### 9.8.5 QAT for Optical Neural Networks

**D2NN quantization challenges**:
- Phase quantization: φ ∈ [0, 2π), K levels
- Amplitude quantization: ADC/DAC limited bits
- Phase shifter nonlinearity: non-uniform steps

**Phase quantization STE**:
Forward: φ_q = round(φ K/2π) × 2π/K
Backward: ∂φ_q/∂φ = 1

**Weight quantization** (phase = weight):
W_q = round(W / Δ_w) × Δ_w
Backward: ∂W_q/∂W = 1

**Activation quantization** (intensity):
A_q = round(A / Δ_a) × Δ_a
Backward: ∂A_q/∂A = 1

**Mixed precision QAT**:
Weights: 4-8 bits (critical for accuracy)
Activations: 4-8 bits
Gradients: 16-32 bits (FP16/FP32)

#### 9.8.6 Knowledge Distillation for QAT

**Teacher-student framework**:
Teacher: FP32 model (high accuracy)
Student: Quantized model (target precision)

**Loss function**:
L = L_task(student) + λ L_KD(teacher, student)
L_KD = KL(student || teacher) or MSE(logits)

**Benefits**:
- Recovers 1-2 bits of accuracy
- Student learns smooth decision boundaries
- Reduces quantization sensitivity

**Quantization-aware distillation**:
Teacher: FP32
Student: Quantized
KD loss on intermediate features

#### 9.8.7 Post-Training Quantization (PTQ) vs. QAT

**PTQ** (no retraining):
1. Calibrate: collect activation statistics
2. Determine Δ per layer
3. Quantize weights/activations
4. Evaluate, iterate

**PTQ techniques**:
- MinMax calibration: Δ = max(|x|)/(2^{N-1}-1)
- Percentile calibration: ignore outliers (99.9%)
- KL divergence: minimize KL(original || quantized)
- AdaRound: optimize rounding direction

**QAT vs PTQ accuracy gap**:
- PTQ: 1-5% accuracy drop (ResNet-50, 8-bit)
- QAT: <0.5% drop (with 10 epochs fine-tune)
- For 4-bit: PTQ fails, QAT essential

**Hybrid approach**:
PTQ → QAT (few epochs) → Deploy
Best trade-off: PTQ calibration + few QAT epochs

#### 9.8.8 Gradient Estimation for Non-Uniform Quantization

**Non-uniform quantization**:
x_q = Σ_k c_k · 1_{x ∈ [t_k, t_{k+1})}
t_k = decision thresholds, c_k = reconstruction levels

**STE for non-uniform**:
∂x_q/∂x = 1 (same as uniform)
But Δ_k = t_{k+1} - t_k varies

**Lloyd-Max QAT**:
Jointly optimize thresholds t_k and levels c_k
Backward: ∂L/∂t_k = ∂L/∂x_q · ∂x_q/∂t_k
∂x_q/∂t_k = c_{k+1} - c_k (for threshold)

**Learned quantization**:
Parameterize t_k, c_k as learnable
Constrained: t_0 < t_1 < ... < t_K
Use softplus for ordering: t_k = Σ_{i<k} softplus(δ_i)

#### 9.8.8 Quantization Noise Injection During Training

**Noise injection** (more accurate than STE):
Forward: x_q = Q(x + ε), ε ~ Uniform(-Δ/2, Δ/2)
Backward: ∂x_q/∂x = 1 (STE)

**Why it works**:
E_ε[Q(x + ε)] ≈ x (for smooth Q)
Gradient unbiased: E[∂Q(x+ε)/∂x] = 1

**Variance of gradient estimator**:
Var(∂L/∂x) = Var(∂L/∂x_q)
No additional variance from STE

**Comparison**:
- STE: biased but low variance
- Noise injection: unbiased but higher variance
- Practical: STE preferred (lower variance)

#### 9.8.9 QAT for Optical Phase Shifters

**Phase shifter non-idealities**:
- Nonlinear V-φ curve: φ(V) ≠ αV
- Hysteresis: φ(V) ≠ φ(V) on return
- Thermal crosstalk: φ_i depends on V_j
- Drift: φ(t) = φ_0 + α t

**Calibration-aware QAT**:
1. Characterize φ(V) per shifter
2. Build lookup table or polynomial
3. Forward: φ_actual = LUT(V)
4. Backward: STE through LUT
   ∂φ/∂V = LUT'(V) (interpolated derivative)

**Crosstalk-aware QAT**:
Forward: φ = C V (C = crosstalk matrix)
Backward: ∂φ/∂V = C^T

**Joint optimization**:
min_V L(Q(C V))
V updated via STE gradient

#### 9.8.10 QAT for Mixed-Precision and Dynamic Quantization

**Mixed-precision QAT**:
Different layers → different bit-widths
Learnable bit-width: b_i = softmax(θ_i)
Gumbel-Softmax for discrete selection

**Loss with precision penalty**:
L = L_task + λ Σ b_i

**Dynamic quantization** (input-dependent):
Δ(x) = f(x; θ) (learned)
Small Δ for important features
Large Δ for robust features

**Bit-width scheduling**:
Start: high precision (16-bit)
Gradually reduce: 16 → 12 → 8 → 4
Curriculum learning for quantization

**Hardware-aware QAT**:
Incorporate hardware constraints:
- Power budget: Σ 2^{b_i} ≤ P_max
- Area budget: Σ b_i ≤ A_max
- Latency budget: Σ f(b_i) ≤ T_max

**AutoQ** (automated quantization):
Search: bit-width per layer + quantization scheme
Reward: accuracy - λ × cost
Search: RL, evolution, gradient-based

---

*End of Piece 8. Next: Piece 9 - Hessian-Weighted Quantization: Optimal Bit-Width per Layer*