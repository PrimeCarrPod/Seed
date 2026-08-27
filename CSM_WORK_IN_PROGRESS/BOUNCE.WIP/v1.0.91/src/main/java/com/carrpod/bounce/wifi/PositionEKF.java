package com.carrpod.bounce.wifi;

/**
 * Extended Kalman Filter (EKF) for 2D position tracking with Wi-Fi RSSI measurements.
 * State vector: [x, y, vx, vy] - position and velocity in 2D
 * Measurements: RSSI-based distances from multiple APs
 */
public class PositionEKF {

    // State vector: [x, y, vx, vy]
    private double[] x = new double[4];  // state estimate
    private double[][] P = new double[4][4];  // error covariance

    // Process noise covariance
    private double[][] Q = new double[4][4];
    
    // Measurement noise covariance (per AP)
    private double R = 1.0;  // measurement noise variance (distance^2)

    // Time step
    private double dt = 1.0;  // seconds

    // AP positions (known)
    private java.util.Map<String, Trilateration.Point2D> apPositions = new java.util.HashMap<>();

    // Last update time
    private long lastUpdateTime = 0;

    public PositionEKF() {
        initialize();
    }

    private void initialize() {
        // Initial state: unknown position, zero velocity
        x[0] = 0;  // x
        x[1] = 0;  // y
        x[2] = 0;  // vx
        x[3] = 0;  // vy
        
        // Initialize covariance - high uncertainty initially
        for (int i = 0; i < 4; i++) {
            for (int j = 0; j < 4; j++) {
                P[i][j] = (i == j) ? 100.0 : 0.0;
            }
        }

        // Process noise - small position noise, larger velocity noise
        Q = new double[][]{
            {0.01, 0,    0,     0},
            {0,    0.01, 0,     0},
            {0,    0,    0.1,   0},
            {0,    0,    0,     0.1}
        };
    }

    /**
     * Add known AP position.
     */
    public void addAccessPoint(String bssid, double x, double y) {
        apPositions.put(bssid, new Trilateration.Point2D(x, y));
    }

    /**
     * Set measurement noise variance.
     */
    public void setMeasurementNoise(double r) {
        this.R = r;
    }

    /**
     * Set time step.
     */
    public void setTimeStep(double dt) {
        this.dt = dt;
    }

    /**
     * Predict step - propagate state forward in time.
     */
    public void predict(double dt) {
        this.dt = dt;

        // State transition matrix F for constant velocity model
        double[][] F = {
            {1, 0, dt, 0},
            {0, 1, 0, dt},
            {0, 0, 1, 0},
            {0, 0, 0, 1}
        };

        // Predict state: x = F * x
        double[] xNew = new double[4];
        for (int i = 0; i < 4; i++) {
            xNew[i] = 0;
            for (int j = 0; j < 4; j++) {
                xNew[i] += F[i][j] * x[j];
            }
        }
        x = xNew;

        // Predict covariance: P = F * P * F^T + Q
        double[][] PNew = new double[4][4];
        double[][] FP = multiply(F, P);
        double[][] FTP = transpose(F);
        
        // P = F * P * F^T + Q
        double[][] temp = multiply(FP, FTP);
        for (int i = 0; i < 4; i++) {
            for (int j = 0; j < 4; j++) {
                P[i][j] = temp[i][j] + Q[i][j];
            }
        }
    }

