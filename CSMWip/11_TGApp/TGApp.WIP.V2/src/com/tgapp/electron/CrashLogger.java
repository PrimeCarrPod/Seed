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

    public static void init(Context context) {
        try {
            // Try external storage first (accessible via file manager)
            File externalDir = Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_DOWNLOADS);
            if (!externalDir.exists() || !externalDir.canWrite()) {
                // Fallback to app's external files dir
                externalDir = context.getExternalFilesDir(null);
            }
            if (externalDir == null) {
                // Last resort: internal cache
                externalDir = context.getCacheDir();
            }
            
            logFile = new File(externalDir, "tge_electron_crash_log.txt");
            
            // Append to existing log
            logWriter = new BufferedWriter(new FileWriter(logFile, true));
            
            // Write session header
            logWriter.write("\n\n=== SESSION START: " + TIMESTAMP.format(new Date()) + " ===\n");
            logWriter.write("Package: com.tgapp.electron\n");
            logWriter.write("Log file: " + logFile.getAbsolutePath() + "\n");
            logWriter.flush();
            
            log("CrashLogger initialized. Log file: " + logFile.getAbsolutePath());
            
            // Set up default uncaught exception handler
            Thread.setDefaultUncaughtExceptionHandler(new Thread.UncaughtExceptionHandler() {
                @Override
                public void uncaughtException(Thread thread, Throwable ex) {
                    logCrash(ex);
                    // Call previous handler if exists
                    try {
                        Thread.getDefaultUncaughtExceptionHandler().uncaughtException(thread, ex);
                    } catch (Exception ignored) {}
                }
            });
            
        } catch (Exception e) {
            Log.e(TAG, "Failed to initialize CrashLogger", e);
        }
    }

    public static void log(String message) {
        String line = TIMESTAMP.format(new Date()) + " " + message;
        Log.d(TAG, line);
        try {
            if (logWriter != null) {
                logWriter.write(line + "\n");
                logWriter.flush();
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
    }

    public static void logError(String tag, String message) {
        log("ERROR [" + tag + "]: " + message);
    }

    public static void logWarning(String tag, String message) {
        log("WARN [" + tag + "]: " + message);
    }

    public static void logInfo(String tag, String message) {
        log("INFO [" + tag + "]: " + message);
    }

    public static String getLogFilePath() {
        return logFile != null ? logFile.getAbsolutePath() : "unknown";
    }

    public static void close() {
        try {
            if (logWriter != null) {
                logWriter.write("=== SESSION END: " + TIMESTAMP.format(new Date()) + " ===\n");
                logWriter.close();
            }
        } catch (IOException ignored) {}
    }
}
