## 6. Computational Implementation

### 6.1 Discrete Differential Geometry
Using triangle meshes for garment panels:

```
$K_v = 2\pi - \sum_{j} \theta_{vj}$  (Angle defect at vertex v)
```
```
$H_v = \frac{1}{4A_v} \sum_{j} (\cot \alpha_{ij} + \cot \beta_{ij}) (\mathbf{v}_j - \mathbf{v}_i)$
```
```
$\text{Discrete Gaussian Curvature: } K_d = \frac{K_v}{A_v}$
```



### 6.2 Cone Splitting Algorithm
For flattening non-developable regions:

```
$\text{Split along: } \nabla K \cdot \mathbf{n} = 0$
```
```
$\text{Cut graph: } \mathcal{C} = \arg\min_{\mathcal{C}} \sum_{e \in \mathcal{C}} w_e $
```
```
$\text{Boundary parametrization: } \phi: \partial \Omega \to \partial \tilde{\Omega}$
```


