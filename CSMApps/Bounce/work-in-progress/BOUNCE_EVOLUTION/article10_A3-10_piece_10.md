# Refinement_Existing_Parts_Prioritized — Piece 10/13
## Article A3: A3-10 — Refinement Existing Parts Prioritized
**Piece:** 10 of 13  
**Generated:** 2026-10-08 16:41:24 UTC

---

# Section 10: Refinement of Existing Parts — Export, Theming & Accessibility (RF028, RF030)

## 10.1 RF028 — Multi-Format Export (GPX/KML/CSV) (P1, Low Effort)

**Component:** `TrailExporter.java` + `bounce.html` export UI  
**Issue:** JSON only — limited interoperability with GIS tools, fitness apps  
**Current State:** `exportTrail()` returns GeoJSON FeatureCollection  
**Proposed Refinement:** Add GPX 1.1, KML 2.2, CSV export with metadata  

### Export Formats Specification:

#### GPX 1.1 (GPS Exchange Format):
```xml
<?xml version="1.0" encoding="UTF-8"?>
<gpx version="1.1" creator="BOUNCE v1.0.94" 
     xmlns="http://www.topografix.com/GPX/1/1"
     xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
     xsi:schemaLocation="http://www.topografix.com/GPX/1/1 http://www.topografix.com/GPX/1/1/gpx.xsd">
  <metadata>
    <name>BOUNCE Trail - 2026-10-08</name>
    <desc>Indoor positioning trail with RSSI fingerprints</desc>
    <time>2026-10-08T16:41:24Z</time>
    <extensions>
      <bounce:algorithm>EKF+ParticleFilter</bounce:algorithm>
      <bounce:apCount>12</bounce:apCount>
      <bounce:duration>1842</bounce:duration>
    </extensions>
  </metadata>
  <trk>
    <name>Session 2026-10-08</name>
    <trkseg>
      <trkpt lat="37.7749" lon="-122.4194">
        <ele>10.5</ele>
        <time>2026-10-08T16:00:00Z</time>
        <extensions>
          <bounce:accuracy>2.3</bounce:accuracy>
          <bounce:rssi>-58,-62,-71,-65</bounce:rssi>
          <bounce:zone>lobby</bounce:zone>
        </extensions>
      </trkpt>
      <!-- ... more track points ... -->
    </trkseg>
  </trk>
  <wpt lat="37.7749" lon="-122.4194">
    <name>AP: AA:BB:CC:DD:EE:FF</name>
    <extensions>
      <bounce:rssiMean>-65</bounce:rssiMean>
      <bounce:rssiVariance>12.5</bounce:rssiVariance>
    </extensions>
  </wpt>
</gpx>
```

#### KML 2.2 (Google Earth):
```xml
<?xml version="1.0" encoding="UTF-8"?>
<kml xmlns="http://www.opengis.net/kml/2.2">
  <Document>
    <name>BOUNCE Trail Export</name>
    <Style id="trailStyle">
      <LineStyle><color>ff00d4aa</color><width>3</width></LineStyle>
    </Style>
    <Style id="apStyle">
      <IconStyle><scale>1.2</scale><Icon><href>wifi.png</href></Icon></IconStyle>
    </Style>
    <Placemark>
      <name>Trail Path</name>
      <styleUrl>#trailStyle</styleUrl>
      <LineString>
        <tessellate>1</tessellate>
        <altitudeMode>relativeToGround</altitudeMode>
        <coordinates>
          -122.4194,37.7749,10.5
          -122.4193,37.7750,10.7
        </coordinates>
      </LineString>
    </Placemark>
    <Placemark>
      <name>Access Point AA:BB:CC:DD:EE:FF</name>
      <styleUrl>#apStyle</styleUrl>
      <Point><coordinates>-122.4194,37.7749,10.5</coordinates></Point>
      <ExtendedData>
        <Data name="rssiMean"><value>-65</value></Data>
        <Data name="rssiVariance"><value>12.5</value></Data>
      </ExtendedData>
    </Placemark>
  </Document>
</kml>
```

#### CSV (Spreadsheet Compatible):
```csv
timestamp,latitude,longitude,altitude,accuracy,rssi_values,zone,algorithm
2026-10-08T16:00:00Z,37.7749,-122.4194,10.5,2.3,"-58,-62,-71,-65",lobby,EKF
2026-10-08T16:00:01Z,37.7749,-122.4193,10.7,2.1,"-57,-63,-70,-64",lobby,EKF
```

