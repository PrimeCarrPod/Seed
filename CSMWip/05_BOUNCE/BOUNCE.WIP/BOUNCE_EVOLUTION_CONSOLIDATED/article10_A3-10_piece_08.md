# Refinement_Existing_Parts_Prioritized — Piece 08/13
## Article A3: A3-10 — Refinement Existing Parts Prioritized
**Piece:** 08 of 13  
**Generated:** 2026-10-08 16:41:24 UTC

---

# Section 10: Refinement of Existing Parts — Testing & CI/CD (RF022, RF023, RF024)

## 8.1 RF022 — Unit Tests for All 6 Positioning Algorithms (P1, High Effort)

**Component:** `PositionEKF.java`, `ParticleFilter.java`, `Trilateration.java`, `WifiRttRanging.java`, `ZoneHMM.java`, `BluetoothRanging.java`  
**Issue:** Zero unit tests — algorithms unverified, regressions undetected  
**Current State:** No test directory, no JUnit dependencies  
**Proposed Refinement:** Comprehensive JUnit 5 test suite with synthetic and recorded data  

### Test Structure:
```
app/src/test/java/com/carrpod/bounce/
├── PositionEKFTest.java
├── ParticleFilterTest.java
├── TrilaterationTest.java
├── WifiRttRangingTest.java
├── ZoneHMMTest.java
├── BluetoothRangingTest.java
├── testdata/
│   ├── synthetic/
│   │   ├── static_position.csv
│   │   ├── linear_movement.csv
│   │   ├── turn_movement.csv
│   │   └── noise_profiles/
│   └── recorded/
│       ├── office_walkthrough_v1.csv
│       ├── mall_traversal_v1.csv
│       └── outdoor_gps_fusion_v1.csv
└── utils/
    ├── TestDataLoader.java
    ├── PositionAssertions.java
    └── MetricsCollector.java
```

### PositionEKFTest.java (Example):
```java
// PositionEKFTest.java
package com.carrpod.bounce;

import org.junit.jupiter.api.*;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.CsvSource;
import static org.junit.jupiter.api.Assertions.*;

class PositionEKFTest {
  
  private PositionEKF ekf;
  private static final double EPS = 0.5; // 0.5m tolerance
  
  @BeforeEach
  void setUp() {
    ekf = new PositionEKF();
    // Known initial state
    ekf.initialize(0, 0, 0, 0, 0, 0);
  }
  
  @Test
  void testInitialization_vyBugFixed() {
    // Regression test for RF002: vy was uninitialized (x[2]=0; x[2]=0;)
    double[] state = ekf.getState();
    assertEquals(0.0, state[2], EPS, "vx should be 0");
    assertEquals(0.0, state[3], EPS, "vy should be 0 (was bug: x[2]=0 twice)");
  }
  
  @Test
  void testStaticPosition() {
    // Stationary at origin, perfect measurements
    for (int i = 0; i < 100; i++) {
      ekf.predict(0.1);
      ekf.update(new double[]{0, 0}, new double[]{0.1, 0.1}); // range, bearing
    }
    double[] pos = ekf.getPosition();
    assertEquals(0.0, pos[0], EPS);
    assertEquals(0.0, pos[1], EPS);
  }
  
  @ParameterizedTest
  @CsvSource({
    "1.0, 0.0, 1.0, 0.0",  // East
    "0.0, 1.0, 0.0, 1.0",  // North
    "-1.0, 0.0, -1.0, 0.0", // West
    "0.0, -1.0, 0.0, -1.0"  // South
  })
  void testLinearMovement(double vx, double vy, double expectedX, double expectedY) {
    ekf.initialize(0, 0, vx, vy, 0, 0);
    for (int i = 0; i < 10; i++) {
      ekf.predict(1.0); // 1 second steps
      // Simulate perfect range measurements from origin
      double range = Math.hypot(ekf.getState()[0], ekf.getState()[1]);
      ekf.update(new double[]{range}, new double[]{0.1});
    }
    double[] pos = ekf.getPosition();
    assertEquals(expectedX * 10, pos[0], 1.0);
    assertEquals(expectedY * 10, pos[1], 1.0);
  }
  
  @Test
  void testProcessNoiseAdaptation() {
    // Test RF013 adaptive Q
    ekf.setAdaptiveProcessNoise(true);
    double initialQ = ekf.getProcessNoise()[0];
    
    // High RSSI variance → higher Q
    ekf.setRssiVariance(25.0); // High variance
    ekf.predict(0.1);
    double highQ = ekf.getProcessNoise()[0];
    
    // Low RSSI variance → lower Q
    ekf.setRssiVariance(1.0); // Low variance
    ekf.predict(0.1);
    double lowQ = ekf.getProcessNoise()[0];
    
    assertTrue(highQ > lowQ, "Adaptive Q should increase with RSSI variance");
  }
  
  @Test
  void testDivergenceDetection() {
    // Feed inconsistent measurements
    for (int i = 0; i < 50; i++) {
      ekf.predict(0.1);
      ekf.update(new double[]{i * 10}, new double[]{0.1}); // Impossible ranges
    }
    assertTrue(ekf.isDiverged(), "Should detect filter divergence");
  }
}
```

