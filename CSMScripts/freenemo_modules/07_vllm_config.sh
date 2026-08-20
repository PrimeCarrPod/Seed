#!/usr/bin/env bash
# ════════════════════════════════════════════════════════════════════════════
# MODULE 07: vLLM Configuration — NVFP4, Mamba-2, MTP, LatentMoE Flags
# Exact flags for Nemotron 3 Ultra 550B on 8-GPU (H100/H200/B200) clusters
# ════════════════════════════════════════════════════════════════════════════

# ─── ENVIRONMENT VARIABLES (set before vLLM launch) ─────────────────────────
vllm_set_env() {
    export VLLM_USE_FLASHINFER_MOE_FP4=1
    export VLLM_MEMORY_PROFILER_ESTIMATE_CUDAGRAPHS=1
    export VLLM_ALLOW_LONG_MAX_MODEL_LEN=1
    freenemo_log "vLLM env vars set: FLASHINFER_MOE_FP4=1, MEMORY_PROFILER=1, ALLOW_LONG_MAX_MODEL_LEN=1"
}

# ─── vLLM SERVER COMMAND BUILDER ────────────────────────────────────────────
vllm_build_cmd() {
    local model_path="${1:-/models/nvidia/Nemotron-3-Ultra-550B-NVFP4}"
    local tp_size="${2:-8}"
    local max_len="${3:-1048576}"
    local port="${4:-8000}"

    cat <<EOF
vllm serve ${model_path} \\
    --quantization nvfp4 \\
    --tensor-parallel-size ${tp_size} \\
    --max-model-len ${max_len} \\
    --kv-cache-dtype fp8 \\
    --mamba-backend flashinfer \\
    --mamba-cache-dtype float16 \\
    --enable-mamba-cache-stochastic-rounding \\
    --mamba-cache-philox-rounds 5 \\
    --speculative-config.method mtp \\
    --speculative-config.num-speculative-tokens 5 \\
    --reasoning-parser nemotron_v3 \\
    --tool-call-parser qwen3_coder \\
    --disable-log-requests \\
    --port ${port} \\
    --host 0.0.0.0
EOF
}

# ─── HARDWARE REQUIREMENTS CHECK ────────────────────────────────────────────
vllm_check_hardware() {
    freenemo_banner "🔧 vLLM HARDWARE CHECK — Nemotron 3 Ultra NVFP4"
    freenemo_log "Required: 8x H100/H200 (80GB) or 4x B200/GB200 (SXM + NVLink 4.0)"
    freenemo_log "NVFP4 footprint: ~352 GB VRAM (550B @ 4-bit + 15% overhead)"
    freenemo_log "BF16 footprint: ~1,265 GB (requires 16x H100 or 8x B200)"
    freenemo_log "FP8 (W8A8) footprint: ~660 GB (8x H100 or 4x B200)"

    if command -v nvidia-smi >/dev/null 2>&1; then
        local gpu_count=$(nvidia-smi -L | wc -l)
        local vram_per_gpu=$(nvidia-smi --query-gpu=memory.total --format=csv,noheader,nounits | head -1)
        freenemo_log "Detected: ${gpu_count} GPUs, ${vram_per_gpu}MB VRAM each"
        local total_vram=$((gpu_count * vram_per_gpu / 1024))
        freenemo_log "Total VRAM: ~${total_vram} GB"
        if (( total_vram >= 352 )); then
            freenemo_success "VRAM sufficient for NVFP4 deployment"
        else
            freenemo_warn "VRAM may be insufficient for NVFP4 (need 352 GB)"
        fi
    else
        freenemo_warn "nvidia-smi not available, cannot verify hardware"
    fi

    # Check vLLM version
    if python3 -c "import vllm; print(vllm.__version__)" 2>/dev/null | grep -qE '^0\.(2[3-9]|[3-9])'; then
        freenemo_success "vLLM version >= 0.23.0 (cuDNN graph corruption fix)"
    else
        freenemo_warn "vLLM version may be < 0.23.0 — prefix caching instability risk at >200k tokens"
    fi
}

# ─── NUMA PINNING (for GB200/B200) ──────────────────────────────────────────
vllm_numa_pinning() {
    freenemo_log "For GB200/B200: bind vLLM workers to local CPU socket (NUMA pinning)"
    freenemo_log "  numactl --cpunodebind=0 --membind=0 vllm serve ..."
    freenemo_log "  This bypasses NVLink-C2C cross-socket path, gives ~10% throughput gain"
}

# ─── CUDA GRAPH REVALIDATION ────────────────────────────────────────────────
vllm_cudnn_workaround() {
    freenemo_log "cuDNN graph corruption workaround (vLLM >= 0.23.0):"
    freenemo_log "  - Periodic graph revalidation enabled by default"
    freenemo_log "  - For Blackwell (B200/B300), add --no-enable-flashinfer-autotune if auto-tuning fails"
    freenemo_log "  - Alternative: --moe-backend triton to bypass FlashInfer MoE kernel bugs"
}

# ─── DEPLOYMENT MATRIX ──────────────────────────────────────────────────────
vllm_print_matrix() {
    cat <<'EOF'
════════════════════════════════════════════════════════════════════════════
                    vLLM DEPLOYMENT MATRIX — Nemotron 3 Ultra
════════════════════════════════════════════════════════════════════════════
Format      | Min Hardware          | VRAM    | Advantage
──────────────────────────────────────────────────────────────────────────────
BF16        | 16x H100 or 8x B200   | ~1265GB | Max accuracy, fine-tuning
FP8 (W8A8)  | 8x H100 or 4x B200    | ~660GB  | Balanced for Hopper
NVFP4 (W4A4)| 8x H100 or 4x B200/GB | ~352GB  | MAX throughput, 1.5-2.2x GEMM FLOPS on Blackwell
════════════════════════════════════════════════════════════════════════════
Required Flags:
  --quantization nvfp4              # Native 4-bit E2M1 weights
  --tensor-parallel-size 8          # Shard 512 experts across 8 GPUs via NVLink 4.0
  --kv-cache-dtype fp8              # 8-bit KV cache for GQA anchors (NOT nvfp4)
  --mamba-backend flashinfer        # Optimized CUDA kernels for Mamba-2 SSM
  --mamba-cache-dtype float16       # FP16 recurrent state (dynamic range)
  --enable-mamba-cache-stochastic-rounding   # Prevent state drift at 1M tokens
  --mamba-cache-philox-rounds 5     # 5 randomization rounds per state update
  --speculative-config.method mtp   # Native Multi-Token Prediction
  --speculative-config.num-speculative-tokens 5  # Draft 5 tokens/step
  --reasoning-parser nemotron_v3    # Dual-stream parser (reasoning + content)
  --tool-call-parser qwen3_coder    # NVIDIA-mandated tool calling format
  --disable-log-requests            # Prevent asyncio blocking from sync I/O
════════════════════════════════════════════════════════════════════════════
EOF
}