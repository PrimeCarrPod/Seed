package com.tgapp.electron.v3;
import android.view.View;

public class TheoryClickListener implements View.OnClickListener {
    private MainActivity activity;
    public TheoryClickListener(MainActivity activity) { this.activity = activity; }
    @Override
    public void onClick(View v) { activity.toggleTheory(); }
}
