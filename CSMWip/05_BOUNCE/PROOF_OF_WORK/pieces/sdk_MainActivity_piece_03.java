        };

        root.setBackgroundColor(Color.parseColor("#0A0A0F"));

        webView = buildWebView();
        root.addView(webView);

        headerOverlay = buildHeader();
        root.addView(headerOverlay);

        root.addView(buildControlBar());
        setContentView(root);

        prefs = getSharedPreferences("BounceUpdate", MODE_PRIVATE);

        PowerManager pm = (PowerManager) getSystemService(POWER_SERVICE);
        wakeLock = pm.newWakeLock(PowerManager.PARTIAL_WAKE_LOCK, "Bounce:TrailRecorder");
        wakeLock.acquire();

        wifiManager = (WifiManager) getApplicationContext().getSystemService(WIFI_SERVICE);
        p2pManager = (WifiP2pManager) getSystemService(WIFI_P2P_SERVICE);
        if (p2pManager != null) {
            p2pChannel = p2pManager.initialize(this, Looper.getMainLooper(), null);
        }
        locationManager = (LocationManager) getSystemService(LOCATION_SERVICE);

        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
            boolean needLoc = checkSelfPermission(Manifest.permission.ACCESS_FINE_LOCATION) != PackageManager.PERMISSION_GRANTED;
            boolean needWifi = Build.VERSION.SDK_INT >= 33 &&
                checkSelfPermission(Manifest.permission.NEARBY_WIFI_DEVICES) != PackageManager.PERMISSION_GRANTED;
            boolean needBt = Build.VERSION.SDK_INT >= 31 && (checkSelfPermission(Manifest.permission.BLUETOOTH_SCAN) != PackageManager.PERMISSION_GRANTED
                || checkSelfPermission(Manifest.permission.BLUETOOTH_CONNECT) != PackageManager.PERMISSION_GRANTED);
            boolean needActivity = Build.VERSION.SDK_INT >= 29 &&
                checkSelfPermission(Manifest.permission.ACTIVITY_RECOGNITION) != PackageManager.PERMISSION_GRANTED;

            if (needLoc || needWifi || needBt || needActivity) {
                java.util.ArrayList<String> perms = new java.util.ArrayList<>();
                if (needLoc) { perms.add(Manifest.permission.ACCESS_FINE_LOCATION); perms.add(Manifest.permission.ACCESS_COARSE_LOCATION); }
                if (needWifi) perms.add(Manifest.permission.NEARBY_WIFI_DEVICES);
                if (needBt) { perms.add(Manifest.permission.BLUETOOTH_SCAN); perms.add(Manifest.permission.BLUETOOTH_CONNECT); }
                if (needActivity) perms.add(Manifest.permission.ACTIVITY_RECOGNITION);

                new Handler(Looper.getMainLooper()).postDelayed(() -> {
                    requestPermissions(perms.toArray(new String[0]), PERM_REQ);
                    Toast.makeText(MainActivity.this, "Grant permissions for scanning, GPS, and Bluetooth", Toast.LENGTH_LONG).show();
                }, 500);
                return;
            }
        }

        startServices();
    }

    @Override
    public void onRequestPermissionsResult(int code, String[] perms, int[] results) {
        super.onRequestPermissionsResult(code, perms, results);
        if (code == PERM_REQ) {
            boolean granted = results.length > 0 && results[0] == PackageManager.PERMISSION_GRANTED;
            Toast.makeText(this, granted ? "Permissions granted" : "Denied — scanner disabled", Toast.LENGTH_LONG).show();
            if (granted) startServices();
        }
    }

    private void startServices() {
        // Initialize Wi-Fi triangulation modules
        initializeTriangulationModules();

        startWifiScanning();
        startGpsTracking();
        startSensors();
        startBtScanning();
        startBtCleanupTask();
    }

    private void checkUpdate() {
        new Thread(() -> {
            List<ReleaseInfo> releases = fetchAvailableReleases();
            runOnUiThread(() -> {
                if (releases != null && !releases.isEmpty()) {
                    StringBuilder json = new StringBuilder("[");
                    for (int i = 0; i < releases.size(); i++) {
                        ReleaseInfo r = releases.get(i);
                        if (i > 0) json.append(",");
                        json.append("{\"version\":\"").append(r.version)
                            .append("\",\"filename\":\"").append(r.filename)
                            .append("\",\"url\":\"").append(r.url)
                            .append("\",\"newer\":").append(isNewerVersion(r.version, "1.0.92")).append("}");
                    }
                    json.append("]");
                    injectJs("Bounce.onReleasesAvailable(" + json.toString() + ")");
                } else {
                    injectJs("Bounce.onReleasesAvailable([])");
                }
            });
        }).start();
    }

    private void startUpdate() {
        if (latestVersion == null) return;
        Toast.makeText(this, "Updating to v" + latestVersion + "...", Toast.LENGTH_SHORT).show();
        prefs.edit().putInt("ignoreCount", 0).apply();
    }