    /**
     * Update step with distance measurement from an AP.
     */
    public void update(String bssid, double measuredDistance) {
        Trilateration.Point2D apPos = apPositions.get(bssid);
        if (apPos == null) {
            return; // Unknown AP
        }

        // Predicted position
        double px = x[0];
        double py = x[1];

        // Predicted distance to this AP
        double dx = x[0] - apPos.x;
        double dy = x[1] - apPos.y;
        double predictedDist = Math.sqrt(dx * dx + dy * dy);

        if (predictedDist < 0.1) {
            return; // Too close, avoid division by zero
        }

        // Jacobian H = dh/dx where h = sqrt((x-ax)^2 + (y-ay)^2)
        double[] H = new double[4];
        H[0] = dx / predictedDist;  // dh/dx
        H[1] = dy / predictedDist;  // dh/dy
        H[2] = 0;  // dh/dvx = 0
        H[3] = 0;  // dh/dvy = 0

        // Innovation (measurement residual)
        double y = measuredDistance - predictedDist;

        // Innovation covariance S = H * P * H^T + R
        double S = 0;
        for (int i = 0; i < 4; i++) {
            for (int j = 0; j < 4; j++) {
                S += H[i] * P[i][j] * H[j];
            }
        }
        S += R;

        // Kalman gain K = P * H^T * S^-1
        double[] K = new double[4];
        for (int i = 0; i < 4; i++) {
            double sum = 0;
            for (int j = 0; j < 4; j++) {
                sum += P[i][j] * H[j];
            }
            K[i] = sum / S;
        }

        // Update state: x = x + K * y
        for (int i = 0; i < 4; i++) {
            x[i] += K[i] * y;
        }

        // Update covariance: P = (I - K*H) * P
        double[][] PNew = new double[4][4];
        for (int i = 0; i < 4; i++) {
            for (int j = 0; j < 4; j++) {
                double val = P[i][j];
                for (int k = 0; k < 4; k++) {
                    val -= K[i] * H[k] * P[k][j];
                }
                P[i][j] = val;
            }
        }
        P = PNew;
    }

    /**
     * Update with multiple AP measurements at once (batch update).
     */
    public void updateBatch(java.util.Map<String, Double> measurements) {
        // For each measurement, perform sequential update
        for (java.util.Map.Entry<String, Double> entry : measurements.entrySet()) {
            update(entry.getKey(), entry.getValue());
        }
    }

    /**
     * Get current position estimate.
     */
    public double[] getPosition() {
        return new double[]{x[0], x[1]};
    }

    /**
     * Get current velocity estimate.
     */
    public double[] getVelocity() {
        return new double[]{x[2], x[3]};
    }

    /**
     * Get position uncertainty (standard deviation in meters).
     */
    public double getPositionUncertainty() {
        return Math.sqrt(P[0][0] + P[1][1]);
    }

    /**
     * Initialize filter with known position.
     */
    public void initialize(double xPos, double yPos) {
        x[0] = xPos;
        x[1] = yPos;
        x[2] = 0;
        x[3] = 0;
        
        // Reduce covariance after initialization
        for (int i = 0; i < 4; i++) {
            for (int j = 0; j < 4; j++) {
                P[i][j] = (i == j) ? (i < 2 ? 1.0 : 10.0) : 0.0;
            }
        }
    }

    // Helper: matrix multiplication
    private double[][] multiply(double[][] A, double[][] B) {
        int rowsA = A.length;
        int colsA = A[0].length;
        int colsB = B[0].length;
        double[][] result = new double[rowsA][colsB];
        
        for (int i = 0; i < rowsA; i++) {
            for (int j = 0; j < colsB; j++) {
                double sum = 0;
                for (int k = 0; k < A[0].length; k++) {
                    sum += A[i][k] * B[k][j];
                }
                result[i][j] = sum;
            }
        }
        return result;
    }

    // Helper: matrix transpose
    private double[][] transpose(double[][] A) {
        int rows = A.length;
        int cols = A[0].length;
        double[][] result = new double[cols][rows];
        for (int i = 0; i < rows; i++) {
            for (int j = 0; j < cols; j++) {
                result[j][i] = A[i][j];
            }
        }
        return result;
    }

    /**
     * Process a batch of scan results.
     * Call this periodically with new scan results.
     */
    public void processScanResults(java.util.List<Trilateration.AccessPoint> aps, long timestamp) {
        double dt = (timestamp - lastUpdateTime) / 1000.0;  // convert to seconds
        if (dt <= 0) dt = 1.0;
        if (dt > 10) dt = 1.0;  // cap at 1 second

        predict(dt);
        
        // Update with all AP measurements
        java.util.Map<String, Double> measurements = new java.util.HashMap<>();
        for (Trilateration.AccessPoint ap : aps) {
            measurements.put(ap.bssid, ap.distance);
        }
        updateBatch(measurements);
        
        lastUpdateTime = timestamp;
    }

    /**
     * Get current 2D position estimate.
     */
    public Trilateration.Point2D getPosition2D() {
        return new Trilateration.Point2D(x[0], x[1]);
    }

    /**
     * Get position covariance matrix (2x2 for position only).
     */
    public double[][] getPositionCovariance() {
        return new double[][]{
            {P[0][0], P[0][1]},
            {P[1][0], P[1][1]}
        };
    }
}