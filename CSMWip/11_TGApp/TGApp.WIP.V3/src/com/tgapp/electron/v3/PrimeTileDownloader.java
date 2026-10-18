package com.tgapp.electron.v3;

import android.os.Environment;
import android.webkit.JavascriptInterface;
import android.util.Log;
import com.tgapp.electron.v3.SessionLogger;
import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.zip.GZIPInputStream;

public class PrimeTileDownloader {
    private static final String TAG = "PrimeTileDownloader";
    private static final String BASE_URL = "https://raw.githubusercontent.com/PrimeBookOne/PrimeBookOne.github.io/main/primebookone/";
    private MainActivity activity;
    String downloadDir;
    boolean isDownloading = false;
    int totalTiles = 0;
    int completedTiles = 0;
    int currentTile = 0;
    String currentDir = "";
    int downloadMode = 0;
    String[] allDirs = {"0.0", "0.1", "1.0", "2.0", "2.1", "3.0"};
    int[] allCounts = {500, 500, 500, 500, 500, 3500};
    int singleStart = 0;
    int singleEnd = 0;
    String singleDir = "";
    
    public PrimeTileDownloader(MainActivity activity) {
        this.activity = activity;
        // Primary: Public Downloads folder (persists across reinstalls, user-visible)
        File downloadsDir = Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_DOWNLOADS);
        this.downloadDir = downloadsDir.getAbsolutePath() + "/PrimeBookOne/";
        new File(downloadDir).mkdirs();
        // Secondary: Public Documents folder (legacy location, persists across reinstalls)
        File documentsDirFile = Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_DOCUMENTS);
        this.documentsDir = documentsDirFile.getAbsolutePath() + "/PrimeBookOne/";
        new File(documentsDir).mkdirs();
        // Tertiary: App-specific external files dir (for WebView access, persists across updates)
        this.appFilesDir = activity.getExternalFilesDir(null).getAbsolutePath() + "/PrimeBookOne/";
        new File(appFilesDir).mkdirs();
    }
    
    private String appFilesDir;
    private String documentsDir;
    
    @JavascriptInterface
    public String getDownloadDir() { return downloadDir; }
    
    @JavascriptInterface
    public boolean isDownloading() { return isDownloading; }
    
    @JavascriptInterface
    public int getProgress() { return totalTiles == 0 ? 0 : (completedTiles * 100) / totalTiles; }
    
    @JavascriptInterface
    public String getCurrentStatus() { return isDownloading ? "Downloading " + currentDir + ": Tile " + currentTile : "Idle"; }
    
    @JavascriptInterface
    public void downloadDirectory(String dir, int startTile, int endTile) {
        if (isDownloading) { postCallback("onDownloadError", "\"Already downloading\""); return; }
        downloadMode = 1; singleDir = dir; singleStart = startTile; singleEnd = endTile;
        isDownloading = true; totalTiles = endTile - startTile + 1; completedTiles = 0; currentDir = dir;
        SessionLogger.logDownloadStart(dir, startTile, endTile, totalTiles);
        new Thread(new PrimeDownloadTask(this)).start();
    }
    
    @JavascriptInterface
    public void downloadAllDirectories() {
        if (isDownloading) return;
        downloadMode = 2; isDownloading = true; totalTiles = 0;
        for (int c : allCounts) totalTiles += c; completedTiles = 0;
        SessionLogger.logDownloadStart("ALL", 0, totalTiles - 1, totalTiles);
        new Thread(new PrimeDownloadTask(this)).start();
    }
    
    @JavascriptInterface
    public void cancelDownload() { isDownloading = false; downloadMode = 0; }
    
    void downloadSingleDir() {
        long dirStartTime = System.currentTimeMillis();
        for (int i = singleStart; i <= singleEnd && isDownloading; i++) {
            currentTile = i;
            String tileName = "Tile0" + i;
            String url = BASE_URL + singleDir + "/" + tileName + ".zip";
            String targetDir = downloadDir + singleDir + "/"; new File(targetDir).mkdirs();
            String targetFile = targetDir + tileName + ".prime";
            
            if (fileExistsInAnyLocation(singleDir, tileName + ".prime")) {
                completedTiles++; 
                SessionLogger.logDownloadVerify(singleDir, tileName, new File(targetFile).length(), true, true);
                postProgress(); 
                continue; 
            }
            
            long dlStart = System.currentTimeMillis();
            long gzSize = 0;
            boolean success = downloadAndExtract(url, targetFile, tileName);
            long dlDuration = System.currentTimeMillis() - dlStart;
            
            File outFile = new File(targetFile);
            long outSize = outFile.exists() ? outFile.length() : 0;
            int speedKbps = dlDuration > 0 ? (int)(outSize / 1024 / (dlDuration / 1000.0)) : 0;
            
            SessionLogger.logDownloadProgress(singleDir, i, completedTiles, totalTiles, speedKbps);
            
            if (success) {
                completedTiles++;
                SessionLogger.logDownloadVerify(singleDir, tileName, outSize, true, true);
            } else {
                SessionLogger.logDownloadError(singleDir, tileName, "Download failed after retries");
                postCallback("onDownloadError", "\"Failed: " + tileName + " in " + singleDir + "\"");
            }
            
            postProgress();
            if (isDownloading && i < singleEnd) { try { Thread.sleep(500); } catch (InterruptedException e) { return; } }
        }
        if (isDownloading) {
            long dirDuration = System.currentTimeMillis() - dirStartTime;
            SessionLogger.logDownloadComplete(singleDir, completedTiles, totalTiles, dirDuration);
            postCallback("onDownloadComplete", "\"Directory " + singleDir + " complete\"");
        }
    }
    
    void downloadAllDirs() {
        long allStartTime = System.currentTimeMillis();
        for (int d = 0; d < allDirs.length && isDownloading; d++) {
            String dir = allDirs[d]; int count = allCounts[d]; currentDir = dir;
            long dirStartTime = System.currentTimeMillis();
            
            for (int i = 0; i < count && isDownloading; i++) {
                currentTile = i;
                String tileName = "Tile0" + i;
                String url = BASE_URL + dir + "/" + tileName + ".zip";
                String targetDir = downloadDir + dir + "/"; new File(targetDir).mkdirs();
                String targetFile = targetDir + tileName + ".prime";
                
                if (fileExistsInAnyLocation(dir, tileName + ".prime")) {
                    completedTiles++;
                    SessionLogger.logDownloadVerify(dir, tileName, new File(targetFile).length(), true, true);
                    postProgress(); 
                    continue; 
                }
                
                long dlStart = System.currentTimeMillis();
                boolean success = downloadAndExtract(url, targetFile, tileName);
                long dlDuration = System.currentTimeMillis() - dlStart;
                
                File outFile = new File(targetFile);
                long outSize = outFile.exists() ? outFile.length() : 0;
                int speedKbps = dlDuration > 0 ? (int)(outSize / 1024 / (dlDuration / 1000.0)) : 0;
                
                SessionLogger.logDownloadProgress(dir, i, completedTiles, totalTiles, speedKbps);
                
                if (success) {
                    completedTiles++;
                    SessionLogger.logDownloadVerify(dir, tileName, outSize, true, true);
                } else {
                    SessionLogger.logDownloadError(dir, tileName, "Download failed after retries");
                }
                
                postProgress();
                if (isDownloading && (d < allDirs.length - 1 || i < count - 1)) { try { Thread.sleep(500); } catch (InterruptedException e) { return; } }
            }
            
            if (isDownloading) {
                long dirDuration = System.currentTimeMillis() - dirStartTime;
                SessionLogger.logDownloadComplete(dir, completedTiles, totalTiles, dirDuration);
            }
        }
        if (isDownloading) {
            long allDuration = System.currentTimeMillis() - allStartTime;
            SessionLogger.logDownloadComplete("ALL", completedTiles, totalTiles, allDuration);
            postCallback("onDownloadComplete", "\"All directories complete\"");
        }
    }
    
    private boolean fileExistsInAnyLocation(String dir, String fileName) {
        // Check Downloads (primary)
        File f1 = new File(downloadDir + dir + "/" + fileName);
        if (f1.exists() && f1.length() > 0) return true;
        // Check Documents (legacy)
        File f2 = new File(documentsDir + dir + "/" + fileName);
        if (f2.exists() && f2.length() > 0) return true;
        // Check app files dir (WebView copy)
        File f3 = new File(appFilesDir + dir + "/" + fileName);
        if (f3.exists() && f3.length() > 0) return true;
        return false;
    }
    
    private boolean downloadAndExtract(String urlString, String targetFile, String tileName) {
        int maxRetries = 3;
        for (int attempt = 1; attempt <= maxRetries && isDownloading; attempt++) {
            try {
                URL url = new URL(urlString);
                SessionLogger.log("DL_URL", currentDir, tileName + " -> " + urlString);
                HttpURLConnection conn = (HttpURLConnection) url.openConnection();
                conn.setConnectTimeout(60000);
                conn.setReadTimeout(120000);
                conn.setRequestProperty("User-Agent", "TGE-Electron/3.017");
                
                int responseCode = conn.getResponseCode();
                if (responseCode != 200) {
                    SessionLogger.logDownloadError(currentDir, tileName, "HTTP " + responseCode);
                    if (attempt == maxRetries) return false;
                    Thread.sleep(2000 * attempt);
                    continue;
                }
                
                // Unique temp file per attempt to avoid EEXIST
                String tempFile = targetFile + ".tmp.gz." + attempt + "." + System.currentTimeMillis();
                long gzSize = 0;
                try (InputStream in = conn.getInputStream(); FileOutputStream out = new FileOutputStream(tempFile)) {
                    byte[] buffer = new byte[16384];
                    int len;
                    while ((len = in.read(buffer)) > 0) {
                        if (!isDownloading) return false;
                        out.write(buffer, 0, len);
                        gzSize += len;
                    }
                }
                
                File gzFile = new File(tempFile);
                gzSize = gzFile.length();
                
                long extractStart = System.currentTimeMillis();
                // Delete target before extraction to avoid EEXIST
                new File(targetFile).delete();
                extractTarGz(tempFile, targetFile);
                long extractDuration = System.currentTimeMillis() - extractStart;
                
                File outFile = new File(targetFile);
                long outSize = outFile.exists() ? outFile.length() : 0;
                boolean extractOk = outFile.exists() && outSize > 0;
                
                SessionLogger.logDownloadExtract(currentDir, tileName, gzSize, outSize, extractOk);
                
                // Also copy to app files dir for WebView access
                String fileName = new File(targetFile).getName();
                String dirName = new File(targetFile).getParentFile().getName();
                String appTargetDir = appFilesDir + dirName + "/";
                new File(appTargetDir).mkdirs();
                String appTargetFile = appTargetDir + fileName;
                new File(appTargetFile).delete(); // Avoid EEXIST
                copyFile(targetFile, appTargetFile);
                
                // Clean up temp file
                new File(tempFile).delete();
                
                return extractOk;
            } catch (Exception e) {
                Log.e(TAG, "Download/extract failed (attempt " + attempt + "/" + maxRetries + "): " + urlString, e);
                SessionLogger.logDownloadError(currentDir, tileName, "Exception: " + e.getClass().getSimpleName() + " - " + e.getMessage());
                if (attempt == maxRetries) return false;
                try { Thread.sleep(3000 * attempt); } catch (InterruptedException ie) { return false; }
            }
        }
        return false;
    }
    
    private void copyFile(String src, String dst) throws IOException {
        try (FileInputStream in = new FileInputStream(src); FileOutputStream out = new FileOutputStream(dst)) {
            byte[] buffer = new byte[8192];
            int len;
            while ((len = in.read(buffer)) > 0) out.write(buffer, 0, len);
        }
    }
    
