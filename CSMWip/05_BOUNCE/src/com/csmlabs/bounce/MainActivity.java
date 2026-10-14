package com.csmlabs.bounce;

import android.app.Activity;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.view.View;
import android.widget.TextView;

public class MainActivity extends Activity
        implements GameView.ScoreListener, GameView.GameOverListener, View.OnClickListener {

    private GameView gameView;
    private TextView scoreText;
    private TextView overlayText;
    private Handler uiHandler;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        uiHandler = new Handler(Looper.getMainLooper());

        gameView = findViewById(R.id.game_view);
        scoreText = findViewById(R.id.score_text);
        overlayText = findViewById(R.id.overlay_text);

        gameView.setScoreListener(this);
        gameView.setGameOverListener(this);
        gameView.setOnClickListener(this);
    }

    @Override
    public void onScore(final int score) {
        uiHandler.post(new ScoreUpdater(this, score));
    }

    @Override
    public void onGameOver() {
        uiHandler.post(new GameOverUpdater(this));
    }

    public void updateScore(int score) {
        scoreText.setText(getString(R.string.score_prefix) + score);
    }

    public void updateGameOver() {
        overlayText.setText(getString(R.string.game_over) + "\n" + getString(R.string.tap_to_restart));
        overlayText.setVisibility(View.VISIBLE);
    }

    @Override
    public void onClick(View v) {
        if (gameView.isGameOver()) {
            overlayText.setVisibility(View.GONE);
            gameView.restart();
        }
    }

    @Override
    protected void onResume() {
        super.onResume();
        gameView.resume();
    }

    @Override
    protected void onPause() {
        super.onPause();
        gameView.pause();
    }
}
