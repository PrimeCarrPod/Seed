# DATA ACCESS: PrimeBookOne Tile Index — Piece 03

## 2. PARSING SPECIFICATIONS

### 2.1 Zip File Structure

Each Tile*.zip contains a single binary file (no subdirectories).

File name inside zip: `Tile{XX}.bin` or `Tile{XX}.dat` (500 bytes)

### 2.2 Binary Format

- **Endianness:** Little-endian (x86 standard)
- **Data type:** uint8 (unsigned 8-bit integer, 0-255)
- **Count:** Exactly 500 values per tile
- **No headers, no metadata** — raw byte stream

### 2.3 Python Parsing Code

```python
import requests, zipfile, io, numpy as np

def fetch_tile(dir_version, tile_num):
    url = f"https://github.com/PrimeBookOne/PrimeBookOne.github.io/raw/main/primebookone/{dir_version}/Tile{tile_num:02d}.zip"
    resp = requests.get(url)
    resp.raise_for_status()
    with zipfile.ZipFile(io.BytesIO(resp.content)) as z:
        # Assume single file in zip
        data = z.read(z.namelist()[0])
    return np.frombuffer(data, dtype=np.uint8)

# Fetch all 189 tiles from 0.0
gaps_0_0 = np.concatenate([fetch_tile("0.0", i) for i in range(189)])
# gaps_0_0.shape = (94500,)
```

### 2.4 Gap Value Interpretation

Raw value v ∈ [0, 255] → Prime gap d = v (direct mapping).

Most common values in 0.0: 2 (twin), 4, 6, 8, 10, 12, 14.
Values > 100 rare (record gaps).