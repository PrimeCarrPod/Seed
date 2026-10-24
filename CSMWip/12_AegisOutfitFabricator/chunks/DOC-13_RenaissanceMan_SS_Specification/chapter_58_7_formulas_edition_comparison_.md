## 7. Formulas (Edition Comparison/Transitions/Trade-offs)

### 7.1 Edition Comparison Metrics

**Mass Scaling (CSMFAB078-A Eq. 3.2.3):**
$$\frac{M_e}{M_{ref}} = (1 + \alpha_e)^{1.8} \times [1 + \gamma \cdot \max(0, \alpha_e)]$$

**Mobility Index (CSMFAB078-A Eq. 3.4.2):**
$$MI = 0.4 \frac{ROM}{ROM_0} + 0.3 \frac{M_{ref}}{M} + 0.2 \frac{T_{don,0}}{T_{don}} + 0.1 \frac{R_{th,0}}{R_{th}}$$

**Pareto Dominance:**
$$A \succ B \iff \forall i: f_i(A) \geq f_i(B) \land \exists j: f_j(A) > f_j(B)$$

### 7.2 Transition Formulas

**Transition Time (CSMFAB078-A Eq. 3.5.1):**
$$T_{trans} = \frac{|M_1 - M_2|}{\dot{M}_{max}} + \frac{|N_{p1} - N_{p2}|}{\dot{N}_{panel}} + \frac{|T_{LES,1} - T_{LES,2}|}{\dot{T}_{LES}}$$

**LES Tension Delta:**
$$\Delta T_{z} = T_{z,ref} \cdot \alpha_e \cdot (\beta_{z,target} - \beta_{z,source})$$

**SMA Actuation Time:**
$$t_{SMA} = \frac{\Delta T_z}{k_{SMA} \cdot I_{max}}$$

### 7.3 Trade-off Analysis

**Utility Function:**
$$U = \sum_{i=1}^{5} w_i \cdot \frac{f_i - f_{i,min}}{f_{i,max} - f_{i,min}}$$

Where $f = [MI, V_{50}/1000, (60-T_{th})/60, SE/70, 1-M/25]$

**Cost-Effectiveness:**
$$CE = \frac{U_{mission}}{C_{unit} + C_{lifecycle}/5}$$

### 7.4 Technology Readiness Scoring

$$TRL_{edition} = \frac{1}{N} \sum_{tech} TRL_{tech} \cdot \text{Criticality}_{tech}$$

---
