# Quantum_Federation_ML_Prime_Gaps — Piece 08/12
## Article 3: A3-26 — Quantum Federation ML Prime Gaps
**Piece:** 08 of 12  
**Generated:** 2026-08-23 23:15:00 UTC

---

# Gap-Statistics for ML Model Interpretability and Uncertainty Quantification

## 8.1 Gap-Index Attribution: Explaining Predictions via Gap Features

Gap-statistical features provide intrinsic interpretability: each feature corresponds to a mathematically defined property of the prime gap sequence (modulo class, entropy, correlation, etc.).

```
┌─────────────────────────────────────────────────────────────────────┐
│                    GAP-INTERPRETABILITY FRAMEWORK                   │
├─────────────────────────────────────────────────────────────────────┤
│                                                                     │
│  FEATURE ATTRIBUTION METHODS:                                       │
│  ┌─────────────────────────────────────────────────────────────┐   │
│  │ 1. GAP-SHAP: Shapley values with gap-index coalitions      │   │
│  │    • Coalition = subset of gap indices                     │   │
│  │    • Value = model output on coalition                     │   │
│  │    • Respects gap-index ordering (I1)                      │   │
│  │                                                             │   │
│  │ 2. GAP-INTEGRATED GRADIENTS: Path integral in gap space    │   │
│  │    • Baseline = low-entropy gap (minimal information)      │   │
│  │    • Path = gap-index trajectory                           │   │
│  │    • Respects gap-index monotonicity (I1)                  │   │
│  │                                                             │   │
│  │ 3. GAP-LIME: Local interpretable models on gap windows     │   │
│  │    • Perturb gap indices in window                         │   │
│  │    • Weight by gap-index distance                          │   │
│  │    • Modulo-class aware sampling                           │   │
│  └─────────────────────────────────────────────────────────────┘   │
│                              │                                      │
│                              ▼                                      │
│  UNCERTAINTY QUANTIFICATION:                                        │
│  ┌─────────────────────────────────────────────────────────────┐   │
│  │ • Epistemic: Gap-index regions with low training coverage   │   │
│  │ • Aleatoric: Inherent gap statistical variance              │   │
│  │ • Combined: Predictive distribution over gap indices        │   │
│  └─────────────────────────────────────────────────────────────┘   │
│                                                                     │
└─────────────────────────────────────────────────────────────────────┘
```

## 8.2 Gap-SHAP: Shapley Values on Gap Indices

```python
class GapSHAP:
    """SHAP values for gap-index features with gap-index coalitions."""
    
    def __init__(self, model: nn.Module, 
                 gap_feature_extractor: GapFeatureEngine,
                 background_gaps: List[int]):
        self.model = model
        self.extractor = gap_feature_extractor
        self.background_gaps = background_gaps
        self.baseline = self.compute_baseline()
    
    def compute_baseline(self) -> np.ndarray:
        """Expected model output on background distribution."""
        outputs = []
        for gap in self.background_gaps:
            features = self.extractor.extract_features(gap)
            pred = self.model(torch.tensor(features).unsqueeze(0))
            outputs.append(pred.item())
        return np.mean(outputs)
    
    def shap_values(self, gap_index: int, 
                    max_interactions: int = 2) -> GapSHAPResult:
        """Compute SHAP values for gap index features."""
        # Get features for target gap
        target_features = self.extractor.extract_features(gap_index)
        
        # Feature names
        feature_names = self.get_feature_names()
        num_features = len(feature_names)
        
        # Compute Shapley values (exact for small, approximate for large)
        if num_features <= 20:
            shap_vals = self.exact_shap(gap_index, target_features)
        else:
            shap_vals = self.approximate_shap(gap_index, target_features)
        
        # Compute interactions if requested
        interactions = None
        if max_interactions > 1:
            interactions = self.compute_interactions(
                gap_index, target_features, max_interactions
            )
        
        return GapSHAPResult(
            gap_index=gap_index,
            feature_names=feature_names,
            shap_values=shap_vals,
            baseline=self.baseline,
            model_output=self.model_output(gap_index),
            interactions=interactions
        )
    
    def exact_shap(self, gap_index: int, 
                   target_features: np.ndarray) -> np.ndarray:
        """Exact Shapley values by enumerating all coalitions."""
        num_features = len(target_features)
        shap = np.zeros(num_features)
        
        # All possible coalitions (2^n)
        for mask in range(1 << num_features):
            # Coalition features
            coalition_features = target_features.copy()
            coalition_features[~self.mask_to_bool(mask)] = self.baseline_features
            
            # Model output on coalition
            pred = self.model_output_from_features(coalition_features)
            
            # Marginal contribution
            for i in range(num_features):
                if mask & (1 << i):
                    # With feature i
                    with_i = pred
                else:
                    # Without feature i
                    without_i = pred
                
                # Weight by coalition size
                k = bin(mask).count('1')
                weight = 1 / (num_features * comb(num_features - 1, k - 1))
                shap[i] += weight * (with_i - without_i)
        
        return shap
    
    def approximate_shap(self, gap_index: int, 
                         target_features: np.ndarray,
                         num_samples: int = 2000) -> np.ndarray:
        """Approximate SHAP using KernelSHAP."""
        num_features = len(target_features)
        shap = np.zeros(num_features)
        weights = np.zeros(num_features)
        
        for _ in range(num_samples):
            # Random coalition
            mask = np.random.binomial(1, 0.5, num_features).astype(bool)
            k = mask.sum()
            
            if k == 0 or k == num_features:
                continue
            
            # Coalition features
            coalition = target_features.copy()
            coalition[~mask] = self.baseline_features[~mask]
            pred = self.model_output_from_features(coalition)
            
            # Weight: (n-1) / (C(n,k) * k * (n-k))
            weight = (num_features - 1) / (comb(num_features, k) * k * (num_features - k))
            
            for i in range(num_features):
                if mask[i]:
                    shap[i] += weight * pred
                    weights[i] += weight
        
        return shap / (weights + 1e-8)
```

