package com.csmlabs.bounce;

import android.widget.TextView;

public class ScoreUpdater implements Runnable {
    private MainActivity activity;
    private int score;

    public ScoreUpdater(MainActivity activity, int score) {
        this.activity = activity;
        this.score = score;
    }

    @Override
    public void run() {
        activity.updateScore(score);
    }
}
