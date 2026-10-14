package com.tgapp.electron.v3;

public class InsetsRunnable implements Runnable {
    private MainActivity activity;
    private int sbh;
    public InsetsRunnable(MainActivity activity, int sbh) {
        this.activity = activity;
        this.sbh = sbh;
    }
    @Override
    public void run() {
        activity.injectJs("TGE.setInsets(" + sbh + ",0)");
    }
}
