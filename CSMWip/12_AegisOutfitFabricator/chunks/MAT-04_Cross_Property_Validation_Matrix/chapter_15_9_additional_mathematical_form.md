## 9. Additional Mathematical Formulas

### 9.1 Correlation and Covariance
**Pearson Correlation:**
```
$r_{xy} = \frac{\sum (x_i - \bar{x})(y_i - \bar{y})}{\sqrt{\sum (x_i - \bar{x})^2 \sum (y_i - \bar{y})^2}}$
```
```
$\text{Cov}(X,Y) = \frac{1}{n-1} \sum (x_i - \bar{x})(y_i - \bar{y})$
```



### 9.2 Principal Component Analysis
**Covariance Matrix:**
```
$\mathbf{\Sigma} = \frac{1}{n-1} \mathbf{X}^T \mathbf{X}$
```
```
$\mathbf{\Sigma} = \mathbf{V} \mathbf{\Lambda} \mathbf{V}^T$  (eigendecomposition)
```
```
$\text{PC}_k = \mathbf{X} \mathbf{v}_k$  (principal components)
```



### 9.3 Cross-Property Validation Metrics
**Validation Score:**
```
$S_{\text{val}} = 1 - \frac{\| \mathbf{y}_{\text{pred}} - \mathbf{y}_{\text{meas}} \|_2}{\| \mathbf{y}_{\text{meas}} \|_2}$
```
```
$R^2 = 1 - \frac{\sum (y_i - \hat{y}_i)^2}{\sum (y_i - \bar{y})^2}$
```



### 9.4 Multivariate Regression
**Multiple Linear Regression:**
```
$\mathbf{y} = \mathbf{X} \boldsymbol{\beta} + \boldsymbol{\varepsilon}$
```
```
$\hat{\boldsymbol{\beta}} = (\mathbf{X}^T \mathbf{X})^{-1} \mathbf{X}^T \mathbf{y}$
```
```
$\text{VIF}_j = \frac{1}{1 - R_j^2}$  (Variance Inflation Factor)
```



### 9.5 Uncertainty Quantification
**Monte Carlo Propagation:**
```
$\mu_Y = f(\mu_X), \quad \sigma_Y^2 = \nabla f^T \mathbf{\Sigma}_X \nabla f$
```
```
$Y = f(X_1, ..., X_n) \approx f(\mu) + \sum \frac{\partial f}{\partial x_i} (X_i - \mu_i)$
```



### 9.6 Sensitivity Analysis
**Sobol Indices:**
```
$S_i = \frac{\text{Var}_{X_i}(E[Y|X_i])}{\text{Var}(Y)}$  (first-order)
```
```
$S_{Ti} = 1 - \frac{\text{Var}_{X_{\sim i}}(E[Y|X_{\sim i}])}{\text{Var}(Y)}$  (total-order)
```