void extractTarGz(String gzPath, String targetFile) throws IOException {
        File target = new File(targetFile);
        String tileName = target.getName().replace(".prime", "");
        // Ensure parent directory exists
        if (!target.getParentFile().exists()) {
            target.getParentFile().mkdirs();
        }
        // Delete existing file - check result
        if (target.exists()) {
            boolean deleted = target.delete();
            SessionLogger.log("DL_EXT_CLEAN", currentDir, tileName + " delete=" + deleted + " exists_after=" + target.exists());
            if (target.exists()) {
                // Try to make writable and delete again
                target.setWritable(true);
                deleted = target.delete();
                SessionLogger.log("DL_EXT_CLEAN2", currentDir, tileName + " delete2=" + deleted + " exists_after=" + target.exists());
            }
        }
        try (FileInputStream fis = new FileInputStream(gzPath); GZIPInputStream gis = new GZIPInputStream(fis); FileOutputStream fos = new FileOutputStream(targetFile, false)) {
            byte[] header = new byte[512];
            while (gis.read(header) == 512) {
                String name = new String(header, 0, 100).trim();
                if (name.endsWith(".prime")) {
                    long size = parseOctal(new String(header, 124, 12).trim());
                    byte[] buffer = new byte[8192]; long remaining = size;
                    while (remaining > 0) { int toRead = (int) Math.min(buffer.length, remaining); int read = gis.read(buffer, 0, toRead); if (read <= 0) break; fos.write(buffer, 0, read); remaining -= read; }
                    long padding = (512 - (size % 512)) % 512; if (padding > 0) gis.skip(padding); break;
                } else { long size = parseOctal(new String(header, 124, 12).trim()); gis.skip(size + (512 - (size % 512)) % 512); }
            }
        }
    }
    
    long parseOctal(String s) { try { return Long.parseLong(s.trim(), 8); } catch (NumberFormatException e) { return 0; } }
    
    void postProgress() {
        int p = getProgress();
        String json = "{\"progress\":" + p + ",\"completed\":" + completedTiles + ",\"total\":" + totalTiles + ",\"dir\":\"" + currentDir + "\",\"tile\":" + currentTile + "}";
        postCallback("onProgress", json);
    }
    
    void postCallback(String method, String data) {
        if (activity != null) activity.scanHandler.post(new PrimeCallbackTask(activity, method, data));
    }
}