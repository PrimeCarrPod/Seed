# Document 9: ADC/DAC Quantization Theory and Analog Tax
## Piece 10: Mixed-Precision Quantization: Knowledge Distillation and AdaRound

---

### 9.10 Mixed-Precision Quantization: Knowledge Distillation and AdaRound

Post-training quantization (PTQ) and quantization-aware training (QAT) are the two main approaches for deploying quantized neural networks. This piece covers advanced PTQ techniques—specifically AdaRound for weight rounding optimization and knowledge distillation for recovering accuracy—along with their application to mixed-precision optical neural networks.

#### 9.10.1 Post-Training Quantization (PTQ) Challenges

**Standard PTQ pipeline**:
1. Calibrate activation ranges (min/max or percentile)
2. Compute scale Δ = (max - min) / (2^N - 1)
3. Quantize weights: W_q = round(W / Δ) × Δ
4. Quantize activations per layer
5. Evaluate accuracy

**Common issues**:
- **Weight rounding**: round() is suboptimal
- **Activation range**: outliers skew scale
- **Cross-layer error propagation**: early layer errors amplify
- **No gradient information**: cannot recover lost accuracy

**Typical accuracy drop** (ResNet-50, ImageNet):
- 8-bit PTQ: 1-2% top-1 drop
- 6-bit PTQ: 5-10% drop
- 4-bit PTQ: >20% drop (often unusable)

#### 9.10.2 AdaRound: Adaptive Rounding for Weights

**Key insight** (Nagel et al., 2020):
round(x) = floor(x) + round(frac(x))
The rounding direction (up vs. down) is a discrete choice
Can be optimized to minimize task loss

**AdaRound formulation**:
For each weight w:
w_q = s · (⌊w/s⌋ + h(σ(v)))
where:
- s = scale factor
- v = learnable parameter per weight
- h(·) = sigmoid (soft rounding)
- σ(v) ∈ [0,1] → probability of rounding up

**Loss function**:
L = L_task(W_q) + λ L_reg(v)
L_reg = Σ (1 - |2h(σ(v)) - 1|)^β
Encourages h → 0 or 1 (hard rounding)
β = 2/3 (recommended)

**Optimization**:
- Freeze all other parameters
- Optimize v for 1000-5000 iterations
- Batch size: 32-64
- LR: 1e-3 to 1e-4

**Results** (ResNet-50, 4-bit weights):
- Standard PTQ: 20% drop
- AdaRound: <1% drop
- Near QAT performance without retraining

#### 9.10.3 AdaQuant: Joint Weight and Activation Quantization

**Extension to activations**:
AdaQuant optimizes both weight rounding and activation clipping thresholds

**Joint optimization**:
min_{v, t} L_task(W_q(v), A_q(t))
where:
- v: weight rounding parameters
- t: activation clipping thresholds (min/max per channel)

**Activation quantization**:
A_q = clip(A, t_min, t_max)
Δ = (t_max - t_min) / (2^N - 1)

**Clipping threshold optimization**:
t_max = argmin L_task
Can be learned per channel or per layer

**Gradient for thresholds**:
∂L/∂t = ∂L/∂A_q · ∂A_q/∂t
∂A_q/∂t = 1 (inside range), 0 (outside) → STE

#### 9.10.4 Knowledge Distillation for Quantized Networks

**Teacher-Student framework**:
- Teacher: FP32 model (high accuracy)
- Student: Quantized model (target precision)

**Distillation loss**:
L = α L_CE(y, y_student) + (1-α) L_KD(y_teacher, y_student)

**Distillation losses**:
1. **Logit matching** (Hinton):
   L_KD = KL(softmax(z_T/τ) || softmax(z_S/τ))
   τ = temperature (2-10)

2. **Feature matching** (FitNets):
   L_KD = Σ ||F_T - F_S||²

3. **Attention transfer** (AT):
   L_KD = Σ ||A_T - A_S||²
   A = attention maps

4. **Correlation congruence** (CC):
   L_KD = Σ ||C_T - C_S||²
   C = correlation matrices

**Quantization-aware distillation**:
- Teacher: FP32, fixed
- Student: Quantized, learning
- KD loss on quantized student logits
- Recovers 1-2 bits of precision

**Data-free distillation**:
- Generate synthetic data from teacher
- No real data needed
- Useful for privacy-sensitive deployment

#### 9.10.5 Mixed-Precision AdaRound with Distillation

**Combined approach**:
1. Hessian-weighted bit allocation → target bits per layer
2. AdaRound per layer at target precision
3. Distillation to recover residual accuracy

**Algorithm**:
1. Compute Hessian trace per layer (or K-FAC approx)
2. Allocate bits: N_i = ½ log₂(Tr[H_i] R_i²) + λ
3. For each layer i:
   - Run AdaRound at N_i bits
   - Fine-tune clipping thresholds
4. Distill from FP32 teacher:
   - L = L_task + λ L_KD
   - Few epochs (5-10)

