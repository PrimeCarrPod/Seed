# Working_Features_Versions_History — Piece 07/13
## Article A9: A9-09 — Working Features Versions History
**Piece:** 07 of 13  
**Generated:** 2026-10-08 15:28:33 UTC

---

# Positioning Algorithms Part 1: RSSI Kalman, Trilateration, EKF

## 7.1 WF011 — RSSI Kalman Filter (1D) (Positioning)

**Category:** Positioning | **First Working:** v1.0.79 | **Last Enhanced:** v1.0.91 | **Status:** Complete
**Lines Added:** ~64 | **Key Files:** `RssiKalmanFilter.java` | **Dependencies:** Wi-Fi RSSI, BLE RSSI

### Enhancement History
| Version | Enhancement | Lines Delta |
|---------|-------------|-------------|
| v1.0.79 | 1D Kalman per AP: state=[RSSI], measurement=raw RSSI | +64 |
| v1.0.86 | Per-device BLE Kalman: separate filter per MAC address | +40 |

### Kalman Filter Implementation (RssiKalmanFilter.java)
```java
public class RssiKalmanFilter {
    // State: x = [RSSI]
    // Process: x_k = x_{k-1} + w, w ~ N(0, q)
    // Measure: z_k = x_k + v, v ~ N(0, r)
    
    private double x = 0;      // State estimate
    private double P = 100;    // Error covariance
    private final double q = 0.01;  // Process noise (tuned)
    private final double r = 16.0;  // Measurement noise (RSSI variance ~4dB²)
    
    public double update(double measurement) {
        // Predict
        // x = x (constant velocity model for RSSI)
        P = P + q;
        
        // Update
        double K = P / (P + r);      // Kalman gain
        x = x + K * (measurement - x);
        P = (1 - K) * P;
        
        return x;
    }
    
    public double getEstimate() { return x; }
    public double getVariance() { return P; }
}
```

### Per-Device Management (v1.0.86+)
```java
// MainActivity.java - Map of MAC → Kalman filter
private final Map<String, RssiKalmanFilter> bleKalmanFilters = new ConcurrentHashMap<>();

private double getFilteredRssi(String mac, double rawRssi) {
    return bleKalmanFilters.computeIfAbsent(mac, k -> new RssiKalmanFilter())
                           .update(rawRssi);
}
```

### Known Limitations
- **Fixed q/r params**: Process noise (q=0.01) and measurement noise (r=16) hand-tuned
- No adaptive noise estimation based on environment

### Next Planned Enhancement
**Adaptive Learning (P1-01)** — Online EM algorithm for q/r estimation

---

## 7.2 WF012 — Trilateration (Weighted Least Squares) (Positioning)

**Category:** Positioning | **First Working:** v1.0.81 | **Last Enhanced:** v1.0.91 | **Status:** Complete
**Lines Added:** ~257 | **Key Files:** `Trilateration.java` | **Dependencies:** 3+ APs with known positions

### Enhancement History
| Version | Enhancement | Lines Delta |
|---------|-------------|-------------|
| v1.0.81 | Basic weighted least squares: minimize Σ w_i (d_i - ||x - p_i||)² | +150 |
| v1.0.90 | GDOP calculation + AP position refinement | +107 |

### Trilateration Mathematics
```java
// Trilateration.java - Weighted Least Squares
public class Trilateration {
    // AP positions: p_i = (x_i, y_i) in local meters
    // Measured distances: d_i from RSSI path loss model
    // Weights: w_i = 1 / σ_i² (inverse variance)
    
    // Linearized system: A Δx = b
    // A = [ (x-x₁)/d₁  (y-y₁)/d₁ ]   b = [ d₁ - ||x-p₁|| ]
    //     [ (x-x₂)/d₂  (y-y₂)/d₂ ]       [ d₂ - ||x-p₂|| ]
    //     [   ...         ...      ]       [     ...      ]
    
    // Solution: Δx = (A^T W A)⁻¹ A^T W b
    // Iterate until ||Δx|| < ε
    
    public static PositionResult solve(List<AP> aps, List<Double> distances, 
                                        List<Double> weights, Position initial) {
        Position x = initial;
        for (int iter = 0; iter < 10; iter++) {
            // Build A, b
            double[][] A = new double[aps.size()][2];
            double[] b = new double[aps.size()];
            for (int i = 0; i < aps.size(); i++) {
                double dx = x.x - aps.get(i).x;
                double dy = x.y - aps.get(i).y;
                double dist = Math.hypot(dx, dy);
                if (dist > 0.1) {
                    A[i][0] = dx / dist;
                    A[i][1] = dy / dist;
                    b[i] = distances.get(i) - dist;
                }
            }
            // Weighted normal equations
            double[][] W = diagonalMatrix(weights);
            double[][] ATWA = multiply(transpose(A), multiply(W, A));
            double[] ATWb = multiply(transpose(A), multiply(W, b));
            double[] dx = solveLinear(ATWA, ATWb);  // 2x2 system
            x.x += dx[0];
            x.y += dx[1];
            if (Math.hypot(dx[0], dx[1]) < 0.01) break;
        }
        
        // GDOP: sqrt(trace((A^T W A)⁻¹))
        double gdop = Math.sqrt(trace(inverse(ATWA)));
        
        return new PositionResult(x, gdop, residuals);
    }
}
```