## 8.3 Gap-Integrated Gradients

```python
class GapIntegratedGradients:
    """Integrated gradients along gap-index paths."""
    
    def __init__(self, model: nn.Module,
                 gap_feature_extractor: GapFeatureEngine,
                 steps: int = 50):
        self.model = model
        self.extractor = gap_feature_extractor
        self.steps = steps
    
    def attribute(self, gap_index: int, 
                  baseline_gap: int = None) -> AttributionResult:
        """Compute integrated gradients for gap index."""
        if baseline_gap is None:
            # Use lowest entropy gap as baseline
            baseline_gap = self.find_lowest_entropy_gap()
        
        # Features at target and baseline
        target_features = self.extractor.extract_features(gap_index)
        baseline_features = self.extractor.extract_features(baseline_gap)
        
        # Linear interpolation path
        alphas = np.linspace(0, 1, self.steps)
        integrated_grads = np.zeros_like(target_features)
        
        for alpha in alphas:
            # Interpolated features
            interp = baseline_features + alpha * (target_features - baseline_features)
            interp_tensor = torch.tensor(interp, requires_grad=True).unsqueeze(0)
            
            # Forward pass
            output = self.model(interp_tensor)
            
            # Gradient w.r.t. features
            grad = torch.autograd.grad(output, interp_tensor)[0]
            
            # Accumulate
            integrated_grads += grad.squeeze().numpy()
        
        # Average and scale
        integrated_grads = integrated_grads / self.steps
        integrated_grads *= (target_features - baseline_features)
        
        return AttributionResult(
            gap_index=gap_index,
            baseline_gap=baseline_gap,
            attributions=integrated_grads,
            feature_names=self.get_feature_names(),
            convergence_score=self.check_convergence(integrated_grads)
        )
    
    def check_convergence(self, grads: np.ndarray) -> float:
        """Check convergence of integrated gradients."""
        # Compare with different step counts
        return 1.0  # Placeholder
```

## 8.4 Gap-Uncertainty Quantification

```python
class GapUncertaintyQuantifier:
    """Quantify predictive uncertainty using gap statistics."""
    
    def __init__(self, model: nn.Module,
                 gap_feature_extractor: GapFeatureEngine,
                 method: str = 'ensemble'):
        self.model = model
        self.extractor = gap_feature_extractor
        self.method = method
        
        if method == 'ensemble':
            self.ensemble = self.build_ensemble()
        elif method == 'dropout':
            self.enable_dropout()
        elif method == 'laplace':
            self.laplace_approx = LaplaceApproximation(model)
    
    def predict_with_uncertainty(self, gap_index: int,
                                 num_samples: int = 100) -> UncertaintyResult:
        """Predict with uncertainty estimates."""
        features = self.extractor.extract_features(gap_index)
        features_tensor = torch.tensor(features).unsqueeze(0)
        
        if self.method == 'ensemble':
            predictions = []
            for m in self.ensemble:
                with torch.no_grad():
                    pred = m(features_tensor)
                predictions.append(pred.numpy())
            
            predictions = np.array(predictions)  # [E, 1]
            
        elif self.method == 'dropout':
            predictions = []
            self.model.train()  # Enable dropout
            for _ in range(num_samples):
                with torch.no_grad():
                    pred = self.model(features_tensor)
                predictions.append(pred.numpy())
            self.model.eval()
            predictions = np.array(predictions)
            
        elif self.method == 'laplace':
            mean, cov = self.laplace_approx.predict(features_tensor)
            predictions = np.random.multivariate_normal(
                mean.flatten(), cov, num_samples
            )
        
        # Compute statistics
        mean_pred = np.mean(predictions)
        std_pred = np.std(predictions)
        
        # Decompose uncertainty
        if self.method == 'ensemble':
            # Epistemic = variance across ensemble
            epistemic = np.var([np.mean(p) for p in predictions])
            # Aleatoric = mean of individual variances
            aleatoric = np.mean([np.var(p) for p in predictions])
        else:
            epistemic = std_pred**2
            aleatoric = 0.0
        
        # Gap-index specific uncertainty
        gap_entropy = self.extractor.get_entropy(gap_index)
        gap_coverage = self.training_coverage(gap_index)
        
        return UncertaintyResult(
            gap_index=gap_index,
            mean=mean_pred,
            std=std_pred,
            epistemic=epistemic,
            aleatoric=aleatoric,
            gap_entropy=gap_entropy,
            training_coverage=gap_coverage,
            prediction_interval=self.prediction_interval(predictions, 0.95)
        )
    
    def training_coverage(self, gap_index: int) -> float:
        """Estimate training data coverage near gap index."""
        # Distance to nearest training gap indices
        # Weighted by gap-index density
        return 1.0  # Placeholder
    
    def prediction_interval(self, predictions: np.ndarray, 
                           confidence: float = 0.95) -> Tuple[float, float]:
        """Compute prediction interval."""
        alpha = 1 - confidence
        lower = np.percentile(predictions, 100 * alpha / 2)
        upper = np.percentile(predictions, 100 * (1 - alpha / 2))
        return (float(lower), float(upper))
```

