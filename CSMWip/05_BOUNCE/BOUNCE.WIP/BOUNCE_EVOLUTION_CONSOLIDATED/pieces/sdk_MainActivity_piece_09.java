        transitionInProgress = true;
        broadcastStartTime = System.currentTimeMillis();
        armTransitionTimeout();

        String code = ssidCode.length() > 25 ? ssidCode.substring(0, 25) : ssidCode;
        doCreateGroup(code);
    }

    private void doCreateGroup(String code) {
        if (!preflightCheck()) { onGroupFailed(); return; }
        if (code == null) { onGroupFailed(); return; }

        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) {
            try {
                WifiP2pConfig config = new WifiP2pConfig.Builder()
                    .setNetworkName(code)
                    .setPassphrase("Bounce-2026")
                    .setGroupOperatingBand(WifiP2pConfig.GROUP_OWNER_BAND_5GHZ)
                    .build();
                if (p2pManager != null && p2pChannel != null) {
                    p2pManager.createGroup(p2pChannel, config, new WifiP2pManager.ActionListener() {
                        public void onSuccess() { onGroupCreated(code, "bare"); }
                        public void onFailure(int r) { tryWithDirect(code); }
                    });
                } else { onGroupFailed(); }
            } catch (IllegalArgumentException e) {
                tryWithDirect(code);
            } catch (Exception e) {
                tryWithDirect(code);
            }
        } else {
            doLegacyCreateGroup(code);
        }
    }

    private void tryWithDirect(String code) {
        if (!preflightCheck()) { onGroupFailed(); return; }
        try {
            WifiP2pConfig config = new WifiP2pConfig.Builder()
                .setNetworkName("DIRECT-" + code)
                .setPassphrase("Bounce-2026")
                .setGroupOperatingBand(WifiP2pConfig.GROUP_OWNER_BAND_5GHZ)
                .build();
            if (p2pManager != null && p2pChannel != null) {
                p2pManager.createGroup(p2pChannel, config, new WifiP2pManager.ActionListener() {
                    public void onSuccess() { onGroupCreated("DIRECT-" + code, "direct-prefix"); }
                    public void onFailure(int r) { doLegacyCreateGroup(code); }
                });
            } else { onGroupFailed(); }
        } catch (Exception e) { doLegacyCreateGroup(code); }
    }

    private void onGroupCreated(String ssid, String method) {
        disarmTransitionTimeout();
        broadcasting = true;
        transitionInProgress = false;
        long elapsed = System.currentTimeMillis() - broadcastStartTime;
        if (webView != null) {
            injectJs("Bounce.onTransitionTiming(" + elapsed + ",'" + ssid + "','" + method + "')");
            injectJs("Bounce.onBroadcastStatus({status:'visible',ssid:'" + ssid + "',method:'" + method + "'})");
        }
        try { Toast.makeText(MainActivity.this, ssid + " (" + elapsed + "ms)", Toast.LENGTH_SHORT).show(); } catch (Exception ignored) {}
    }

    private void doLegacyCreateGroup(String code) {
        if (!preflightCheck()) { onGroupFailed(); return; }
        try {
            java.lang.reflect.Method setDev = WifiP2pManager.class.getMethod("setDeviceName",
                WifiP2pManager.Channel.class, String.class, WifiP2pManager.ActionListener.class);
            setDev.invoke(p2pManager, p2pChannel, code, new WifiP2pManager.ActionListener() {
                public void onSuccess() {
                    if (p2pManager != null && p2pChannel != null) {
                        p2pManager.createGroup(p2pChannel, new WifiP2pManager.ActionListener() {
                            public void onSuccess() { onGroupCreated(code, "legacy"); }
                            public void onFailure(int r) { onGroupFailed(); }
                        });
                    } else { onGroupFailed(); }
                }
                public void onFailure(int r) {
                    if (p2pManager != null && p2pChannel != null) {
                        p2pManager.createGroup(p2pChannel, new WifiP2pManager.ActionListener() {
                            public void onSuccess() { onGroupCreated(code, "legacy-fallback"); }
                            public void onFailure(int r2) { onGroupFailed(); }
                        });
                    } else { onGroupFailed(); }
                }
            });
        } catch (Exception e) { onGroupFailed(); }
    }

    private void onGroupFailed() {
        disarmTransitionTimeout();
        broadcasting = false;
        transitionInProgress = false;
        injectJs("Bounce.onBroadcastStatus({status:'failed'})");
    }

    public void refreshBroadcastSSID(String newCode) {
        if (transitionInProgress) return;
        if (!broadcasting) return;
        if (!preflightCheck()) return;
        if (newCode == null || newCode.isEmpty()) return;
