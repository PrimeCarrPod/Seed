
    private void handleRttResults(Map<String, WifiRttRanging.RttMeasurement> results) {
        // Send RTT results to JS
        if (webView != null) {
            StringBuilder json = new StringBuilder("{");
            boolean first = true;
            for (Map.Entry<String, WifiRttRanging.RttMeasurement> entry : results.entrySet()) {
                if (!first) json.append(",");
                first = false;
                WifiRttRanging.RttMeasurement m = entry.getValue();
                json.append("\"").append(entry.getKey()).append("\":")
                    .append("{\"dist\":").append(m.distanceMeters)
                    .append(",\"stdDev\":").append(m.distanceStdDevMeters)
                    .append(",\"rssi\":").append(m.rssi).append("}");
            }
            json.append("}");
            injectJs("Bounce.onRttResults(" + json.toString() + ")");
        }
    }

    private void startBtScanning() {
        if (Build.VERSION.SDK_INT >= 31) {
            if (checkSelfPermission(Manifest.permission.BLUETOOTH_SCAN) != PackageManager.PERMISSION_GRANTED) {
                injectJs("Bounce.onBtStatus({status:'no_permission'})");
                return;
            }
        }
        bluetoothAdapter = BluetoothAdapter.getDefaultAdapter();
        if (bluetoothAdapter == null || !bluetoothAdapter.isEnabled()) {
            injectJs("Bounce.onBtStatus({status:'bt_disabled'})");
            return;
        }
        bleScanner = bluetoothAdapter.getBluetoothLeScanner();
        if (bleScanner == null) {
            injectJs("Bounce.onBtStatus({status:'no_le_scanner'})");
            return;
        }
        btScanning = true;
        ScanSettings settings = new ScanSettings.Builder()
            .setScanMode(ScanSettings.SCAN_MODE_LOW_LATENCY)
            .build();
        bleScanner.startScan(null, settings, btCallback);
        injectJs("Bounce.onBtStatus({status:'scanning'})");
        android.util.Log.d("BounceBT", "BT scan started successfully");
        
        // Restart scan periodically like Wi-Fi to ensure continuous scanning
        scanHandler.postDelayed(new Runnable() {
            public void run() {
                if (btScanning && bleScanner != null && bluetoothAdapter != null && bluetoothAdapter.isEnabled()) {
                    try {
                        bleScanner.stopScan(btCallback);
                    } catch (Exception ignored) {}
                    bleScanner.startScan(null, settings, btCallback);
                    android.util.Log.d("BounceBT", "BT scan restarted");
                }
                if (btScanning) {
                    scanHandler.postDelayed(this, 50000); // Restart every 5 seconds
                }
            }
        }, 5000);
    }

    private final ScanCallback btCallback = new ScanCallback() {
        public void onScanResult(int callbackType, android.bluetooth.le.ScanResult result) {
            if (result == null || webView == null) return;
            android.util.Log.d("BounceBT", "onScanResult: " + result.getDevice().getAddress() + " rssi=" + result.getRssi());
            BluetoothDevice dev = result.getDevice();
            int rawRssi = result.getRssi();
            String addr = dev.getAddress();
            String name = dev.getName() != null ? dev.getName() : "Unknown";
            long now = System.currentTimeMillis();

            // Kalman filter for RSSI smoothing
            KalmanState ks = btKalmanStates.get(addr);
            if (ks == null) { ks = new KalmanState(); ks.x = rawRssi; btKalmanStates.put(addr, ks); }
            ks.p += 0.01f;
            float k = ks.p / (ks.p + 20f);
            ks.x += k * (rawRssi - ks.x);
            ks.p *= (1f - k);
            float filteredRssi = ks.x;

            // Distance estimation using filtered RSSI
            float distance = (float) Math.pow(10, (BT_RSSI_1M - filteredRssi) / (10f * BT_PATH_LOSS_EXPONENT));

            // Get or create 3D device
            BtDevice3D device = btDevices.get(addr);
            if (device == null) {
                device = new BtDevice3D(addr, name);
                btDevices.put(addr, device);
                android.util.Log.d("BounceBT", "NEW DEVICE: " + addr + " name=" + name + " dist=" + distance + " az=" + phoneAzimuth + " pitch=" + phonePitch);
            }
            
            // Update device state
            device.rssi = rawRssi;
            device.filteredRssi = filteredRssi;
            device.distance = distance;
            device.lastSeen = now;
            device.active = true;
            
            // RE-ENERGIZE BRIGHTNESS on signal catch
            device.brightness = Math.min(1.0f, device.brightness * BRIGHTNESS_BOOST);
            
