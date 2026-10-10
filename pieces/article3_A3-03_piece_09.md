# Connection_Pathways_Bidirectional — Piece 09/13
## Article A3: A3-03 — Connection Pathways Bidirectional
**Piece:** 09 of 13  
**Generated:** 2026-10-08 04:26:00 UTC

---

## TESTING STRATEGY

### Current Test Coverage: ZERO (CP016, P1-02)

### Required Test Layers

#### 1. Unit Tests — Android Bridge Methods
```java
// Test each @JavascriptInterface method
@Test
public void testSetVehicleData_validJson() {
    String json = "{\"plate\":\"ABC123\",\"originKey\":\"key1\",\"fleet\":true}";
    bridge.setVehicleData(json);
    verify(activity).setVehicleData(argThat(matchesVehicleData()));
}

@Test
public void testSetVehicleData_invalidJson() {
    bridge.setVehicleData("not json");
    verify(bridge).pushError(contains("Invalid JSON"));
}

@Test
public void testGetTrajectory_returnsJson() {
    String result = bridge.getTrajectory("AA:BB:CC:DD:EE:FF");
    assertNotNull(result);
    TrajectoryPoint[] points = gson.fromJson(result, TrajectoryPoint[].class);
}
```

#### 2. Unit Tests — HTML Bridge Handlers
```javascript
// Test UI.updateXxx functions with valid/invalid data
test('updateWifiList parses valid JSON', () => {
    const json = '[{"ssid":"Test","rssi":-50}]';
    UI.updateWifiList(json);
    expect(wifiList.children.length).toBe(1);
});

test('updateWifiList handles invalid JSON', () => {
    expect(() => UI.updateWifiList('invalid')).not.toThrow();
    expect(console.error).toHaveBeenCalled();
});
```

#### 3. Integration Tests — Full Bridge Roundtrip
```java
@RunWith(AndroidJUnit4.class)
public class BridgeIntegrationTest {
    
    @Test
    public void testWifiScanToHtml() {
        // 1. Trigger scan
        activity.requestScan();
        
        // 2. Simulate broadcast receiver
        Intent intent = new Intent(WifiManager.SCAN_RESULTS_AVAILABLE_ACTION);
        activity.sendBroadcast(intent);
        
        // 3. Verify evaluateJavascript called with correct JSON
        ArgumentCaptor<String> jsCaptor = ArgumentCaptor.forClass(String.class);
        verify(webView).evaluateJavascript(jsCaptor.capture(), isNull());
        
        String jsCall = jsCaptor.getValue();
        assertTrue(jsCall.contains("UI.updateWifiList"));
    }
}
```

#### 4. Contract Tests — JSON Schema Validation
```json
// wifi-scan.schema.json
{
  "type": "array",
  "items": {
    "type": "object",
    "required": ["ssid", "bssid", "rssi", "frequency"],
    "properties": {
      "ssid": {"type": "string"},
      "bssid": {"type": "string", "pattern": "^([0-9A-Fa-f]{2}:){5}[0-9A-Fa-f]{2}$"},
      "rssi": {"type": "integer", "minimum": -100, "maximum": 0},
      "frequency": {"type": "integer", "minimum": 2400, "maximum": 5900}
    }
  }
}
```

---

## TEST AUTOMATION PIPELINE (Planned)

### CI/CD Test Stages
```yaml
# .github/workflows/bridge-tests.yml
jobs:
  bridge-tests:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - name: Setup Android SDK
        uses: android-actions/setup-android@v2
      - name: Run Unit Tests
        run: ./gradlew test
      - name: Run Instrumented Tests
        run: ./gradlew connectedAndroidTest
      - name: Validate JSON Schemas
        run: |
          for schema in schemas/*.json; do
            ajv validate -s "$schema" -d "test/data/$(basename $schema .schema.json).json"
          done
```

---

## PIECE 09 SUMMARY
This piece documents the testing strategy for the connection pathways: current coverage is zero (CP016), required test layers include unit tests for Android bridge methods (21 methods), HTML bridge handlers (13 UI functions), integration tests for full roundtrip, and contract tests with JSON schemas. CI/CD pipeline planned with Android unit tests, instrumented tests, and schema validation.

**Next Piece (10):** Debugging & Monitoring — Logging, Metrics, Observability