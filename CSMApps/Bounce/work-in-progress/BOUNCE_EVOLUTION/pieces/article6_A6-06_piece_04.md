# Runtime Theme/AppCompat Errors (E006, E007, E008)

## Article A6: A6-06 — Repeated_Errors_Catalog_Solutions
**Piece:** 04 of 13  
**Generated:** 2026-10-08 05:25:52 UTC

---

# E006: Theme.Material.NoActionBar crash on launch
**Type:** Runtime | **First:** v1.0.80 | **Last:** v1.0.85 | **Frequency:** Multiple
**Root Cause:** AppCompatActivity without appcompat dependency in Gradle build
**Solution:** Use plain Activity() with @android:style/Theme.Material.NoActionBar
**Worked:** Yes | **Fixed In:** v1.0.85 | **Time Lost:** High
**Notes:** No AppCompat needed for minimal single-activity apps

### Reproduction
```java
// MainActivity.java
public class MainActivity extends AppCompatActivity {  // Crash!
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);  // Crash here
        setContentView(R.layout.activity_main);
    }
}
```

```
java.lang.IllegalStateException: You need to use a Theme.AppCompat theme...
```

### Root Cause Detail
Gradle build included AppCompatActivity but didn't include androidx.appcompat:appcompat dependency. The theme @style/Theme.AppCompat.Light.NoActionBar doesn't exist without the library.

### Fix Implementation
```java
// Option 1: Use plain Activity (recommended for minimal apps)
public class MainActivity extends Activity {
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
    }
}
```

```xml
<!-- AndroidManifest.xml -->
<activity
    android:name=".MainActivity"
    android:theme="@android:style/Theme.Material.NoActionBar">
```

### Prevention
- Don't use AppCompatActivity unless you need Material Components
- Use framework themes: @android:style/Theme.Material.*
- Keep dependencies minimal

---

# E007: APK installs but immediately closes
**Type:** Runtime | **First:** v1.0.80 | **Last:** v1.0.85 | **Frequency:** Multiple
**Root Cause:** Theme resource not found / missing icon / crash in onCreate
**Solution:** Use @android:style/Theme.Material.NoActionBar + create adaptive icon + call setContentView first
**Worked:** Yes | **Fixed In:** v1.0.85 | **Time Lost:** High
**Notes:** Three root causes - all must be fixed

### Root Cause 1: Theme Not Found
```xml
<!-- BAD - theme doesn't exist without appcompat -->
android:theme="@style/Theme.AppCompat.Light.NoActionBar"

<!-- GOOD - framework theme always exists -->
android:theme="@android:style/Theme.Material.NoActionBar"
```

### Root Cause 2: Missing Adaptive Icon (API 26+)
```xml
<!-- res/mipmap-anydpi-v26/ic_launcher.xml -->
<adaptive-icon xmlns:android="http://schemas.android.com/apk/res/android">
    <background android:drawable="@color/ic_launcher_background"/>
    <foreground android:drawable="@mipmap/ic_launcher_foreground"/>
</adaptive-icon>
```

### Root Cause 3: setContentView After Crash
```java
// BAD - crash before setContentView
@Override
protected void onCreate(Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);
    // Crash here from theme/icon
    setContentView(R.layout.activity_main);  // Never reached
}

// GOOD - setContentView immediately
@Override
protected void onCreate(Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);
    setContentView(R.layout.activity_main);  // First line after super
    // Then init other stuff
}
```

---

# E008: Manifest merger failed — android:icon not found
**Type:** Build | **First:** v1.0.80 | **Last:** v1.0.85 | **Frequency:** Multiple
**Root Cause:** @mipmap/ic_launcher referenced but no icon files exist
**Solution:** Create adaptive icon XML in res/mipmap-anydpi-v26/ic_launcher.xml
**Worked:** Yes | **Fixed In:** v1.0.85 | **Time Lost:** Medium
**Notes:** XML-based adaptive icons required for API 26+

### Reproduction
```bash
$ ./gradlew assembleDebug
> Manifest merger failed: Attribute application@icon value=(@mipmap/ic_launcher)
> from AndroidManifest.xml:12:9-45
> Error: Resource not found
```

### Fix Implementation
```bash
# Create required directories
mkdir -p src/main/res/mipmap-anydpi-v26
mkdir -p src/main/res/mipmap-mdpi
mkdir -p src/main/res/mipmap-hdpi
mkdir -p src/main/res/mipmap-xhdpi
mkdir -p src/main/res/mipmap-xxhdpi
mkdir -p src/main/res/mipmap-xxxhdpi

# Create adaptive icon XML
cat > src/main/res/mipmap-anydpi-v26/ic_launcher.xml <<'EOF'
<adaptive-icon xmlns:android="http://schemas.android.com/apk/res/android">
    <background android:drawable="@color/ic_launcher_background"/>
    <foreground android:drawable="@mipmap/ic_launcher_foreground"/>
</adaptive-icon>
EOF

# Create foreground icon (or use placeholder)
# Create color resource
cat > src/main/res/values/colors.xml <<'EOF'
<resources>
    <color name="ic_launcher_background">#0066CC</color>
</resources>
EOF
```

### Prevention
- Always include adaptive icon for API 26+
- Use Android Studio Image Asset Studio to generate
- Test on API 26+ emulator

---

*Next Piece: Runtime Permission Errors - API33+ (E009, E023, E024)*