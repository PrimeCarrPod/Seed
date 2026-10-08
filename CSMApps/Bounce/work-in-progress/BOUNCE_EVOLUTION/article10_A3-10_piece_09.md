# Refinement_Existing_Parts_Prioritized — Piece 09/13
## Article A3: A3-10 — Refinement Existing Parts Prioritized
**Piece:** 09 of 13  
**Generated:** 2026-10-08 16:41:24 UTC

---

# Section 10: Refinement of Existing Parts — Offline & Platform Features (RF026, RF027)

## 9.1 RF026 — Offline Capability with Vector Map Tiles (P2, High Effort)

**Component:** `bounce.html` (MapLibre/Mapbox GL) + `MainActivity` (asset bundling)  
**Issue:** No map tiles offline — app unusable without network  
**Current State:** Online-only MapLibre style, no tile caching  
**Proposed Refinement:** Bundle minimal world vector tiles (MBTiles) for true offline operation  

### Architecture:
```
assets/
├── maps/
│   ├── world.mbtiles          # ~50MB: zoom 0-6 global, zoom 7-10 land only
│   ├── regions/
│   │   ├── north_america.mbtiles  # ~30MB: zoom 11-14
│   │   ├── europe.mbtiles         # ~25MB
│   │   ├── asia_pacific.mbtiles   # ~35MB
│   │   └── ...
│   └── style/
│       ├── offline.json       # MapLibre style referencing local tiles
│       └── sprites/           # Local sprite sheets
```

### Tile Generation Pipeline:
```bash
# scripts/generate-offline-tiles.sh
#!/bin/bash

# 1. Download OSM data (planet or regional extracts)
# wget https://download.geofabrik.de/planet-latest.osm.pbf

# 2. Generate vector tiles with tippecanoe / tilemaker
# tilemaker --input planet.osm.pbf --output world.mbtiles --config tilemaker-config.json

# 3. Optimized config for minimal size:
# - Zoom 0-6: global coverage (coastlines, borders, major roads)
# - Zoom 7-10: land only (no ocean tiles)
# - Zoom 11-14: regional bundles on demand
# - Layers: roads, buildings, landuse, water, boundaries, POIs
# - Simplification: Douglas-Peucker at each zoom
# - Attribute filtering: keep only name, class, type

# 4. Compress with gzip (MBTiles supports compressed tiles)
# 5. Verify with MapLibre GL JS offline example
```

### MapLibre Offline Style (`offline.json`):
```json
{
  "version": 8,
  "name": "BOUNCE Offline",
  "sources": {
    "world": {
      "type": "vector",
      "url": "mbtiles://assets/maps/world.mbtiles",
      "minzoom": 0,
      "maxzoom": 14
    }
  },
  "sprite": "assets/maps/style/sprites/sprite",
  "glyphs": "assets/maps/style/fonts/{fontstack}/{range}.pbf",
  "layers": [
    {
      "id": "background",
      "type": "background",
      "paint": { "background-color": "#0d1117" }
    },
    {
      "id": "land",
      "type": "fill",
      "source": "world",
      "source-layer": "landuse",
      "filter": ["==", "class", "land"],
      "paint": { "fill-color": "#1a1f2e" }
    },
    {
      "id": "roads",
      "type": "line",
      "source": "world",
      "source-layer": "roads",
      "paint": {
        "line-color": "#30363d",
        "line-width": ["interpolate", ["linear"], ["zoom"], 6, 0.5, 14, 2]
      }
    },
    {
      "id": "buildings",
      "type": "fill-extrusion",
      "source": "world",
      "source-layer": "buildings",
      "paint": {
        "fill-extrusion-color": "#21262d",
        "fill-extrusion-height": ["get", "height"],
        "fill-extrusion-base": 0
      }
    }
  ]
}
```

### Android Asset Loading:
```java
// MainActivity.java - Offline map initialization
private void initOfflineMap() {
  // Copy MBTiles from assets to app storage (if not present)
  File mbtilesDir = new File(getFilesDir(), "maps");
  if (!mbtilesDir.exists()) {
    mbtilesDir.mkdirs();
    copyAssetDirectory("maps", mbtilesDir.getAbsolutePath());
  }
  
  // Configure MapLibre for offline
  MapboxMap map = mapView.getMapboxMap();
  map.setStyle(new Style.Builder()
    .fromUri("file://" + new File(mbtilesDir, "style/offline.json").getAbsolutePath())
    .build());
  
  // Disable network tile requests
  map.getStyle().getSource("world").setTileUrlTemplates(Collections.emptyList());
}
```

### Storage Estimates:
| Coverage | Zooms | Size | Use Case |
|----------|-------|------|----------|
| World (land) | 0-10 | ~50 MB | Global context, country outlines |
| Continental | 11-14 | ~30 MB each | Regional detail |
| Country | 11-16 | ~10-50 MB | High-detail local |

