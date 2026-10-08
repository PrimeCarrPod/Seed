# Working_Features_Versions_History — Piece 05/13
## Article A9: A9-09 — Working Features Versions History
**Piece:** 05 of 13  
**Generated:** 2026-10-08 15:28:33 UTC

---

# Control Features, Reference Data, System Services

## 5.1 WF019 — Control Buttons (+VEHICLE, +BEACON, Theory, etc.) (Visualization)

**Category:** Visualization | **First Working:** v1.0.0 | **Last Enhanced:** v1.0.91 | **Status:** Complete
**Lines Added:** ~100 | **Key Files:** `bounce.html` + `MainActivity.java` | **Dependencies:** JS bridge (`Android.jsInterface`)

### Enhancement History
| Version | Enhancement | Lines Delta |
|---------|-------------|-------------|
| v1.0.0 | Basic buttons: +VEHICLE, +BEACON, RESET | +40 |
| v1.0.21 | Plate mode: vehicle configuration plate UI | +30 |
| v1.0.22 | Fleet mode: multi-vehicle management | +30 |
| v1.0.86 | Theory mode: algorithm visualization toggles | +40 |

### JS Bridge Command Protocol
```javascript
// bounce.html → Android (via Android.jsInterface)
Android.sendCommand("ADD_VEHICLE", { type: "tardigrade", config: {} });
Android.sendCommand("ADD_BEACON", { mac: "aa:bb:cc:dd:ee:ff", algo: "kalman" });
Android.sendCommand("SET_MODE", { mode: "THEORY", params: { algo: "particle" } });
Android.sendCommand("RESET_ALL", {});
Android.sendCommand("TOGGLE_TRAIL", { enabled: true });
```

### Android Command Handler (MainActivity.java)
```java
@JavascriptInterface
public void sendCommand(String command, String json) {
    try {
        JSONObject obj = new JSONObject(json);
        switch (command) {
            case "ADD_VEHICLE": addVehicle(obj); break;
            case "ADD_BEACON": addBeacon(obj); break;
            case "SET_MODE": setVisualizationMode(obj); break;
            case "RESET_ALL": resetAll(); break;
            case "TOGGLE_TRAIL": toggleTrail(obj); break;
        }
    } catch (JSONException e) { Log.e(TAG, "Command parse error", e); }
}
```

### Known Limitations
- No command queuing; rapid clicks may drop commands
- No confirmation/acknowledgment protocol

### Next Planned Enhancement
None — feature complete

---

## 5.2 WF020 — FAA METAR Codes (Reference)

**Category:** Reference | **First Working:** v1.0.64 | **Last Enhanced:** v1.0.91 | **Status:** Complete
**Lines Added:** ~200 | **Key Files:** `bounce.html` | **Dependencies:** Static lookup tables (embedded)

### Enhancement History
| Version | Enhancement | Lines Delta |
|---------|-------------|-------------|
| v1.0.64 | METAR code tables + Slot 3 broadcast integration | +200 |

### METAR Code Coverage
```javascript
// Embedded in bounce.html (~200 lines)
const METAR_CODES = {
  "weather": {
    "RA": "Rain", "SN": "Snow", "FG": "Fog", "BR": "Mist",
    "TS": "Thunderstorm", "SH": "Showers", "FZ": "Freezing"
  },
  "clouds": {
    "FEW": "Few (1-2 oktas)", "SCT": "Scattered (3-4)",
    "BKN": "Broken (5-7)", "OVC": "Overcast (8)"
  },
  "runway": {
    "CLSD": "Closed", "WET": "Wet", "SNOW": "Snow covered",
    "ICE": "Icy", "RWY": "Runway"
  }
};
```

### Broadcast Integration (Slot 3)
```
SSID Slot 3 payload: "METAR|KJFK|20261008|1500|RA|BKN020|12/10|2992"
→ Decoded in HUD SCAN panel → Weather display
```

### Known Limitations
- **Static data**: No live METAR fetch (requires network + API key)
- Codes incomplete; missing TAF, SPECI, PIREP types

### Next Planned Enhancement
None — static reference complete

---

## 5.3 WF021 — Auto-Update System (System)

**Category:** System | **First Working:** v1.0.91 | **Last Enhanced:** v1.0.93 | **Status:** Complete
**Lines Added:** ~100 | **Key Files:** `MainActivity.java` + `bounce.html` | **Dependencies:** GitHub API, `URLConnection`, JSON parsing

### Enhancement History
| Version | Enhancement | Lines Delta |
|---------|-------------|-------------|
| v1.0.91 | Manual check button in HUD Update panel | +50 |
| v1.0.93 | Full menu: check now, auto-check toggle, release notes, install | +50 |

