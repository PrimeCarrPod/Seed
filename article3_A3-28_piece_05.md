# Quantum_Federation_Multi_Tenant_Prime_Gaps — Piece 05/12
## Article 3: A3-28 — Quantum Federation Multi-Tenant Prime Gaps
**Piece:** 05 of 12  
**Generated:** 2026-08-24 02:51:06 UTC

---

# Gap-Indexed Security: Tenant Security Domains, Key Management, and Threat Isolation

## 5.1 The Security Multi-Tenancy Problem

Security at the quantum edge is **gap-native** (A3-27 Piece 07). Multi-tenancy requires:
- **Tenant security domains** — isolated threat detection, attestation, keys
- **Key hierarchy** — gap-derived, tenant-scoped, rotation-aligned
- **Threat isolation** — compromise of Tenant A never affects Tenant B
- **Compliance per tenant** — different regulations per tenant gap-range

## 5.2 Tenant Security Domain (TSD)

### 5.2.1 TSD Definition

```
TenantSecurityDomain(T) = {
  tenant_id: T,
  gap_range: T.gap_ranges,
  trust_level: T.trust_level,           // 0-3 per gap-index (Piece 07)
  attestation_state: TenantAttestationState(T),  // Piece 01
  key_hierarchy: TenantKeyHierarchy(T),  // Below
  threat_detection: TenantGADS(T),       // Tenant-scoped GADS
  policy_engine: TenantGPE(T),           // Tenant-scoped GPE
  incident_response: TenantIR(T),        // Tenant-specific IR
  audit_trail: TenantGAT(T)              // Tenant-scoped GAT
}
```

### 5.2.2 TSD Isolation Properties

| Property | Enforcement |
|----------|-------------|
| **Attestation Isolation** | Separate LMT roots per tenant per gap-index |
| **Key Isolation** | Tenant keys derived from `H(d_n || T.tenant_id || ...)` |
| **Threat Detection Isolation** | Tenant GADS only sees tenant's GTRs |
| **Policy Isolation** | Tenant GPE only evaluates tenant's policies |
| **Incident Isolation** | Tenant IR cannot trigger cross-tenant actions |
| **Audit Isolation** | Tenant GAT only contains tenant's GARs |

## 5.3 Tenant Key Hierarchy (TKH)

### 5.3.1 Key Derivation Tree

```
Root Seed (per tenant): 
  SK_T = H(T.tenant_id || "master" || epoch_0)

Level 1: Gap-Index Keys (per gap-index)
  K_T(n) = H(SK_T || d_n || "gap-key" || epoch)

Level 2: Purpose Keys (per gap-index)
  K_T_enc(n)   = H(K_T(n) || "encryption")     // AEAD
  K_T_auth(n)  = H(K_T(n) || "authentication")  // MAC
  K_T_quant(n) = H(K_T(n) || "quantum")         // QKD, teleportation
  K_T_attest(n)= H(K_T(n) || "attestation")     // LMT signing
  K_T_fl(n)    = H(K_T(n) || "federated")       // FL masks

Level 3: Session Keys (per operation)
  K_session = H(K_T_purpose(n) || nonce || counter)
```

**Properties**:
- **Gap-deterministic**: Same inputs → same keys (no key distribution needed)
- **Tenant-scoped**: Different tenants → completely independent key trees
- **Forward secrecy**: Epoch rotation every 1000 gaps (gap-checkpoint)
- **Quantum-safe**: HKDF with Kyber-1024 / Dilithium-5

### 5.3.2 Key Rotation at Gap-Checkpoint

```
KeyRotation(T, checkpoint_k):
1. New epoch = k
2. For each n ∈ T.gap_ranges:
     a. Derive new Level 1 keys: K_T(n) with epoch=k
     b. Derive new Level 2 purpose keys
     c. Update LMT signing key
     d. Update FL mask seeds
     e. Re-encrypt any data-at-rest with new K_T_enc(n)
3. Old epoch keys: Securely erased (quantum-secure deletion)
4. Emit: KEY_ROTATION GAR for each gap-index
```

**Zero-downtime**: Rotation happens at checkpoint boundary; in-flight operations use old keys until complete.

## 5.4 Tenant Attestation: Gap-Attestation per Tenant

### 5.4.1 Tenant Local Gap-Attestation (TLGA)

Each tenant runs **independent LGA** on their gaps:

```
TLGA(T, n):
1. Tenant collects: GTRs, resource metrics, quantum stats for n
2. Tenant computes: Gap-stat summary S_T(n) = {density, entropy, correlation}
3. Tenant verifies: S_T(n) matches expected for T.gap_range (not global 3.0!)
4. Tenant signs: σ_T = Sign_{K_T_attest(n)}(n, S_T(n), checkpoint)
5. Tenant updates: Tenant LMT root R_T(n)
6. If deviation: Tenant emits TENANT_ANOMALY GTR (not global)
```

