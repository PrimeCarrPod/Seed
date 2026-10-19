package com.tgapp.electron.v3;

import android.util.Log;
import android.webkit.JavascriptInterface;
import android.widget.Toast;
import java.io.FileOutputStream;
import java.io.IOException;

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
    public void updatePrimeBooks(int loadedDirs, int totalDirs, int loadedTiles, int totalTiles) {
        activity.runOnUiThread(new JsBridgeUpdatePrimeBooks(activity, loadedDirs, totalDirs, loadedTiles, totalTiles));
    }

    @JavascriptInterface
    public void onWorldlineReflection(String data) {
        Log.d("TGE_Electron", "Worldline reflection: " + data);
    }

    @JavascriptInterface
    public void onPrimeGapEvent(String data) {
        Log.d("TGE_Electron", "Prime gap event: " + data);
    }

    @JavascriptInterface
    public void logRenderState(float x, float y, float z, float vx, float vy, float vz,
                               int reflections, int steps, int gapsCrossed, float zoom,
                               float berryPhase, float axionField) {
        SessionLogger.logRenderState(x, y, z, vx, vy, vz, reflections, steps, gapsCrossed, zoom, berryPhase, axionField);
    }

    @JavascriptInterface
    public void logRenderEvent(String event, String detail) {
        SessionLogger.logRenderEvent(event, detail);
    }

    @JavascriptInterface
    public void logButtonPress(String buttonId, String action) {
        SessionLogger.logButtonPress(buttonId, action);
    }

    @JavascriptInterface
    public void logUIEvent(String component, String action, String detail) {
        SessionLogger.logUIEvent(component, action, detail);
    }

    @JavascriptInterface
    public void logPrimeEvent(String event, int loaded, int total, int dirsLoaded) {
        SessionLogger.logPrimeEvent(event, loaded, total, dirsLoaded);
    }

    @JavascriptInterface
    public void saveFile(String filePath, byte[] data) {
        try {
            java.io.File file = new java.io.File(filePath);
            file.getParentFile().mkdirs();
            try (FileOutputStream fos = new FileOutputStream(file)) {
                fos.write(data);
            }
            SessionLogger.log("FILE_SAVE", "TardigradiaApps", filePath + " size=" + data.length + " ok=true");
        } catch (IOException e) {
            Log.e("TGE_Electron", "Failed to save file: " + filePath, e);
            SessionLogger.log("FILE_SAVE", "TardigradiaApps", filePath + " err=" + e.getMessage());
        }
    }
}