### Auto-Update Architecture
```java
// MainActivity.java - UpdateManager
public class UpdateManager {
    private static final String GITHUB_API = 
        "https://api.github.com/repos/owner/repo/releases/latest";
    
    public void checkForUpdate(UpdateCallback callback) {
        new Thread(() -> {
            try {
                URL url = new URL(GITHUB_API);
                HttpURLConnection conn = (HttpURLConnection) url.openConnection();
                conn.setRequestProperty("Accept", "application/vnd.github.v3+json");
                // Parse JSON: tag_name, body, assets[].browser_download_url
                // Compare versionCode with current
                callback.onResult(hasUpdate, releaseInfo);
            } catch (Exception e) { callback.onError(e); }
        }).start();
    }
}
```

### HUD Integration
- **Update panel** (WF018): Shows current version, latest version, release notes
- **Manual check**: Button triggers `UpdateManager.checkForUpdate()`
- **Auto-check**: Disabled by default (removed in v1.0.93 per design decision)
- **Install**: Downloads APK to `Downloads/Bounce/` → `Intent.ACTION_VIEW` install

### Known Limitations
- **Auto-check removed**: Design decision to avoid background network
- GitHub API rate limit: 60 req/hr unauthenticated
- No delta updates; full APK download (~45KB)

### Next Planned Enhancement
**Move to TGAPP (FP021)** — Monetization app handles updates + licensing

---

## 5.4 WF022 — Debug Keystore Auto-Generation (Build)

**Category:** Build | **First Working:** v1.0.0 | **Last Enhanced:** v1.0.91 | **Status:** Complete
**Lines Added:** ~20 | **Key Files:** `build.sh` | **Dependencies:** `keytool` (JDK)

### Enhancement History
| Version | Enhancement | Lines Delta |
|---------|-------------|-------------|
| v1.0.0 | Auto-generate debug keystore if missing | +20 |

### Build.sh Keystore Logic
```bash
# build.sh excerpt
DEBUG_KEYSTORE="$HOME/.android/debug.keystore"
if [ ! -f "$DEBUG_KEYSTORE" ]; then
    echo "Generating debug keystore..."
    keytool -genkeypair -v -keystore "$DEBUG_KEYSTORE" \
        -alias androiddebugkey -keyalg RSA -keysize 2048 \
        -validity 10000 -dname "CN=Android Debug,O=Android,C=US" \
        -storepass android -keypass android
fi
```

### Known Limitations
- **Debug only**: Not suitable for Play Store release
- Keystore path hardcoded to `~/.android/debug.keystore`

### Next Planned Enhancement
**Release Keystore (TD-08)** — Secure release keystore management for Play Store

---

## 5.5 WF023 — No-Gradle Build Pipeline (Build)

**Category:** Build | **First Working:** v1.0.0 | **Last Enhanced:** v1.0.91 | **Status:** Complete
**Lines Added:** ~109 | **Key Files:** `build.sh` | **Dependencies:** `aapt2`, `d8`, `zipalign`, `apksigner`, Android SDK

### Enhancement History
| Version | Enhancement | Lines Delta |
|---------|-------------|-------------|
| v1.0.0 | Complete no-Gradle pipeline created | +109 |

### Build Pipeline Stages (build.sh)
```bash
#!/bin/bash
# 1. AAPT2: Compile resources → R.java + resources.ap_
aapt2 compile --dir res -o compiled_res.zip
aapt2 link -o base.apk -I $ANDROID_JAR --manifest AndroidManifest.xml \
    -R compiled_res.zip --java src

# 2. D8: Compile Java → classes.dex
d8 --lib $ANDROID_JAR --output . src/*.java

# 3. Merge: classes.dex + resources → APK
aapt2 link -o unsigned.apk -I $ANDROID_JAR --manifest AndroidManifest.xml \
    -R compiled_res.zip --dex classes.dex

# 4. Zipalign: 4-byte alignment
zipalign -f -p 4 unsigned.apk aligned.apk

# 5. Apksigner: Debug signature
apksigner sign --ks $DEBUG_KEYSTORE --ks-pass pass:android \
    --key-pass pass:android --out Bounce.apk aligned.apk
```

### Known Limitations
- **SDK path management**: Requires `ANDROID_HOME` + `BUILD_TOOLS_VERSION` env vars
- No incremental builds; full recompile every run
- No CI/CD integration (GitHub Actions, Jenkins)

### Next Planned Enhancement
**CI/CD (TD-09)** — GitHub Actions workflow for automated builds

---

*End of Piece 05 — Continue to Piece 06 for Wake Lock, Permissions, Chart.js*