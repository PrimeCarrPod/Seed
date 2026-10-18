## 3. Telemedicine Architecture

### 3.1 Communication Stack — DOC-29 Integration

Per **DOC-29 §5** and **HIPAA-compliant** reachback:

| Layer | Technology | Bandwidth | Latency | Security |
|-------|------------|-----------|---------|----------|
| **Physical** | SATCOM (AEHF) + LTE/5G + Mesh | 1–50 Mbps | 50–500 ms | AES-256-GCM |
| **Transport** | QUIC + DTLS 1.3 | — | — | PFS, 0-RTT |
| **Application** | FHIR R4 + DICOMweb + HL7 | — | — | SMART on FHIR |

**Bandwidth Allocation** (priority-weighted):

$$
B_{telemed} = \sum_{i} p_i \cdot b_i \leq B_{avail}
$$

| Stream | Priority $p_i$ | Bandwidth $b_i$ | Content |
|--------|----------------|-----------------|---------|
| **Vital Signs** | 1.0 | 64 kbps | Continuous JSON (IEEE 11073) |
| **Audio (Medic)** | 0.9 | 32 kbps | Opus, 16 kHz mono |
| **Video (Wound)** | 0.7 | 500 kbps | H.265, 720p @ 15 fps |
| **Ultrasound** | 0.8 | 2 Mbps | Compressed cine loops |
| **AI Triage Report** | 0.9 | 10 kbps | DOC-30 output (JSON) |

### 3.2 AI Triage — DOC-30 Integration

Per **DOC-30 §7**, neuromorphic core runs **triage inference**:

$$
\text{Triage Category} = \arg\max_{c \in \{T1,T2,T3,EXP\}} P(c | \mathbf{v}, \mathbf{h}, \mathbf{m})
$$

Where $\mathbf{v}$ = vitals, $\mathbf{h}$ = injury pattern (DOC-29 imagery), $\mathbf{m}$ = mechanism.

**Categories** (NATO STANAG 2879):
- **T1** (Immediate): Life-threatening, salvageable (e.g., airway, tension PTX, exsanguination)
- **T2** (Delayed): Serious, stable for hours (e.g., open fractures, burns <20%)
- **T3** (Minimal): Minor, can wait (e.g., lacerations, sprains)
- **EXP** (Expectant): Unsalvageable with current resources

**AI Confidence Threshold**:

$$
\text{Autonomous if } \max_c P(c) \geq 0.90 \quad \text{else } \text{Human-in-loop}
$$

### 3.3 Store-and-Forward for Disconnected Ops

Per **MIL-STD-188-220** and **DTN (Delay-Tolerant Networking)**:

$$
\text{Bundle} = \{ \text{Payload}, \text{Metadata}, \text{Custody Timer} \}
$$

**Custody Transfer Protocol**:

1. AIMES → Local Mesh (DOC-29) → RMH (DOC-35) → SATCOM Gateway
2. Each hop acknowledges custody
3. Max custody timer: 24 hr (configurable per DOC-35 §3)
4. Priority queue: T1 > T2 > Audio > Video > Routine

---