**Performance** (ResNet-50, mixed 4-8 bit):
| Method | Top-1 Acc | Drop |
|--------|-----------|------|
| FP32 | 76.1% | - |
| Uniform 8-bit PTQ | 75.3% | 0.8% |
| Mixed 4-8 bit PTQ | 74.1% | 2.0% |
| + AdaRound | 75.6% | 0.5% |
| + Distillation | 75.9% | 0.2% |
| QAT (8-bit) | 76.0% | 0.1% |

#### 9.10.6 AdaRound for Optical Neural Networks

**Phase shifter AdaRound**:
Phase shifters have discrete levels (e.g., 8-bit = 256 levels)
Rounding: φ_q = φ_min + round((φ - φ_min)/Δ) × Δ

**AdaRound for phase**:
v_i per phase shifter
φ_q,i = φ_min + Δ · (⌊(φ_i - φ_min)/Δ⌋ + h(σ(v_i)))
Δ = 2π / 2^{N_phase}

**Loss function**:
L = L_task(φ_q(v)) + λ Σ (1 - |2h(σ(v_i)) - 1|)^β

**Phase shifter specific considerations**:
- Non-uniform phase response: Δ varies with voltage
- Hysteresis: different rounding for up/down
- Thermal crosstalk: coupled rounding decisions

**Coupled AdaRound**:
v = vector of all phase shifter rounding params
Crosstalk matrix C: φ_actual = C φ_q
Loss: L(φ_q(v)) with C in forward pass

#### 9.10.7 Knowledge Distillation for Optical Neural Networks

**Optical teacher-student**:
Teacher: High-precision electronic model (or high-res optical sim)
Student: Quantized optical model (D2NN/MRR/MZI)

**Optical-specific distillation**:
- Teacher: high-resolution D2NN (continuous phase)
- Student: Quantized D2NN (discrete phase levels)
- KD loss on output intensity patterns

**Diffraction-aware distillation**:
Teacher output: |U_teacher|²
Student output: |U_student|²
L_KD = || |U_teacher|² - |U_student|² ||²

**Phase-aware distillation**:
L_KD = ||φ_teacher - φ_student||² (if phase accessible)
Or: L_KD = ||ℱ{φ_teacher} - ℱ{φ_student}||² (frequency domain)

**Multi-wavelength distillation**:
Teacher: multi-wavelength (high info capacity)
Student: single-wavelength (hardware constraint)
KD transfers multi-wavelength knowledge

#### 9.10.8 Quantization for Optical Training vs. Inference

**Inference quantization** (weights fixed):
- Weights: offline quantized (AdaRound)
- Activations: online quantized (per-layer calibration)
- No backprop through quantization

**Training quantization** (weights updated):
- Forward: quantized weights/activations
- Backward: STE gradients
- Weight update: high precision (FP32 master)

**Mixed-precision training**:
- Forward pass: 8-bit weights, 8-bit activations
- Backward: 16-bit gradients (FP16)
- Weight update: FP32 master weights
- Quantize updated weights: AdaRound or STE

**Optical training flow**:
1. Electronic forward: quantized weights → optical encoder
2. Optical propagation: analog (high precision)
3. Detection: ADC quantization
4. Electronic backward: STE through ADC
5. Adjoint optical: analog (high precision)
6. Weight gradient: electronic (high precision)
7. Weight update: FP32
8. Weight quantization: AdaRound for phase shifters

#### 9.10.9 Mixed-Precision Quantization for Sparse Optical Networks

**Sparsity + quantization**:
Pruning + quantization = super-linear compression
Optical networks naturally sparse (diffraction limits)

**Sparse AdaRound**:
Only quantize non-zero weights
Zero weights stay zero
Reduces rounding variables

**Structured sparsity + quantization**:
- Channel pruning + quantization
- Block sparsity + quantization
- Optical: diffraction-limited sparsity

**Sparsity-aware bit allocation**:
More bits for dense layers
Fewer bits for sparse layers
N_i ∝ density_i × Tr[H_i]

#### 9.10.10 Future: Self-Supervised Quantization and Continual Quantization

**Self-supervised quantization**:
- Learn quantization from unlabeled data
- Contrastive loss with quantization
- Improves transfer learning performance

**Contrastive quantization**:
L = L_contrastive + λ L_quant
z_q = Q(z)
L_contrastive = -log(exp(sim(z_q, z'_q)/τ) / Σ exp(sim(z_q, z_k)/τ))

**Continual quantization**:
- Quantize model for task A
- Adapt to task B without full retraining
- Elastic weight consolidation for quantization
- Preserve quantization on important weights

**Online quantization adaptation**:
- Monitor accuracy drift
- Re-quantize sensitive layers
- Dynamic bit-width adjustment

**Quantum-inspired rounding**:
Quantum annealing for optimal rounding
Quantum approximate optimization (QAOA)
Solves discrete rounding problem globally

**Neuromorphic quantization**:
Spike-based quantization
Rate coding: precision = √N_spikes
Event-driven quantization
Natural fit for optical spike trains

---

*End of Piece 10. Document 9 complete (10 pieces). Next: Glue pieces into Doc09_Final.md*