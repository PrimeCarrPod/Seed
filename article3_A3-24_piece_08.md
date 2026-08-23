# Quantum_Federation_Security_Prime_Gaps — Piece 08/12
## Article 3: A3-24 — Quantum Federation Security Prime Gaps
**Piece:** 08 of 12  
**Generated:** 2026-08-23 22:28:08 UTC

---

# Key Management from Gap Entropy: The Gap Key Management System (GAP-KMS)

## 8.1 Gap Entropy as Key Material

The Prime Gap Directory Hierarchy provides a structured entropy source with known statistical properties. Unlike traditional RNGs where entropy is estimated, gap entropy is **mathematically provable** from prime number theory.

**Entropy Guarantees:**
- Min-entropy per gap: H∞(d_n) ≥ log₂(φ(210)) ≈ 5.585 bits
- Min-entropy per 1024-gap window: ≥ 5,720 bits
- Entropy is **non-extractable** without PrimeBookOne access
- Entropy is **forward-secure**: past gaps don't reveal future gaps

## 8.2 GAP-KMS Architecture

```
┌─────────────────────────────────────────────────────────────────────┐
│                      GAP-KMS ARCHITECTURE                           │
├─────────────────────────────────────────────────────────────────────┤
│                                                                     │
│  ┌──────────────┐    ┌──────────────┐    ┌────────────────────┐   │
│  │ PrimeBookOne │───▶│ Gap Entropy  │───▶│ Gap Key Derivation │   │
│  │  (Source)    │    │  Extractor   │    │    Function (KDF)  │   │
│  └──────────────┘    └──────────────┘    └─────────┬──────────┘   │
│                                                     │              │
│                    ┌────────────────────────────────┼────────┐    │
│                    ▼                                ▼        ▼    │
│            ┌───────────────┐              ┌──────────────┐  ┌──────────┐
│            │ Gap Index     │              │ Gap-Derived  │  │ Gap      │
│            │ Allocator     │              │ Key Types    │  │ Key      │
│            │ (n assignment)│              │              │  │ Lifecycle│
│            └───────────────┘              └──────────────┘  └──────────┘
│                    │                                │             │
│                    ▼                                ▼             ▼
│            ┌─────────────────────────────────────────────────────┐│
│            │              Gap Key Store (GKS)                    ││
│            │  ┌────────┐ ┌────────┐ ┌────────┐ ┌────────────┐  ││
│            │  │ Signing│ │ KEM    │ │ Symm   │ │ Ephemeral  │  ││
│            │  │ Keys   │ │ Keys   │ │ Keys   │ │ Session    │  ││
│            │  └────────┘ └────────┘ └────────┘ └────────────┘  ││
│            └─────────────────────────────────────────────────────┘│
│                                                                     │
└─────────────────────────────────────────────────────────────────────┘
```

## 8.3 Gap Index Allocation

**Gap Index Allocator (GIA)** assigns gap-index ranges to entities:

```go
type GapIndexAllocation struct {
    EntityID       string    // GII of requester
    Purpose        KeyPurpose // SIGNING, KEM, SYMMETRIC, EPHEMERAL
    RangeStart     uint64    // Inclusive
    RangeEnd       uint64    // Inclusive
    AllocatedAt    uint64    // Gap index when allocated
    ExpiresAt      uint64    // Gap index when expires (or 0 for no expiry)
    Metadata       map[string]string
}

type KeyPurpose uint8
const (
    PurposeSigning KeyPurpose = iota
    PurposeKEM
    PurposeSymmetric
    PurposeEphemeral
    PurposeAttestation
    PurposeBackup
)

// Allocation algorithm: contiguous ranges with modulo-class diversity
func (gia *GapIndexAllocator) Allocate(entity GII, purpose KeyPurpose, count uint32) GapIndexAllocation {
    // Find contiguous range with good modulo-210 distribution
    range := gia.findRange(count, purpose)
    
    // Reserve range in allocation map
    gia.reserve(range, entity, purpose)
    
    // Create allocation record
    return GapIndexAllocation{
        EntityID:    entity.String(),
        Purpose:     purpose,
        RangeStart:  range.Start,
        RangeEnd:    range.End,
        AllocatedAt: gia.currentGapIndex(),
        ExpiresAt:   range.Start + purpose.defaultTTL(),
        Metadata:    map[string]string{"allocator_version": "v1"},
    }
}
```

