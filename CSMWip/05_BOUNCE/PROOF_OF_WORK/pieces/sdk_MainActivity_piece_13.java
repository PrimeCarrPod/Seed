    private static class KalmanState {
        float x; float p = 1f;
    }

    private String computeZone(float distance) {
        if (distance < ZONE_IMMEDIATE) return "immediate";
        if (distance < ZONE_NEAR) return "near";
        return "far";
    }

    private float kalmanDistance(String bssid, int rawRssi) {
        KalmanState ks = kalmanStates.get(bssid);
        if (ks == null) { ks = new KalmanState(); ks.x = rawRssi; kalmanStates.put(bssid, ks); }

        ks.p += KALMAN_Q;
        float k = ks.p / (ks.p + KALMAN_R);
        ks.x += k * (rawRssi - ks.x);
        ks.p *= (1f - k);

        float filteredRssi = ks.x;
        return (float) Math.pow(10, (RSSI_1M - filteredRssi) / (10f * PATH_LOSS_EXPONENT));
    }

    private String escapeJson(String s) {
        if (s == null || s.isEmpty()) return "---";
        return s.replace("\\", "\\\\").replace("\"", "\\\"").replace("\n", "\\n").replace("\r", "");
    }

    private WebView buildWebView() {
        WebView wv = new WebView(this);
        wv.setLayoutParams(new FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));
        // Enable hardware acceleration for WebGL/Three.js rendering
        wv.setLayerType(View.LAYER_TYPE_HARDWARE, null);
        WebSettings s = wv.getSettings();
        s.setJavaScriptEnabled(true);
        s.setDomStorageEnabled(true);
        s.setAllowFileAccess(true);
        s.setAllowFileAccessFromFileURLs(true);
        s.setAllowUniversalAccessFromFileURLs(true);
        s.setMediaPlaybackRequiresUserGesture(false);
        wv.setWebChromeClient(new WebChromeClient());
        wv.setWebViewClient(new WebViewClient() {
            public void onPageFinished(WebView v, String u) {
                v.postDelayed(() -> {
                    v.evaluateJavascript("androidBridge('onReady',{loaded:true})", null);
                    v.evaluateJavascript("UI.setInsets(40,34)", null);
                }, 2000);
            }
        });
        wv.addJavascriptInterface(new JsBridge(), "BounceBridge");
        wv.loadUrl("file:///android_asset/bounce.html");
        return wv;
    }

    private LinearLayout buildHeader() {
        LinearLayout h = new LinearLayout(this);
        h.setOrientation(LinearLayout.VERTICAL);
        h.setGravity(Gravity.CENTER);
        h.setPadding(dp(16), dp(44), dp(16), dp(10));
        h.setBackgroundColor(Color.argb(190, 10, 10, 15));
        FrameLayout.LayoutParams hp = new FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        hp.gravity = Gravity.TOP | Gravity.CENTER_HORIZONTAL;
        h.setLayoutParams(hp);

        TextView logo = new TextView(this);
        logo.setText("BOUNCE");
        logo.setTextSize(26f);
        logo.setTextColor(Color.parseColor("#FF6600"));
        logo.setTypeface(Typeface.DEFAULT_BOLD);
        logo.setGravity(Gravity.CENTER);

        TextView tag = new TextView(this);
        tag.setText("RSSI Kalman · v1.0.92");
        tag.setTextSize(11f);
        tag.setTextColor(Color.parseColor("#E8E8F0"));
        tag.setGravity(Gravity.CENTER);
        tagTextView = tag;

        h.addView(logo);
        h.addView(tag);
        return h;
    }

    private FrameLayout buildControlBar() {
        FrameLayout bar = new FrameLayout(this);
        bar.setBackgroundColor(Color.parseColor("#E50A0A0F"));
        FrameLayout.LayoutParams bp = new FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        bp.gravity = Gravity.BOTTOM;
        bar.setLayoutParams(bp);

        LinearLayout row = new LinearLayout(this);
        row.setOrientation(LinearLayout.HORIZONTAL);
        row.setGravity(Gravity.CENTER);
        row.setPadding(0, dp(8), 0, dp(8));

        row.addView(mkBtn("SCAN", "#00FF88", v -> {
            if (wifiManager != null) {
                boolean started = wifiManager.startScan();
                // Also push cached results immediately
                pushScanResults();
                if (!started) Toast.makeText(MainActivity.this, "Scan throttled — cached results shown", Toast.LENGTH_SHORT).show();
            }
