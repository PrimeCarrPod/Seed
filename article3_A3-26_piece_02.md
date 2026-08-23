# Quantum_Federation_ML_Prime_Gaps — Piece 02/12
## Article 3: A3-26 — Quantum Federation ML Prime Gaps
**Piece:** 02 of 12  
**Generated:** 2026-08-23 23:15:00 UTC

---

# Gap-Index Embedding Models: Representation Learning from Prime Gap Sequences

## 2.1 Gap-Index Embedding Architecture

The gap-index embedding learns dense vector representations where mathematically similar gap indices (similar local statistics, same modulo class, nearby in sequence) map to nearby vectors in embedding space.

```
┌─────────────────────────────────────────────────────────────────────┐
│                    GAP-INDEX EMBEDDING MODEL                        │
├─────────────────────────────────────────────────────────────────────┤
│                                                                     │
│  INPUT: Gap index n ∈ [0, 3.67B)                                    │
│                                                                     │
│  ┌─────────────────────────────────────────────────────────────┐   │
│  │ EMBEDDING LAYERS                                             │   │
│  │                                                              │   │
│  │  Tile Embedding:     188 → 64D     (learned)               │   │
│  │  Book Embedding:     3500 → 32D    (learned)               │   │
│  │  Difference Embed:   1.05M → 16D   (learned or hashed)     │   │
│  │  Modulo-6 Embed:     6 → 8D        (learned)               │   │
│  │  Modulo-30 Embed:    8 → 16D       (learned)               │   │
│  │  Modulo-210 Embed:   48 → 64D      (learned)               │   │
│  │  Positional Enc:     n → 128D      (sinusoidal/RoPE)       │   │
│  │                                                              │   │
│  │  Concatenated: 328D → Projector → 512D                     │   │
│  └─────────────────────────────────────────────────────────────┘   │
│                              │                                      │
│                              ▼                                      │
│  ┌─────────────────────────────────────────────────────────────┐   │
│  │ ENCODER (Transformer / MLP)                                 │   │
│  │  • 6 layers, 8 heads, 2048 FFN                             │   │
│  │  • Attention over local gap window (128 tokens)            │   │
│  │  • Gap-index relative positional bias                      │   │
│  │  • Modulo-class attention masking                          │   │
│  └─────────────────────────────────────────────────────────────┘   │
│                              │                                      │
│                              ▼                                      │
│  OUTPUT: Gap embedding e_n ∈ ℝ^512                                 │
│                                                                     │
└─────────────────────────────────────────────────────────────────────┘
```

## 2.2 Self-Supervised Pretraining Objectives

### 2.2.1 Gap Value Prediction (GVP)

```python
class GapValuePrediction:
    """Predict d_n from context (masked gap modeling)."""
    
    def __init__(self, encoder: GapEncoder, vocab_size: int = 2000):
        self.encoder = encoder
        self.head = nn.Linear(512, vocab_size)
        self.loss_fn = nn.CrossEntropyLoss()
    
    def forward(self, gap_indices: Tensor, mask_ratio: float = 0.15) -> Loss:
        # 1. Get embeddings for context
        embeddings = self.encoder(gap_indices)  # [B, L, 512]
        
        # 2. Mask random positions
        mask = torch.rand_like(gap_indices.float()) < mask_ratio
        masked_indices = gap_indices.clone()
        masked_indices[mask] = MASK_TOKEN
        
        # 3. Encode masked sequence
        masked_embeddings = self.encoder(masked_indices)
        
        # 4. Predict masked gap values
        logits = self.head(masked_embeddings)  # [B, L, vocab]
        
        # 5. Compute loss only on masked positions
        targets = gap_indices[mask]
        preds = logits[mask]
        loss = self.loss_fn(preds, targets)
        
        return loss
```

### 2.2.2 Next-Gap Prediction (NGP)

```python
class NextGapPrediction:
    """Autoregressive prediction of next gap."""
    
    def __init__(self, encoder: GapEncoder):
        self.encoder = encoder
        self.predictor = nn.Sequential(
            nn.Linear(512, 1024),
            nn.GELU(),
            nn.Linear(1024, 2000)  # Gap vocab
        )
    
    def forward(self, gap_indices: Tensor) -> Loss:
        # Predict d_{n+1} from context up to n
        context_emb = self.encoder(gap_indices[:, :-1])  # [B, L-1, 512]
        last_emb = context_emb[:, -1]  # [B, 512]
        logits = self.predictor(last_emb)  # [B, vocab]
        targets = gap_indices[:, -1]  # [B]
        return F.cross_entropy(logits, targets)
```

