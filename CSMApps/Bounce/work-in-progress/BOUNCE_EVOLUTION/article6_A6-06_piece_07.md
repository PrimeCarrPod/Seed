# Runtime Positioning/EKF Errors (E011, E019, E020)

## Article A6: A6-06 — Repeated_Errors_Catalog_Solutions
**Piece:** 07 of 13  
**Generated:** 2026-10-08 05:27:28 UTC

---

# E011: EKF velocity vy not initialized (CRITICAL - P0-01)
**Type:** Runtime | **First:** v1.0.90 | **Last:** v1.0.91 | **Frequency:** Every run
**Root Cause:** Copy-paste typo in PositionEKF.java:38 - x[2]=0; x[2]=0; should be x[3]=0
**Solution:** Change second x[2]=0 to x[3]=0
**Worked:** Yes | **Fixed In:** v1.0.92 | **Time Lost:** Medium
**Notes:** P0-01 bug - ALWAYS verify array indices in initialization code

### Reproduction
```java
// PositionEKF.java:38 - BROKEN CODE
public void initialize(double x, double y) {
    this.x[0] = x;      // x position
    this.x[1] = y;      // y position
    this.x[2] = 0;      // vx velocity
    this.x[2] = 0;      // BUG: should be x[3] = 0; // vy velocity
    // x[3] (vy) remains uninitialized - garbage value!
}
```

### Consequences
- vy (Y velocity) never initialized → contains random memory value
- Kalman filter state covariance becomes corrupted
- Position estimates drift incorrectly in Y direction
- Trilateration and particle filter receive bad velocity priors
- All 6-algorithm fusion outputs corrupted

### Fix Implementation
```java
// PositionEKF.java:38 - FIXED
public void initialize(double x, double y) {
    this.x[0] = x;      // x position
    this.x[1] = y;      // y position
    this.x[2] = 0;      // vx velocity
    this.x[3] = 0;      // FIXED: vy velocity
    // Initialize covariance
    for (int i = 0; i < 4; i++) {
        for (int j = 0; j < 4; j++) {
            this.P[i][j] = (i == j) ? 1.0 : 0.0;
        }
    }
}
```

### Prevention
1. **Code Review**: Always review array initialization loops
2. **Unit Test**: Add test verifying vy=0 after initialize()
3. **Static Analysis**: Enable array bounds checking
4. **Pattern**: Use named constants instead of magic indices
   ```java
   private static final int IDX_X = 0, IDX_Y = 1, IDX_VX = 2, IDX_VY = 3;
   x[IDX_VX] = 0; x[IDX_VY] = 0;  // Clear intent
   ```

### Verification
```java
@Test
public void testEKFVelocityInitialization() {
    PositionEKF ekf = new PositionEKF();
    ekf.initialize(10.0, 20.0);
    assertEquals(0.0, ekf.getState()[2], 0.001); // vx
    assertEquals(0.0, ekf.getState()[3], 0.001); // vy - THIS WAS FAILING
}
```

---

# E019: GPS speed shows 0 when stationary (zero-fix)
**Type:** Runtime | **First:** v1.0.4 | **Last:** v1.0.26 | **Frequency:** Every run
**Root Cause:** GPS provider returns 0 speed when stationary
**Solution:** Speed threshold > 1mph for trail recording
**Worked:** Yes | **Fixed In:** v1.0.27 | **Time Lost:** Low
**Notes:** Expected GPS behavior - not a bug, handle in application logic

### Reproduction
```java
Location loc = locationManager.getLastKnownLocation(GPS_PROVIDER);
float speed = loc.getSpeed();  // Returns 0.0 when stationary
```

### Root Cause Detail
GPS receivers calculate speed from Doppler shift. When stationary, multipath and noise cause speed to fluctuate around 0. Most Android GPS providers clamp to 0 when confidence is low.

### Fix Implementation
```java
// Trail recording with speed threshold
private static final float MIN_SPEED_MPS = 0.447f;  // 1 mph = 0.447 m/s

public void onLocationChanged(Location location) {
    float speed = location.getSpeed();  // m/s
    if (speed > MIN_SPEED_MPS) {
        trailRecorder.addPoint(location);
    }
    // Ignore stationary points - prevents noisy trail
}
```

### Prevention
- Don't treat GPS speed=0 as error - it's normal behavior
- Apply speed threshold before adding to trail
- Consider fused location provider for better accuracy

---

# E020: Azimuth wrap-around at 0/360 boundary
**Type:** Runtime | **First:** v1.0.25 | **Last:** v1.0.91 | **Frequency:** Every run
**Root Cause:** Sensor orientation jumps 359→0 degrees
**Solution:** Add wrap handling: if diff > 180, adjust by 360
**Worked:** Yes | **Fixed In:** v1.0.25 | **Time Lost:** Medium
**Notes:** Standard sensor fusion fix - angular discontinuity

### Reproduction
```java
// Sensor event
float azimuth = event.values[0];  // 0-360 degrees
// When crossing north: 359 → 0 (diff = -359, should be +1)
```

### Root Cause Detail
Magnetic azimuth wraps at 360°. Naive difference calculation gives 359° jump instead of 1° change.

### Fix Implementation
```java
private static float normalizeAngle(float angle) {
    while (angle < 0) angle += 360;
    while (angle >= 360) angle -= 360;
    return angle;
}

private static float angleDiff(float a, float b) {
    float diff = normalizeAngle(a - b);
    if (diff > 180) diff -= 360;
    if (diff < -180) diff += 360;
    return diff;
}

// Usage in sensor fusion
float currentAzimuth = normalizeAngle(event.values[0]);
float delta = angleDiff(currentAzimuth, lastAzimuth);
// delta is now minimal signed difference (-180 to +180)
lastAzimuth = currentAzimuth;
```

### Prevention
- Always normalize angles to [0, 360) before comparison
- Use angleDiff() for all angular differences
- Test at boundary: 359→0, 0→359, 180→-180

---

*Next Piece: Runtime WebView/Three.js Errors (E012, E016, E028, E029)*