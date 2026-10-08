package com.carrpod.bounce.wifi;

/**
 * Trilateration module for 2D position estimation from multiple AP distances.
 * Uses least-squares multilateration for 2D position estimation from 3+ AP distances.
 */
public class Trilateration {

    /**
     * Represents a 2D point with x, y coordinates.
     */
    public static class Point2D {
        public final double x;
        public final double y;

        public Point2D(double x, double y) {
            this.x = x;
            this.y = y;
        }

        public double distanceTo(Point2D other) {
            double dx = this.x - other.x;
            double dy = this.y - other.y;
            return Math.sqrt(dx * dx + dy * dy);
        }

        @Override
        public String toString() {
            return String.format("(%.2f, %.2f)", x, y);
        }
    }

    /**
     * Access point with known position and measured distance.
     */
    public static class AccessPoint {
        public final String bssid;
        public final String ssid;
        public final Point2D position;  // Known position in meters (relative coordinate system)
        public final double distance;    // Measured distance in meters
        public final double weight;      // Weight based on signal quality/reliability

        public AccessPoint(String bssid, String ssid, Point2D position, double distance, double weight) {
            this.bssid = bssid;
            this.ssid = ssid;
            this.position = position;
            this.distance = distance;
            this.weight = weight;
        }
    }

    /**
     * Result of trilateration.
     */
    public static class Result {
        public final Point2D position;
        public final double error;           // RMS error
        public final int usedAps;            // Number of APs used
        public final double gdop;            // Geometric Dilution of Precision
        public final boolean valid;

        public Result(Point2D position, double error, int usedAps, double gdop, boolean valid) {
            this.position = position;
            this.error = error;
            this.usedAps = usedAps;
            this.gdop = gdop;
            this.valid = valid;
        }

        public boolean isValid() {
            return valid && usedAps >= 3 && error < 50.0; // Valid if 3+ APs and error < 50m
        }
    }

    /**
     * Perform 2D trilateration using weighted least squares multilateration.
     * 
     * @param aps List of access points with known positions and measured distances
     * @return Trilateration result with estimated position and quality metrics
     */
    public static Result trilaterate(java.util.List<AccessPoint> aps) {
        if (aps == null || aps.size() < 3) {
            return new Result(new Point2D(0, 0), Double.MAX_VALUE, aps != null ? aps.size() : 0, Double.MAX_VALUE, false);
        }

        // Filter out APs with invalid distances
        java.util.List<AccessPoint> validAps = new java.util.ArrayList<>();
        for (AccessPoint ap : aps) {
            if (ap.distance > 0 && ap.distance < 1000 && ap.weight > 0) {
                validAps.add(ap);
            }
        }

        if (validAps.size() < 3) {
            return new Result(new Point2D(0, 0), Double.MAX_VALUE, validAps.size(), Double.MAX_VALUE, false);
        }

        // Weighted least squares multilateration
        // Solve: (x - xi)^2 + (y - yi)^2 = di^2
        // Linearized: -2*xi*x - 2*yi*y + (x^2 + y^2) = di^2 - xi^2 - yi^2
        
        int n = validAps.size();
        double[][] A = new double[n][3];
        double[] b = new double[n];
        double[] w = new double[n];

        for (int i = 0; i < n; i++) {
            AccessPoint ap = validAps.get(i);
            double xi = ap.position.x;
            double yi = ap.position.y;
            double di = ap.distance;

            A[i][0] = -2 * xi;
            A[i][1] = -2 * yi;
            A[i][2] = 1;  // for (x^2 + y^2) term
            
            b[i] = di * di - xi * xi - yi * yi;
            w[i] = ap.weight;
        }

        // Weighted least squares: (A^T W A) x = A^T W b
        double[][] ATA = new double[3][3];
        double[] ATb = new double[3];

        for (int i = 0; i < n; i++) {
            double wi = w[i];
            for (int j = 0; j < 3; j++) {
                ATb[j] += wi * A[i][j] * b[i];
                for (int k = 0; k < 3; k++) {
                    ATA[j][k] += wi * A[i][j] * A[i][k];
                }
            }
        }

        // Solve 3x3 linear system using Gaussian elimination
        double[] solution = solveLinearSystem(ATA, ATb);
        if (solution == null) {
            return new Result(new Point2D(0, 0), Double.MAX_VALUE, validAps.size(), Double.MAX_VALUE, false);
        }

        double x = solution[0];
        double y = solution[1];
        // z = solution[2] represents x^2 + y^2 (not used directly)

        Point2D estimated = new Point2D(x, y);

        // Calculate RMS error
        double sumSqError = 0;
        for (AccessPoint ap : validAps) {
            double estimatedDist = estimated.distance(ap.position);
            double error = estimatedDist - ap.distance;
            sumSqError += error * error;
        }
        double rmsError = Math.sqrt(sumSqError / validAps.size());

        // Calculate GDOP (simplified)
        double gdop = calculateGdop(validAps, estimated);

        return new Result(estimated, rmsError, validAps.size(), gdop, true);
    }

