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
    private static final int MAX_LOG_LINES = 2000;
    private static final long MAX_LOG_BYTES = 512 * 1024;
    private static int lineCount = 0;
    private static boolean crashed = false;
    private static boolean initialized = false;

    public static void init(Context context) {
        if (initialized) return;
        initialized = true;
        
        try {
            // Always try internal storage first (always accessible)
            File internalDir = context.getFilesDir();
            logFile = new File(internalDir, "tge_electron_crash_log.txt");
            
            // Try external storage for user access
            File externalDir = Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_DOWNLOADS);
            File externalLog = new File(externalDir, "tge_electron_crash_log.txt");
            
            // Rotate old log if too large
            rotateIfNeeded(externalLog);
            rotateIfNeeded(logFile);
            
            // Use internal for writing (guaranteed), also mirror to external if possible
            logWriter = new BufferedWriter(new FileWriter(logFile, true));
            
            // Write session header
            logWriter.write("\n\n=== SESSION START: " + TIMESTAMP.format(new Date()) + " ===\n");
            logWriter.write("Package: com.tgapp.electron\n");
            logWriter.write("Internal log: " + logFile.getAbsolutePath() + "\n");
            logWriter.write("External log: " + externalLog.getAbsolutePath() + "\n");
            logWriter.flush();
            
            lineCount = 3;
            log("CrashLogger initialized. Internal: " + logFile.getAbsolutePath());
            log("CrashLogger initialized. External: " + externalLog.getAbsolutePath());
            
            // Also try to write to external for user access
            try {
                BufferedWriter extWriter = new BufferedWriter(new FileWriter(externalLog, true));
                extWriter.write("\n\n=== SESSION START: " + TIMESTAMP.format(new Date()) + " ===\n");
                extWriter.write("Package: com.tgapp.electron\n");
                extWriter.write("Internal log: " + logFile.getAbsolutePath() + "\n");
                extWriter.flush();
                extWriter.close();
            } catch (Exception ignored) {}
            
            // Set up default uncaught exception handler
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
        }
    }

    private static void rotateIfNeeded(File logFile) {
        if (logFile.exists() && logFile.length() > MAX_LOG_BYTES) {
            try {
                LinkedList<String> lines = new LinkedList<>();
                BufferedReader reader = new BufferedReader(new FileReader(logFile));
                String line;
                while ((line = reader.readLine()) != null) {
                    lines.addLast(line);
                    if (lines.size() > MAX_LOG_LINES) lines.removeFirst();
                }
                reader.close();
                
                BufferedWriter writer = new BufferedWriter(new FileWriter(logFile, false));
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
                if (lineCount > MAX_LOG_LINES) {
                    lineCount = MAX_LOG_LINES; // Will rotate on next init
                }
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
        
        // Also write to external if possible
        try {
            File externalDir = Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_DOWNLOADS);
            File externalLog = new File(externalDir, "tge_electron_crash_log.txt");
            BufferedWriter extWriter = new BufferedWriter(new FileWriter(externalLog, true));
            extWriter.write(header);
            extWriter.write(stackTrace);
            extWriter.write(footer);
            extWriter.flush();
            extWriter.close();
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
                logWriter.close();
            }
        } catch (IOException ignored) {}
    }
}
