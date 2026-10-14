package com.tgapp.electron.v3;

public class WorldlineSimulationRunnable implements Runnable {
    private MainActivity activity;
    public WorldlineSimulationRunnable(MainActivity activity) { this.activity = activity; }
    @Override
    public void run() {
        activity.injectJs("WorldlineRenderer.step()");
        activity.scanHandler.postDelayed(this, 16);
    }
}