## 8.5 Gap-Conformal Prediction

```python
class GapConformalPredictor:
    """Conformal prediction with gap-index calibration."""
    
    def __init__(self, model: nn.Module,
                 gap_feature_extractor: GapFeatureEngine,
                 calibration_gaps: List[int],
                 alpha: float = 0.1):
        self.model = model
        self.extractor = gap_feature_extractor
        self.alpha = alpha
        
        # Compute nonconformity scores on calibration set
        self.calibration_scores = self.compute_calibration_scores(calibration_gaps)
        self.quantile = np.quantile(self.calibration_scores, 1 - alpha)
    
    def compute_calibration_scores(self, gap_indices: List[int]) -> np.ndarray:
        """Nonconformity scores: |y - ŷ| for calibration gaps."""
        scores = []
        for gap in gap_indices:
            features = self.extractor.extract_features(gap)
            pred = self.model(torch.tensor(features).unsqueeze(0))
            # True value from PrimeBookOne
            true_val = self.get_true_value(gap)
            score = abs(pred.item() - true_val)
            scores.append(score)
        return np.array(scores)
    
    def predict_set(self, gap_index: int) -> PredictionSet:
        """Conformal prediction set for gap index."""
        features = self.extractor.extract_features(gap_index)
        pred = self.model(torch.tensor(features).unsqueeze(0)).item()
        
        # Prediction interval
        lower = pred - self.quantile
        upper = pred + self.quantile
        
        # Adjust for gap-index specific coverage
        gap_entropy = self.extractor.get_entropy(gap_index)
        entropy_factor = 5.585 / max(gap_entropy, 0.1)
        
        return PredictionSet(
            gap_index=gap_index,
            point_prediction=pred,
            interval=(lower / entropy_factor, upper / entropy_factor),
            coverage=1 - self.alpha,
            gap_entropy=gap_entropy
        )
```

## 8.6 Gap-Counterfactual Explanations

```python
class GapCounterfactualExplainer:
    """Generate counterfactual explanations in gap-index space."""
    
    def __init__(self, model: nn.Module,
                 gap_feature_extractor: GapFeatureEngine,
                 gap_constraints: GapConstraints):
        self.model = model
        self.extractor = gap_feature_extractor
        self.constraints = gap_constraints
    
    def explain(self, gap_index: int, target_output: float,
                max_iter: int = 1000) -> CounterfactualResult:
        """Find nearest gap index with target output."""
        original_features = self.extractor.extract_features(gap_index)
        original_output = self.model_output(gap_index)
        
        # Optimize in gap-index space
        current_gap = gap_index
        best_gap = gap_index
        best_diff = abs(original_output - target_output)
        
        for _ in range(max_iter):
            # Propose neighbor
            neighbor = self.propose_neighbor(current_gap)
            
            # Check constraints
            if not self.constraints.is_valid(neighbor):
                continue
            
            # Evaluate
            neighbor_output = self.model_output(neighbor)
            diff = abs(neighbor_output - target_output)
            
            if diff < best_diff:
                best_diff = diff
                best_gap = neighbor
            
            # Move towards better
            if neighbor_output > original_output:
                current_gap = neighbor
        
        # Compute feature differences
        cf_features = self.extractor.extract_features(best_gap)
        feature_diff = cf_features - original_features
        
        return CounterfactualResult(
            original_gap=gap_index,
            counterfactual_gap=best_gap,
            original_output=original_output,
            target_output=target_output,
            achieved_output=self.model_output(best_gap),
            feature_differences=feature_diff,
            gap_distance=abs(best_gap - gap_index),
            valid=self.constraints.is_valid(best_gap)
        )
    
    def propose_neighbor(self, gap_index: int) -> int:
        """Propose neighboring gap index."""
        # Weighted random walk in gap space
        steps = [1, 2, 4, 8, 16, 32, 64, 128, 256, 512, 1024]
        probs = np.array([1/s for s in steps])
        probs /= probs.sum()
        
        step = np.random.choice(steps, p=probs)
        direction = np.random.choice([-1, 1])
        
        return gap_index + direction * step
```

---

**Next Piece:** Piece 09 covers Gap-Native MLOps: Training, Deployment, and Monitoring on Gap Indices.