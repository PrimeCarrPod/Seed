            return false;
        }
    }

    private void startBtCleanupTask() {
        btCleanupRunnable = new Runnable() {
            public void run() {
                long now = System.currentTimeMillis();
                List<String> toRemove = new ArrayList<>();
                
                for (Map.Entry<String, BtDevice3D> entry : btDevices.entrySet()) {
                    BtDevice3D device = entry.getValue();
                    long age = now - device.lastSeen;
                    
                    // Decay brightness for inactive devices
                    if (!device.active) {
                        device.brightness *= BRIGHTNESS_DECAY;
                        device.brightness = Math.max(0.1f, device.brightness); // Minimum visibility
                    }
                    
                    // Mark as inactive if not seen recently
                    if (age > 2000) { // 2 seconds
                        device.active = false;
                    }
                    
                    // Remove very old devices (but keep for theory view)
                    if (age > BT_MAX_AGE_MS) {
                        toRemove.add(entry.getKey());
                    }
                    
                    // Send periodic update for theory view (even for inactive devices)
                    if (webView != null && (device.active || age < BT_MAX_AGE_MS)) {
                        final BtDevice3D d = device;
                        final String addr = entry.getKey();
                        final long a = age;
                        webView.post(() -> {
                            String json = "{\"addr\":\"" + addr
                                + "\",\"name\":\"" + escapeJson(d.name) + "\""
                                + "\",\"rssi\":" + (int)d.rssi
                                + "\",\"dist\":" + String.format("%.1f", d.distance)
                                + "\",\"x\":" + String.format("%.2f", d.x)
                                + "\",\"y\":" + String.format("%.2f", d.y)
                                + "\",\"z\":" + String.format("%.2f", d.z)
                                + "\",\"brightness\":" + String.format("%.2f", d.brightness)
                                + "\",\"active\":" + d.active
                                + "\",\"persist\":" + ((now - d.firstSeen) / 1000)
                                + "\",\"age\":" + (a / 1000) + "}";
                            injectJs("Bounce.onBtResult3D(" + json + ")");
                        });
                    }
                }
                
                // Remove expired devices from active map (trajectory kept in btTrajectories)
                for (String addr : toRemove) {
                    btDevices.remove(addr);
                }
                
                // Schedule next cleanup
                btCleanupHandler.postDelayed(this, 500); // Run every 500ms
            }
        };
        btCleanupHandler.post(btCleanupRunnable);
    }

    private void initializeTriangulationModules() {
        // Initialize executor for background tasks
        executor = Executors.newSingleThreadExecutor();

        // Initialize Kalman filter for RSSI smoothing
        rssiKalmanFilter = new RssiKalmanFilter();

        // Initialize per-BSSID Kalman filters
        kalmanFilters.clear();

        // Initialize trilateration
        trilateration = new Trilateration();

        // Initialize Extended Kalman Filter for 2D position tracking
        positionEKF = new PositionEKF();

        // Initialize Particle Filter for non-Gaussian RSSI
        particleFilter = new ParticleFilter(200);  // 200 particles

        // Initialize Zone HMM for zone classification
        zoneHMM = new ZoneHMM();

        // Initialize Wi-Fi RTT ranging
        wifiRttRanging = new WifiRttRanging(this, new WifiRttRanging.RttCallback() {
            @Override
            public void onRttResults(Map<String, WifiRttRanging.RttMeasurement> results) {
                handleRttResults(results);
            }

            @Override
            public void onRttFailure(int errorCode) {
                Log.w("Bounce", "RTT ranging failed: " + errorCode);
            }
        });

        // Initialize executor for background tasks
        executor = Executors.newSingleThreadExecutor();
    }
