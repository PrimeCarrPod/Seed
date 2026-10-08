# Future_Thoughts_Evaluations_Vision — Piece 02/13
## Article A11: A11-11 — Future Thoughts Evaluations Vision
**Piece:** 02 of 13  
**Generated:** 2026-10-08 22:03:13 UTC

---

# Network Evolution: Opportunistic Mesh & Modern Discovery

## FT002 — Opportunistic Mesh via Bluetooth (Network)

**Hypothesis:** BT already scanning; can piggyback relay  
**Feasibility:** Medium | **Potential Impact:** Medium - extends range  
**Risks:** BT throughput low (2 Mbps LE, 25 Mbps EDR) | **Related Work:** BLE Mesh spec  
**Validation Approach:** Test BT throughput | **Timeline:** 3-6 months | **Status:** Research  

Current Bounce v1.0.91 uses Bluetooth Classic (RFCOMM) for device-to-device beacon exchange. Range: ~100m line-of-sight. Throughput: ~0.5 Mbps effective after overhead. Mesh hop adds ~50ms latency per hop.

**Opportunistic Mesh Design:**
- Leverage existing BLE scan results (already running for positioning) as mesh topology discovery
- When Wi-Fi Direct fails (range, interference, API21+ restrictions), fall back to BLE relay
- Each device maintains `MeshNeighbor` table: `{mac, rssi, lastSeen, hopCount, capabilities}`
- Packet format: `MeshHeader{ttl, seq, src, dst, type} + Payload`
- TTL default: 3 hops (covers ~300m in urban canyon)
- Flooding with duplicate suppression: track `seq` per `src` for 30s window

**Throughput Analysis:**
| Layer | Theoretical | Practical | Mesh Overhead |
|-------|-------------|-----------|---------------|
| BLE 4.x | 1 Mbps | 0.3 Mbps | 40% (headers, ACK, retransmit) |
| BLE 5.x 2M PHY | 2 Mbps | 0.8 Mbps | 35% |
| BT Classic EDR | 3 Mbps | 1.5 Mbps | 30% |

**Implementation:**
```java
// In MeshService
private void relayPacket(MeshPacket pkt) {
    if (pkt.ttl <= 0) return;
    pkt.ttl--;
    for (MeshNeighbor n : neighbors) {
        if (n.capabilities.supportsMesh && !seenRecently(pkt.src, pkt.seq)) {
            btSocket.write(pkt.serialize());
            markSeen(pkt.src, pkt.seq);
        }
    }
}
```

**Critical Path:** BLE advertising interval (100ms default) → mesh latency ~300ms per hop. For safety-critical (collision warning), need <100ms. Solution: dedicated mesh channel with 10ms adv interval on mesh-capable devices only.

---

## FT003 — Wi-Fi Aware (NAN) for Discovery (Network)

**Hypothesis:** NAN designed for peer-to-peer; lower latency  
**Feasibility:** High | **Potential Impact:** High - modern API  
**Risks:** API26+ only (Android 8.0+) | **Related Work:** Android NAN docs  
**Validation Approach:** Test on API26+ devices | **Timeline:** 2-3 months | **Status:** Research  

Wi-Fi Direct (current) requires group owner negotiation (~2-5s), legacy API, deprecated in Android 13+. Wi-Fi Aware (Neighbor Awareness Networking) is the modern replacement: designed for continuous peer discovery without AP, sub-100ms connection setup, works in background.

**NAN Integration:**
- Publish service: `bounce._tcp` with TXT record: `v=1;pos=1;mesh=1;ver=91`
- Subscribe to same service type
- On match: `WifiAwareSession` → `NetworkSpecifier` → `NetworkRequest` → `ConnectivityManager.requestNetwork()`
- Result: `Network` object with direct IP link (no AP, no DHCP server needed)
- Throughput: 50-200 Mbps (vs Wi-Fi Direct 10-50 Mbps)
- Range: ~200m (similar to Wi-Fi Direct)

**Migration from Wi-Fi Direct:**
```kotlin
// Current (deprecated)
val config = WifiP2pConfig().apply { deviceAddress = peer.deviceAddress }
manager.connect(channel, config, actionListener)

// NAN (modern)
val specifier = wifiAwareSession.createNetworkSpecifierOpen(
    peerId, 
    PassphraseConfig.INSTANCE
)
val request = NetworkRequest.Builder()
    .addTransportType(TRANSPORT_WIFI_AWARE)
    .setNetworkSpecifier(specifier)
    .build()
connectivityManager.requestNetwork(request, networkCallback)
```

**Compatibility:** Devices API26+ (2017+) cover >95% active Android. For API21-25, keep Wi-Fi Direct as fallback. NAN requires `ACCESS_FINE_LOCATION` + `CHANGE_WIFI_STATE` + `ACCESS_WIFI_STATE` — already granted for scanning.

**Strategic Value:** NAN enables "always-on" discovery without battery drain (hardware offload). Mesh can maintain neighbor table continuously, not just on user-initiated scan.

---