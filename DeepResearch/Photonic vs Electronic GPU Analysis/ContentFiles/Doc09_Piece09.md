# Document 9: ADC/DAC Quantization Theory and Analog Tax
## Piece 9: Hessian-Weighted Quantization: Optimal Bit-Width per Layer

---

### 9.9 Hessian-Weighted Quantization: Optimal Bit-Width per Layer

Not all layers in a neural network are equally sensitive to quantization. Hessian-weighted quantization uses second-order sensitivity information to allocate bit-widths optimally across layers, minimizing accuracy loss for a given bit budget. This is critical for optical neural networks where different layers may have different quantization constraints.

#### 9.9.1 Sensitivity Analysis for Quantization

**Quantization error** for layer i:
ΔW_i = W_i,q - W_i
ΔA_i = A_i,q - A_i

**Loss increase** (second-order Taylor):
ΔL ≈ ½ Σ_i Tr[Δθ_i^T H_i Δθ_i]
where H_i = ∂²L/∂θ_i² (Hessian w.r.t. layer i parameters)

**Quantization noise variance**:
σ²_i = Δ_i²/12 (for uniform quantizer)

**Expected loss increase**:
E[ΔL] ≈ ½ Σ_i σ²_i Tr[H_i]
= Σ_i (Δ_i²/24) Tr[H_i]

**Sensitivity metric**:
S_i = Tr[H_i] (layer sensitivity to quantization)

**Optimal bit allocation** (for fixed total bits):
Minimize Σ_i (Δ_i²/24) Tr[H_i]
Subject to: Σ_i N_i = B_total
Δ_i = 2R_i / 2^{N_i} (R_i = range)

**Solution** (continuous relaxation):
N_i = ½ log₂(Tr[H_i] R_i²) + λ
where λ chosen to satisfy Σ N_i = B_total

**Intuition**: More bits to layers with larger Hessian trace (more sensitive)

#### 9.9.2 Hessian Computation Methods

**Full Hessian** (impractical):
H = ∂²L/∂θ∂θ^T ∈ ℝ^{P×P}
P = total parameters (millions)

**Diagonal Hessian** (practical):
H_ii = ∂²L/∂θ_i²
Can be computed via Hutchinson's estimator:
H_ii ≈ (g(θ+εe_i) - g(θ))_i / ε
where g = ∇L, e_i = basis vector

**Hessian-vector product** (HVP):
Hv = ∇_θ (v^T ∇L)
Computed via forward-over-reverse autodiff
Cost: 2× backward pass

**Layer-wise Hessian trace**:
Tr[H_i] = Σ_{j∈layer_i} H_{jj}
Can be estimated via:
Tr[H_i] ≈ E_z[z^T H_i z] (z ~ N(0,I))
z^T H z = ∇_θ (z^T ∇L) · z

**K-FAC approximation** (Kronecker-Factored):
H_i ≈ A_i ⊗ G_i
A_i = input covariance, G_i = gradient covariance
Tr[H_i] = Tr[A_i] Tr[G_i]

#### 9.9.3 Optimal Bit-Width Allocation Algorithm

**Problem formulation**:
Minimize Σ_i c_i / 2^{2N_i}
Subject to: Σ N_i = B, N_i ≥ N_min

where c_i = R_i² Tr[H_i] / 12 (layer cost coefficient)

**Optimal allocation** (continuous):
N_i* = ½ log₂(c_i) + λ
λ = (B - ½ Σ log₂(c_i)) / L

**Discrete algorithm** (greedy):
1. Initialize N_i = N_min
2. While Σ N_i < B:
   Find i maximizing ΔGain_i = c_i(2^{-2N_i} - 2^{-2(N_i+1)})
   N_i += 1

**Complexity**: O((B - L·N_min) log L)

#### 9.9.4 Mixed-Precision Quantization for D2NN

**D2NN layer sensitivity**:
- Input layer: High sensitivity (error propagates)
- Middle layers: Moderate sensitivity
- Output layer: High sensitivity (directly affects loss)

**D2NN-specific sensitivity factors**:
- Optical loss: later layers have less power → lower SNR
- Phase error accumulation: earlier errors amplified
- Detection noise: final layer most affected

**Bit-width allocation example** (8-layer D2NN, 64 total bits):
| Layer | Hessian trace | Bits allocated |
|-------|---------------|----------------|
| 1 (input) | High | 10 |
| 2 | Medium | 8 |
| 3 | Medium | 8 |
| 4 | Medium | 8 |
| 5 | Medium | 8 |
| 6 | Medium | 8 |
| 7 | Medium | 8 |
| 8 (output) | High | 10 |

**Result**: 2.3% accuracy improvement vs. uniform 8-bit

#### 9.9.5 Mixed-Precision for Phase Shifters vs. ADCs

**Different components, different budgets**:
- Phase shifters: N_phase bits (continuous → quantized)
- ADCs: N_ADC bits (analog → digital)
- DACs: N_DAC bits (digital → analog)

**Joint optimization**:
Minimize Σ_i c_i,phase 2^{-2N_phase,i} + c_i,ADC 2^{-2N_ADC,i} + c_i,DAC 2^{-2N_DAC,i}
Subject to: Σ (N_phase,i + N_ADC,i + N_DAC,i) = B_total

