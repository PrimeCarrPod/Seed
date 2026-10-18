## 5. Insider Threat & Runtime Monitoring

### 5.1 Behavioral Analytics — DOC-30 Integration

Per **NIST 800-53 CA-7/CA-8** and **DOC-30 neuromorphic monitor**:

**Baseline Model** (per operator + suit):

$$
\mathcal{B} = \{ \mu_{HR}, \sigma_{HR}, \mu_{keystroke}, \mu_{voice}, \mu_{gesture}, \text{Command N-grams} \}
$$

**Anomaly Score**:

$$
A(t) = \sum_{i} w_i \cdot \frac{|x_i(t) - \mu_i|}{\sigma_i + \epsilon}
$$

Alert if $A(t) > \theta_A$ (adaptive threshold, $\theta_A \approx 3.5\sigma$).

### 5.2 Immutable Audit Log — Blockchain Ledger

Per **DOC-30 §7.3** and **NIST 800-53 AU-2/AU-6**:

$$
\text{Log}_n = \{ \text{Event}, \text{Actor}, \text{Resource}, \text{Action}, \text{Result}, t_n, H_{n-1} \}
$$

$$
H_n = \text{SHA3-256}(H_{n-1} \| \text{Log}_n)
$$

**Log Entry Types**:
- Authentication (success/fail)
- Authorization (grant/deny)
- Configuration change
- Firmware update
- Crypto key operation
- Sensor data access
- AI model inference (hash of input/output)

### 5.3 Hardware Root of Trust — DOC-30

**TCG DICE (Device Identifier Composition Engine)**:

$$
\text{CDI}_{layer} = \text{HMAC}_{K_{parent}}(\text{CodeHash}_{layer} \| \text{Config}_{layer})
$$

Layer 0: ROM (immutable) → Layer 1: Bootloader → Layer 2: OS → Layer 3: Apps

**Attestation**:

$$
\text{Quote} = \text{Sign}_{AK}(\text{PCR}_0..15 \| \text{Nonce} \| \text{Timestamp})
$$

Verified by remote attestation service (DOC-29 comms).

---