    /**
     * Solve 3x3 linear system using Gaussian elimination with partial pivoting.
     */
    private static double[] solveLinearSystem(double[][] A, double[] b) {
        int n = 3;
        double[][] aug = new double[n][n + 1];
        
        for (int i = 0; i < n; i++) {
            System.arraycopy(A[i], 0, aug[i], 0, n);
            aug[i][n] = b[i];
        }

        // Gaussian elimination with partial pivoting
        for (int col = 0; col < n; col++) {
            // Find pivot
            int maxRow = col;
            for (int row = col + 1; row < n; row++) {
                if (Math.abs(aug[row][col]) > Math.abs(aug[maxRow][col])) {
                    maxRow = row;
                }
            }

            if (Math.abs(aug[maxRow][col]) < 1e-10) {
                return null; // Singular matrix
            }

            // Swap rows
            if (maxRow != col) {
                double[] temp = aug[col];
                aug[col] = aug[maxRow];
                aug[maxRow] = temp;
            }

            // Normalize pivot row
            double pivot = aug[col][col];
            for (int j = col; j <= n; j++) {
                aug[col][j] /= pivot;
            }

            // Eliminate other rows
            for (int row = 0; row < n; row++) {
                if (row != col) {
                    double factor = aug[row][col];
                    for (int j = col; j <= n; j++) {
                        aug[row][j] -= factor * aug[col][j];
                    }
                }
            }
        }

        double[] x = new double[n];
        for (int i = 0; i < n; i++) {
            x[i] = aug[i][n];
        }
        return x;
    }

    /**
     * Calculate Geometric Dilution of Precision (GDOP).
     * Lower is better. Based on geometry of AP positions relative to estimate.
     */
    private static double calculateGdop(java.util.List<AccessPoint> aps, Point2D estimate) {
        if (aps.size() < 3) return Double.MAX_VALUE;

        // Simplified GDOP based on angular separation of APs
        double[] angles = new double[aps.size()];
        for (int i = 0; i < aps.size(); i++) {
            AccessPoint ap = aps.get(i);
            angles[i] = Math.atan2(ap.position.y - estimate.y, ap.position.x - estimate.x);
        }

        // Sort angles
        java.util.Arrays.sort(angles);

        // Calculate maximum angular gap
        double maxGap = 0;
        for (int i = 1; i < angles.length; i++) {
            double gap = angles[i] - angles[i - 1];
            if (gap > maxGap) maxGap = gap;
        }
        // Check wrap-around gap
        double wrapGap = (angles[0] + 2 * Math.PI) - angles[angles.length - 1];
        if (wrapGap > maxGap) maxGap = wrapGap;

        // GDOP inversely proportional to angular coverage
        // Perfect coverage (evenly spaced) gives maxGap = 2π/n, GDOP ~ 1
        // Large gap means poor geometry, high GDOP
        double idealGap = 2 * Math.PI / aps.size();
        return maxGap / idealGap;
    }
}