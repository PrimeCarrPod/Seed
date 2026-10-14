package com.tgapp.electron.v3;

public class PageFinishedRunnable implements Runnable {
    private MainActivity activity;
    public PageFinishedRunnable(MainActivity activity) { this.activity = activity; }
    @Override
    public void run() {
        if (activity.webView != null) {
            activity.webView.evaluateJavascript("TGEBridge.onReady({loaded:true})", null);
            activity.webView.evaluateJavascript("TGE.setInsets(40,34)", null);
            // Initialize PrimeEngine data and TGE
            String primeData = PrimeEngine.getPrimeTileData();
            activity.injectJs("PrimeEngine.init(" + primeData + ")");
            activity.injectJs("TGE.init()");
            // Kick the electron to start moving
            activity.injectJs("TGE.electron.vx = 2.5; TGE.electron.vy = 1.8;");
        }
    }
}