### 2.2.3 Modulo Class Prediction (MCP)

```python
class ModuloClassPrediction:
    """Predict modulo classes from gap embedding."""
    
    def __init__(self, encoder: GapEncoder):
        self.encoder = encoder
        self.mod6_head = nn.Linear(512, 6)
        self.mod30_head = nn.Linear(512, 30)
        self.mod210_head = nn.Linear(512, 210)
    
    def forward(self, gap_indices: Tensor, gap_values: Tensor) -> Loss:
        emb = self.encoder(gap_indices)
        
        # Multi-task loss
        loss_mod6 = F.cross_entropy(self.mod6_head(emb), gap_values % 6)
        loss_mod30 = F.cross_entropy(self.mod30_head(emb), gap_values % 30)
        loss_mod210 = F.cross_entropy(self.mod210_head(emb), gap_values % 210)
        
        return loss_mod6 + loss_mod30 + loss_mod210
```

### 2.2.4 Contrastive Gap Learning (CGL)

```python
class ContrastiveGapLearning:
    """Contrastive learning: similar gap statistics → similar embeddings."""
    
    def __init__(self, encoder: GapEncoder, temperature: float = 0.1):
        self.encoder = encoder
        self.temperature = temperature
        self.projector = nn.Sequential(
            nn.Linear(512, 512),
            nn.ReLU(),
            nn.Linear(512, 128)
        )
    
    def forward(self, anchor_indices: Tensor, 
                positive_indices: Tensor,
                negative_indices: Tensor) -> Loss:
        """
        Anchor: gap index n
        Positive: gap index m with similar statistics (e.g., same modulo-210 class)
        Negative: gap index k with different statistics
        """
        z_anchor = self.projector(self.encoder(anchor_indices))
        z_pos = self.projector(self.encoder(positive_indices))
        z_neg = self.projector(self.encoder(negative_indices))
        
        # Normalize
        z_anchor = F.normalize(z_anchor, dim=-1)
        z_pos = F.normalize(z_pos, dim=-1)
        z_neg = F.normalize(z_neg, dim=-1)
        
        # InfoNCE loss
        pos_sim = (z_anchor * z_pos).sum(dim=-1) / self.temperature
        neg_sim = (z_anchor @ z_neg.T) / self.temperature
        
        logits = torch.cat([pos_sim.unsqueeze(1), neg_sim], dim=1)
        labels = torch.zeros(logits.size(0), dtype=torch.long)
        
        return F.cross_entropy(logits, labels)
```

## 2.3 Gap-Index Relative Positional Bias

```python
class GapRelativePositionalBias:
    """Attention bias based on gap-index distance and statistical similarity."""
    
    def __init__(self, num_heads: int = 8, max_distance: int = 1024):
        self.num_heads = num_heads
        self.max_distance = max_distance
        
        # Learned bias for gap-index distances
        self.distance_bias = nn.Embedding(max_distance + 1, num_heads)
        
        # Modulo-class similarity bias
        self.modulo_bias = nn.Parameter(torch.zeros(num_heads, 210, 210))
    
    def forward(self, gap_indices: Tensor, gap_values: Tensor) -> Tensor:
        """
        Returns attention bias of shape [num_heads, seq_len, seq_len]
        """
        seq_len = gap_indices.size(1)
        device = gap_indices.device
        
        # Gap-index distance bias
        pos = torch.arange(seq_len, device=device)
        dist = pos.unsqueeze(1) - pos.unsqueeze(0)  # [L, L]
        dist_clamped = dist.abs().clamp(max=self.max_distance)
        dist_bias = self.distance_bias(dist_clamped)  # [L, L, H]
        dist_bias = dist_bias.permute(2, 0, 1)  # [H, L, L]
        
        # Modulo-class similarity bias
        mod210 = gap_values % 210  # [B, L]
        # Average over batch for bias
        mod_bias = self.modulo_bias[:, mod210[0], :][:, :, mod210[0]]  # [H, L, L]
        
        return dist_bias + mod_bias
```

## 2.4 Gap-Window Transformer Encoder

