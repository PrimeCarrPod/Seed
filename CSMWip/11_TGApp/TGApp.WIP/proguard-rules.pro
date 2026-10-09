# TGApp ProGuard Rules
# Place in: CSMWip/11_TGApp/TGApp.WIP/proguard-rules.pro

# Keep FeatureGate for license validation
-keep class com.TGApp.mynewapp.FeatureGate { *; }

# Keep BillingClient and related classes
-keep class com.android.billingclient.api.** { *; }

# Keep Firebase Functions
-keep class com.google.firebase.functions.** { *; }

# Keep Kotlin coroutines
-keep class kotlinx.coroutines.** { *; }

# Keep JSON classes
-keep class org.json.** { *; }

# Keep WebView JavaScript interfaces
-keepclassmembers class com.TGApp.mynewapp.MainActivity {
    @android.webkit.JavascriptInterface <methods>;
}

# Keep license receiver
-keep class com.TGApp.mynewapp.MainActivity$LicenseBroadcastReceiver { *; }

# Don't optimize ProGuard for debug builds
-dontoptimize
-dontobfuscate

# Keep line numbers for crash reporting
-keepattributes SourceFile,LineNumberTable
-renamesourcefileattribute SourceFile