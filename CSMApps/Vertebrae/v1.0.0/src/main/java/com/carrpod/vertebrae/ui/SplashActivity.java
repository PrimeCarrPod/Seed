package com.carrpod.vertebrae.ui;

import android.app.Activity;
import android.content.Intent;
import android.os.Build;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.provider.Settings;
import android.widget.TextView;

import com.carrpod.vertebrae.R;

public class SplashActivity extends Activity {

    private static final int OVERLAY_PERMISSION_REQUEST = 1001;
    private boolean permissionRequested = false;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_splash);

        TextView tvStatus = findViewById(R.id.tv_splash_status);
        tvStatus.setText("Initializing Vertebrae...");

        new Handler(Looper.getMainLooper()).postDelayed(this::checkAndProceed, 500);
    }

    private void checkAndProceed() {
        // Check overlay permission
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M && !Settings.canDrawOverlays(this)) {
            if (!permissionRequested) {
                permissionRequested = true;
                TextView tvStatus = findViewById(R.id.tv_splash_status);
                tvStatus.setText("Overlay permission needed for floating windows");
                
                Intent intent = new Intent(Settings.ACTION_MANAGE_OVERLAY_PERMISSION,
                        android.net.Uri.parse("package:" + getPackageName()));
                startActivityForResult(intent, OVERLAY_PERMISSION_REQUEST);
                return;
            }
        }

        // Start core services from MainActivity context
        startServicesThenMain();
    }

    @Override
    protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        super.onActivityResult(requestCode, resultCode, data);
        if (requestCode == OVERLAY_PERMISSION_REQUEST) {
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M && Settings.canDrawOverlays(this)) {
                TextView tvStatus = findViewById(R.id.tv_splash_status);
                tvStatus.setText("Permission granted. Starting...");
                new Handler(Looper.getMainLooper()).postDelayed(this::startServicesThenMain, 500);
            } else {
                TextView tvStatus = findViewById(R.id.tv_splash_status);
                tvStatus.setText("Overlay permission required. Retrying...");
                new Handler(Looper.getMainLooper()).postDelayed(this::checkAndProceed, 1000);
            }
        }
    }

    @Override
    protected void onResume() {
        super.onResume();
        if (!permissionRequested) {
            checkAndProceed();
        }
    }

    private void startServicesThenMain() {
        // Start services
        Intent[] services = {
            new Intent(this, com.carrpod.vertebrae.service.SessionManagerService.class),
            new Intent(this, com.carrpod.vertebrae.service.HeartbeatService.class),
            new Intent(this, com.carrpod.vertebrae.service.FloatingWindowService.class),
            new Intent(this, com.carrpod.vertebrae.comm.InterSessionServer.class)
        };

        for (Intent service : services) {
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
                startForegroundService(service);
            } else {
                startService(service);
            }
        }

        // Launch MainActivity
        Intent mainIntent = new Intent(this, MainActivity.class);
        mainIntent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK | Intent.FLAG_ACTIVITY_CLEAR_TASK);
        startActivity(mainIntent);
        finish();
    }
}