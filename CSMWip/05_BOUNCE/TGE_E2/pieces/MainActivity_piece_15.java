        try {
            if (webView != null) {
                webView.evaluateJavascript(s, null);
            }
        } catch (Exception e) {
            Log.w("TGE_E2", "injectJs failed: " + e.getMessage());
        }
    }

    private int dp(int px) {
        return (int) (px * getResources().getDisplayMetrics().density);
    }

    private void restoreState() {
        cleanMode = prefs.getBoolean("cleanMode", false);
        theoryMode = prefs.getBoolean("theoryMode", false);
        cleanBtn.setText(cleanMode ? "SHOW" : "CLEAN");
        cleanBtn.setTextColor(Color.parseColor(cleanMode ? "#FF4466" : "#FF6600"));
        headerOverlay.setVisibility(cleanMode ? View.GONE : View.VISIBLE);
        theoryBtn.setText(theoryMode ? "LIVE" : "THEORY");