```python
class GapWindowTransformerEncoder(nn.Module):
    """Transformer encoder for gap-index windows with statistical awareness."""
    
    def __init__(self, 
                 embed_dim: int = 512,
                 num_heads: int = 8,
                 num_layers: int = 6,
                 ff_dim: int = 2048,
                 dropout: float = 0.1,
                 window_size: int = 128):
        super().__init__()
        
        self.embed_dim = embed_dim
        self.window_size = window_size
        
        # Input projection
        self.input_proj = nn.Linear(328, embed_dim)
        
        # Positional encoding
        self.pos_encoding = GapPositionalEncoding(embed_dim, max_len=4_000_000_000)
        
        # Relative positional bias
        self.rel_pos_bias = GapRelativePositionalBias(num_heads)
        
        # Transformer layers
        self.layers = nn.ModuleList([
            GapTransformerLayer(embed_dim, num_heads, ff_dim, dropout)
            for _ in range(num_layers)
        ])
        
        self.norm = nn.LayerNorm(embed_dim)
    
    def forward(self, gap_indices: Tensor, gap_features: Tensor) -> Tensor:
        """
        gap_indices: [B, L] - gap indices
        gap_features: [B, L, 328] - raw features
        Returns: [B, L, embed_dim] - contextual embeddings
        """
        # Project features
        x = self.input_proj(gap_features)  # [B, L, D]
        
        # Add positional encoding
        x = x + self.pos_encoding(gap_indices)
        
        # Compute attention bias
        gap_values = gap_features[:, :, 0] * 1000  # Reverse normalization
        attn_bias = self.rel_pos_bias(gap_indices, gap_values)
        
        # Transformer layers
        for layer in self.layers:
            x = layer(x, attn_bias)
        
        return self.norm(x)
```

## 2.5 Training Procedure

```python
class GapEmbeddingTrainer:
    """End-to-end training for gap-index embeddings."""
    
    def __init__(self, model: GapWindowTransformerEncoder, 
                 primebookone: PrimeBookOneAccessor,
                 batch_size: int = 1024,
                 lr: float = 1e-4,
                 weight_decay: float = 0.01):
        self.model = model
        self.pb = primebookone
        self.batch_size = batch_size
        self.optimizer = torch.optim.AdamW(
            model.parameters(), lr=lr, weight_decay=weight_decay
        )
        self.scheduler = CosineAnnealingLR(self.optimizer, T_max=100_000)
        
        # Loss weights
        self.loss_weights = {
            'gvp': 1.0,      # Gap value prediction
            'ngp': 0.5,      # Next gap prediction
            'mcp': 0.3,      # Modulo class prediction
            'cgl': 0.2,      # Contrastive learning
        }
        
        self.task_heads = {
            'gvp': GapValuePrediction(model),
            'ngp': NextGapPrediction(model),
            'mcp': ModuloClassPrediction(model),
            'cgl': ContrastiveGapLearning(model),
        }
    
    def training_step(self, batch_gap_indices: List[int]) -> Dict[str, float]:
        """Single training step."""
        # 1. Extract features
        features = self.extract_batch_features(batch_gap_indices)
        gap_values = features[:, :, 0] * 1000  # Denormalized
        
        # 2. Forward pass
        embeddings = self.model(
            torch.tensor(batch_gap_indices), 
            features
        )
        
        # 3. Compute task losses
        losses = {}
        for task_name, head in self.task_heads.items():
            if task_name == 'gvp':
                losses[task_name] = head(
                    torch.tensor(batch_gap_indices), features
                )
            elif task_name == 'ngp':
                losses[task_name] = head(
                    torch.tensor(batch_gap_indices)
                )
            elif task_name == 'mcp':
                losses[task_name] = head(
                    torch.tensor(batch_gap_indices), 
                    torch.tensor(gap_values)
                )
            elif task_name == 'cgl':
                pos_indices, neg_indices = self.sample_contrastive_pairs(
                    batch_gap_indices
                )
                losses[task_name] = head(
                    torch.tensor(batch_gap_indices),
                    torch.tensor(pos_indices),
                    torch.tensor(neg_indices)
                )
        
        # 4. Weighted total loss
        total_loss = sum(
            self.loss_weights[k] * v for k, v in losses.items()
        )
        
        # 5. Backward
        self.optimizer.zero_grad()
        total_loss.backward()
        torch.nn.utils.clip_grad_norm_(self.model.parameters(), 1.0)
        self.optimizer.step()
        self.scheduler.step()
        
        return {k: v.item() for k, v in losses.items()}, total_loss.item()
```

---

**Next Piece:** Piece 03 covers Gap-Statistics as ML Features for Downstream Tasks.