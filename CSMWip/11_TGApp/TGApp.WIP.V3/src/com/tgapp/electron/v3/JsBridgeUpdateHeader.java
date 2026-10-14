package com.tgapp.electron.v3;

public class JsBridgeUpdateHeader implements Runnable {
    private MainActivity activity;
    private String text;
    public JsBridgeUpdateHeader(MainActivity activity, String text) { this.activity = activity; this.text = text; }
    @Override
    public void run() { activity.tagTextView.setText(text); }
}