### ParticleFilterTest.java (Key Tests):
```java
// ParticleFilterTest.java
@Test
void testAdaptiveParameters() {
  // RF004: Verify per-AP parameter learning
  ParticleFilter pf = new ParticleFilter(1000);
  String bssid = "AA:BB:CC:DD:EE:FF";
  
  // Feed RSSI samples
  for (int i = 0; i < 100; i++) {
    pf.addRssiSample(bssid, -65 + Math.random() * 10); // Mean -65, variance ~8
  }
  
  double mean = pf.getRssiMean(bssid);
  double variance = pf.getRssiVariance(bssid);
  
  assertEquals(-65, mean, 2.0);
  assertTrue(variance > 5 && variance < 20, "Variance should converge to ~8.3");
}

@Test
void testWeightComputation() {
  // Particles near AP should have higher weight
  ParticleFilter pf = new ParticleFilter(1000);
  pf.setApPosition("AP1", 0, 0);
  
  double weightNear = pf.computeWeight(1, 0, Map.of("AP1", -40));
  double weightFar = pf.computeWeight(100, 0, Map.of("AP1", -40));
  
  assertTrue(weightNear > weightFar * 1000, "Near particle should dominate");
}
```

### TrilaterationTest.java:
```java
// TrilaterationTest.java
@Test
void testSelfCalibration() {
  // RF005: AP position self-calibration
  Trilateration tri = new Trilateration();
  
  // Simulate user walking in square, 4 APs at corners
  List<Measurement> measurements = generateSquareWalkMeasurements();
  tri.calibrateApPositions(measurements);
  
  Map<String, Point> apPositions = tri.getApPositions();
  assertEquals(4, apPositions.size());
  
  // Check each AP within 1m of true position
  for (String bssid : apPositions.keySet()) {
    Point truePos = TRUE_AP_POSITIONS.get(bssid);
    Point estPos = apPositions.get(bssid);
    assertTrue(truePos.distance(estPos) < 1.0, "AP " + bssid + " calibration error");
  }
}
```

### Test Dependencies (build.sh):
```bash
# Add to build.sh
JUNIT_JAR="junit-jupiter-5.10.0.jar"
MOCKITO_JAR="mockito-core-5.7.0.jar"

download_test_deps() {
  curl -L "https://repo1.maven.org/maven2/org/junit/jupiter/junit-jupiter/5.10.0/junit-jupiter-5.10.0.jar" -o libs/$JUNIT_JAR
  curl -L "https://repo1.maven.org/maven2/org/mockito/mockito-core/5.7.0/mockito-core-5.7.0.jar" -o libs/$MOCKITO_JAR
}

run_tests() {
  # Compile test classes
  javac -cp "libs/*:$ANDROID_JAR" -d test-out app/src/test/java/com/carrpod/bounce/*.java
  
  # Run with JUnit Console Launcher
  java -jar junit-platform-console-standalone-1.10.0.jar \
    --class-path test-out \
    --scan-class-path \
    --reports-dir=test-results
}
```