**Coupled sensitivity**:
Phase error → weight error → activation error
ADC error → gradient error → weight update error
DAC error → weight error (during loading)

**Optimal ratio** (typical):
N_phase : N_ADC : N_DAC ≈ 1 : 1 : 1 (for inference)
N_phase : N_ADC : N_DAC ≈ 1 : 1.5 : 1 (for training)

#### 9.9.6 Hardware-Aware Mixed-Precision Search

**AutoQ** (automated quantization):
Search space: bit-width per layer, quantization scheme
Reward: accuracy - λ × cost
Cost: power, area, latency

**Search algorithms**:
- Reinforcement learning (RL)
- Evolutionary algorithms
- Bayesian optimization
- Gradient-based (Gumbel-Softmax)

**Hardware cost model**:
Power_i = P_0 + α_i 2^{N_i}
Area_i = A_0 + β_i 2^{N_i}
Latency_i = L_0 + γ_i 2^{N_i}

**Multi-objective Pareto search**:
Find Pareto front: (accuracy, power, area, latency)
Designer selects operating point

**Example** (ResNet-18, ImageNet):
| Precision | Top-1 Acc | Power | Area |
|-----------|-----------|-------|------|
| FP32 | 70.5% | 1.0W | 1.0mm² |
| Uniform 8-bit | 69.8% | 0.35W | 0.3mm² |
| Mixed (HAQ) | 70.2% | 0.28W | 0.25mm² |
| Mixed (AutoQ) | 70.3% | 0.25W | 0.22mm² |

#### 9.9.6 Quantization-Aware Mixed-Precision Training

**Differentiable bit-width**:
N_i = Σ_k k · softmax(θ_i)_k
Gumbel-Softmax for discrete selection

**Loss function**:
L = L_task + λ Σ_i c_i 2^{-2N_i}

**Gradient**:
∂L/∂θ_i = -2 ln(2) c_i 2^{-2N_i} ∂N_i/∂θ_i

**Gumbel-Softmax**:
π_k = exp((log α_k + g_k)/τ) / Σ exp(...)
N_i = Σ k π_k
g_k ~ Gumbel(0,1)
τ → 0 during training

#### 9.9.7 Quantization-Aware Mixed-Precision for Optical Systems

**Optical system constraints**:
- Phase shifter resolution: fixed by hardware (e.g., 8-bit)
- ADC resolution: fixed by hardware (e.g., 8-bit)
- Optical power budget: limits SNR

**Variable precision per layer**:
- Early layers: more bits (high sensitivity)
- Late layers: fewer bits (lower power)

**Free-space vs. waveguide**:
Free-space D2NN: phase mask resolution limited by fabrication
Waveguide D2NN: phase shifter resolution limited by DAC

**Optical power allocation**:
More optical power → higher SNR → fewer bits needed
Joint optimization: bits + optical power

#### 9.9.8 Quantization-Robust Architecture Design

**Architecture modifications for quantization robustness**:
1. **Batch normalization**: Absorbs scale variations
2. **Skip connections**: Gradient flow bypasses quantization
3. **Group normalization**: Less sensitive to batch statistics
4. **Weight standardization**: Normalizes weights per channel
5. **Quantization-friendly activations**: ReLU6, hard-sigmoid

**Quantization-aware NAS**:
Search: architecture + quantization policy
Reward: accuracy / (power × area)
Search space: layer types, connections, bit-widths

**Optical NAS**:
Search: D2NN architecture + phase quantization
Optical constraints: minimum feature size, alignment

#### 9.9.9 Mixed-Precision for Training vs. Inference

**Inference** (fixed weights):
- Weights: 4-8 bits (offline quantized)
- Activations: 4-8 bits (online quantized)
- No gradient computation

**Training** (weight updates):
- Forward: 8-bit weights/activations
- Backward: 16-32 bits (gradients)
- Weight update: 32-bit accumulation

**Mixed-precision training flow**:
1. FP32 master weights
2. Forward: quantize to 8-bit
3. Loss computation: FP32
4. Backward: FP16 gradients
5. Weight update: FP32 master + FP16 gradient
6. Quantize updated weights to 8-bit

**Gradient scaling** (for FP16):
Scale loss by S = 2^{14} (typical)
Unscale gradients before update
Prevents underflow

**Optical training specifics**:
- Optical forward: analog, high precision
- Optical backward: analog adjoint (high precision)
- Electronic weight update: digital
- Phase shifter update: DAC precision limited

#### 9.9.10 Future: Learned Quantization and Adaptive Precision

**Learned quantization**:
- Learn optimal thresholds and levels
- End-to-end differentiable
- Surpasses uniform quantization

**Adaptive precision** (runtime):
- Monitor layer sensitivity (online Hessian)
- Adjust precision per layer dynamically
- Save power during easy inputs

**Continual quantization**:
- Quantize once, adapt to new tasks
- Preserve accuracy on old tasks
- Elastic weight consolidation for quantization

**Self-supervised quantization**:
- Learn quantization from unlabeled data
- Contrastive learning with quantization
- Improves transfer learning

**Quantum-inspired quantization**:
- Variational quantization (quantum circuits)
- Quantum annealing for bit allocation
- Quantum neural network quantization

---

*End of Piece 9. Next: Piece 10 - Mixed-Precision Quantization: Knowledge Distillation and AdaRound*