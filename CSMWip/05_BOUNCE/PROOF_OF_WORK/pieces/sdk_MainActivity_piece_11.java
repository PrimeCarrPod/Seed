        }
    };

    private void startWifiScanning() {
        if (wifiManager == null || !wifiManager.isWifiEnabled()) {
            Toast.makeText(this, "Enable Wi-Fi for Bounce scanning", Toast.LENGTH_LONG).show();
            return;
        }

        IntentFilter filter = new IntentFilter(WifiManager.SCAN_RESULTS_AVAILABLE_ACTION);
        registerReceiver(wifiScanReceiver, filter);

        scanning = true;
        lastScanTime = System.currentTimeMillis();
        wifiManager.startScan();
        pushScanResults();

        scanHandler.postDelayed(new Runnable() {
            public void run() {
                if (scanning) {
                    lastScanTime = System.currentTimeMillis();
                    wifiManager.startScan();
        pushScanResults();
                    scanHandler.postDelayed(this, 1000);
                }
            }
        }, 1000);
    }

    private final BroadcastReceiver wifiScanReceiver = new BroadcastReceiver() {
        @Override
        public void onReceive(Context context, Intent intent) {
            boolean success = intent.getBooleanExtra(WifiManager.EXTRA_RESULTS_UPDATED, false);
            if (!success) return;
            List<android.net.wifi.ScanResult> results = wifiManager.getScanResults();
            if (results == null || results.isEmpty()) return;
            long elapsed = System.currentTimeMillis() - lastScanTime;
            lastScanTime = System.currentTimeMillis();
            sendScanResultsToJs(results, elapsed);
        }
    };

    private void pushScanResults() {
        if (wifiManager == null || webView == null) return;
        try {
            List<android.net.wifi.ScanResult> results = wifiManager.getScanResults();
            if (results == null || results.isEmpty()) {
                // No results yet — tell JS we're still scanning
                injectJs("Bounce.onScanStatus({status:'empty',msg:'no networks found'})");
                return;
            }
            sendScanResultsToJs(results, 0);
        } catch (SecurityException se) {
            injectJs("Bounce.onScanStatus({status:'denied',msg:'location permission needed'})");
        } catch (Exception e) {
            injectJs("Bounce.onScanStatus({status:'error',msg:'"+e.getMessage()+"'})");
        }
    }

    private void sendScanResultsToJs(List<android.net.wifi.ScanResult> results, long elapsed) {
        scanCount++;
        long now = System.currentTimeMillis();

        // Prepare AP data for triangulation
        List<Trilateration.AccessPoint> apsForTrilateration = new ArrayList<>();
        List<Trilateration.AccessPoint> apsForEKF = new ArrayList<>();
        Map<String, Double> measurementsForEKF = new HashMap<>();
        Map<String, Double> measurementsForParticleFilter = new HashMap<>();

        StringBuilder json = new StringBuilder("[");
        boolean first = true;

        for (android.net.wifi.ScanResult r : results) {
            if (!first) json.append(","); first = false;
            String ssid = escapeJson(r.SSID);
            String bssid = r.BSSID;
            long firstSeen = ssidLog.containsKey(bssid) ? ssidLog.get(bssid) : now;
            if (!ssidLog.containsKey(bssid)) ssidLog.put(bssid, now);
            long persistence = (now - firstSeen) / 1000;
            Float prevRssi = ssidRssiHistory.get(bssid);
            boolean reliable = prevRssi != null && Math.abs(r.level - prevRssi) < 15;

            // Apply Kalman filter to RSSI
            float filteredRssi = rssiKalmanFilter.update(r.level);
            
            // Update per-BSSID Kalman filter
            RssiKalmanFilter bssidFilter = kalmanFilters.get(bssid);
            if (bssidFilter == null) {
                bssidFilter = new RssiKalmanFilter();
                kalmanFilters.put(bssid, bssidFilter);
            }
            float bssidFilteredRssi = bssidFilter.update(r.level);

            // Calculate distance using filtered RSSI
            float kDist = (float) Math.pow(10, (RSSI_1M - bssidFilteredRssi) / (10f * PATH_LOSS_EXPONENT));
            
            // Use HMM for zone classification
            ZoneHMM.Zone zone = zoneHMM.step(kDist);
            String zoneStr = zone.name().toLowerCase();

            // Update AP position estimates if we have GPS
            updateApPosition(bssid, r.level);
