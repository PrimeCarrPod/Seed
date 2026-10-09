package com.TGApp.mynewapp;

import android.content.Context;
import android.content.SharedPreferences;
import android.util.Base64;
import android.util.Log;
import org.json.JSONArray;
import org.json.JSONObject;
import java.security.KeyFactory;
import java.security.PublicKey;
import java.security.Signature;
import java.security.spec.X509EncodedKeySpec;

public class FeatureGate {

    private static final String TAG = "TGApp_FeatureGate";
    private static final String PREFS_NAME = "bounce_license";
    private static final String KEY_LICENSE_JWT = "license_jwt";
    private static final String BROADCAST_ACTION = "LICENSE_UPDATED";

    private final Context context;
    private final SharedPreferences prefs;
    private final PublicKey publicKey;

    public FeatureGate(Context context) {
        this.context = context;
        this.prefs = context.getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE);
        
        String keyString = "-----BEGIN PUBLIC KEY-----\n" +
                "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAn...\n" +
                "-----END PUBLIC KEY-----"
                .replace("-----BEGIN PUBLIC KEY-----", "")
                .replace("-----END PUBLIC KEY-----", "")
                .replace("\n", "")
                .trim();
        
        try {
            byte[] keyBytes = Base64.decode(keyString, Base64.DEFAULT);
            X509EncodedKeySpec spec = new X509EncodedKeySpec(keyBytes);
            this.publicKey = KeyFactory.getInstance("RSA").generatePublic(spec);
        } catch (Exception e) {
            Log.e(TAG, "Failed to load public key", e);
            throw new RuntimeException("Failed to load public key", e);
        }
    }

    public boolean isProEnabled() {
        String jwt = prefs.getString(KEY_LICENSE_JWT, "");
        if (jwt.isEmpty()) {
            return false;
        }
        return validateJwt(jwt);
    }

    private boolean validateJwt(String jwt) {
        try {
            String[] parts = jwt.split("\\.");
            if (parts.length != 3) {
                Log.w(TAG, "Invalid JWT format: not 3 parts");
                return false;
            }

            String headerB64 = parts[0];
            String payloadB64 = parts[1];
            String signatureB64 = parts[2];

            String signingInput = headerB64 + "." + payloadB64;
            byte[] signature = Base64.decode(signatureB64, Base64.URL_SAFE);
            
            Signature sig = Signature.getInstance("SHA256withRSA");
            sig.initVerify(publicKey);
            sig.update(signingInput.getBytes("UTF-8"));
            
            if (!sig.verify(signature)) {
                Log.w(TAG, "JWT signature verification failed");
                return false;
            }

            String payloadJson = new String(Base64.decode(payloadB64, Base64.URL_SAFE), "UTF-8");
            JSONObject json = new JSONObject(payloadJson);

            long exp = json.getLong("exp") * 1000;
            if (exp <= System.currentTimeMillis()) {
                Log.w(TAG, "License expired: " + exp);
                return false;
            }

            JSONArray features = json.getJSONArray("features");
            boolean hasPro = false;
            for (int i = 0; i < features.length(); i++) {
                if ("pro".equals(features.getString(i))) {
                    hasPro = true;
                    break;
                }
            }

            if (!hasPro) {
                Log.w(TAG, "License does not contain 'pro' feature");
                return false;
            }

            Log.d(TAG, "License VALID: exp=" + exp + ", features=" + features);
            return true;
        } catch (Exception e) {
            Log.e(TAG, "JWT validation failed: " + e.getMessage());
            return false;
        }
    }

    public void onLicenseUpdated(String jwt) {
        prefs.edit().putString(KEY_LICENSE_JWT, jwt).apply();
        Log.d(TAG, "License JWT updated, broadcasting to BOUNCE");
        
        android.content.Intent intent = new android.content.Intent(BROADCAST_ACTION);
        context.sendBroadcast(intent);
    }

    public String getCachedJwt() {
        return prefs.getString(KEY_LICENSE_JWT, null);
    }

    public void clearLicense() {
        prefs.edit().remove(KEY_LICENSE_JWT).apply();
        Log.d(TAG, "License cleared");
    }

    public long getLicenseExpiry() {
        String jwt = prefs.getString(KEY_LICENSE_JWT, "");
        if (jwt.isEmpty()) {
            return 0;
        }
        try {
            String[] parts = jwt.split("\\.");
            String payloadJson = new String(Base64.decode(parts[1], Base64.URL_SAFE), "UTF-8");
            JSONObject json = new JSONObject(payloadJson);
            return json.getLong("exp") * 1000;
        } catch (Exception e) {
            return 0;
        }
    }

    public boolean isExpiringSoon(int days) {
        long expiry = getLicenseExpiry();
        return expiry > 0 && expiry < System.currentTimeMillis() + (days * 24L * 60 * 60 * 1000);
    }
}
