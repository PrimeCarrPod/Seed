package com.tgapp.electron.v3;
import android.widget.Toast;

public class JsBridgeOnReady implements Runnable {
    private MainActivity activity;
    public JsBridgeOnReady(MainActivity activity) { this.activity = activity; }
    @Override
    public void run() {
        Toast.makeText(activity, "TGE Electron — Prime Electron Worldline Active", Toast.LENGTH_SHORT).show();
    }
}
