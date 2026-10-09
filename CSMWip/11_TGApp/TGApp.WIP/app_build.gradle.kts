// TGApp Module build.gradle.kts
// Place in: CSMWip/11_TGApp/TGApp.WIP/app/build.gradle.kts
// Or rename to build.gradle.kts in the WIP root if using single-module structure

plugins {
    id("com.android.application")
    id("org.jetbrains.kotlin.android")
    id("com.google.gms.google-services")
}

android {
    namespace = "com.TGApp.mynewapp"
    compileSdk = 34

    defaultConfig {
        applicationId = "com.TGApp.mynewapp"
        minSdk = 28
        targetSdk = 34
        versionCode = 2
        versionName = "1.0.1"
        
        testInstrumentationRunner = "androidx.test.runner.AndroidJUnitRunner"
    }

    signingConfigs {
        create("release") {
            storeFile = file("../keystore/release.keystore")
            storePassword = System.getenv("KEYSTORE_PASS")
            keyAlias = "release-key"
            keyPassword = System.getenv("KEY_PASS")
        }
        
        create("debug") {
            storeFile = file("../keystore/debug.keystore")
            storePassword = "android"
            keyAlias = "androiddebugkey"
            keyPassword = "android"
        }
    }

    buildTypes {
        release {
            signingConfig = signingConfigs.getByName("release")
            minifyEnabled = true
            proguardFiles(
                getDefaultProguardFile("proguard-android-optimize.txt"),
                "proguard-rules.pro"
            )
            shrinkResources = true
        }
        
        debug {
            signingConfig = signingConfigs.getByName("debug")
            minifyEnabled = false
            isDebuggable = true
        }
    }

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }

    kotlinOptions {
        jvmTarget = "17"
        freeCompilerArgs += "-Xopt-in=kotlin.RequiresOptIn"
    }

    buildFeatures {
        viewBinding = true
    }
}

dependencies {
    // AndroidX Core
    implementation("androidx.core:core-ktx:1.12.0")
    implementation("androidx.appcompat:appcompat:1.6.1")
    implementation("androidx.constraintlayout:constraintlayout:2.1.4")
    
    // Material Design
    implementation("com.google.android.material:material:1.11.0")
    
    // Play Billing
    implementation("com.android.billingclient:billing:6.2.1")
    
    // Firebase
    implementation(platform("com.google.firebase:firebase-bom:32.7.0"))
    implementation("com.google.firebase:firebase-functions-ktx")
    implementation("com.google.firebase:firebase-analytics-ktx")
    implementation("com.google.firebase:firebase-crashlytics-ktx")
    
    // Coroutines
    implementation("org.jetbrains.kotlinx:kotlinx-coroutines-android:1.7.3")
    implementation("org.jetbrains.kotlinx:kotlinx-coroutines-play-services:1.7.3")
    
    // JSON
    implementation("org.json:json:20231013")
    
    // Testing
    testImplementation("junit:junit:4.13.2")
    testImplementation("org.mockito:mockito-core:5.7.0")
    testImplementation("org.jetbrains.kotlinx:kotlinx-coroutines-test:1.7.3")
    androidTestImplementation("androidx.test.ext:junit:1.1.5")
    androidTestImplementation("androidx.test.espresso:espresso-core:3.5.1")
}

// ProGuard rules for release
tasks.named("proguardRelease") {
    configure<com.android.build.gradle.internal.tasks.ProguardTask> {
        // Keep FeatureGate for reflection
        add("-keep class com.TGApp.mynewapp.FeatureGate { *; }")
        // Keep BillingClient callbacks
        add("-keep class com.android.billingclient.api.** { *; }")
        // Keep Firebase Functions
        add("-keep class com.google.firebase.functions.** { *; }")
    }
}