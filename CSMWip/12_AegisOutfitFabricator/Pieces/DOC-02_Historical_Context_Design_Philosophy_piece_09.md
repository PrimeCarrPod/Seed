---

## 6. Computational Implementation Architecture

### 6.1 HAS/PES Evaluation Pipeline

```python
def evaluate_design(x: DesignVector, edition: Edition) -> Tuple[float, float]:
    """
    Evaluate Historical Authenticity Score and Protection Efficacy Score.
    Returns: (HAS, PES) in [0, 1] × [0, 1]
    """
    # Decode design vector
    layer_thicknesses = decode_thicknesses(x[:12])
    material_choices = decode_materials(x[12:24])
    les_tensions = x[24:36]
    scaling_factors = x[36:39]
    au_density = x[39]
    
    # HAS computation (12 features)
    has_features = compute_historical_features(
        layer_thicknesses, material_choices, les_tensions, 
        scaling_factors, au_density, edition
    )
    has = sum(w * f for w, f in zip(HAS_WEIGHTS, has_features))
    
    # PES computation (5 threats)
    pes_scores = compute_protection_scores(
        layer_thicknesses, material_choices, les_tensions, edition
    )
