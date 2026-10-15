package com.tgapp.electron.v3;

public class JsBridgeUpdatePrimeBooks implements Runnable {
    private MainActivity activity;
    private int loadedDirs;
    private int totalDirs;
    private int loadedTiles;
    private int totalTiles;
    public JsBridgeUpdatePrimeBooks(MainActivity a, int ld, int td, int lt, int tt) { activity = a; loadedDirs = ld; totalDirs = td; loadedTiles = lt; totalTiles = tt; }
    @Override public void run() {
        if (activity.primeBooksTextView != null) {
            activity.primeBooksTextView.setText("Prime Books: " + loadedDirs + "/" + totalDirs + " loaded · " + loadedTiles + "/" + totalTiles + " tiles");
        }
    }
}