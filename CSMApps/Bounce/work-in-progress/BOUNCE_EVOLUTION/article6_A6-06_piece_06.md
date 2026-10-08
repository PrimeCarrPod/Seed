# Runtime BLE/Bluetooth Errors (E010, E027)

## Article A6: A6-06 — Repeated_Errors_Catalog_Solutions
**Piece:** 06 of 13  
**Generated:** 2026-10-08 05:26:56 UTC

---

# E010: Bluetooth LE scan dies after ~10 seconds (CRITICAL)
**Type:** Runtime | **First:** v1.0.48 | **Last:** v1.0.64 | **Frequency:** Every run
**Root Cause:** Android kills continuous BLE scan - internal timeout
**Solution:** Restart scan every 5s with Handler.postDelayed
**Worked:** Yes | **Fixed In:** v1.0.65 | **Time Lost:** High
**Notes:** 5s restart cycle MANDATORY - without it, scan silently stops

### Reproduction
```java
bluetoothLeScanner.startScan(filters, settings, callback);
// Works for ~10 seconds, then:
// - No more onScanResult callbacks
// - No onScanFailed callback
// - Scanner still thinks it's scanning
// - Must restart app to recover
```

### Root Cause Detail
Android's Bluetooth stack has an internal watchdog that stops continuous LE scans after ~10 seconds to preserve battery. The scan appears active but returns no results. No callback indicates the scan stopped.

### Fix Implementation
```java
public class BleScanService {
    private static final long SCAN_RESTART_MS = 5000;  // 5 seconds
    private final Handler handler = new Handler(Looper.getMainLooper());
    private boolean isScanning = false;
    
    private final Runnable scanRestarter = new Runnable() {
        @Override
        public void run() {
            if (isScanning && bluetoothLeScanner != null) {
                // Stop and restart to keep alive
                bluetoothLeScanner.stopScan(scanCallback);
                
                // Use LOW_LATENCY for fastest discovery
                ScanSettings settings = new ScanSettings.Builder()
                    .setScanMode(ScanSettings.SCAN_MODE_LOW_LATENCY)
                    .build();
                
                bluetoothLeScanner.startScan(buildScanFilters(), settings, scanCallback);
            }
            // Schedule next restart
            handler.postDelayed(this, SCAN_RESTART_MS);
        }
    };
    
    public void startScan() {
        isScanning = true;
        handler.post(scanRestarter);  // Start immediately
    }
    
    public void stopScan() {
        isScanning = false;
        handler.removeCallbacks(scanRestarter);
        if (bluetoothLeScanner != null) {
            bluetoothLeScanner.stopScan(scanCallback);
        }
    }
}
```

### Why 5 Seconds?
- Short enough to prevent Android's internal timeout (~10s)
- Long enough to avoid excessive battery drain from restart overhead
- Verified stable across 91 versions (v1.0.65-v1.0.91)

### Prevention
- ALWAYS implement scan restart cycle for continuous BLE scanning
- Use LOW_LATENCY scan mode for fastest device discovery
- Log scan restarts for debugging: `Log.d(TAG, "BLE scan restarted")`

---

# E027: Bluetooth device name not showing
**Type:** Runtime | **First:** v1.0.48 | **Last:** v1.0.85 | **Frequency:** Occasional
**Root Cause:** ScanCallback missing name - device.getName() returns null
**Solution:** Use device.getName() with null check
**Worked:** Yes | **Fixed In:** v1.0.85 | **Time Lost:** Low
**Notes:** Null safety - some devices don't broadcast name

### Reproduction
```java
@Override
public void onScanResult(int callbackType, ScanResult result) {
    BluetoothDevice device = result.getDevice();
    String name = device.getName();  // Returns null for some devices
    Log.d(TAG, "Found: " + name);  // Logs "Found: null"
}
```

### Root Cause Detail
Not all BLE devices include their name in advertising packets. Some only include it in scan response (requires active scan), others never broadcast it.

### Fix Implementation
```java
@Override
public void onScanResult(int callbackType, ScanResult result) {
    BluetoothDevice device = result.getDevice();
    String name = device.getName();
    
    // Handle null name
    String displayName = (name != null && !name.isEmpty()) 
        ? name 
        : "Unknown Device (" + device.getAddress() + ")";
    
    Log.d(TAG, "Found: " + displayName + " RSSI: " + result.getRssi());
    
    // Optionally: request name via GATT if needed
    if (name == null && shouldResolveName(device.getAddress())) {
        device.fetchUuidsWithSdp();  // May trigger name resolution
    }
}
```

### Prevention
- Always null-check device.getName()
- Use MAC address as fallback identifier
- Consider active scan (higher power) if name is critical

---

*Next Piece: Runtime Positioning/EKF Errors (E011, E019, E020)*