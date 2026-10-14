package com.tgapp.electron;

public class JsBridgeSetTheory implements Runnable {
    private MainActivity activity;
    private boolean enabled;
    public JsBridgeSetTheory(MainActivity activity, boolean enabled) { this.activity = activity; this.enabled = enabled; }
    @Override
    public void run() {
        String mode = enabled ? "THEORY" : "LIVE";
        activity.tagTextView.setText("Prime Electron Worldline · v1.0.0 · " + mode);
    }
}