### AP Position Estimation (WF029 overlap)
- v1.0.81: Random initial positions
- v1.0.90: Refined via gradient descent on residuals
- **Still partial**: Needs self-calibration (P0-03)

### Known Limitations
- **AP positions unknown**: Requires survey or self-calibration (P0-03)
- GDOP > 3 indicates poor geometry (collinear APs)
- Path loss model assumes free space; multipath causes bias

### Next Planned Enhancement
**Self-Calibration (P0-03)** — Simultaneous AP position + user position estimation

---

## 7.3 WF013 — Extended Kalman Filter (2D Constant Velocity) (Positioning)

**Category:** Positioning | **First Working:** v1.0.90 | **Last Enhanced:** v1.0.91 (bug fixed v1.0.92) | **Status:** Complete (bug fixed)
**Lines Added:** ~302 | **Key Files:** `PositionEKF.java` | **Dependencies:** Trilateration output as measurement

### Enhancement History
| Version | Enhancement | Lines Delta |
|---------|-------------|-------------|
| v1.0.90 | 2D CV EKF: state=[x, y, vx, vy], measurement=[x, y] from trilateration | +302 |
| v1.0.92 | **CRITICAL BUG FIX**: vy initialization (line 38) | +1 |

### Critical Bug: EKF vy Initialization (FIXED v1.0.92)
```java
// PositionEKF.java:38 - BEFORE (BUGGY v1.0.90-91)
double[] x = new double[4];
x[0] = initialX;  // x position
x[1] = initialY;  // y position
x[2] = 0;         // vx velocity
x[2] = 0;         // BUG: should be x[3] = 0 (vy)!
// x[3] remains uninitialized (garbage)

// PositionEKF.java:38 - AFTER (FIXED v1.0.92)
double[] x = new double[4];
x[0] = initialX;
x[1] = initialY;
x[2] = 0;         // vx
x[3] = 0;         // vy - FIXED
```

### EKF Implementation (PositionEKF.java)
```java
// State: [x, y, vx, vy] - Constant Velocity model
// Process: x_k = F x_{k-1} + w, w ~ N(0, Q)
// F = [1 0 dt 0; 0 1 0 dt; 0 0 1 0; 0 0 0 1]
// Q = σ_a² * [dt⁴/4 0 dt³/2 0; 0 dt⁴/4 0 dt³/2; dt³/2 0 dt² 0; 0 dt³/2 0 dt²]
// Measure: z_k = H x_k + v, v ~ N(0, R)
// H = [1 0 0 0; 0 1 0 0]  (position only)
// R = diag(σ_x², σ_y²) from trilateration covariance

public class PositionEKF {
    private final double[][] F = new double[4][4];
    private final double[][] H = {{1,0,0,0}, {0,1,0,0}};
    private final double[][] Q = new double[4][4];
    private final double[][] R = {{25,0}, {0,25}};  // 5m position noise
    private double[] x = new double[4];
    private double[][] P = identity(4);
    
    public PositionEKF(double dt, double sigmaA) {
        // Initialize F, Q with dt, σ_a
        F[0][0]=1; F[0][2]=dt;
        F[1][1]=1; F[1][3]=dt;
        F[2][2]=1; F[3][3]=1;
        
        double dt2 = dt*dt, dt3 = dt2*dt, dt4 = dt3*dt;
        double q = sigmaA*sigmaA;
        Q[0][0]=q*dt4/4; Q[0][2]=q*dt3/2;
        Q[1][1]=q*dt4/4; Q[1][3]=q*dt3/2;
        Q[2][0]=q*dt3/2; Q[2][2]=q*dt2;
        Q[3][1]=q*dt3/2; Q[3][3]=q*dt2;
    }
    
    public void predict() {
        x = multiply(F, x);
        P = add(multiply(multiply(F, P), transpose(F)), Q);
    }
    
    public void update(double[] z) {  // z = [x_meas, y_meas]
        double[] y = subtract(z, multiply(H, x));
        double[][] S = add(multiply(multiply(H, P), transpose(H)), R);
        double[][] K = multiply(multiply(P, transpose(H)), inverse(S));
        x = add(x, multiply(K, y));
        P = multiply(subtract(identity(4), multiply(K, H)), P);
    }
    
    public double[] getState() { return x; }
    public double[][] getCovariance() { return P; }
}
```

### Known Limitations
- **Velocity accuracy**: Unverified without ground truth
- Constant velocity model mismatches actual motion
- Trilateration covariance (R) approximated as diagonal 25m²

### Next Planned Enhancement
**Velocity Accuracy Validation** — Compare with GPS velocity when available

---

*End of Piece 07 — Continue to Piece 08 for Particle Filter, Zone HMM, RTT*