package com.tgapp.electron.v3;
import android.view.View;

public class ZoomOutClickListener implements View.OnClickListener {
    private MainActivity activity;
    public ZoomOutClickListener(MainActivity activity) { this.activity = activity; }
    @Override
    public void onClick(View v) { activity.injectJs("TGE.zoomOut()"); }
}