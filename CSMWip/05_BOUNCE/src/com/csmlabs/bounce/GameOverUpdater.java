package com.csmlabs.bounce;

import android.widget.TextView;

public class GameOverUpdater implements Runnable {
    private MainActivity activity;

    public GameOverUpdater(MainActivity activity) {
        this.activity = activity;
    }

    @Override
    public void run() {
        activity.updateGameOver();
    }
}
