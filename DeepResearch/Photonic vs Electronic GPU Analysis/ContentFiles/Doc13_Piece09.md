# Document 13: Optical NVLink and Optical Circuit Switching Physics
## Piece 9: FEC Overhead and Latency Trade-offs

---

### 13.9 FEC Overhead and Latency Trade-offs

Forward Error Correction (FEC) is essential for achieving the ultra-low BER targets in high-speed optical interconnects, but it introduces overhead in bandwidth, latency, and power. This piece analyzes the trade-offs between different FEC schemes for optical NVLink and coherent optical interconnects.

#### 13.9.1 FEC Overhead Fundamentals

**Overhead definition**:
```
Overhead (%) = (n - k) / k × 100%
Code rate = k/n
```

where n = codeword length, k = information symbols

**Overhead impact on data rate**:
```
R_net = R_line × (k/n)
```
For 56 GBaud PAM-4 with KP4 (544/514):
- Line rate: 56 GBd × 2 bits/symbol = 112 Gbps
- Net rate: 112 × (514/544) = 105.9 Gbps
- Overhead: 5.84%

**Overhead vs. coding gain trade-off**:
- Higher overhead → stronger correction → lower pre-FEC BER required
- Lower overhead → higher net rate → less coding margin

#### 13.9.2 FEC Latency Components

**Total FEC latency**:
```
T_FEC = T_encode + T_transmit + T_decode + T_buffer
```

**Latency components**:
| Component | Typical Latency | Scaling |
|-----------|-----------------|---------|
| Encoding | 10-100 ns | O(k) to O(k log k) |
| Transmission | n/R_line | Linear in n |
| Decoding | 50-500 ns | O(n) to O(n log n) |
| Buffering | 1-10 codewords | Depends on burstiness |

**Latency by FEC type** (for 56G PAM-4, 544-symbol codeword):
| FEC Type | Encode Latency | Decode Latency | Total Latency |
|----------|----------------|----------------|---------------|
| KP4 RS(544,514) | 50 ns | 200 ns | 250 ns |
| oFEC (Open FEC) | 100 ns | 500 ns | 600 ns |
| LDPC (1/2, 64800 bits) | 200 ns | 1 µs | 1.2 µs |
| Turbo (1/2, 64800 bits) | 300 ns | 2 µs | 2.3 µs |
| Hamming (7,4) | 5 ns | 10 ns | 15 ns |

**Latency budget allocation** (100G PAM-4, 100km):
| Component | Latency Budget |
|-----------|----------------|
| FEC (Tx + Rx) | 1-2 µs |
| Propagation (100km) | 500 µs |
| SerDes + CDR | 100 ns |
| **Total** | **~501 µs** |

#### 13.9.3 FEC Schemes Comparison

**Reed-Solomon (RS) Codes**:
| Code | Rate | Overhead | t (correctable) | NCG (dB) |
|------|------|----------|-----------------|----------|
| RS(255,239) | 0.937 | 6.7% | 8 | 5.0 dB |
| RS(528,514) | 0.973 | 2.7% | 7 | 4.5 dB |
| RS(544,514) - KP4 | 0.945 | 5.8% | 15 | 5.5 dB |
| RS(528,514) | 0.973 | 2.7% | 7 | 4.5 dB |

**RS advantages**: Low latency, mature, low complexity
**RS disadvantages**: Limited coding gain, fixed overhead

**LDPC (Low-Density Parity-Check)**:
| Code | Rate | Overhead | NCG (dB) | Complexity |
|------|------|----------|----------|------------|
| LDPC (1/2) | 1/2 | 100% | 7.5 dB | High |
| LDPC (2/3) | 2/3 | 50% | 6.5 dB | High |
| LDPC (3/4) | 3/4 | 33% | 5.8 dB | Medium |
| LDPC (5/6) | 5/6 | 20% | 5.5 dB | Medium |
| LDPC (14/15) | 14/15 | 7% | 5.0 dB | Low-Medium |

**LDPC advantages**: Near-Shannon limit, flexible rates
**LDPC disadvantages**: Higher latency, iterative decoding, error floor

**Turbo Codes**:
- **Rate**: 1/3, 1/2, 2/3, 3/4
- **NCG**: 6-7 dB (rate 1/2)
- **Latency**: High (iterative, 10-20 iterations)
- **Use case**: Deep space, not optical interconnects

#### 13.9.4 FEC for Optical NVLink

**NVLink FEC requirements**:
- **Target BER**: < 10⁻¹⁵ (post-FEC)
- **Latency budget**: < 200 ns (link-level)
- **Power budget**: < 50 mW/lane (FEC portion)
- **Area budget**: < 0.1 mm²/lane

**NVLink FEC evolution**:
| Generation | FEC Scheme | Overhead | Latency | Net Coding Gain |
|------------|------------|----------|---------|-----------------|
| NVLink 1.0 | None | 0% | 0 | N/A |
| NVLink 2.0 | Hamming (SECDED) | 12.5% | 10 ns | 3 dB |
| NVLink 3.0 | RS(255,239) | 6.7% | 50 ns | 5 dB |
| NVLink 4.0 | Custom RS | 5% | 100 ns | 5.5 dB |
| NVLink 5.0 | RS + LDPC concat | 8% | 200 ns | 7 dB |
| Optical 7.0 | LDPC + KP4 concat | 10% | 500 ns | 8 dB |

