# DOC-05: Structural Framework Specification
**Project:** AegisOutfitFabricator — Historical Renaissance Protective Outfit Fabrication System  
**Document ID:** DOC-05  
**Version:** 1.0  
**Classification:** Core Document Batch 1  
**Dependencies:** MAT-02, DRAFT-04, MAT-03, MAT-04, SYNTH-01, CSMFAB078 Main §4, CSMFAB078-A §3, CSMFAB078-B §3  
**Status:** AUTHORED — Pipeline Pending  

---

## 1. Baleen/Steel Hybrid Chassis (from MAT-02, DRAFT-04, CSMFAB078 Main §4.3, CSMFAB078-A §3.3)

### 1.1 Baleen Tensor Properties (Hydrated)

**Orthotropic Elasticity Tensor (Principal Material Directions):**

$$\mathbb{C}_{\text{baleen}} = \begin{bmatrix}
E_L & \nu_{LT}E_T & \nu_{LR}E_R & 0 & 0 & 0 \\
\nu_{TL}E_L & E_T & \nu_{TR}E_R & 0 & 0 & 0 \\
\nu_{RL}E_L & \nu_{RT}E_T & E_R & 0 & 0 & 0 \\
0 & 0 & 0 & G_{LT} & 0 & 0 \\
0 & 0 & 0 & 0 & G_{LR} & 0 \\
0 & 0 & 0 & 0 & 0 & G_{TR}
\end{bmatrix}$$

**Principal Values (per MAT-02 §3.1):**
- $E_L = 4.5\text{ GPa}$ (longitudinal, along keratin tubules)
- $E_T = 1.8\text{ GPa}$ (transverse, circumferential)
- $E_R = 1.2\text{ GPa}$ (radial, through thickness)
- $\nu_{LT} = 0.35$, $\nu_{TL} = 0.14$ (reciprocity: $\nu_{TL} = \nu_{LT} E_T/E_L$)