### Implementation (Java):
```java
// TrailExporter.java
public class TrailExporter {
  
  public enum Format { GEOJSON, GPX, KML, CSV }
  
  public String export(Trail trail, Format format) {
    return switch (format) {
      case GEOJSON -> exportGeoJSON(trail);
      case GPX -> exportGPX(trail);
      case KML -> exportKML(trail);
      case CSV -> exportCSV(trail);
    };
  }
  
  private String exportGPX(Trail trail) {
    StringBuilder gpx = new StringBuilder();
    gpx.append("<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n");
    gpx.append("<gpx version=\"1.1\" creator=\"BOUNCE ").append(BuildConfig.VERSION_NAME).append("\" ");
    gpx.append("xmlns=\"http://www.topografix.com/GPX/1/1\" ");
    gpx.append("xmlns:bounce=\"http://bounce.csm/app\">\n");
    
    // Metadata
    gpx.append("  <metadata>\n");
    gpx.append("    <name>BOUNCE Trail - ").append(trail.getStartTime()).append("</name>\n");
    gpx.append("    <time>").append(ISO8601.format(trail.getStartTime())).append("</time>\n");
    gpx.append("  </metadata>\n");
    
    // Track
    gpx.append("  <trk>\n");
    gpx.append("    <trkseg>\n");
    for (TrailPoint pt : trail.getPoints()) {
      gpx.append("      <trkpt lat=\"").append(pt.lat).append("\" lon=\"").append(pt.lon).append("\">\n");
      gpx.append("        <ele>").append(pt.alt).append("</ele>\n");
      gpx.append("        <time>").append(ISO8601.format(pt.timestamp)).append("</time>\n");
      gpx.append("        <extensions>\n");
      gpx.append("          <bounce:accuracy>").append(pt.accuracy).append("</bounce:accuracy>\n");
      gpx.append("          <bounce:rssi>").append(String.join(",", pt.rssiValues)).append("</bounce:rssi>\n");
      gpx.append("          <bounce:zone>").append(pt.zone).append("</bounce:zone>\n");
      gpx.append("        </extensions>\n");
      gpx.append("      </trkpt>\n");
    }
    gpx.append("    </trkseg>\n");
    gpx.append("  </trk>\n");
    
    // Waypoints for APs
    for (AccessPoint ap : trail.getAccessPoints()) {
      gpx.append("  <wpt lat=\"").append(ap.lat).append("\" lon=\"").append(ap.lon).append("\">\n");
      gpx.append("    <name>AP: ").append(ap.bssid).append("</name>\n");
      gpx.append("    <extensions>\n");
      gpx.append("      <bounce:rssiMean>").append(ap.rssiMean).append("</bounce:rssiMean>\n");
      gpx.append("      <bounce:rssiVariance>").append(ap.rssiVariance).append("</bounce:rssiVariance>\n");
      gpx.append("    </extensions>\n");
      gpx.append("  </wpt>\n");
    }
    
    gpx.append("</gpx>");
    return gpx.toString();
  }
  
  // KML and CSV similar...
}
```

### JavaScript Export UI:
```javascript
// modules/ui/exportPanel.js
export function createExportPanel() {
  const formats = [
    { id: 'geojson', label: 'GeoJSON', ext: 'geojson', mime: 'application/geo+json' },
    { id: 'gpx', label: 'GPX 1.1', ext: 'gpx', mime: 'application/gpx+xml' },
    { id: 'kml', label: 'KML 2.2', ext: 'kml', mime: 'application/vnd.google-earth.kml+xml' },
    { id: 'csv', label: 'CSV', ext: 'csv', mime: 'text/csv' }
  ];
  
  return formats.map(f => ({
    ...f,
    export: async () => {
      const data = await Bounce.viz.trail.export(f.id);
      downloadBlob(new Blob([data], { type: f.mime }), `bounce_trail_${Date.now()}.${f.ext}`);
    }
  }));
}
```

### Target: v1.0.94 | Status: Planned | Master List Ref: P2-05

---

## 10.2 RF030 — Accessibility (Content Descriptions + TalkBack) (P2, Low Effort)

**Component:** `bounce.html` (HTML/CSS) + `MainActivity.java` (Android views)  
**Issue:** No accessibility support — excluded users with visual/motor impairments  
**Current State:** Canvas-only Three.js scene, no semantic HTML, no TalkBack labels  
**Proposed Refinement:** Full a11y compliance (WCAG 2.1 AA)  