**NVLink 5.0+ FEC architecture** (projected):
```
Outer: LDPC (3/4 or 5/6) - corrects burst errors
Inner: KP4 RS(544,514) - corrects random errors
Interleaver: Between outer/inner (burst dispersal)
```

#### 13.9.5 Latency-Overhead Pareto Frontier

**Pareto-optimal FEC designs** (for 100G+ optical):

| Design Point | Overhead | Net Coding Gain | Latency | Best For |
|--------------|----------|-----------------|---------|----------|
| KP4 RS(544,514) | 5.8% | 5.5 dB | 250 ns | Standard Ethernet |
| RS(528,514) | 2.7% | 4.5 dB | 150 ns | Low latency |
| LDPC(14/15) + RS | 10% | 6.5 dB | 500 ns | High reach |
| LDPC(5/6) + RS | 15% | 7.0 dB | 1 µs | Ultra-long haul |
| Hamming + RS | 10% | 4.5 dB | 50 ns | Ultra-low latency |

**Pareto frontier equation** (empirical):
```
NCG (dB) ≈ 10 log₁₀(1 + α × Overhead^β)
α ≈ 2.5, β ≈ 0.7 (for modern codes)
Latency ∝ Overhead^γ, γ ≈ 1.2
```

#### 13.9.5 Latency-Critical Applications

**HPC/AI Collective Operations** (AllReduce, AllGather):
- **Latency sensitivity**: High (critical path)
- **FEC requirement**: Ultra-low latency (< 100 ns)
- **Solution**: Minimal FEC (Hamming/SECDED) + ARQ

**Storage/Database Replication**:
- **Latency sensitivity**: Medium (ms-level acceptable)
- **FEC requirement**: Strong (LDPC + RS)
- **Solution**: Concatenated LDPC + RS

**Storage/Backup**:
- **Latency sensitivity**: Low (seconds acceptable)
- **FEC requirement**: Maximum protection
- **Solution**: Strong LDPC + outer RS + erasure coding

#### 13.9.6 ARQ (Automatic Repeat Request) vs. FEC

**Hybrid ARQ (HARQ) types**:
| Type | Description | Latency | Throughput |
|------|-------------|---------|------------|
| Type I | Retransmit same | High | Low |
| Type II | Incremental redundancy | Medium | High |
| Type III | New codeword each retry | Low | Highest |

**FEC vs. ARQ trade-off**:
| Scenario | Preferred | Reason |
|----------|-----------|--------|
| Low BER channel (<10⁻⁶) | FEC only | Low overhead |
| Bursty errors | FEC + ARQ | FEC corrects random, ARQ handles bursts |
| High latency path | ARQ (Type II/III) | RTT dominates |
| Ultra-low latency | FEC only (no ARQ) | ARQ latency unacceptable |

**Optical NVLink ARQ strategy**:
- **Link-level**: FEC only (no ARQ, latency-critical)
- **Packet-level**: End-to-end ARQ (transport layer)
- **Retry logic**: At transport layer (NVLink protocol)

#### 13.9.6 FEC Power Consumption

**Power breakdown** (per lane, 56G PAM-4):
| FEC Type | Encode Power | Decode Power | Total |
|----------|--------------|--------------|-------|
| KP4 RS | 5 mW | 15 mW | 20 mW |
| RS(528,514) | 3 mW | 10 mW | 13 mW |
| LDPC (5/6) | 15 mW | 50 mW | 65 mW |
| Turbo (1/2) | 25 mW | 80 mW | 105 mW |

**Power scaling**:
- **RS**: P ∝ n × f_clk (linear)
- **LDPC**: P ∝ iterations × n × f_clk (superlinear)
- **Turbo**: P ∝ iterations × n × f_clk (high)

**Energy per bit**:
```
E_bit = P_total / R_net
```

| FEC | E_bit (pJ/bit) | Overhead |
|-----|----------------|----------|
| KP4 RS | 15 | 5.8% |
| LDPC (3/4) | 35 | 33% |
| Turbo (1/2) | 80 | 100% |

#### 13.9.7 FEC for Coherent Optical (400ZR/800ZR/1600ZR)

**400ZR (400 Gbps, DP-16QAM)**:
- **FEC**: KP4 RS(544,514) × 2 (I/Q)
- **Overhead**: 5.84% (per polarization)
- **Net rate**: 400 Gbps × 2 × (514/544) = 755 Gbps gross
- **Latency**: 250 ns per polarization

**800ZR (800 Gbps, DP-16QAM)**:
- **FEC**: oFEC (Open FEC) - concatenated LDPC + RS
- **Overhead**: ~20% (higher for reach)
- **Net rate**: 800 Gbps
- **Latency**: 500-1000 ns

