package com.tgapp.electron.v3;
import android.view.View;

public class ZoomInClickListener implements View.OnClickListener {
    private MainActivity activity;
    public ZoomInClickListener(MainActivity activity) { this.activity = activity; }
    @Override
    public void onClick(View v) { activity.injectJs("TGE.zoomIn()"); }
}