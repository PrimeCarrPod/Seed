# DOC-04: Geometric Pattern System
**Project:** AegisOutfitFabricator — Historical Renaissance Protective Outfit Fabrication System  
**Document ID:** DOC-04  
**Version:** 1.0  
**Classification:** Core Document Batch 1  
**Dependencies:** DRAFT-01, DRAFT-02, DRAFT-03, DRAFT-04, DRAFT-05, SYNTH-01, CSMFAB078-A, MAT-02, Research Doc 1, CSMFAB078 Main  
**Status:** AUTHORED — Pipeline Pending  

---

## 1. Developable Surface Engine (from DRAFT-01, SYNTH-01 §3.1, Research Doc 1 §4.1, CSMFAB078 Main §5.1)

### 1.1 Convolute Surface Generation

**Directrix Curve Definition (Body Silhouette Cross-Sections):**

$$\mathbf{c}(u) = \begin{bmatrix} x(u) \\ y(u) \\ z(u) \end{bmatrix} = \begin{bmatrix} R(u) \cos\theta(u) \\ R(u) \sin\theta(u) \\ z(u) \end{bmatrix}$$

Where $u \in [0,1]$ parameterizes body height, $R(u)$ = radius at height $u$, $\theta(u)$ = angular offset for asymmetry.

**Generatrix Ruling (Straight Grain Lines):**
