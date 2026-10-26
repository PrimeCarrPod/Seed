package com.csmlabs.voicedictation;

import android.Manifest;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.ServiceConnection;
import android.content.pm.PackageManager;
import android.os.Build;
import android.os.Bundle;
import android.os.IBinder;
import android.text.TextUtils;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;
import androidx.core.app.ActivityCompat;
import androidx.core.content.ContextCompat;

public class MainActivity extends AppCompatActivity {
    private static final String TAG = "MainActivity";
    private static final int REQ_MIC_PERMISSION = 1001;
    
    private EditText etServerIp, etServerPort;
    private Button btnConnect, btnListen;
    private TextView tvStatus, tvRecognized;
    
    private WebSocketClient wsClient;
    private VoiceRecognitionService voiceService;
    private boolean isBound = false;
    private boolean isConnected = false;
    private boolean isListening = false;
    
    private final ServiceConnection serviceConnection = new ServiceConnection() {
        @Override
        public void onServiceConnected(ComponentName name, IBinder service) {
            VoiceRecognitionService.LocalBinder binder = (VoiceRecognitionService.LocalBinder) service;
            voiceService = binder.getService();
            voiceService.setCallback(new VoiceRecognitionService.VoiceCallback() {
                @Override
                public void onPartialResult(String text) {
                    runOnUiThread(() -> tvRecognized.setText(getString(R.string.text_recognized, text + "…")));
                }
                
                @Override
                public void onFinalResult(String text) {
                    runOnUiThread(() -> {
                        tvRecognized.setText(getString(R.string.text_recognized, text));
                        if (wsClient != null && isConnected) {
                            wsClient.sendText(text);
                        }
                    });
                }
                
                @Override
                public void onError(int errorCode) {
                    runOnUiThread(() -> {
                        String msg = "Speech error: " + errorCode;
                        tvStatus.setText(msg);
                        tvStatus.setTextColor(0xFFFF0000);
                        stopListeningInternal();
                    });
                }
                
                @Override
                public void onListeningStarted() {
                    runOnUiThread(() -> {
                        isListening = true;
                        updateListenButton();
                        tvStatus.setText(R.string.status_listening);
                        tvStatus.setTextColor(0xFF00AA00);
                    });
                }
                
                @Override
                public void onListeningStopped() {
                    runOnUiThread(() -> {
                        isListening = false;
                        updateListenButton();
                        if (isConnected) {
                            tvStatus.setText(R.string.status_connected);
                            tvStatus.setTextColor(0xFF0000AA);
                        }
                    });
                }
            });
            isBound = true;
        }
        
        @Override
        public void onServiceDisconnected(ComponentName name) {
            voiceService = null;
            isBound = false;
        }
    };
    
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        
        etServerIp = findViewById(R.id.etServerIp);
        etServerPort = findViewById(R.id.etServerPort);
        btnConnect = findViewById(R.id.btnConnect);
        btnListen = findViewById(R.id.btnListen);
        tvStatus = findViewById(R.id.tvStatus);
        tvRecognized = findViewById(R.id.tvRecognized);
        
        btnConnect.setOnClickListener(v -> toggleConnection());
        btnListen.setOnClickListener(v -> toggleListening());
        
