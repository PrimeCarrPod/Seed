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
        
        // FIRST: Write to PUBLIC DOWNLOADS - accessible via ANY file manager, no ADB needed
        try {
            File publicDownloads = Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_DOWNLOADS);
            File publicLog = new File(publicDownloads, "tge_electron_crash_log.txt");
            FileWriter fw = new FileWriter(publicLog, true);
            BufferedWriter bw = new BufferedWriter(fw);
            bw.write("\n\n=== SESSION START (PUBLIC DOWNLOADS): " + TIMESTAMP.format(new Date()) + " ===\n");
            bw.write("Package: com.tgapp.electron.v3\n");
            bw.write("Log file: " + publicLog.getAbsolutePath() + "\n");
            bw.write("Open this file in any file manager app (Files, My Files, etc.)\n");
            bw.flush();
            bw.close();
            
            logFile = publicLog;
            logWriter = new BufferedWriter(new FileWriter(publicLog, true));
            initialized = true;
            log("CrashLogger.init() PUBLIC DOWNLOADS ready: " + publicLog.getAbsolutePath());
        } catch (Exception e) {
            Log.e(TAG, "Public Downloads failed", e);
        }
        
        // SECOND: Also write to internal as backup
        try {
            File internalDir = context.getFilesDir();
            File internalLog = new File(internalDir, "tge_electron_crash_log.txt");
            FileWriter fw = new FileWriter(internalLog, true);
            BufferedWriter bw = new BufferedWriter(fw);
            bw.write("\n\n=== SESSION START (INTERNAL BACKUP): " + TIMESTAMP.format(new Date()) + " ===\n");
            bw.write("Package: com.tgapp.electron.v3\n");
            bw.write("Primary log at: " + logFile.getAbsolutePath() + "\n");
            bw.flush();
            bw.close();
        } catch (Exception ignored) {}
        
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