**Allocation Policies:**
- **Signing Keys:** 1 index per key, TTL = 1,000,000 gaps (~2.7 years at 10k ops/sec)
- **KEM Keys:** 16 indices per key (for public key), TTL = 100,000 gaps
- **Symmetric Keys:** 1 index per 32-byte key, TTL = 10,000 gaps
- **Ephemeral/Session:** 1 index per session, TTL = 100 gaps
- **Attestation:** 1 index per certificate, TTL = 1,000 gaps
- **Backup/Recovery:** Dedicated tile range (Tile 180-187), no expiry

## 8.4 Gap Key Derivation Function (GAP-KDF)

```
GAP-KDF(ikm_gap_index, label, context, output_len):
    1. // Extract: derive PRK from gap-index IKM
       prk = HKDF-Extract(
           salt = "GAP-KDF-v1" || label,
           IKM = concat( G(ikm_gap_index), G(ikm_gap_index+1), ..., G(ikm_gap_index+L-1) )
       )
       where L = ceil(256 / 16) = 16 gaps for 256-bit PRK
    
    2. // Expand: generate output keying material
       okm = HKDF-Expand(
           PRK = prk,
           info = context || "GAP-KDF",
           L = output_len
       )
    
    3. Return okm
```

**Domain Separation Labels:**
- `"signing-key"` → ECDSA/EdDSA private key
- `"kem-key"` → KEM private key (ML-KEM-768 seed)
- `"symmetric-key"` → AES-256-GCM / ChaCha20-Poly1305 key
- `"session-key"` → AEAD session key (forward-secure)
- `"attestation-key"` → GAP-DSA signing key
- `"backup-key"` → Shamir share encryption key

## 8.5 Gap Key Lifecycle Management

### 8.5.1 Key States

```
┌────────────┐     ┌──────────┐     ┌─────────┐     ┌───────────┐     ┌──────────┐
│  ALLOCATED │────▶│  ACTIVE  │────▶│ ROTATING│────▶│  EXPIRED  │────▶│ DESTROYED│
└────────────┘     └──────────┘     └─────────┘     └───────────┘     └──────────┘
      │                │                │               │                │
      │                │                │               │                │
      ▼                ▼                ▼               ▼                ▼
   Gap range      In use for      New key being   No longer      Gap indices
   reserved       crypto ops      generated; old  valid for      released to
                   (gap-index      key still       new ops;       allocator;
                   bound)          valid for       awaiting       available for
                                   decrypt/verify  destruction    reallocation
```

### 8.5.2 Automated Rotation

```python
class GapKeyRotationManager:
    def __init__(self, kms: GapKMS):
        self.kms = kms
        self.rotation_policies = {
            KeyPurpose.SIGNING: RotationPolicy(
                trigger_gap_distance=500_000,  # ~1.3 years
                overlap_gaps=10_000,           # Overlap period
                approval_required=True
            ),
            KeyPurpose.KEM: RotationPolicy(
                trigger_gap_distance=50_000,
                overlap_gaps=1_000,
                approval_required=False
            ),
            KeyPurpose.SYMMETRIC: RotationPolicy(
                trigger_gap_distance=5_000,
                overlap_gaps=100,
                approval_required=False
            ),
            KeyPurpose.EPHEMERAL: RotationPolicy(
                trigger_gap_distance=50,
                overlap_gaps=0,
                approval_required=False
            ),
        }
    
    def check_rotation_needed(self) -> List[RotationAction]:
        current_gap = self.kms.get_current_gap_index()
        actions = []
        
        for key in self.kms.list_active_keys():
            policy = self.rotation_policies[key.purpose]
            gaps_since_rotation = current_gap - key.last_rotated_at
            
            if gaps_since_rotation >= policy.trigger_gap_distance:
                actions.append(RotationAction(
                    key_id=key.id,
                    old_gap_range=key.gap_range,
                    new_gap_range=self.kms.allocate_next_range(key),
                    overlap_end=key.gap_range.end + policy.overlap_gaps,
                    requires_approval=policy.approval_required
                ))
        
        return actions
```

### 8.5.3 Gap-Forward Secrecy

**Definition:** Compromise of long-term gap-index keys does not reveal past session keys.

**Mechanism:** Each session uses a unique gap-index range. Session keys are derived from ephemeral gap indices that are **deleted after use**:

