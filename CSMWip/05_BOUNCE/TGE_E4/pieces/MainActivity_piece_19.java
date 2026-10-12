        super.onDestroy();
        scanHandler.removeCallbacksAndMessages(null);
        if (sensorManager != null) sensorManager.unregisterListener(this);
    }

    @Override
    public void onBackPressed() {
        if (menuVisible) {
            toggleMenu();
            return;
        }
        if (webView != null && webView.canGoBack()) {
            webView.goBack();
        } else {
            super.onBackPressed();
        }
    }

    public class JsBridge {
        @JavascriptInterface
