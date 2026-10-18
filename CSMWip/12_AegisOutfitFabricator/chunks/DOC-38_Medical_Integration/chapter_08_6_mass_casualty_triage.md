## 6. Mass Casualty Triage

### 6.1 Triage Algorithm — SALT + AI

Per **SALT (Sort-Assess-Lifesaving interventions-Treatment/Transport)** and **DOC-30 AI augmentation**:

**Step 1 — Global Sort** (DOC-29 imagery + DOC-30):
- **Walking** → T3 (Minimal)
- **Waving/Purposeful movement** → Assess
- **Still/Obvious death** → EXP

**Step 2 — Individual Assessment** (≤ 60 s/casualty):
$$
\text{Assess: } \{ \text{Airway}, \text{Breathing}, \text{Circulation}, \text{Disability}, \text{Exposure} \}
$$

**Step 3 — Lifesaving Interventions** (Auto + Medic):
- Airway: iSGA (DOC-38 §2.3)
- Breathing: ANT (DOC-38 §2.4)
- Circulation: ITS + Hemostatic (DOC-38 §2.1–2.2)

**Step 4 — AI-Assisted Triage Category**:
$$
P(c | \text{data}) = \text{DOC-30 Inference}(\mathbf{v}, \text{injury pattern}, \text{mechanism})
$$

### 6.2 Resource Allocation Optimization

**Maximize Survivability** given constrained resources (medics, litters, MEDEVAC slots):

$$
\max \sum_{j=1}^M S_j \cdot \mathbb{I}(\text{Treated}_j)
$$

Subject to:
$$
\sum_{j \in T1} \text{MedicTime}_j \leq T_{medic}^{avail}
$$
$$
\sum_{j \in T1} \text{Litter}_j \leq N_{litter}
$$
$$
\sum_{j \in T1} \text{MEDEVAC}_j \leq N_{slots}
$$

Where $S_j$ = survival probability if treated (from DOC-30), $M$ = casualties.

**Solution**: Greedy by $S_j / \text{ResourceCost}_j$ ratio (knapsack approximation).

### 6.3 Triage Tagging — Digital + Physical

- **Digital**: RFID tag (ISO 18000-6C) with casualty ID, triage category, vitals hash
- **Physical**: NATO-standard triage tag (T1=Red, T2=Yellow, T3=Green, EXP=Black)
- **Sync**: Every 5 min or on category change

---
