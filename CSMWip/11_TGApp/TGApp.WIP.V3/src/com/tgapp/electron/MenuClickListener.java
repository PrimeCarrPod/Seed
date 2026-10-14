package com.tgapp.electron;
import android.view.View;

public class MenuClickListener implements View.OnClickListener {
    private MainActivity activity;
    public MenuClickListener(MainActivity activity) { this.activity = activity; }
    @Override
    public void onClick(View v) { activity.toggleMenu(); }
}
