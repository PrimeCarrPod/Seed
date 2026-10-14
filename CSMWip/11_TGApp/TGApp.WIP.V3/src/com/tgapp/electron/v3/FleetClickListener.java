package com.tgapp.electron.v3;
import android.view.View;

public class FleetClickListener implements View.OnClickListener {
    private MainActivity activity;
    public FleetClickListener(MainActivity activity) { this.activity = activity; }
    @Override
    public void onClick(View v) { activity.injectJs("TGE.toggleFleet()"); }
}
