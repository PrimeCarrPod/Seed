- [x] Landolil-inspired menu overlay (fullscreen modal)
- [x] menuVisible state management
- [x] Menu buttons: RESUME, THEORY MODE, PRIME EXPLORER, WORLDLINE HISTORY, GAP ANALYSIS, RESET
- [x] Button styling: primary, secondary, danger variants
- [x] JavaScript bridge: toggleMenu(visible), setTheoryMode(enabled)
- [x] Back button handling: closes menu first, then webView back, then exit

---

## PIECE 5: PRIME ENGINE (MainActivity.kt pieces 9-10)
- [x] PrimeEngine singleton object
- [x] Load Tile00.prime and Tile01.prime from assets
- [x] Parse prime count from binary tile data (4 bytes per prime)
- [x] Compute prime gaps from consecutive primes
- [x] Synthetic prime generation fallback (Sieve of Eratosthenes)
- [x] getPrimeTileData() for JavaScript injection
- [x] CoroutineScope(Dispatchers.IO) for async initialization
- [x] Prime count display in header