### WebView Accessibility (HTML/JS):
```html
<!-- bounce.html - Semantic structure -->
<main role="main" aria-label="BOUNCE Indoor Positioning">
  <!-- Three.js canvas with accessible fallback -->
  <div id="scene-container" role="img" aria-label="3D positioning visualization" tabindex="0">
    <canvas id="three-canvas" aria-hidden="true"></canvas>
    <!-- Text alternative for screen readers -->
    <div id="scene-description" class="sr-only" aria-live="polite">
      Current position: Lobby. Accuracy: 2.3 meters. 12 access points visible. 
      Trail shows path from Entrance to Conference Room.
    </div>
  </div>
  
  <!-- Accessible HUD (not canvas-rendered) -->
  <aside id="hud" role="region" aria-label="Position metrics" aria-live="polite">
    <dl class="metrics">
      <dt>Position Accuracy</dt>
      <dd id="metric-accuracy" aria-live="polite">2.3 m</dd>
      <dt>Zone</dt>
      <dd id="metric-zone" aria-live="polite">Lobby</dd>
      <dt>Access Points</dt>
      <dd id="metric-aps" aria-live="polite">12 visible</dd>
      <dt>Algorithm</dt>
      <dd id="metric-algo">EKF + Particle Filter</dd>
    </dl>
  </aside>
  
  <!-- Keyboard-navigable controls -->
  <nav id="controls" role="navigation" aria-label="App controls">
    <button id="btn-scan" aria-pressed="false">Start Scan</button>
    <button id="btn-export" aria-haspopup="menu">Export Trail</button>
    <button id="btn-settings">Settings</button>
  </nav>
</main>
```

### Screen Reader Updates:
```javascript
// modules/ui/accessibility.js
class AccessibilityAnnouncer {
  constructor() {
    this.liveRegion = document.getElementById('scene-description');
    this.lastAnnouncement = '';
  }
  
  announcePosition(position) {
    const msg = `Position updated. ${position.zone}, accuracy ${position.accuracy.toFixed(1)} meters. ${position.apCount} access points.`;
    if (msg !== this.lastAnnouncement) {
      this.liveRegion.textContent = msg;
      this.lastAnnouncement = msg;
    }
  }
  
  announceZoneChange(from, to, confidence) {
    this.liveRegion.textContent = `Zone changed from ${from} to ${to}. Confidence ${Math.round(confidence * 100)} percent.`;
  }
  
  announceAlert(type, message) {
    this.liveRegion.textContent = `Alert: ${message}`;
  }
}

// Connect to positioning updates
eventBus.on('nav.position.update', (pos) => announcer.announcePosition(pos));
eventBus.on('nav.zone.transition', (t) => announcer.announceZoneChange(t.from, t.to, t.confidence));
eventBus.on('nav.alert.hazard', (h) => announcer.announceAlert('hazard', h.message));
```

### CSS for Screen Readers:
```css
/* bounce.html <style> */
.sr-only {
  position: absolute;
  width: 1px;
  height: 1px;
  padding: 0;
  margin: -1px;
  overflow: hidden;
  clip: rect(0, 0, 0, 0);
  white-space: nowrap;
  border: 0;
}

:focus-visible {
  outline: 3px solid var(--accent-primary);
  outline-offset: 2px;
}

/* High contrast mode support */
@media (prefers-contrast: more) {
  #scene-container { border: 3px solid #fff; }
  .metrics dd { font-weight: bold; }
}

/* Reduced motion */
@media (prefers-reduced-motion: reduce) {
  #three-canvas { transition: none !important; }
  .trail-animation { animation: none !important; }
}
```

### Android Native Accessibility:
```java
// MainActivity.java - View accessibility
private void setupAccessibility() {
  // Toolbar / ActionBar
  getSupportActionBar().setTitle("BOUNCE Indoor Positioning");
  
  // Floating action buttons
  fabScan.setContentDescription("Start Bluetooth and Wi-Fi scan");
  fabScan.setOnLongClickListener(v -> {
    announceForAccessibility("Double tap to start scanning");
    return true;
  });
  
  // Custom views (if any non-canvas)
  trailView.setAccessibilityDelegate(new View.AccessibilityDelegate() {
    @Override
    public void onInitializeAccessibilityNodeInfo(View host, AccessibilityNodeInfo info) {
      super.onInitializeAccessibilityNodeInfo(host, info);
      info.setClassName(Button.class.getName());
      info.setContentDescription("Trail visualization. " + getTrailDescription());
      info.addAction(AccessibilityNodeInfo.AccessibilityAction.ACTION_CLICK);
    }
  });
  
  // Live region for announcements
  AccessibilityManager am = (AccessibilityManager) getSystemService(ACCESSIBILITY_SERVICE);
  if (am.isEnabled()) {
    // Use TTS announcer (RF027) for critical alerts
  }
}

private String getTrailDescription() {
  Position pos = positioningEngine.getCurrentPosition();
  return String.format("Current zone: %s. Accuracy: %.1f meters. %d access points.", 
    pos.zone, pos.accuracy, pos.apCount);
}
```

### TalkBack Testing Checklist:
- [ ] Swipe navigation reaches all controls
- [ ] Double-tap activates buttons
- [ ] Position updates announced via live region
- [ ] Zone changes announced
- [ ] Alerts announced immediately
- [ ] Export menu navigable
- [ ] Settings screen fully accessible
- [ ] Color contrast ratios ≥ 4.5:1 (AA)
- [ ] Touch targets ≥ 48×48dp
- [ ] No keyboard traps

### Target: v1.0.95 | Status: Planned | Master List Ref: Android a11y

---

*End of Piece 10/13*