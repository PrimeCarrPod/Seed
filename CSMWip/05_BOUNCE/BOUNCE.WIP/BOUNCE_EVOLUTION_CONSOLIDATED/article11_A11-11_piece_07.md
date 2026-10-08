# Future_Thoughts_Evaluations_Vision — Piece 07/13
## Article A11: A11-11 — Future Thoughts Evaluations Vision
**Piece:** 07 of 13  
**Generated:** 2026-10-08 22:03:13 UTC

---

# AI Integration: On-Device ML & Natural Language

## FT013 — On-Device ML for Hazard Detection (AI)

**Hypothesis:** Real-time hazard prediction  
**Feasibility:** Medium | **Potential Impact:** High - safety  
**Risks:** Model size/accuracy | **Related Work:** TFLite + sensors  
**Validation Approach:** Train on collected data | **Timeline:** 6-12 months | **Status:** Research  

Current hazard detection: rule-based (speed > threshold + decel > threshold = hard brake). False positives: 23%. False negatives: 18% (missed hazards).

**ML Approach:** TensorFlow Lite model on device. Input: 5s window of IMU (100Hz) + GPS (1Hz) + BLE beacon RSSI (1Hz) + vehicle CAN (if available). Output: hazard probability per class.

**Model Architecture:**
```
Input: [500, 12]  // 5s × 100Hz IMU (ax,ay,az,gx,gy,gz) + GPS (v,heading) + BLE (rssi,count)
├── Conv1D(64, kernel=5, stride=2) → [250, 64]
├── BatchNorm + ReLU
├── Conv1D(128, kernel=3, stride=2) → [125, 128]
├── Bidirectional LSTM(64) → [125, 128]
├── Attention Pooling → [128]
├── Dense(64) + ReLU + Dropout(0.3)
└── Dense(5, softmax)  // [normal, hard_brake, swerve, collision_risk, road_hazard]
```

**Model Size:** ~800KB (TFLite int8 quantized). Inference: ~15ms on Snapdragon 8 Gen 2 (NNAPI delegate).

**Training Data:**
- Source: Bounce v1.0.91 fleet (50 vehicles, 6 months = 2.5M km)
- Labels: Driver-reported incidents + insurance claims + manual review
- Augmentation: Time warp, noise injection, sensor dropout
- Split: 70/15/15 train/val/test by vehicle (not trip) to avoid leakage

**Target Metrics:**
| Metric | Rule-Based | ML Target |
|--------|------------|-----------|
| Precision (hazard) | 61% | 85% |
| Recall (hazard) | 72% | 90% |
| F1 | 66% | 87% |
| Latency | 5ms | <50ms |
| Battery/hr | 0% | 2% |

**Deployment:**
- Model bundled in APK (`assets/hazard_model.tflite`)
- Update via Play Store (model + app) or dynamic delivery (Play Asset Delivery)
- A/B test: 50% fleet ML, 50% rules → compare incident rates
- Fallback: Rules if model fails (NNAPI unavailable, OOM)

**Privacy:** All inference on-device. No raw sensor data leaves device. Only hazard events (class, confidence, timestamp, location) synced to fleet.

---

## FT014 — LLM Natural Language Interface (AI)

**Hypothesis:** Voice-first for drivers  
**Feasibility:** Low | **Potential Impact:** High - UX  
**Risks:** Privacy + latency | **Related Work:** On-device LLM (Gemma)  
**Validation Approach:** Prototype voice UI | **Timeline:** 12+ months | **Status:** Future  

**Vision:** Driver says: "Route around accident ahead" → Bounce parses intent → queries mesh for hazards → computes alternate route → speaks turn-by-turn.

**On-Device LLM Options (2024):**
| Model | Params | Size (int4) | Hardware | Quality |
|-------|--------|-------------|----------|---------|
| Gemma 2B | 2B | 1.2GB | NPU/GPU | Good |
| Phi-3 Mini | 3.8B | 2.3GB | NPU/GPU | Very Good |
| Llama 3.2 1B | 1B | 0.7GB | CPU/NPU | Fair |
| Qwen 2.5 1.5B | 1.5B | 0.9GB | NPU | Good |

**Architecture:**
```
Voice Input (ASR) → Text → Intent Classifier (small BERT) → 
  if navigation: Route Engine → TTS
  if query: On-Device LLM → TTS
  if command: Action Executor → Confirmation TTS
```

**ASR:** Google ML Kit (on-device, 50MB) or Whisper.cpp (tiny, 39MB, CPU)
**TTS:** Google TTS (on-device, system) or Piper (local, 50MB)
**Intent Classifier:** DistilBERT (66M params, 25MB) fine-tuned on driving commands

**Privacy:** Zero cloud. All models on device. Voice audio deleted after ASR (or never stored - streaming ASR).

**Latency Budget (target <2s end-to-end):**
| Stage | Target |
|-------|--------|
| ASR (streaming) | 500ms |
| Intent classification | 50ms |
| LLM (if needed) | 1000ms |
| TTS | 300ms |
| **Total** | **~1.8s** |

**MVP Scope (Phase 1):** 
- Fixed commands: "Report hazard", "Navigate to [POI]", "Call dispatch", "Mesh status"
- No open-ended LLM. Rule-based intent → action.
- Phase 2: Gemma 2B for "Find coffee near next exit" type queries.

**Hardware Requirement:** NPU (Snapdragon 8 Gen 1+, Tensor G2+, Dimensity 9000+). Fallback: CPU (slow, 5-10s).

---