### Target: v1.0.94 | Status: Planned | Master List Ref: P1-02

---

## 8.2 RF023 — CI/CD Pipeline (GitHub Actions) (P2, Medium Effort)

**Component:** None (manual builds only)  
**Issue:** No automation — human error, no PR validation, no release artifacts  
**Current State:** `./build.sh` run locally  
**Proposed Refinement:** GitHub Actions workflow for build, test, sign, release  

### .github/workflows/ci.yml:
```yaml
name: CI/CD Pipeline

on:
  push:
    branches: [main, develop]
  pull_request:
    branches: [main]
  release:
    types: [published]

env:
  ANDROID_SDK_VERSION: "34"
  BUILD_TOOLS_VERSION: "34.0.0"

jobs:
  build-and-test:
    runs-on: ubuntu-latest
    timeout-minutes: 30
    
    steps:
      - uses: actions/checkout@v4
      
      - name: Setup JDK 17
        uses: actions/setup-java@v4
        with:
          distribution: 'temurin'
          java-version: '17'
          
      - name: Setup Android SDK
        uses: android-actions/setup-android@v3
        with:
          api-level: ${{ env.ANDROID_SDK_VERSION }}
          build-tools-version: ${{ env.BUILD_TOOLS_VERSION }}
          
      - name: Cache Gradle/Android
        uses: actions/cache@v4
        with:
          path: |
            ~/.gradle/caches
            ~/.android/build-cache
          key: ${{ runner.os }}-android-${{ hashFiles('**/build.sh') }}
          
      - name: Make build.sh executable
        run: chmod +x build.sh
        
      - name: Build Debug APK
        run: ./build.sh debug
        env:
          ANDROID_HOME: ${{ env.ANDROID_SDK_ROOT }}
          
      - name: Run Unit Tests
        run: ./build.sh test
        env:
          ANDROID_HOME: ${{ env.ANDROID_SDK_ROOT }}
          
      - name: Upload Debug APK
        uses: actions/upload-artifact@v4
        with:
          name: bounce-debug-apk
          path: out/Bounce-debug.apk
          
      - name: Upload Test Results
        uses: actions/upload-artifact@v4
        if: always()
        with:
          name: test-results
          path: test-results/

  build-release:
    needs: build-and-test
    if: github.event_name == 'release' || github.ref == 'refs/heads/main'
    runs-on: ubuntu-latest
    timeout-minutes: 30
    permissions:
      contents: write  # For release upload
      
    steps:
      - uses: actions/checkout@v4
      
      - name: Setup JDK 17
        uses: actions/setup-java@v4
        with:
          distribution: 'temurin'
          java-version: '17'
          
      - name: Setup Android SDK
        uses: android-actions/setup-android@v3
        with:
          api-level: ${{ env.ANDROID_SDK_VERSION }}
          build-tools-version: ${{ env.BUILD_TOOLS_VERSION }}
          
      - name: Restore Keystore
        run: |
          echo "${{ secrets.RELEASE_KEYSTORE_BASE64 }}" | base64 -d > keystore/release.jks
          echo "STORE_PASSWORD=${{ secrets.KEYSTORE_PASSWORD }}" > keystore/credentials.txt
          echo "KEY_PASSWORD=${{ secrets.KEY_PASSWORD }}" >> keystore/credentials.txt
          echo "ALIAS=${{ secrets.KEY_ALIAS }}" >> keystore/credentials.txt
          
      - name: Build Release APK
        run: ./build.sh release
        env:
          ANDROID_HOME: ${{ env.ANDROID_SDK_ROOT }}
          
      - name: Verify Signature
        run: |
          APK=out/Bounce-release.apk
          $ANDROID_HOME/build-tools/$BUILD_TOOLS_VERSION/apksigner verify --print-certs $APK
          
      - name: Upload Release APK
        uses: actions/upload-artifact@v4
        with:
          name: bounce-release-apk
          path: out/Bounce-release.apk
          
      - name: Upload to GitHub Release
        if: github.event_name == 'release'
        uses: softprops/action-gh-release@v1
        with:
          files: out/Bounce-release.apk
          body_path: CHANGELOG.md
```

