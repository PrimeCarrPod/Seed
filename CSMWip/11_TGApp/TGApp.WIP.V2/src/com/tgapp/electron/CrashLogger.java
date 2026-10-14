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
        
        try {
            // FORCE: Create log file in Downloads FIRST, before anything else
            File downloadsDir = Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_DOWNLOADS);
            if (!downloadsDir.exists()) {
                downloadsDir.mkdirs();
            }
            logFile = new File(downloadsDir, "tge_electron_crash_log.txt");
            
            // SYNCHRONOUS write - create file immediately
            FileWriter fw = new FileWriter(logFile, true);
            BufferedWriter bw = new BufferedWriter(fw);
            bw.write("\n\n=== SESSION START: " + TIMESTAMP.format(new Date()) + " ===\n");
            bw.write("Package: com.tgapp.electron\n");
            bw.write("Log file: " + logFile.getAbsolutePath() + "\n");
            bw.write("CrashLogger.init() called\n");
            bw.flush();
            bw.close();
            
            // Now open persistent writer
            logWriter = new BufferedWriter(new FileWriter(logFile, true));
            initialized = true;
            
            log("CrashLogger.init() completed. Log: " + logFile.getAbsolutePath());
            
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
            
        } catch (Exception e) {
            Log.e(TAG, "Failed to initialize CrashLogger", e);
            // Try internal storage as last resort
            try {
                File internalDir = context.getFilesDir();
                logFile = new File(internalDir, "tge_electron_crash_log.txt");
                logWriter = new BufferedWriter(new FileWriter(logFile, true));
                logWriter.write("\n\n=== SESSION START (INTERNAL): " + TIMESTAMP.format(new Date()) + " ===\n");
                logWriter.flush();
                initialized = true;
            } catch (Exception ignored) {}
        }
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
        
        // Also write crash to Downloads
        try {
            File downloadsDir = Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_DOWNLOADS);
            File crashLog = new File(downloadsDir, "tge_electron_crash_log.txt");
            BufferedWriter bw = new BufferedWriter(new FileWriter(crashLog, true));
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
