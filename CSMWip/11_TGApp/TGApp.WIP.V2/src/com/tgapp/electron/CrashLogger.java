package com.tgapp.electron;

import android.content.Context;
import android.os.Environment;
import android.util.Log;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.LinkedList;
import java.util.Locale;

public class CrashLogger {
    private static final String TAG = "CrashLogger";
    private static BufferedWriter logWriter;
    private static File logFile;
    private static final SimpleDateFormat TIMESTAMP = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS", Locale.US);
    private static final int MAX_LOG_LINES = 2000;  // Keep last 2000 lines
    private static final long MAX_LOG_BYTES = 512 * 1024;  // 512 KB max
    private static int lineCount = 0;
    private static boolean crashed = false;

    public static void init(Context context) {
        try {
            // Rotate old log if too large
            rotateIfNeeded();

            // Try external storage first (accessible via file manager)
            File externalDir = Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_DOWNLOADS);
            if (!externalDir.exists() || !externalDir.canWrite()) {
                externalDir = context.getExternalFilesDir(null);
            }
            if (externalDir == null) {
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
            
            lineCount = 3;
            log("CrashLogger initialized. Log file: " + logFile.getAbsolutePath());
            
            // Set up default uncaught exception handler
            Thread.setDefaultUncaughtExceptionHandler(new Thread.UncaughtExceptionHandler() {
                @Override
                public void uncaughtException(Thread thread, Throwable ex) {
                    if (!crashed) {
                        crashed = true;
                        logCrash(ex);
                    }
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

    private static void rotateIfNeeded() {
        // Check if we have a log file from a previous run that's too large
        File externalDir = Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_DOWNLOADS);
        File oldLog = new File(externalDir, "tge_electron_crash_log.txt");
        if (oldLog.exists() && oldLog.length() > MAX_LOG_BYTES) {
            // Truncate to last MAX_LOG_LINES lines
            try {
                LinkedList<String> lines = new LinkedList<>();
                BufferedReader reader = new BufferedReader(new FileReader(oldLog));
                String line;
                while ((line = reader.readLine()) != null) {
                    lines.addLast(line);
                    if (lines.size() > MAX_LOG_LINES) {
                        lines.removeFirst();
                    }
                }
                reader.close();
                
                BufferedWriter writer = new BufferedWriter(new FileWriter(oldLog, false)); // overwrite
                writer.write("=== LOG ROTATED (kept last " + MAX_LOG_LINES + " lines) ===\n");
                for (String l : lines) {
                    writer.write(l);
                    writer.write("\n");
                }
                writer.close();
            } catch (IOException ignored) {}
        }
    }

    public static void log(String message) {
        String line = TIMESTAMP.format(new Date()) + " " + message;
        Log.d(TAG, line);
        try {
            if (logWriter != null && !crashed) {
                logWriter.write(line + "\n");
                logWriter.flush();
                lineCount++;
                // Trim if too many lines
                if (lineCount > MAX_LOG_LINES) {
                    trimLogFile();
                }
            }
        } catch (IOException ignored) {}
    }

    private static void trimLogFile() {
        // Can't easily trim in-place with BufferedWriter, just reset counter
        // Full rotation happens on next init
        lineCount = MAX_LOG_LINES;
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
