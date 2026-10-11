- [x] buildWebView() with hardware acceleration, JS enabled, file access
- [x] WebViewClient with onPageFinished → inject PrimeEngine + WorldlineRenderer
- [x] JavaScript interface: TGEBridge

---

## PIECE 3: UI COMPONENTS (MainActivity.kt pieces 4-6)
- [x] buildHeader(): TGE E1 logo, version tag, prime electron worldline subtitle
- [x] buildControlBar(): 6 buttons (SCAN, MENU, THEORY, FLEET, CLEAN)
- [x] mkBtn() helper for consistent button styling
- [x] Header overlay with semi-transparent background
- [x] Control bar at bottom with prime-themed colors
- [x] Button click handlers: toggleMenu, toggleTheory, cleanMode
- [x] injectJs() wrapper with error logging

---

## PIECE 4: MENU SYSTEM (MainActivity.kt pieces 7-8)
