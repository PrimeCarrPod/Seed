# DATA ACCESS: PrimeBookOne Tile Index — Piece 09

## 8. DATA VERIFICATION AND INTEGRITY

### 8.1 Checksums

Each Tile*.zip should be verified after download.

**SHA256 verification:**
```bash
sha256sum Tile00.zip
# Compare with known checksum (if published)
```

**Expected file sizes:**
- Tile*.zip: ~500-600 bytes (500 raw + zip overhead)
- Extracted .bin: exactly 500 bytes

### 8.2 Gap Value Validation

After extraction, verify:
```python
gaps = np.frombuffer(data, dtype=np.uint8)
assert len(gaps) == 500, f"Expected 500 gaps, got {len(gaps)}"
assert gaps.min() >= 0 and gaps.max() <= 255, "Values out of uint8 range"
# Check for known patterns
twin_count = np.sum(gaps == 2)
print(f"Twin primes (gap=2): {twin_count}/500 = {twin_count/500:.3f}")
```

### 8.3 Directory 0.0 Expected Statistics

| Statistic | Expected Range |
|-----------|----------------|
| Mean gap | ~12-15 |
| Gap=2 (twin) frequency | ~15-20% |
| Gap=4 frequency | ~10-15% |
| Gap=6 frequency | ~8-12% |
| Max gap | < 100 |
| Min gap | 1 (only at start) or 2 |

### 8.4 Cross-Directory Consistency

- TileXX.zip in 0.0, 0.1, 1.0, 2.0, 2.1, 3.0 all have 500 gaps
- Cumulative gap count increases monotonically
- No overlapping prime indices between directories