### Required Secrets (GitHub Repository Settings):
| Secret | Description |
|--------|-------------|
| `RELEASE_KEYSTORE_BASE64` | `base64 -w0 keystore/release.jks` |
| `KEYSTORE_PASSWORD` | Keystore store password |
| `KEY_PASSWORD` | Key password |
| `KEY_ALIAS` | Key alias (e.g., `bounce-release`) |

### Target: v1.0.95 | Status: Planned | Master List Ref: TD-09

---

## 8.3 RF024 — Auto-Version from Git Tags (P2, Low Effort)

**Component:** `build.sh` (manual version string)  
**Issue:** Version bumped manually in build.sh — error-prone, inconsistent  
**Current State:** `VERSION="1.0.91"` hardcoded  
**Proposed Refinement:** Derive version from git tags + commit count + dirty flag  

### Version Script (`scripts/version.sh`):
```bash
#!/bin/bash
# version.sh - Auto-generate version from git

get_version() {
  local prefix="v"
  local dirty=false
  
  # Check for uncommitted changes
  if ! git diff --quiet || ! git diff --cached --quiet; then
    dirty=true
  fi
  
  # Get latest tag
  local tag=$(git describe --tags --abbrev=0 2>/dev/null || echo "")
  
  if [[ -z "$tag" ]]; then
    # No tags yet - use commit count
    local count=$(git rev-list --count HEAD)
    echo "0.1.${count}${dirty:+-dirty}"
    return
  fi
  
  # Parse tag (expects v1.0.91 format)
  local base_version=${tag#$prefix}
  local commits_since=$(git rev-list --count ${tag}..HEAD)
  
  if [[ $commits_since -eq 0 && "$dirty" == "false" ]]; then
    # Exact tag match
    echo "$base_version"
  else
    # Increment patch, add commit count
    IFS='.' read -r major minor patch <<< "$base_version"
    local new_patch=$((patch + 1))
    echo "${major}.${minor}.${new_patch}-${commits_since}${dirty:+-dirty}"
  fi
}

get_version_code() {
  # Monotonically increasing integer for Android versionCode
  local version=$(get_version)
  # Parse: 1.0.91-5-dirty → 1009105
  # Or: 1.0.91 → 1009100
  local clean=${version%%-*}
  IFS='.' read -r major minor patch <<< "$clean"
  local extra=0
  if [[ "$version" == *-* ]]; then
    extra=$(echo "$version" | sed 's/.*-//' | sed 's/[^0-9].*//')
  fi
  echo $((major * 1000000 + minor * 10000 + patch * 100 + extra))
}

# Usage in build.sh:
# VERSION=$(./scripts/version.sh)
# VERSION_CODE=$(./scripts/version.sh code)
# sed -i "s/versionName=.*/versionName=$VERSION/" AndroidManifest.xml
# sed -i "s/versionCode=.*/versionCode=$VERSION_CODE/" AndroidManifest.xml
```

### Git Tagging Convention:
```bash
# Release process:
git tag -a v1.0.92 -m "Release v1.0.92: EKF vy bug fix"
git push origin v1.0.92

# GitHub Actions triggers release build on tag push
```

### Changelog Generation:
```bash
# scripts/changelog.sh
generate_changelog() {
  local prev_tag=$(git describe --tags --abbrev=0 HEAD^ 2>/dev/null || git rev-list --max-parents=0 HEAD)
  local current_tag=$(git describe --tags --abbrev=0 2>/dev/null || echo "HEAD")
  
  echo "# Changelog for $current_tag"
  echo ""
  git log --pretty=format:"- %s (%h)" $prev_tag..$current_tag | grep -v "Merge\|chore\|ci"
}
```

### Target: v1.0.94 | Status: Planned | Master List Ref: TD-10

---

*End of Piece 08/13*