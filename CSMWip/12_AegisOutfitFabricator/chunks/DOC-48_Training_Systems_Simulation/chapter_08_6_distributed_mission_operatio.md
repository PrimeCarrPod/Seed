## 6. Distributed Mission Operations (DMO)

### 6.1 DMO Architecture — LVC Federation

The DMO capability connects geographically dispersed training sites into a single synthetic battlespace per **SISO-STD-001 (RPR-FOM)** and **TENA**. Federation architecture references **SYNTH-02** protective layer adaptation for cross-domain threat mapping. **CSMFAB078-A** edition parameters drive site-specific configuration. **SYNTH-03** drafting kernel supports federated geometry.

**Federation Topology**:

```
SITE A (Live Range) ←→ GATEWAY ←→ SITE B (Virtual Sim) ←→ GATEWAY ←→ SITE C (Constructive CGF)
        ↓                                                    ↓
   TENA SDR                                            DIS/HLA
        ↓                                                    ↓
   RANGE INSTRUMENTATION                              FEDERATION MANAGER
```

**Latency Budget for DMO**:

$$L_{\text{total}} = L_{\text{local}} + L_{\text{wan}} + L_{\text{gateway}} + L_{\text{federation}} \leq 100 \text{ ms}$$

| Component | Budget (ms) | Technology |
|-----------|-------------|------------|
| Local simulation | 11.11 | V4.0 Physics |
| WAN transport | 50 | MPLS / SATCOM |
| Gateway translation | 5 | TENA-DIS/HLA |
| Federation management | 3 | RTI |
| **Total** | **69.11** | — |

### 6.2 Cross-Domain Interoperability

**Data Mapping — Live to Virtual**:

$$\text{Entity State}_{\text{virtual}} = \mathcal{T}_{\text{LV}}(\text{Entity State}_{\text{live}})$$

Where $\mathcal{T}_{\text{LV}}$ transforms:
- GPS → Geocentric coordinates (WGS-84)
- Sensor tracks → Entity state PDUs
- Radio comms → HLA interactions

**Consistency Maintenance (Dead Reckoning)**:

$$\mathbf{p}(t) = \mathbf{p}_0 + \mathbf{v}_0 \Delta t + \frac{1}{2} \mathbf{a}_0 \Delta t^2$$

$$\text{Error Bound: } \|\mathbf{p}_{\text{true}}(t) - \mathbf{p}_{\text{DR}}(t)\| \leq \epsilon_{\text{max}} = 0.5 \text{ m}$$

### 6.3 DMO Scalability

**Maximum Federation Size**:

$$N_{\text{sites}}^{\text{max}} = \left\lfloor \frac{B_{\text{wan}}}{B_{\text{per-site}}} \right\rfloor = \left\lfloor \frac{10 \text{ Gbps}}{50 \text{ Mbps}} \right\rfloor = 200$$

Where $B_{\text{per-site}} = 50$ Mbps (entity updates, voice, video).

**Federate Join/Leave Time**:

$$T_{\text{join}} = T_{\text{connect}} + T_{\text{register}} + T_{\text{sync}} + T_{\text{validate}} \leq 30 \text{ s}$$

---

