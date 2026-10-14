package com.csmlabs.bounce;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.util.AttributeSet;
import android.view.MotionEvent;
import android.view.SurfaceHolder;
import android.view.SurfaceView;

public class GameView extends SurfaceView implements SurfaceHolder.Callback, Runnable {

    private Thread gameThread;
    private volatile boolean running;
    private volatile boolean gameOver;

    private final Paint ballPaint = new Paint();
    private final Paint paddlePaint = new Paint();
    private final Paint textPaint = new Paint();

    private float ballX, ballY;
    private float ballRadius;
    private float ballVelX, ballVelY;
    private float paddleX, paddleY, paddleWidth, paddleHeight;
    private float screenWidth, screenHeight;
    private int score;

    private ScoreListener scoreListener;
    private GameOverListener gameOverListener;

    public interface ScoreListener { void onScore(int score); }
    public interface GameOverListener { void onGameOver(); }

    public void setScoreListener(ScoreListener l) { scoreListener = l; }
    public void setGameOverListener(GameOverListener l) { gameOverListener = l; }

    public GameView(Context context) { super(context); init(); }
    public GameView(Context context, AttributeSet attrs) { super(context, attrs); init(); }
    public GameView(Context context, AttributeSet attrs, int defStyleAttr) { super(context, attrs, defStyleAttr); init(); }

    private void init() {
        getHolder().addCallback(this);
        setFocusable(true);

        ballPaint.setColor(getResources().getColor(R.color.ball_color));
        ballPaint.setAntiAlias(true);
        paddlePaint.setColor(getResources().getColor(R.color.paddle_color));
        paddlePaint.setAntiAlias(true);
        textPaint.setColor(getResources().getColor(R.color.text_color));
        textPaint.setTextSize(48);
        textPaint.setAntiAlias(true);
    }

    @Override
    public void surfaceCreated(SurfaceHolder holder) {
        screenWidth = getWidth();
        screenHeight = getHeight();
        resetGame();
        startGame();
    }

    @Override
    public void surfaceChanged(SurfaceHolder holder, int format, int width, int height) {
        screenWidth = width;
        screenHeight = height;
    }

    @Override
    public void surfaceDestroyed(SurfaceHolder holder) {
        stopGame();
    }

    @Override
    public boolean onTouchEvent(MotionEvent event) {
        if (event.getAction() == MotionEvent.ACTION_MOVE || event.getAction() == MotionEvent.ACTION_DOWN) {
            float touchX = event.getX();
            paddleX = touchX - paddleWidth / 2;
            paddleX = Math.max(0, Math.min(screenWidth - paddleWidth, paddleX));
        }
        return true;
    }

    public void resume() {
        if (!running && gameThread == null) {
            startGame();
        }
    }

    public void pause() {
        stopGame();
    }

    public void restart() {
        resetGame();
        if (!running) startGame();
    }

    public boolean isGameOver() { return gameOver; }

    private void startGame() {
        running = true;
        gameThread = new Thread(this);
        gameThread.start();
    }

    private void stopGame() {
        running = false;
        if (gameThread != null) {
            try { gameThread.join(); } catch (InterruptedException ignored) {}
            gameThread = null;
        }
    }

    private void resetGame() {
        ballRadius = Math.min(screenWidth, screenHeight) * 0.025f;
        ballX = screenWidth / 2f;
        ballY = screenHeight * 0.3f;
        ballVelX = screenWidth * 0.0015f;
        ballVelY = screenHeight * 0.002f;

        paddleWidth = screenWidth * 0.25f;
        paddleHeight = screenHeight * 0.015f;
        paddleX = (screenWidth - paddleWidth) / 2f;
        paddleY = screenHeight * 0.9f;

        score = 0;
        gameOver = false;
        if (scoreListener != null) scoreListener.onScore(score);
    }

    @Override
    public void run() {
        long lastTime = System.nanoTime();
        final double nsPerFrame = 1_000_000_000.0 / 60.0;

        while (running) {
            long now = System.nanoTime();
            double delta = (now - lastTime) / nsPerFrame;
            lastTime = now;

            update(delta);
            draw();

            long frameTime = System.nanoTime() - now;
            long sleepTime = (long) (nsPerFrame - frameTime);
            if (sleepTime > 0) {
                try { Thread.sleep(sleepTime / 1_000_000); } catch (InterruptedException ignored) {}
            }
        }
    }

    private void update(double delta) {
        if (gameOver) return;

        ballX += ballVelX * delta;
        ballY += ballVelY * delta;

        if (ballX - ballRadius <= 0 || ballX + ballRadius >= screenWidth) {
            ballVelX = -ballVelX;
            ballX = Math.max(ballRadius, Math.min(screenWidth - ballRadius, ballX));
        }
        if (ballY - ballRadius <= 0) {
            ballVelY = -ballVelY;
            ballY = ballRadius;
        }

        if (ballY + ballRadius >= paddleY &&
            ballX >= paddleX && ballX <= paddleX + paddleWidth &&
            ballVelY > 0) {
            ballVelY = -Math.abs(ballVelY);
            ballY = paddleY - ballRadius;
            float hitPos = (ballX - paddleX) / paddleWidth - 0.5f;
            ballVelX += hitPos * screenWidth * 0.003f;
            score++;
            if (scoreListener != null) scoreListener.onScore(score);
        }

        if (ballY - ballRadius > screenHeight) {
            gameOver = true;
            running = false;
            if (gameOverListener != null) gameOverListener.onGameOver();
        }
    }

    private void draw() {
        if (getHolder().getSurface().isValid()) {
            Canvas canvas = getHolder().lockCanvas();
            if (canvas != null) {
                canvas.drawColor(Color.WHITE);
                canvas.drawCircle(ballX, ballY, ballRadius, ballPaint);
                canvas.drawRect(paddleX, paddleY, paddleX + paddleWidth, paddleY + paddleHeight, paddlePaint);

                if (gameOver) {
                    String msg = "Game Over\nScore: " + score + "\nTap to restart";
                    float textWidth = textPaint.measureText("Game Over");
                    canvas.drawText(msg, (screenWidth - textWidth) / 2f, screenHeight / 2f, textPaint);
                }

                getHolder().unlockCanvasAndPost(canvas);
            }
        }
    }
}
