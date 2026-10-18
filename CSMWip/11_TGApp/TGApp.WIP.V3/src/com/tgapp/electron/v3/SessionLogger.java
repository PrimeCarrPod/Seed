package com.tgapp.electron.v3;

import android.content.Context;
import android.os.Environment;
import android.util.Log;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;
import java.util.concurrent.atomic.AtomicLong;

public class SessionLogger {
    private static final String TAG = "SessionLogger";
    private static final long MAX_LOG_SIZE = 2 * 1024 * 1024; // 2MB
    private static final int RENDER_LOG_INTERVAL_MS = 5000; // Log 3D state every 5 seconds
    
    private static BufferedWriter logWriter;
    private static File currentLogFile;
    private static File logDir;
    private static final SimpleDateFormat TIMESTAMP = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS", Locale.US);
    private static final SimpleDateFormat FILE_DATE = new SimpleDateFormat("yyyyMMdd_HHmmss", Locale.US);
    private static boolean initialized = false;
    private static final AtomicLong bytesWritten = new AtomicLong(0);
    private static long lastRenderLogTime = 0;
    private static int sessionCounter = 0;
    
    // Compact event codes
    public static final String EVT_DL_START = "DL_START";
    public static final String EVT_DL_PROGRESS = "DL_PROG";
    public static final String EVT_DL_EXTRACT = "DL_EXT";
    public static final String EVT_DL_VERIFY = "DL_VER";
    public static final String EVT_DL_COMPLETE = "DL_OK";
    public static final String EVT_DL_ERROR = "DL_ERR";
    public static final String EVT_BTN = "BTN";
    public static final String EVT_UI = "UI";
    public static final String EVT_RENDER = "RND";
    public static final String EVT_SESSION = "SESS";
    public static final String EVT_LIFECYCLE = "LIFE";
    public static final String EVT_PRIME = "PRIME";
    
    public static synchronized void init(Context context) {
        if (initialized) return;
        
        try {
            File appExternalDir = context.getExternalFilesDir(Environment.DIRECTORY_DOWNLOADS);
            if (appExternalDir == null) appExternalDir = context.getExternalFilesDir(null);
            if (appExternalDir == null) appExternalDir = context.getFilesDir();
            
            logDir = new File(appExternalDir, "logs");
            if (!logDir.exists()) logDir.mkdirs();
            
            rotateLog();
            initialized = true;
            
            log(EVT_SESSION, "START", "version=3.0.22 pkg=com.tgapp.electron.v3");
            log(EVT_LIFECYCLE, "onCreate", "");
            
        } catch (Exception e) {
            Log.e(TAG, "Failed to initialize SessionLogger", e);
        }
    }
    
    private static void rotateLog() throws IOException {
        if (logWriter != null) {
            logWriter.write(format(EVT_SESSION, "END", "bytes=" + bytesWritten.get()));
            logWriter.flush();
            logWriter.close();
        }
        
        sessionCounter++;
        String fname = "tge_session_" + FILE_DATE.format(new Date()) + "_" + sessionCounter + ".txt";
        currentLogFile = new File(logDir, fname);
        
        logWriter = new BufferedWriter(new FileWriter(currentLogFile, true));
        bytesWritten.set(0);
    }
    
    private static void checkRotation() {
        if (bytesWritten.get() >= MAX_LOG_SIZE) {
            try {
                rotateLog();
            } catch (IOException e) {
                Log.e(TAG, "Log rotation failed", e);
            }
        }
    }
    
    private static String format(String event, String action, String data) {
        String ts = TIMESTAMP.format(new Date());
        String line = ts + "|" + event + "|" + action;
        if (data != null && !data.isEmpty()) line += "|" + data;
        return line + "\n";
    }
    
    private static void writeLine(String line) {
        try {
            if (logWriter != null) {
                logWriter.write(line);
                logWriter.flush();
                bytesWritten.addAndGet(line.length());
                checkRotation();
            }
        } catch (IOException ignored) {}
    }
    
    // Download logging
    public static void logDownloadStart(String dir, int startTile, int endTile, int totalTiles) {
        writeLine(format(EVT_DL_START, dir, "start=" + startTile + " end=" + endTile + " total=" + totalTiles));
    }
    
