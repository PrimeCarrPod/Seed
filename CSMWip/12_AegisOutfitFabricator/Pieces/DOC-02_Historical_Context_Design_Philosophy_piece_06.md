
$$\mathbf{g}_{\text{eff}}(\mathbf{x}) = \mathbf{g}_{\text{hist}}(\mathbf{x}) + \mathbf{w}_{\text{protect}} \odot \mathbf{g}_{\text{modern}}(\mathbf{x}) \leq \mathbf{0}$$

Where $\mathbf{w}_{\text{protect}}$ weights modern protection requirements against historical constraints.

---

## 3. Design Philosophy: Authenticity ↔ Protection

### 3.1 Historical Authenticity Score (HAS)

$$\text{HAS} = \sum_{k=1}^{K} \omega_k \cdot \mathbb{I}[F_k \in \mathcal{H}_{1600-1700}] + \sum_{m=1}^{M} \gamma_m \cdot \text{Sim}(P_m, P_m^{\text{hist}})$$

**Feature Categories ($K=12$):**
1. Silhouette accuracy (Watteau back, farthingale profile)
2. Textile typology compliance (CIETA class match)
3. Stitch class fidelity (ISO 4915 ↔ historical mapping)
4. Seam allowance adherence (Alcega/Garsault specs)
5. Lacing topology (historical eyelet placement)
6. Pleating mathematics (3:1 Watteau, S-curve cartridge)
7. Metallic thread construction (Au-Hg/Ag gilded)
8. Pigment chemistry (historical palette match)
