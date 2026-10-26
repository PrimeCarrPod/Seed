package com.csmlabs.voicedictation;

public final class Config {
    public static final String DEFAULT_SERVER_HOST = "192.168.1.100";
    public static final int DEFAULT_SERVER_PORT = 8765;
    public static final String WS_PATH = "/dictation";
    
    public static String buildWsUrl(String host, int port) {
        return "ws://" + host + ":" + port + WS_PATH;
    }
    
    private Config() {}
}