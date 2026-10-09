# CREATE_NEW_APP_TEMPLATE.md
## App Identity (EDIT THESE)
APP_NAME: "TGAPP"
PACKAGE_NAME: "com.bounce.tgapp"
PLAY_STORE_ID: "tgapp-pro"
PRICE_TIER: "yearly_599"  # $5.99/yr

## Feature Tiers (EDIT THESE)
FREE_FEATURES:
  - core_positioning
  - basic_visualization
  - trail_recording
  - theme_toggle
  - gpx_export
  - voice_alerts

PRO_FEATURES:
  - advanced_mesh
  - ar_overlay
  - fleet_keys
  - priority_updates
  - offline_maps
  - hazard_reporting_premium

## Integration Points (DO NOT EDIT - Encapsulated in BOUNCE Documentation)
BOUNCE_INTEGRATION:
  shared_keystore: "bounce_license"
  broadcast_action: "LICENSE_UPDATED"
  feature_gate_class: "FeatureGate"
  license_jwt_public_key: "-----BEGIN PUBLIC KEY-----\nMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAn...\n-----END PUBLIC KEY-----"

TGAPP_RESPONSIBILITIES:
  - billing
  - license_validation
  - apk_delivery
  - fleet_key_mgmt
  - remote_config

## BOUNCE Document References (Encapsulated Context)
FORENSIC_CONTEXT:
  - 91 versions analyzed (v1.0.0 to v1.0.91)
  - APK anomalies: v1.0.77,80,81,82,83
  - EKF bug fixed in v1.0.92 (PositionEKF.java:38)
  - MainActivity grew from 160 to 1,416 lines
  - Zero revenue across 91 versions

SPREADSHEETS_CREATED:
  - Future_Progress_Spreadsheet.csv (FP018-FP021: TGAPP items)
  - TGAPP_Spreadsheet.csv (32 monetization items)
  - Best_Practices_AntiPatterns_Spreadsheet.csv
  - Repeated_Errors_Catalog_Spreadsheet.csv

SECTIONS_COMPLETED:
  - Section 7: Future Progress Roadmap (FP018-FP021 detailed)
  - Section 8: TGAPP Monetization Architecture (pending)

ROADMAP_ITEMS_FOR_THIS_APP:
  FP018: TGAPP Core (P0, v1.0.93)
  FP019: Purchase Verification (P0, v1.0.93)
  FP020: Feature Gating (P0, v1.0.93)
  FP021: Split Updater (P1, v1.0.94)

## Build Configuration (EDIT THESE)
BUILD_CONFIG:
  min_sdk: 28
  target_sdk: 34
  compile_sdk: 34
  kotlin_version: "1.9.20"
  compose_version: "1.5.4"
  billing_version: "6.2.1"
  firebase_bom: "32.7.0"

## Signing Config (EDIT THESE - Use same key as Bounce for APK updates)
SIGNING_CONFIG:
  keystore_path: "keystore/bounce-release.keystore"
  key_alias: "bounce-release-key"
  # Store passwords in CI/CD secrets, not here

## Backend Config (EDIT THESE)
BACKEND_CONFIG:
  firebase_project: "bounce-tgapp-prod"
  functions_region: "us-central1"
  receipt_validation_endpoint: "validateReceipt"
  license_jwt_algorithm: "RS256"
  license_duration_days: 30

## Fleet Key Config (EDIT THESE)
FLEET_CONFIG:
  root_key_derivation: "HKDF-SHA256"
  key_rotation_days: 90
  max_fleet_size: 10000
  provisioning_method: "QR_CODE"

## Update Delivery Config (EDIT THESE)
UPDATE_CONFIG:
  apk_hosting: "firebase_app_distribution"
  delta_updates: false
  forced_update_threshold_days: 60
  notification_channel: "tgapp_updates"

## Testing Checklist
TESTING:
  - [ ] Play Store billing flow (test tracks)
  - [ ] License validation (valid/expired/revoked)
  - [ ] Feature gating (free vs pro)
  - [ ] APK delivery (signature verification)
  - [ ] Fleet key provisioning
  - [ ] Offline license check (cached JWT)
  - [ ] Bounce integration (broadcast receive)

## Launch Checklist
LAUNCH:
  - [ ] Play Store listing (screenshots, description)
  - [ ] Privacy policy URL
  - [ ] Terms of service URL
  - [ ] Support email
  - [ ] Firebase project configured
  - [ ] Keystore backed up
  - [ ] CI/CD pipeline (GitHub Actions)
  - [ ] Monitoring/alerting (Crashlytics, Play Console)

## Version Template
VERSION_TEMPLATE:
  major: 1
  minor: 0
  patch: 0
  build: 1
  # Increment: patch for bugfixes, minor for features, major for breaking

## Notes
NOTES:
  This template is encapsulated within the BOUNCE Evolution documentation.
  See Section 7 (Future Progress Roadmap) and Section 8 (TGAPP Monetization Architecture)
  for full context on why this app exists and how it integrates with Bounce.
  
  The "Title" of this app (TGAPP) holds the monetization logic while Bounce
  remains the free, open-source positioning core. This separation was requested
  by the user to enable paid features without complicating the main app.