        initWebSocketClient();
        bindVoiceService();
        checkMicPermission();
    }
    
    private void initWebSocketClient() {
        wsClient = new WebSocketClient(new WebSocketClient.Listener() {
            @Override
            public void onConnected() {
                runOnUiThread(() -> {
                    isConnected = true;
                    updateConnectButton();
                    btnListen.setEnabled(true);
                    tvStatus.setText(R.string.status_connected);
                    tvStatus.setTextColor(0xFF0000AA);
                    Toast.makeText(MainActivity.this, "Connected to server", Toast.LENGTH_SHORT).show();
                });
            }
            
            @Override
            public void onDisconnected(int code, String reason) {
                runOnUiThread(() -> {
                    isConnected = false;
                    updateConnectButton();
                    btnListen.setEnabled(false);
                    stopListeningInternal();
                    tvStatus.setText(R.string.status_disconnected);
                    tvStatus.setTextColor(0xFF000000);
                    Toast.makeText(MainActivity.this, "Disconnected: " + reason, Toast.LENGTH_LONG).show();
                });
            }
            
            @Override
            public void onError(Exception e) {
                runOnUiThread(() -> {
                    tvStatus.setText(R.string.status_error);
                    tvStatus.setTextColor(0xFFFF0000);
                    Toast.makeText(MainActivity.this, "WS Error: " + e.getMessage(), Toast.LENGTH_LONG).show();
                });
            }
            
            @Override
            public void onMessageReceived(String text) {
                // Server echo or commands - ignore for now
            }
        });
    }
    
    private void bindVoiceService() {
        Intent intent = new Intent(this, VoiceRecognitionService.class);
        bindService(intent, serviceConnection, Context.BIND_AUTO_CREATE);
    }
    
    private void checkMicPermission() {
        if (ContextCompat.checkSelfPermission(this, Manifest.permission.RECORD_AUDIO) != PackageManager.PERMISSION_GRANTED) {
            ActivityCompat.requestPermissions(this, new String[]{Manifest.permission.RECORD_AUDIO}, REQ_MIC_PERMISSION);
        }
    }
    
    @Override
    public void onRequestPermissionsResult(int requestCode, @NonNull String[] permissions, @NonNull int[] grantResults) {
        super.onRequestPermissionsResult(requestCode, permissions, grantResults);
        if (requestCode == REQ_MIC_PERMISSION) {
            if (grantResults.length > 0 && grantResults[0] == PackageManager.PERMISSION_GRANTED) {
                Toast.makeText(this, "Microphone permission granted", Toast.LENGTH_SHORT).show();
            } else {
                Toast.makeText(this, "Microphone permission required", Toast.LENGTH_LONG).show();
            }
        }
    }
    
    private void toggleConnection() {
        if (isConnected) {
            disconnect();
        } else {
            connect();
        }
    }
    
    private void connect() {
        String host = etServerIp.getText().toString().trim();
        String portStr = etServerPort.getText().toString().trim();
        
        if (TextUtils.isEmpty(host)) {
            Toast.makeText(this, "Enter server IP", Toast.LENGTH_SHORT).show();
            return;
        }
        
        int port = TextUtils.isEmpty(portStr) ? Config.DEFAULT_SERVER_PORT : Integer.parseInt(portStr);
        
        btnConnect.setEnabled(false);
        tvStatus.setText(R.string.status_connecting);
        tvStatus.setTextColor(0xFFCC6600);
        
        wsClient.connect(host, port);
    }
    
    private void disconnect() {
        wsClient.disconnect();
    }
    
    private void toggleListening() {
        if (isListening) {
            stopListeningInternal();
        } else {
            startListeningInternal();
        }
    }
    
    private void startListeningInternal() {
        if (voiceService != null && isBound && isConnected) {
            if (ContextCompat.checkSelfPermission(this, Manifest.permission.RECORD_AUDIO) == PackageManager.PERMISSION_GRANTED) {
                voiceService.startListening();
            } else {
                checkMicPermission();
            }
        }
    }
    
    private void stopListeningInternal() {
        if (voiceService != null && isBound) {
            voiceService.stopListening();
        }
    }
    
    private void updateConnectButton() {
        btnConnect.setText(isConnected ? R.string.btn_disconnect : R.string.btn_connect);
        btnConnect.setEnabled(true);
        etServerIp.setEnabled(!isConnected);
        etServerPort.setEnabled(!isConnected);
    }
    
    private void updateListenButton() {
        btnListen.setText(isListening ? R.string.btn_stop_listening : R.string.btn_start_listening);
    }
    
    @Override
    protected void onDestroy() {
        if (isBound) {
            unbindService(serviceConnection);
            isBound = false;
        }
        if (wsClient != null) {
            wsClient.disconnect();
        }
        super.onDestroy();
    }
}