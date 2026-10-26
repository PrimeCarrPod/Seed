package com.csmlabs.voicedictation;

import android.app.Service;
import android.content.Intent;
import android.os.Binder;
import android.os.IBinder;
import android.speech.RecognitionListener;
import android.speech.RecognizerIntent;
import android.speech.SpeechRecognizer;
import android.util.Log;

import java.util.ArrayList;
import java.util.Locale;

public class VoiceRecognitionService extends Service {
    private static final String TAG = "VoiceRecService";
    
    private SpeechRecognizer speechRecognizer;
    private RecognitionListener recognitionListener;
    private boolean isListening = false;
    
    public interface VoiceCallback {
        void onPartialResult(String text);
        void onFinalResult(String text);
        void onError(int errorCode);
        void onListeningStarted();
        void onListeningStopped();
    }
    
    private VoiceCallback callback;
    
    public void setCallback(VoiceCallback callback) {
        this.callback = callback;
    }
    
    @Override
    public void onCreate() {
        super.onCreate();
        initSpeechRecognizer();
    }
    
    private void initSpeechRecognizer() {
        if (SpeechRecognizer.isRecognitionAvailable(this)) {
            speechRecognizer = SpeechRecognizer.createSpeechRecognizer(this);
            speechRecognizer.setRecognitionListener(new RecognitionListener() {
                @Override
                public void onReadyForSpeech(Bundle params) {
                    Log.d(TAG, "Ready for speech");
                    if (callback != null) callback.onListeningStarted();
                }
                
                @Override
                public void onBeginningOfSpeech() {
                    Log.d(TAG, "Beginning of speech");
                }
                
                @Override
                public void onRmsChanged(float rmsdB) {
                    // Volume level
                }
                
                @Override
                public void onBufferReceived(byte[] buffer) {}
                
                @Override
                public void onEndOfSpeech() {
                    Log.d(TAG, "End of speech");
                }
                
                @Override
                public void onError(int error) {
                    Log.e(TAG, "SpeechRecognizer error: " + error);
                    isListening = false;
                    if (callback != null) callback.onError(error);
                }
                
                @Override
                public void onResults(Bundle results) {
                    ArrayList<String> matches = results.getStringArrayList(SpeechRecognizer.RESULTS_RECOGNITION);
                    if (matches != null && !matches.isEmpty()) {
                        String text = matches.get(0);
                        Log.d(TAG, "Final result: " + text);
                        if (callback != null) callback.onFinalResult(text);
                    }
                }
                
                @Override
                public void onPartialResults(Bundle partialResults) {
                    ArrayList<String> matches = partialResults.getStringArrayList(SpeechRecognizer.RESULTS_RECOGNITION);
                    if (matches != null && !matches.isEmpty()) {
                        String text = matches.get(0);
                        Log.d(TAG, "Partial result: " + text);
                        if (callback != null) callback.onPartialResult(text);
                    }
                }
                
                @Override
                public void onEvent(int eventType, Bundle params) {}
            });
        } else {
            Log.e(TAG, "SpeechRecognizer not available");
        }
    }
    
    public void startListening() {
        if (speechRecognizer == null || isListening) return;
        
        Intent intent = new Intent(RecognizerIntent.ACTION_RECOGNIZE_SPEECH);
        intent.putExtra(RecognizerIntent.EXTRA_LANGUAGE_MODEL, RecognizerIntent.LANGUAGE_MODEL_FREE_FORM);
        intent.putExtra(RecognizerIntent.EXTRA_LANGUAGE, Locale.getDefault());
        intent.putExtra(RecognizerIntent.EXTRA_PARTIAL_RESULTS, true);
        intent.putExtra(RecognizerIntent.EXTRA_MAX_RESULTS, 1);
        
        try {
            isListening = true;
            speechRecognizer.startListening(intent);
        } catch (Exception e) {
            Log.e(TAG, "Failed to start listening", e);
            isListening = false;
            if (callback != null) callback.onError(-1);
        }
    }
    
    public void stopListening() {
        if (speechRecognizer != null && isListening) {
            isListening = false;
            speechRecognizer.stopListening();
            if (callback != null) callback.onListeningStopped();
        }
    }
    
    public boolean isListening() {
        return isListening;
    }
    
    @Override
    public void onDestroy() {
        if (speechRecognizer != null) {
            speechRecognizer.destroy();
            speechRecognizer = null;
        }
        super.onDestroy();
    }
    
    @Override
    public IBinder onBind(Intent intent) {
        return new LocalBinder();
    }
    
    public class LocalBinder extends Binder {
        public VoiceRecognitionService getService() {
            return VoiceRecognitionService.this;
        }
    }
}