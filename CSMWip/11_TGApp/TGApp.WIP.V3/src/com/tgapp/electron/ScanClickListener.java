package com.tgapp.electron;
import android.view.View;

public class ScanClickListener implements View.OnClickListener {
    private MainActivity activity;
    public ScanClickListener(MainActivity activity) { this.activity = activity; }
    @Override
    public void onClick(View v) { activity.injectJs("TGE.onScanPressed()"); }
}
