package com.tgapp.electron;

import android.content.Context;
import android.os.Environment;
import android.util.Log;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

public class CrashLogger {
    private static final String TAG = "CrashLogger";
    private static BufferedWriter logWriter;
    private static File logFile;
    private static final SimpleDateFormat TIMESTAMP = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS", Locale.US);
    private static boolean crashed = false;
    private static boolean initialized = false;

    public static void init(Context context) {
        if (initialized) return;
        
        // IMMEDIATE fallback to internal storage - always works
        try {
            File internalDir = context.getFilesDir();
            File internalLog = new File(internalDir, "tge_electron_crash_log.txt");
            FileWriter fw = new FileWriter(internalLog, true);
            BufferedWriter bw = new BufferedWriter(fw);
            bw.write("\n\n=== SESSION START (INTERNAL FALLBACK): " + TIMESTAMP.format(new Date()) + " ===\n");
            bw.write("Package: com.tgapp.electron.v3\n");
            bw.write("Internal log: " + internalLog.getAbsolutePath() + "\n");
            bw.flush();
            bw.close();
            
            logFile = internalLog;
            logWriter = new BufferedWriter(new FileWriter(internalLog, true));
            initialized = true;
            log("CrashLogger.init() internal fallback ready: " + internalLog.getAbsolutePath());
        } catch (Exception e) {
            Log.e(TAG, "Internal fallback failed", e);
        }
        
        // THEN try external storage
        try {
            File appExternalDir = context.getExternalFilesDir(Environment.DIRECTORY_DOWNLOADS);
            if (appExternalDir == null) {
                appExternalDir = context.getExternalFilesDir(null);
            }
            
            if (appExternalDir != null && appExternalDir.canWrite()) {
                File externalLog = new File(appExternalDir, "tge_electron_crash_log.txt");
                FileWriter fw = new FileWriter(externalLog, true);
                BufferedWriter bw = new BufferedWriter(fw);
                bw.write("\n\n=== SESSION START (EXTERNAL): " + TIMESTAMP.format(new Date()) + " ===\n");
                bw.write("Package: com.tgapp.electron.v3\n");
                bw.write("External log: " + externalLog.getAbsolutePath() + "\n");
                bw.flush();
                bw.close();
                
                // Switch to external if internal was fallback
                if (logWriter != null) {
                    try { logWriter.close(); } catch (Exception ignored) {}
                }
                logFile = externalLog;
                logWriter = new BufferedWriter(new FileWriter(externalLog, true));
                log("CrashLogger.init() external ready: " + externalLog.getAbsolutePath());
            }
        } catch (Exception e) {
            log("External storage failed, using internal: " + e.getMessage());
        }
        
        // Set up uncaught exception handler
        Thread.setDefaultUncaughtExceptionHandler(new Thread.UncaughtExceptionHandler() {
            @Override
            public void uncaughtException(Thread thread, Throwable ex) {
                if (!crashed) {
                    crashed = true;
                    logCrash(ex);
                }
                try {
                    Thread.getDefaultUncaughtExceptionHandler().uncaughtException(thread, ex);
                } catch (Exception ignored) {}
            }
        });
    }

    private static void tryCreatePublicDownloadLink() {
        // Try to also write to public Downloads for visibility
        try {
            File publicDownloads = Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_DOWNLOADS);
            File publicLog = new File(publicDownloads, "tge_electron_crash_log.txt");
            FileWriter fw = new FileWriter(publicLog, true);
            BufferedWriter bw = new BufferedWriter(fw);
            bw.write("\n\n=== SESSION START (PUBLIC): " + TIMESTAMP.format(new Date()) + " ===\n");
            bw.write("Package: com.tgapp.electron\n");
            bw.write("Primary log: " + logFile.getAbsolutePath() + "\n");
            bw.flush();
            bw.close();
        } catch (Exception ignored) {}
    }

    public static void log(String message) {
        String line = TIMESTAMP.format(new Date()) + " " + message;
        Log.d(TAG, line);
        try {
            if (logWriter != null && !crashed) {
                logWriter.write(line + "\n");
                logWriter.flush(); // FORCE FLUSH every write
            }
        } catch (IOException ignored) {}
    }

    public static void logCrash(Throwable ex) {
        StringWriter sw = new StringWriter();
        PrintWriter pw = new PrintWriter(sw);
        ex.printStackTrace(pw);
        String stackTrace = sw.toString();
        
        String header = "=== CRASH: " + TIMESTAMP.format(new Date()) + " ===\n";
        String footer = "\n=== END CRASH ===\n";
        
        try {
            if (logWriter != null) {
                logWriter.write(header);
                logWriter.write(stackTrace);
                logWriter.write(footer);
                logWriter.flush();
            }
        } catch (IOException ignored) {}
        
        Log.e(TAG, header + stackTrace + footer);
        
        // Also write crash to public Downloads
        try {
            File publicDownloads = Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_DOWNLOADS);
            File publicLog = new File(publicDownloads, "tge_electron_crash_log.txt");
            BufferedWriter bw = new BufferedWriter(new FileWriter(publicLog, true));
            bw.write(header);
            bw.write(stackTrace);
            bw.write(footer);
            bw.flush();
            bw.close();
        } catch (Exception ignored) {}
    }

    public static void logError(String tag, String message) { log("ERROR [" + tag + "]: " + message); }
    public static void logWarning(String tag, String message) { log("WARN [" + tag + "]: " + message); }
    public static void logInfo(String tag, String message) { log("INFO [" + tag + "]: " + message); }

    public static String getLogFilePath() {
        return logFile != null ? logFile.getAbsolutePath() : "unknown";
    }

    public static void close() {
        try {
            if (logWriter != null) {
                logWriter.write("=== SESSION END: " + TIMESTAMP.format(new Date()) + " ===\n");
                logWriter.flush();
                logWriter.close();
            }
        } catch (IOException ignored) {}
    }
}
