package com.tgapp.electron.v3;

import android.util.Log;
import android.webkit.JavascriptInterface;
import android.widget.Toast;

public class JsBridge {
    private MainActivity activity;

    public JsBridge(MainActivity activity) {
        this.activity = activity;
    }

    @JavascriptInterface
    public void onReady(String json) {
        activity.runOnUiThread(new JsBridgeOnReady(activity));
    }

    @JavascriptInterface
    public void updateHeaderText(String text) {
        activity.runOnUiThread(new JsBridgeUpdateHeader(activity, text));
    }

    @JavascriptInterface
    public void setTheoryMode(boolean enabled) {
        activity.theoryMode = enabled;
        activity.runOnUiThread(new JsBridgeSetTheory(activity, enabled));
    }

    @JavascriptInterface
    public void onWorldlineReflection(String data) {
        Log.d("TGE_Electron", "Worldline reflection: " + data);
    }

    @JavascriptInterface
    public void onPrimeGapEvent(String data) {
        Log.d("TGE_Electron", "Prime gap event: " + data);
    }
}
