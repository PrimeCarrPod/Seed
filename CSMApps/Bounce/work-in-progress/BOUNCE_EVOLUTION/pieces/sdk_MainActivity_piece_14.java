        }));
        row.addView(mkBtn("+VEH", "#f97316", v -> injectJs("Bounce.showPlateInput()")));
        row.addView(mkBtn("BROADCAST", "#4488FF", v -> injectJs("Bounce.toggleBroadcast()")));
        row.addView(mkBtn("FLEET", "#a855f7", v -> injectJs("Bounce.toggleFleet()")));

        cleanBtn = mkBtn("CLEAN", "#FF6600", v -> {
            cleanMode = !cleanMode;
            cleanBtn.setText(cleanMode ? "SHOW" : "CLEAN");
            cleanBtn.setTextColor(Color.parseColor(cleanMode ? "#FF4466" : "#FF6600"));
            headerOverlay.setVisibility(cleanMode ? View.GONE : View.VISIBLE);
        });
        row.addView(cleanBtn);

        bar.addView(row);
        return bar;
    }

    private Button mkBtn(String t, String color, View.OnClickListener l) {
        Button b = new Button(this);
        b.setText(t); b.setTextSize(10f); b.setTextColor(Color.parseColor(color));
        b.setBackgroundColor(Color.parseColor("#1A1A2E"));
        b.setPadding(dp(8), dp(8), dp(8), dp(8));
        b.setLayoutParams(new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));
        b.setOnClickListener(l); return b;
    }

    private void injectJs(String s) { try { if (webView != null) webView.evaluateJavascript(s, null); } catch (Exception ignored) {} }
    private int dp(int px) { return (int)(px * getResources().getDisplayMetrics().density); }

    @Override public void onBackPressed() { super.onBackPressed(); }
    @Override protected void onDestroy() {
        super.onDestroy();
        if (wakeLock != null && wakeLock.isHeld()) wakeLock.release();
        scanning = false;
        scanHandler.removeCallbacksAndMessages(null);
        try { unregisterReceiver(wifiScanReceiver); } catch (Exception ignored) {}
        if (broadcasting) stopP2pBroadcast();
        if (btScanning && bleScanner != null) {
            try { bleScanner.stopScan(btCallback); } catch (Exception ignored) {}
        }
        if (sensorManager != null && sensorHandler != null) {
            sensorManager.unregisterListener(sensorListener);
        }
        if (sensorThread != null) {
            sensorThread.quitSafely();
            sensorThread = null;
        }
        // Stop Bluetooth cleanup task
        if (btCleanupHandler != null && btCleanupRunnable != null) {
            btCleanupHandler.removeCallbacks(btCleanupRunnable);
        }
    }

    public class JsBridge {
        @JavascriptInterface
        public void onReady(String j) {
            runOnUiThread(() -> Toast.makeText(MainActivity.this, "Bounce v1.0.92 · Bluetooth 3D Spatial", Toast.LENGTH_SHORT).show());
        }

        @JavascriptInterface
        public void startBroadcast(String ssidCode) {
            runOnUiThread(() -> startP2pBroadcast(ssidCode));
        }

        @JavascriptInterface
        public void stopBroadcast() {
            runOnUiThread(() -> stopP2pBroadcast());
        }
        @JavascriptInterface
        public void refreshBroadcastSSID(String newSsid) {
            runOnUiThread(() -> refreshBroadcastSSID(newSsid));
        }
        @JavascriptInterface
        public void updateHeaderText(String text) {
            runOnUiThread(() -> {
                if (tagTextView != null) tagTextView.setText(text);
            });
        }
        
        @JavascriptInterface
        public void setTheoryMode(boolean enabled) {
            theoryMode = enabled;
            runOnUiThread(() -> {
                String mode = enabled ? "THEORY" : "LIVE";
                if (tagTextView != null) tagTextView.setText("Bluetooth 3D Spatial · v1.0.92 · " + mode);
                Toast.makeText(MainActivity.this, "Theory Mode: " + (enabled ? "ON" : "OFF"), Toast.LENGTH_SHORT).show();
            });
        }
        
        @JavascriptInterface
        public String getTrajectory(String addr) {
            List<BtPositionSample> traj = btTrajectories.get(addr);
            if (traj == null || traj.isEmpty()) return "[]";
            StringBuilder json = new StringBuilder("[");
            for (int i = 0; i < traj.size(); i++) {
                BtPositionSample s = traj.get(i);
                if (i > 0) json.append(",");
                json.append("{\"t\":").append(s.timestamp)
                    .append(",\"x\":" + String.format("%.2f", s.x))
                    .append(",\"y\":" + String.format("%.2f", s.y))
                    .append(",\"z\":" + String.format("%.2f", s.z))
                    .append(",\"rssi\":" + (int)s.rssi)