**Tenant-specific expectations**: Tenant's gap-range may have different statistics than global 3.0 (e.g., tenant selected high-correlation gaps).

### 5.4.2 Tenant Bridged Gap-Attestation (TBGA)

```
TBGA(T, n, core_anchor):
1. Tenant sends: (n, R_T(n), S_T(n), σ_T) to core
2. Core verifies:
     a. σ_T valid for T's registered key at n
     b. S_T(n) consistent with 3.0 statistics (allowing tenant selection bias)
     c. n ∈ T.gap_ranges (enforced by core)
3. Core returns: (ACK, core_root, σ_core)
4. Tenant stores: core_anchor for n
```

**Core enforces tenant boundaries** — TBGA fails if gap-index not in tenant's range.

## 5.5 Tenant Threat Detection: Scoped GADS

### 5.5.1 Tenant GADS Instance

```
TenantGADS(T) = {
  input_stream: Filtered GTRs where gap_index ∈ T.gap_ranges,
  models: {
    stat_anomaly: Trained on T.gap_range baseline,
    behavioral_anomaly: Trained on T's workload patterns,
    correlation_break: Monitors C(n,m) for n,m ∈ T.gap_ranges,
    quantum_anomaly: Monitors fidelity, syndrome for T's qubits
  },
  alerting: TenantAlertRouter(T),
  quarantine: TenantQuarantine(T)
}
```

### 5.5.2 Threat Isolation

| Threat | Tenant Isolation |
|--------|------------------|
| **Data poisoning** | Only affects tenant's φ_edge(n), FL |
| **Model poisoning** | Only affects tenant's models |
| **Quantum attack** | Only affects tenant's logical qubits |
| **Side-channel** | Tenant's keys, timing independent |
| **Resource exhaustion** | Quota enforcement (Piece 06) |

**Cross-tenant threat propagation**: Impossible by design — no shared gap-indices, keys, attestation, or threat models.

## 5.6 Tenant Policy Engine: Scoped GPE

### 5.6.1 Tenant GPE Rules

```
TenantGPE(T):
Rules = {
  // Resource access
  ALLOW: task ∈ T.tasks AND n ∈ T.gap_ranges,
  DENY: n ∉ T.gap_ranges (unless peering),
  
  // Quantum operations
  ALLOW: entanglement(n,m) where n,m ∈ T.gap_ranges,
  DENY: entanglement to n ∉ T.gap_ranges,
  
  // ML operations
  ALLOW: inference/model_access for T.models,
  DENY: access to other tenant models,
  
  // Cross-tenant
  ALLOW: IF peering_contract_valid AND n ∈ peering_gaps,
  DENY: all other cross-tenant
}
```

### 5.6.2 Policy Deployment

Tenant policies deployed **at gap-checkpoint** via atomic update:

```
DeployTenantPolicy(T, new_rules):
1. Validate: new_rules consistent with federation policies (Piece 10)
2. Stage: At next gap-checkpoint k
3. Atomic switch: All GIRs in T.gap_ranges update TRT[T] + GPE rules
4. Verify: Post-deployment policy check on sample gaps
5. Rollback: Automatic if violation rate > 1%
```

## 5.7 Tenant Incident Response: Scoped IR

### 5.7.1 Tenant IR Playbook

```
TenantIR(T):
On TENANT_ANOMALY:
1. Classify: Level 1/2/3 (within tenant's gaps)
2. Contain: 
     Level 1: Quarantine specific logical qubits/models
     Level 2: Quarantine gap-subrange via GIMP (within T)
     Level 3: Full tenant quarantine (all gaps)
3. Investigate: TenantGapForensics (scoped to T.gap_ranges)
4. Remediate: Rotate keys, rollback models, restore from backup
5. Report: TENANT_INCIDENT_REPORT GCRpt (tenant + federation)
6. Recover: Gradual lift quarantine, verify attestation
```

### 5.7.2 Federation Coordination

Federation security (global GADS) **informed but not controlling** tenant IR:

```
GlobalOnTenantIncident(T, incident):
1. Receive: TENANT_INCIDENT_REPORT
2. Correlate: Check if same pattern in other tenants
3. If correlated: Elevate to FEDERATION_INCIDENT
4. If isolated: Log, monitor, no intervention
5. Never: Direct tenant IR actions (tenant sovereignty)
```

---

*End of Piece 05. Next: Piece 06 — Gap-Indexed Compliance: Tenant Regulatory Mapping, Data Sovereignty, and Audit*