# Future_Thoughts_Evaluations_Vision — Piece 01/13
## Article A11: A11-11 — Future Thoughts Evaluations Vision
**Piece:** 01 of 13  
**Generated:** 2026-10-08 22:03:13 UTC

---

# Architectural Vision: Core/Mesh Split

## FT001 — Split Bounce into Core + Mesh (Architecture)

**Hypothesis:** Core stays lightweight; Mesh handles P2P relay  
**Feasibility:** High | **Potential Impact:** High - modular adoption  
**Risks:** Fragmented UX | **Related Work:** Microkernel patterns  
**Validation Approach:** Prototype mesh service | **Timeline:** 1-2 months | **Status:** Concept  

The current Bounce architecture conflates three distinct concerns: (1) positioning engine (Wi-Fi/BLE/GPS fusion, EKF/Particle filters), (2) visualization (Three.js/WebGL rendering in WebView), and (3) mesh networking (Bluetooth/Wi-Fi Direct relay, device discovery). This monolithic structure creates coupling that limits independent evolution.

**Proposed Split:**
- **Bounce Core** (~500KB APK): Positioning + Visualization only. Runs standalone. No mesh dependencies. Target: consumer devices, drones, robots needing position+viz.
- **Bounce Mesh** (~200KB APK): Networking layer only. Implements opportunistic relay, NAN discovery, CRDT state sync. Communicates with Core via AIDL/ContentProvider interface. Target: fleet devices, mesh nodes, infrastructure beacons.
- **Bounce Full** (combined): Both APKs installed, auto-linked via intent filters.

**Benefits:**
- Core can ship to Play Store without mesh permissions (no ACCESS_FINE_LOCATION for scanning, no BLUETOOTH_CONNECT)
- Mesh can run as background service on dedicated hardware (Raspberry Pi, ESP32 gateway) without UI overhead
- Independent versioning: Core v2.0 (new viz) doesn't force Mesh v2.0 (protocol unchanged)
- Security audit surface reduced: Core has no network code; Mesh has no sensor fusion math

**Migration Path:**
1. Extract mesh classes into separate module (`:mesh` Gradle module)
2. Define `IMeshService` AIDL interface: `registerNode()`, `sendPacket()`, `getNeighbors()`, `onMeshEvent()`
3. Core binds to Mesh service if available; degrades gracefully to standalone if not
4. Build variants: `core`, `mesh`, `full` product flavors
5. Update TGAPP to depend on `full` variant; offer `core` as lightweight SDK

**Key Technical Decision:** Use Android's `Dynamic Feature Module` for Mesh? No—separate APKs allow independent installation on different devices (phone vs gateway). Use `PackageManager` query to detect Mesh APK presence at runtime.

---