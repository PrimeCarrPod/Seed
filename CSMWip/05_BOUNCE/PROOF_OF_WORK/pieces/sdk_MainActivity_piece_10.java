
        transitionInProgress = true;
        broadcastStartTime = System.currentTimeMillis();
        armTransitionTimeout();

        String code = newCode.length() > 25 ? newCode.substring(0, 25) : newCode;

        if (p2pManager != null && p2pChannel != null) {
            p2pManager.removeGroup(p2pChannel, new WifiP2pManager.ActionListener() {
                public void onSuccess() {
                    new Handler(Looper.getMainLooper()).postDelayed(() -> {
                        if (transitionInProgress && preflightCheck()) {
                            doCreateGroup(code);
                        } else {
                            onGroupFailed();
                        }
                    }, 600);
                }
                public void onFailure(int r) {
                    if (preflightCheck()) {
                        doCreateGroup(code);
                    } else {
                        onGroupFailed();
                    }
                }
            });
        } else {
            onGroupFailed();
        }
    }

    private void startBonjourBroadcast(String ssidCode) {
        p2pManager.clearLocalServices(p2pChannel, new WifiP2pManager.ActionListener() {
            public void onSuccess() {} public void onFailure(int r) {}
        });

        Map<String, String> record = new HashMap<>();
        record.put("taf", ssidCode);
        record.put("v", "1.0.13");

        WifiP2pDnsSdServiceInfo info = WifiP2pDnsSdServiceInfo.newInstance("_bounce._tcp", ssidCode, record);
        p2pManager.addLocalService(p2pChannel, info, new WifiP2pManager.ActionListener() {
            public void onSuccess() {
                broadcasting = true;
                p2pManager.discoverPeers(p2pChannel, new WifiP2pManager.ActionListener() {
                    public void onSuccess() {
                        injectJs("Bounce.onBroadcastStatus({status:'visible',ssid:'" + ssidCode + "',method:'Bonjour+Discoverable'})");
                    }
                    public void onFailure(int r) {
                        injectJs("Bounce.onBroadcastStatus({status:'broadcasting',ssid:'" + ssidCode + "',method:'Bonjour-only'})");
                    }
                });
            }
            public void onFailure(int r) {
                injectJs("Bounce.onBroadcastStatus({status:'failed',reason:'bonjour_failed'})");
            }
        });
    }

    public void stopP2pBroadcast() {
        if (p2pManager == null || p2pChannel == null) return;
        transitionInProgress = false;
        p2pManager.removeGroup(p2pChannel, new WifiP2pManager.ActionListener() {
            public void onSuccess() {}
            public void onFailure(int r) {
                // Try clearing services if group removal fails
                p2pManager.clearLocalServices(p2pChannel, new WifiP2pManager.ActionListener() {
                    public void onSuccess() {} public void onFailure(int r2) {}
                });
            }
        });
        broadcasting = false;
        injectJs("Bounce.onBroadcastStatus({status:'stopped'})");
    }

    private void startGpsTracking() {
        if (locationManager == null) return;
        try {
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
                if (checkSelfPermission(Manifest.permission.ACCESS_FINE_LOCATION) != PackageManager.PERMISSION_GRANTED) return;
            }
            locationManager.requestLocationUpdates(LocationManager.GPS_PROVIDER, 1000, .5f, gpsListener, Looper.getMainLooper());
        } catch (Exception e) {
            injectJs("androidBridge('gpsStatus',{status:'error',msg:'" + e.getMessage() + "'})");
        }
    }

    private final LocationListener gpsListener = new LocationListener() {
        public void onLocationChanged(Location loc) {
            if (loc == null || webView == null) return;
            altitude = (float) (loc.getAltitude() * 3.281f);
            webView.post(() -> {
                String json = "{lat:" + loc.getLatitude() + ",lng:" + loc.getLongitude()
                    + ",alt:" + loc.getAltitude() + ",speed:" + loc.getSpeed()
                    + ",bearing:" + loc.getBearing() + ",acc:" + loc.getAccuracy() + "}";
                injectJs("Bounce.onGps(" + json + ")");
            });
        }
        public void onStatusChanged(String p, int s, Bundle b) {}
        public void onProviderEnabled(String p) {}
        public void onProviderDisabled(String p) {
            injectJs("androidBridge('gpsStatus',{status:'disabled'})");
