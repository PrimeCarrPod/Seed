package com.tgapp.electron.v3;
import android.view.View;

public class LogClickListener implements View.OnClickListener {
    private MainActivity activity;
    public LogClickListener(MainActivity activity) { this.activity = activity; }
    @Override
    public void onClick(View v) { activity.showLogLocation(); }
}