    public static void logDownloadProgress(String dir, int currentTile, int completed, int total, int speedKbps) {
        writeLine(format(EVT_DL_PROGRESS, dir, "tile=" + currentTile + " done=" + completed + "/" + total + " kbps=" + speedKbps));
    }
    
    public static void logDownloadExtract(String dir, String tileName, long gzSize, long extractedSize, boolean ok) {
        writeLine(format(EVT_DL_EXTRACT, dir, tileName + " gz=" + gzSize + " out=" + extractedSize + " ok=" + ok));
    }
    
    public static void logDownloadVerify(String dir, String tileName, long fileSize, boolean exists, boolean valid) {
        writeLine(format(EVT_DL_VERIFY, dir, tileName + " size=" + fileSize + " exists=" + exists + " valid=" + valid));
    }
    
    public static void logDownloadComplete(String dir, int completed, int total, long durationMs) {
        writeLine(format(EVT_DL_COMPLETE, dir, "done=" + completed + "/" + total + " dur_ms=" + durationMs));
    }
    
    public static void logDownloadError(String dir, String tileName, String error) {
        writeLine(format(EVT_DL_ERROR, dir, tileName + " err=" + error));
    }
    
    // Button/UI logging
    public static void logButtonPress(String buttonId, String action) {
        writeLine(format(EVT_BTN, buttonId, action));
    }
    
    public static void logUIEvent(String component, String action, String detail) {
        writeLine(format(EVT_UI, component, action + (detail != null ? "|" + detail : "")));
    }
    
    // 3D render state logging (compressed)
    public static void logRenderState(float x, float y, float z, float vx, float vy, float vz, 
                                       int reflections, int steps, int gapsCrossed, float zoom, 
                                       float berryPhase, float axionField) {
        long now = System.currentTimeMillis();
        if (now - lastRenderLogTime < RENDER_LOG_INTERVAL_MS) return;
        lastRenderLogTime = now;
        
        // Compressed: pos(x,y,z) vel(vx,vy,vz) ref steps gaps zoom berry axion
        String data = String.format(Locale.US, 
            "p(%.1f,%.1f,%.1f) v(%.2f,%.2f,%.2f) ref=%d stp=%d gap=%d zm=%.1f br=%.2f ax=%.2f",
            x, y, z, vx, vy, vz, reflections, steps, gapsCrossed, zoom, berryPhase, axionField);
        writeLine(format(EVT_RENDER, "state", data));
    }
    
    public static void logRenderEvent(String event, String detail) {
        writeLine(format(EVT_RENDER, event, detail));
    }
    
    // Lifecycle
    public static void logLifecycle(String method) {
        writeLine(format(EVT_LIFECYCLE, method, ""));
    }
    
    // Prime data
    public static void logPrimeEvent(String event, int loaded, int total, int dirsLoaded) {
        writeLine(format(EVT_PRIME, event, "loaded=" + loaded + " total=" + total + " dirs=" + dirsLoaded));
    }
    
    // Generic
    public static void log(String event, String action, String data) {
        writeLine(format(event, action, data));
    }
    
    public static void logInfo(String tag, String message) {
        writeLine(format(EVT_SESSION, "INFO", tag + ":" + message));
        Log.d(TAG, tag + ": " + message);
    }
    
    public static void logError(String tag, String message) {
        writeLine(format(EVT_SESSION, "ERROR", tag + ":" + message));
        Log.e(TAG, tag + ": " + message);
    }
    
    public static String getLogDir() {
        return logDir != null ? logDir.getAbsolutePath() : "unknown";
    }
    
    public static String getCurrentLogFile() {
        return currentLogFile != null ? currentLogFile.getAbsolutePath() : "unknown";
    }
    
    public static synchronized void close() {
        try {
            if (logWriter != null) {
                writeLine(format(EVT_SESSION, "END", "bytes=" + bytesWritten.get()));
                logWriter.flush();
                logWriter.close();
                logWriter = null;
            }
        } catch (IOException ignored) {}
    }
}