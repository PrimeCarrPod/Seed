# Runtime Permission Errors - API33+ (E009, E023, E024)

## Article A6: A6-06 — Repeated_Errors_Catalog_Solutions
**Piece:** 05 of 13  
**Generated:** 2026-10-08 05:26:24 UTC

---

# E009: WifiManager startScan() returns no results
**Type:** Runtime | **First:** v1.0.80 | **Last:** v1.0.85 | **Frequency:** Multiple
**Root Cause:** API33 NEARBY_WIFI_DEVICES permission missing
**Solution:** Add NEARBY_WIFI_DEVICES with neverForLocation flag
**Worked:** Yes | **Fixed In:** v1.0.85 | **Time Lost:** High
**Notes:** API33+ permission change - Wi-Fi scan now requires dedicated permission

### Reproduction
```java
WifiManager wifi = (WifiManager) getSystemService(WIFI_SERVICE);
wifi.startScan();  // Returns false, no SCAN_RESULTS_AVAILABLE_ACTION broadcast
List<ScanResult> results = wifi.getScanResults();  // Empty list
```

### Root Cause Detail
Android 13 (API 33) introduced NEARBY_WIFI_DEVICES permission. Apps targeting API 33+ must declare this permission to scan Wi-Fi networks, even if they already have ACCESS_FINE_LOCATION.

### Fix Implementation
```xml
<!-- AndroidManifest.xml -->
<uses-permission android:name="android.permission.NEARBY_WIFI_DEVICES"
    android:usesPermissionFlags="neverForLocation" />
```

```java
// Runtime permission request (API 33+)
if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.TIRAMISU) {
    if (checkSelfPermission(Manifest.permission.NEARBY_WIFI_DEVICES)
            != PackageManager.PERMISSION_GRANTED) {
        requestPermissions(new String[]{Manifest.permission.NEARBY_WIFI_DEVICES},
            PERM_REQUEST_WIFI);
    }
}
```

### Prevention
- Always declare NEARBY_WIFI_DEVICES for Wi-Fi scanning on API 33+
- Use neverForLocation flag if not using for location tracking
- Test on API 33+ device/emulator

---

# E023: Bluetooth permissions denied on API31+
**Type:** Runtime | **First:** v1.0.48 | **Last:** v1.0.91 | **Frequency:** Every run
**Root Cause:** Missing BLUETOOTH_SCAN/CONNECT/ADVERTISE permissions
**Solution:** Add all three modern BT permissions
**Worked:** Yes | **Fixed In:** v1.0.48 | **Time Lost:** High
**Notes:** API31+ requires 3 new permissions - old BLUETOOTH/BLUETOOTH_ADMIN deprecated

### Reproduction
```java
BluetoothLeScanner scanner = bluetoothAdapter.getBluetoothLeScanner();
scanner.startScan(callback);  // SecurityException: Need BLUETOOTH_SCAN permission
```

### Root Cause Detail
Android 12 (API 31) replaced BLUETOOTH and BLUETOOTH_ADMIN with three granular permissions:
- BLUETOOTH_SCAN (for scanning)
- BLUETOOTH_CONNECT (for connecting)
- BLUETOOTH_ADVERTISE (for advertising)

### Fix Implementation
```xml
<!-- AndroidManifest.xml -->
<uses-permission android:name="android.permission.BLUETOOTH_SCAN"
    android:usesPermissionFlags="neverForLocation" />
<uses-permission android:name="android.permission.BLUETOOTH_CONNECT" />
<uses-permission android:name="android.permission.BLUETOOTH_ADVERTISE" />

<!-- Legacy for API < 31 -->
<uses-permission android:name="android.permission.BLUETOOTH"
    android:maxSdkVersion="30" />
<uses-permission android:name="android.permission.BLUETOOTH_ADMIN"
    android:maxSdkVersion="30" />
```

```java
// Runtime request (API 31+)
private void requestBluetoothPermissions() {
    List<String> needed = new ArrayList<>();
    if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.S) {
        if (checkSelfPermission(BLUETOOTH_SCAN) != PERMISSION_GRANTED)
            needed.add(BLUETOOTH_SCAN);
        if (checkSelfPermission(BLUETOOTH_CONNECT) != PERMISSION_GRANTED)
            needed.add(BLUETOOTH_CONNECT);
        if (checkSelfPermission(BLUETOOTH_ADVERTISE) != PERMISSION_GRANTED)
            needed.add(BLUETOOTH_ADVERTISE);
    } else {
        if (checkSelfPermission(BLUETOOTH) != PERMISSION_GRANTED)
            needed.add(BLUETOOTH);
        if (checkSelfPermission(BLUETOOTH_ADMIN) != PERMISSION_GRANTED)
            needed.add(BLUETOOTH_ADMIN);
    }
    if (!needed.isEmpty()) {
        requestPermissions(needed.toArray(new String[0]), PERM_BT);
    }
}
```

### Prevention
- Declare all three modern BT permissions
- Use maxSdkVersion for legacy permissions
- Handle both API < 31 and API 31+ paths

---

# E024: Background location permission denied
**Type:** Runtime | **First:** v1.0.29 | **Last:** v1.0.91 | **Frequency:** Every run
**Root Cause:** Missing ACCESS_BACKGROUND_LOCATION permission
**Solution:** Add permission for API29+
**Worked:** Yes | **Fixed In:** v1.0.29 | **Time Lost:** High
**Notes:** Required for background GPS - user must grant "Allow all the time"

### Reproduction
```java
// Background service trying to get location
LocationManager lm = (LocationManager) getSystemService(LOCATION_SERVICE);
lm.requestLocationUpdates(LocationManager.GPS_PROVIDER, 0, 0, listener);
// SecurityException: "Package requires permission android.permission.ACCESS_BACKGROUND_LOCATION"
```

### Root Cause Detail
Android 10 (API 29) introduced ACCESS_BACKGROUND_LOCATION. Apps targeting API 29+ that access location in background (service, broadcast receiver) must declare and request this permission separately from foreground location.

### Fix Implementation
```xml
<!-- AndroidManifest.xml -->
<uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION" />
<uses-permission android:name="android.permission.ACCESS_FINE_LOCATION" />
<uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION" />
```

```java
// Runtime request - requires "Allow all the time" from user
private void requestLocationPermissions() {
    List<String> needed = new ArrayList<>();
    needed.add(ACCESS_FINE_LOCATION);
    needed.add(ACCESS_COARSE_LOCATION);
    if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) {
        needed.add(ACCESS_BACKGROUND_LOCATION);
    }
    requestPermissions(needed.toArray(new String[0]), PERM_LOCATION);
}
```

### Prevention
- Always request ACCESS_BACKGROUND_LOCATION for API 29+ if using background location
- Explain to user why "Allow all the time" is needed
- Handle case where user only grants "Allow only while using the app"

---

*Next Piece: Runtime BLE/Bluetooth Errors (E010, E027)*