### Progressive Enhancement:
```javascript
// modules/visualization/offlineMapManager.js
class OfflineMapManager {
  async initialize() {
    // 1. Check for bundled world tiles
    this.hasWorldTiles = await this.checkAsset('maps/world.mbtiles');
    
    // 2. Check for regional tiles
    this.regions = await this.listRegions();
    
    // 3. If online, register service worker for tile caching
    if (navigator.onLine) {
      await this.registerTileCacheSW();
    }
    
    // 4. Init MapLibre with appropriate source
    this.initMapLibre();
  }
  
  async registerTileCacheSW() {
    // Service worker caches visited tiles for offline reuse
    const registration = await navigator.serviceWorker.register('/sw.js');
    registration.active.postMessage({ type: 'CACHE_TILES', bbox: this.getViewBounds() });
  }
}
```

### Target: v1.0.96 | Status: Planned | Master List Ref: P2-01

---

## 9.2 RF027 — Voice Announcements (TTS Integration) (P1, Low Effort)

**Component:** `MainActivity.java` (TextToSpeech) + `bounce.html` (trigger events)  
**Issue:** No audio feedback — user must watch screen for hazards/alerts  
**Current State:** Visual-only notifications  
**Proposed Refinement:** TextToSpeech integration for hands-free safety alerts  

### Android TTS Service:
```java
// TtsAnnouncer.java
public class TtsAnnouncer implements TextToSpeech.OnInitListener {
  private TextToSpeech tts;
  private Context context;
  private boolean ready = false;
  private final Queue<String> queue = new ConcurrentLinkedQueue<>();
  private final Set<String> announced = ConcurrentHashMap.newKeySet();
  private static final int COOLDOWN_MS = 5000; // Prevent spam
  
  public TtsAnnouncer(Context context) {
    this.context = context;
    tts = new TextToSpeech(context, this);
    tts.setLanguage(Locale.getDefault());
    tts.setSpeechRate(1.0f);
    tts.setPitch(1.0f);
  }
  
  @Override
  public void onInit(int status) {
    if (status == TextToSpeech.SUCCESS) {
      ready = true;
      processQueue();
    }
  }
  
  public void announce(String text, String id) {
    if (!ready) return;
    
    long now = System.currentTimeMillis();
    String key = id + ":" + text;
    
    // Dedupe: same alert within cooldown
    if (announced.contains(key)) return;
    
    announced.add(key);
    queue.offer(text);
    
    // Clean old keys
    new Handler(Looper.getMainLooper()).postDelayed(() -> announced.remove(key), COOLDOWN_MS);
    
    processQueue();
  }
  
  private void processQueue() {
    if (!ready || queue.isEmpty()) return;
    if (tts.isSpeaking()) return;
    
    String text = queue.poll();
    if (text != null) {
      tts.speak(text, TextToSpeech.QUEUE_FLUSH, null, UUID.randomUUID().toString());
    }
  }
  
  public void shutdown() {
    if (tts != null) {
      tts.stop();
      tts.shutdown();
    }
  }
}
```

### Alert Triggers (JavaScript → Android):
```javascript
// modules/positioning/bridge.js - Voice alerts
Bounce.nav.alerts = {
  onHazard: (callback) => eventBus.on('nav.alert.hazard', callback),
  onZoneChange: (callback) => eventBus.on('nav.alert.zone', callback),
  onAccuracyDrop: (callback) => eventBus.on('nav.alert.accuracy', callback)
};

// Android side - MainActivity
private void setupVoiceAlerts() {
  ttsAnnouncer = new TtsAnnouncer(this);
  
  // Hazard proximity (from positioning engine)
  positioningEngine.setHazardListener(hazard -> {
    String msg = String.format("Warning: %s at %.0f meters", hazard.type, hazard.distance);
    ttsAnnouncer.announce(msg, "hazard_" + hazard.id);
  });
  
  // Zone transitions
  zoneHMM.setTransitionListener((from, to, confidence) -> {
    if (confidence > 0.8) {
      ttsAnnouncer.announce("Entering " + to.getName(), "zone_" + to.getId());
    }
  });
  
  // Accuracy degradation
  positioningEngine.setAccuracyListener(accuracy -> {
    if (accuracy > 10.0 && !lowAccuracyAnnounced) {
      ttsAnnouncer.announce("Position accuracy low. Calibration recommended.", "accuracy_low");
      lowAccuracyAnnounced = true;
    } else if (accuracy < 5.0) {
      lowAccuracyAnnounced = false;
    }
  });
}
```

### JavaScript Voice Commands (Future):
```javascript
// Voice control (requires SpeechRecognition)
if ('webkitSpeechRecognition' in window) {
  const recognition = new webkitSpeechRecognition();
  recognition.continuous = false;
  recognition.lang = 'en-US';
  
  recognition.onresult = (e) => {
    const command = e.results[0][0].transcript.toLowerCase();
    handleVoiceCommand(command);
  };
  
  function handleVoiceCommand(cmd) {
    if (cmd.includes('export')) Bounce.sys.storage.export('gpx');
    if (cmd.includes('clear')) Bounce.viz.trail.clear();
    if (cmd.includes('scan')) Bounce.radio.scan.start();
    if (cmd.includes('where')) Bounce.nav.position.get().then(p => speak(`You are at ${p.zone}`));
  }
}
```

### Accessibility Integration:
- Respects system TTS settings (rate, pitch, voice)
- Honors "TalkBack" / "Select to Speak" coexistence
- Provides `contentDescription` for all voice-triggered UI

### Target: v1.0.95 | Status: Planned | Master List Ref: P2-03

---

*End of Piece 09/13*