**1600ZR (1.6 Tbps)**:
- **FEC**: Concatenated LDPC (outer) + RS (inner)
- **Overhead**: 15-20%
- **Latency**: 1-2 µs
- **Net coding gain**: 8-10 dB

**ZR+ / ZR++ evolution**:
| Standard | Rate | Modulation | FEC | Overhead |
|----------|------|------------|-----|----------|
| 100ZR | 100G | DP-QPSK | KP4 | 5.8% |
| 400ZR | 400G | DP-16QAM | KP4 | 5.8% |
| 400ZR+ | 400G | DP-16QAM | oFEC | 20% |
| 800ZR | 800G | DP-16QAM | oFEC | 20% |
| 800ZR+ | 800G | DP-64QAM | LDPC+RS | 25% |
| 1600ZR | 1.6T | DP-64QAM | LDPC+RS | 25% |

#### 13.9.7 FEC Implementation Architectures

**Encoder architectures**:
1. **Serial LFSR** (RS): Low area, low speed
2. **Parallel LFSR** (RS): High speed, area ∝ parallelism
3. **Systolic array** (LDPC): Parallel, regular
4. **Layered decoder** (LDPC): High throughput, low latency
4. **Min-sum / Offset min-sum**: Approximate belief propagation

**Decoder architectures**:
1. **Serial**: Low area, low throughput
2. **Fully parallel**: High area, max throughput
3. **Layered/Partial parallel**: Balanced (most common)
4. **Pipelined**: Deep pipeline, high frequency

**Area comparison** (28nm, 56G):
| Decoder | Area (mm²) | Throughput | Latency |
|---------|------------|------------|---------|
| KP4 RS | 0.05 mm² | 112 Gbps | 250 ns |
| LDPC (3/4) | 0.5 mm² | 112 Gbps | 500 ns |
| LDPC (5/6) | 0.4 mm² | 112 Gbps | 700 ns |
| Turbo | 0.8 mm² | 112 Gbps | 2 µs |

#### 13.9.8 FEC for Emerging Applications

**AI/HPC Collective Communication**:
- **AllReduce/AllGather**: Low latency critical
- **FEC**: Minimal (SECDED) + application-level checkpointing
- **Rationale**: Collective time dominates, FEC latency adds up

**Storage/Backup**:
- **Erasure coding**: Reed-Solomon (k,n) across disks/nodes
- **Latency**: Seconds (acceptable)
- **Overhead**: 1.5-2× (RAID-6 equivalent)

**Quantum Communication**:
- **QEC (Quantum Error Correction)**: Surface codes, color codes
- **Overhead**: 10-100× (physical qubits per logical)
- **Latency**: µs-ms (syndrome extraction)

**Quantum Key Distribution (QKD)**:
- **Error correction**: Cascade, LDPC, Turbo
- **Privacy amplification**: Universal hashing
- **Latency**: ms (sifting, error correction, privacy amp)

#### 13.9.9 FEC Standardization Landscape

**Standards bodies**:
| Standard | FEC | Application |
|----------|-----|-------------|
| IEEE 802.3ck | KP4 RS(544,514) | 100/200/400G Ethernet |
| IEEE 802.3dj | TBD | 800G/1.6T Ethernet |
| OIF CEI-56G | KP4 RS | 56G electrical |
| OIF CEI-112G | oFEC / KP4 | 112G electrical |
| OIF 400ZR | KP4 | 400G coherent |
| OIF 800ZR | oFEC | 800G coherent |
| PCIe 6.0/7.0 | CRC + Retry | PCIe FLIT mode |
| NVLink 5.0 | Proprietary | NVLink protocol |

**Open FEC initiative** (OIF):
- **Goal**: Interoperable FEC for 800G+
- **Code**: LDPC + RS concatenated
- **Flexibility**: Programmable rates, overheads

#### 13.9.10 Future: AI-Designed Codes and Soft Decoding

**AI for FEC design**:
- **Neural decoders**: Replace belief propagation with NN
- **Code construction**: RL for LDPC degree distribution
- **Adaptive decoding**: RL-based early termination

**Soft-decision decoding evolution**:
| Generation | Algorithm | Complexity | Gain |
|------------|-----------|------------|------|
| Hard decision | Berlekamp-Massey | Low | Baseline |
| Soft decision (Chase) | Chase-II/III | Medium | +1-2 dB |
| Belief Propagation | Sum-product | High | +2-3 dB |
| Neural BP | NN-enhanced BP | Medium | +1-2 dB |
| Transformer decoder | Attention-based | High | +1-3 dB |

**Soft-output Viterbi (SOVA)**:
- **Application**: Turbo, convolutional
- **Soft output**: LLR (Log-Likelihood Ratio)
- **Use case**: Turbo decoder, concatenated codes

**Quantum error correction (future)**:
- **Surface code**: Threshold ~1%, overhead 100-1000×
- **Color codes**: Lower overhead, higher threshold
- **GKP codes**: Bosonic, continuous variable
- **Integration**: Hybrid quantum-classical FEC

---

*End of Piece 9. Next: Piece 10 - Coherent vs. Direct Detection: Sensitivity and Reach Comparison*