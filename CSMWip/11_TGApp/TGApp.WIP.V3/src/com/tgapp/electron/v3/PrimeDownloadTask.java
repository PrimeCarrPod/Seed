package com.tgapp.electron.v3;

import android.util.Log;
import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.zip.GZIPInputStream;

public class PrimeDownloadTask implements Runnable {
    private static final String TAG = "PrimeDownloadTask";
    private static final String BASE_URL = "https://raw.githubusercontent.com/PrimeBookOne/PrimeBookOne.github.io/main/primebookone/";
    private PrimeTileDownloader downloader;
    
    PrimeDownloadTask(PrimeTileDownloader d) { downloader = d; }
    
    @Override public void run() {
        try {
            if (downloader.downloadMode == 1) downloader.downloadSingleDir();
            else if (downloader.downloadMode == 2) downloader.downloadAllDirs();
        } catch (Exception e) { Log.e(TAG, "Download error", e); downloader.postCallback("onDownloadError", "\"" + e.getMessage() + "\""); }
        finally { downloader.isDownloading = false; downloader.downloadMode = 0; }
    }
}