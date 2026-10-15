package com.tgapp.electron.v3;

public class PrimeCallbackTask implements Runnable {
    private MainActivity activity;
    private String method;
    private String data;
    PrimeCallbackTask(MainActivity a, String m, String d) { activity = a; method = m; data = d; }
    @Override public void run() { activity.injectJs("javascript:if(window.PrimeDataManager) PrimeDataManager." + method + "(" + data + ")"); }
}