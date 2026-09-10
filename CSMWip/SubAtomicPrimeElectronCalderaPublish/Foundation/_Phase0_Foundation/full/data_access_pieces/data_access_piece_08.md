# DATA ACCESS: PrimeBookOne Tile Index — Piece 08

## 7. API ACCESS PATTERNS

### 7.1 GitHub REST API

**List files in directory:**
```
GET /repos/PrimeBookOne/PrimeBookOne.github.io/contents/primebookone/0.0
```
Returns JSON array with `name`, `download_url`, `size`.

**Download single tile:**
```
GET /repos/PrimeBookOne/PrimeBookOne.github.io/contents/primebookone/0.0/Tile00.zip
```
Use `download_url` from listing.

### 7.2 Raw URL Access (Preferred)

Direct raw URLs (no API rate limits):
```
https://github.com/PrimeBookOne/PrimeBookOne.github.io/raw/main/primebookone/0.0/Tile00.zip
```

### 7.3 Batch Download Script

```bash
#!/bin/bash
# download_dir.sh - Download all tiles from a directory
DIR=$1  # e.g., "0.0"
BASE="https://github.com/PrimeBookOne/PrimeBookOne.github.io/raw/main/primebookone"

for i in {00..188}; do
    curl -sSL -o "Tile${i}.zip" "${BASE}/${DIR}/Tile${i}.zip"
    echo "Downloaded Tile${i}.zip"
done
```

### 7.4 Rate Limiting Considerations

- GitHub API: 5000 req/hour (authenticated), 60 req/hour (unauthenticated)
- Raw URLs: No strict limit, but be respectful
- Recommended: Add 100ms delay between requests
- Use `curl -z` for conditional downloads (ETag/Last-Modified)