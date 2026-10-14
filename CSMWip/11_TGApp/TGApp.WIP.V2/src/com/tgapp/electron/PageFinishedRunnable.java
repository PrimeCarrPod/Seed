package com.tgapp.electron;

public class PageFinishedRunnable implements Runnable {
    private MainActivity activity;
    public PageFinishedRunnable(MainActivity activity) {
        this.activity = activity;
    }
    @Override
    public void run() {
        if (activity.webView != null) {
            activity.webView.evaluateJavascript("TGEBridge.onReady({loaded:true})", null);
            activity.webView.evaluateJavascript("TGE.setInsets(40,34)", null);
            activity.injectJs("PrimeEngine.init(" + PrimeEngine.getPrimeTileData() + ")");
            activity.injectJs("WorldlineRenderer.init()");
        }
    }
}
