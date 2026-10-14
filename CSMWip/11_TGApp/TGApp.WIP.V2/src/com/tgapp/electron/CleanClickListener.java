package com.tgapp.electron;
import android.view.View;
import android.graphics.Color;

public class CleanClickListener implements View.OnClickListener {
    private MainActivity activity;
    public CleanClickListener(MainActivity activity) { this.activity = activity; }
    @Override
    public void onClick(View v) {
        activity.cleanMode = !activity.cleanMode;
        activity.cleanBtn.setText(activity.cleanMode ? "SHOW" : "CLEAN");
        activity.cleanBtn.setTextColor(Color.parseColor(activity.cleanMode ? "#FF4466" : "#FF6600"));
        activity.headerOverlay.setVisibility(activity.cleanMode ? View.GONE : View.VISIBLE);
        activity.saveState();
    }
}
