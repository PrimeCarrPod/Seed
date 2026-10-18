## 4. Communications Security (COMSEC)

### 4.1 Waveform Security — DOC-29 RF Mesh

Per **DOC-29 §4** and **CNSSI 1253**:

| Waveform | Modulation | Crypto | LPI/LPD | Anti-Jam |
|----------|------------|--------|---------|----------|
| **Mesh-Net** | OFDM, 64-QAM | AES-256-GCM | FHSS, 100 hops/s | DSSS, PG=20 dB |
| **SATCOM** | DVB-S2X, QPSK/8PSK | AES-256-GCM + TRANSEC | N/A | Spot beam |
| **LTE/5G** | NR Rel. 17 | 128-NEA2/128-NIA2 | N/A | MIMO, beamforming |
| **Optical** | PPM, 1550 nm | AES-256-GCM | Inherent (narrow beam) | N/A |

**Key Hierarchy** (per CNSSI 4005):

```
Root CA (Offline, HSM)
    │
    ├── COMSEC Key (KEK) — 256-bit, annual rotation
    │       │
    │       ├── Traffic Encryption Key (TEK) — per session, PFS
    │       ├── Authentication Key (AK) — HMAC-SHA384
    │       └── Key Encryption Key (KEK) — for key wrap
    │
    └── TRANSEC Key (Hopping) — per net, daily rotation
```

**Perfect Forward Secrecy (PFS)**:

$$
\text{TEK}_{session} = \text{KDF}(\text{ECDH}(sk_{ephem}, pk_{peer}), \text{salt})
$$

Curve: NIST P-384 / X448. Ephemeral keys per session.

### 4.2 Quantum-Resistant Cryptography — NIST PQC

Per **FIPS 203/204/205 (2024)** and **CNSA 2.0** timeline:

| Algorithm | Standard | Use Case | Migration Target |
|-----------|----------|----------|------------------|
| **ML-KEM (Kyber)** | FIPS 203 | KEM (key exchange) | FY27 (replaces ECDH) |
| **ML-DSA (Dilithium)** | FIPS 204 | Digital signatures | FY27 (replaces ECDSA) |
| **SLH-DSA (SPHINCS+)** | FIPS 205 | Hash-based signatures | FY28 (long-term) |

**Hybrid Mode** (transition):

$$
\text{SharedSecret} = \text{KDF}( \text{ECDH}(sk, pk) \| \text{ML-KEM.Decaps}(sk_{pq}, ct) )
$$

### 4.3 Link Layer Security — IEEE 802.1AR / 802.15.4z

**Device Identity (DevID)** per **IEEE 802.1AR**:

- **Initial DevID (IDevID)**: Manufacturer-installed, X.509, P-384
- **Local DevID (LDevID)**: Provisioned at depot, bound to hardware PUF

**Secure Ranging** (802.15.4z HRP-UWB):

$$
\text{Distance} = \frac{c \cdot (t_{rx} - t_{tx} - t_{reply})}{2}
$$

Authenticated via AES-128-CCM on ranging packets. Prevents relay attacks.

---
