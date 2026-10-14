package com.csmlabs.bounce;

import android.os.Bundle;
import android.view.View;
import android.widget.TextView;
import androidx.appcompat.app.AppCompatActivity;

public class MainActivity extends AppCompatActivity {

    private GameView gameView;
    private TextView scoreText;
    private TextView overlayText;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        gameView = findViewById(R.id.game_view);
        scoreText = findViewById(R.id.score_text);
        overlayText = findViewById(R.id.overlay_text);

        gameView.setScoreListener(score -> {
            runOnUiThread(() -> scoreText.setText(getString(R.string.score_prefix) + score));
        });

        gameView.setGameOverListener(() -> {
            runOnUiThread(() -> {
                overlayText.setText(getString(R.string.game_over) + "\n" + getString(R.string.tap_to_restart));
                overlayText.setVisibility(View.VISIBLE);
            });
        });

        gameView.setOnClickListener(v -> {
            if (gameView.isGameOver()) {
                overlayText.setVisibility(View.GONE);
                gameView.restart();
            }
        });
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