```go
func (kms *GapKMS) CreateSession(giiA, giiB GII) *Session {
    // Allocate ephemeral gap range for this session
    ephRange := kms.allocateEphemeralRange(100) // 100 gaps
    
    // Both parties derive session key from their long-term key + ephemeral range
    // sk_A = GAP-KDF(longterm_sk_A, "session", ephRange.Start || giiB.gap_index)
    // sk_B = GAP-KDF(longterm_sk_B, "session", ephRange.Start || giiA.gap_index)
    // Shared key = GAP-ECDH(sk_A, sk_B) -- but using gap-index DH
    
    session := &Session{
        ID:           hash(ephRange.Start, giiA.gap_index, giiB.gap_index),
        GapRange:     ephRange,
        Participants: [2]GII{giiA, giiB},
        Key:          deriveSessionKey(giiA, giiB, ephRange),
        CreatedAt:    currentGapIndex(),
        ExpiresAt:    currentGapIndex() + 100,
    }
    
    // Schedule secure deletion of ephemeral gap indices after session
    kms.scheduleDeletion(ephRange, session.ExpiresAt)
    
    return session
}
```

**Proof of Forward Secrecy:** At time `t`, adversary compromises long-term keys `sk_A, sk_B`. Past session keys used ephemeral gap indices `e < t`. Since `GAP-KDF` is a PRF and ephemeral indices are deleted, `sk_session = GAP-PRF(sk_longterm, e)` cannot be computed without `e`. Gap-index deletion is verifiable via GTS (I1 monotonicity shows indices not reused).

## 8.6 Gap Key Backup and Recovery

### 8.6.1 Gap Shamir Secret Sharing (GAP-SSS)

```
GAP-SSS-Share(secret_gap_index, threshold, total):
    1. secret = GAP-KDF(secret_gap_index, "master", "backup")
    2. polynomial = random_poly(threshold-1, secret) over GF(2^256)
    3. For i = 1..total:
           share_x = G(backup_tile_start + i)  // Gap-derived x-coordinate
           share_y = polynomial(share_x)
           share_i = (share_x, share_y)
    4. Encrypt each share with guardian's GAP-KEM public key
    5. Store in backup tile range (Tile 180-187)

GAP-SSS-Reconstruct(shares, threshold):
    1. Verify ≥ threshold shares
    2. Lagrange interpolation at x=0 using share_x as coordinates
    3. Recover secret = polynomial(0)
    4. Derive master_gap_index = GAP-KDF-Inverse(secret)
```

### 8.6.2 Disaster Recovery from Gap Indices

**Scenario:** Entire cluster destroyed. Recovery from off-site backup.

```yaml
disasterRecovery:
  trigger: "Cluster unreachable > 1 hour"
  steps:
    - name: "Recover Master Gap Index"
      action: |
        1. Retrieve encrypted shares from Tile 180-187 (offline storage)
        2. Guardian quorum (3/5) decrypt shares with their GAP-KEM keys
        3. GAP-SSS-Reconstruct to recover master_gap_index
        4. Verify master_gap_index against GACA-Root certificate
    
    - name: "Reconstruct Key Hierarchy"
      action: |
        1. From master_gap_index, derive all child gap indices via BIP-32 paths
        2. Reconstruct GACA-Root, all subordinate CAs
        3. Reconstruct all active key allocations
        4. Verify against Gap-CT log for consistency
    
    - name: "Re-establish Federation"
      action: |
        1. Broadcast new GACA-Root certificate (same key, new validity)
        2. Re-issue certificates for all surviving GIIs
        3. Restore GapServiceMesh with recovered keys
        4. Resume GTS emission from recovered gap indices
  
  rto: "4 hours"  # Recovery Time Objective
  rpo: "1000 gaps"  # Recovery Point Objective (gap-index)
```

## 8.7 Gap Key Ceremony: Multi-Party Gap Index Generation

For high-value keys (GACA-Root, Federation CA), use **Gap Ceremony**:

```yaml
gapCeremony:
  name: "GACA-Root-Rotation-2026"
  participants: 7
  threshold: 4
  gapRange: [0, 3_670_015]  # Tile00
  steps:
    1. Each participant i generates local entropy e_i
    2. Commit: H(e_i || nonce_i) published to Gap-CT log
    3. Reveal: e_i published after all commitments
    4. Combined entropy = XOR(e_1, e_2, ..., e_7)
    5. New root_gap_index = combined_entropy mod 3_670_016
    6. Verify: new_root_gap_index in Tile00, valid gap statistics
    7. Each participant signs ceremony transcript with their GII
    8. New GACA-Root certificate issued, old revoked at gap-index boundary
  
  verification:
    - Public ceremony transcript
    - Gap-CT log inclusion proofs
    - Independent reproduction from published e_i values
    - Gap statistical validation of new root range
```

---

**Next Piece:** Piece 09 covers Supply Chain Security from Gap Provenance.