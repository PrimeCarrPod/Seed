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
    private int serviceStartIndex = 0;
    private final String[] serviceNames = {
        "com.carrpod.vertebrae.service.SessionManagerService",
        "com.carrpod.vertebrae.service.HeartbeatService",
        "com.carrpod.vertebrae.service.FloatingWindowService",
        "com.carrpod.vertebrae.comm.InterSessionServer"
    };
    private final Handler handler = new Handler(Looper.getMainLooper());

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_splash);

        TextView tvStatus = findViewById(R.id.tv_splash_status);
        tvStatus.setText("Initializing Vertebrae...");

        // First, check permission
        handler.postDelayed(this::checkOverlayPermission, 300);
    }

    private void checkOverlayPermission() {
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
        
        // Permission granted or not needed, start services sequentially
        startNextService();
    }

    @Override
    protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        super.onActivityResult(requestCode, resultCode, data);
        if (requestCode == OVERLAY_PERMISSION_REQUEST) {
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M && Settings.canDrawOverlays(this)) {
                TextView tvStatus = findViewById(R.id.tv_splash_status);
                tvStatus.setText("Permission granted. Starting services...");
                handler.postDelayed(this::startNextService, 500);
            } else {
                TextView tvStatus = findViewById(R.id.tv_splash_status);
                tvStatus.setText("Overlay permission required. Retrying in 2s...");
                handler.postDelayed(this::checkOverlayPermission, 2000);
            }
        }
    }

    @Override
    protected void onResume() {
        super.onResume();
        if (!permissionRequested) {
            handler.postDelayed(this::checkOverlayPermission, 300);
        }
    }

    private void startNextService() {
        if (serviceStartIndex < serviceNames.length) {
            String className = serviceNames[serviceStartIndex];
            TextView tvStatus = findViewById(R.id.tv_splash_status);
            String simpleName = className.substring(className.lastIndexOf('.') + 1);
            tvStatus.setText("Starting " + simpleName + "...");
            
            try {
                Class<?> clazz = Class.forName(className);
                Intent serviceIntent = new Intent(this, clazz);
                if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
                    startForegroundService(serviceIntent);
                } else {
                    startService(serviceIntent);
                }
            } catch (Exception e) {
                // Log but continue
                e.printStackTrace();
            }
            
            serviceStartIndex++;
            // Next service after delay
            handler.postDelayed(this::startNextService, 300);
        } else {
            // All services started, launch MainActivity
            handler.postDelayed(this::launchMainActivity, 500);
        }
    }

    private void launchMainActivity() {
        TextView tvStatus = findViewById(R.id.tv_splash_status);
        tvStatus.setText("Launching MainActivity...");
        
        try {
            Intent mainIntent = new Intent(this, MainActivity.class);
            mainIntent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK | Intent.FLAG_ACTIVITY_CLEAR_TASK);
            startActivity(mainIntent);
            finish();
        } catch (Exception e) {
            e.printStackTrace();
            tvStatus.setText("Error: " + e.getMessage());
        }
    }
}