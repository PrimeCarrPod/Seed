# TGAPP_Monetization_Architecture — Piece 01/13
## Article A8: A8-08 — TGAPP Monetization Architecture
**Piece:** 01 of 13  
**Generated:** 2026-10-08 06:55:00 UTC

---

# Section 8: TGAPP Monetization Architecture — Overview & Core App

## Introduction
This section documents the complete architecture for **TGAPP** (The Great App / Updater App) — a separate, paid Android application that encapsulates monetization logic while Bounce remains the free, open-source positioning core. This separation was specifically requested to enable paid features without complicating the main app.

**Source Spreadsheet:** `TGAPP_Spreadsheet.csv` (33 rows, 12 columns)
**Priority Distribution:** P0=13, P1=11, P2=9

---

## TGAPP Core Architecture (TG001-TG004)

### TG001: TGAPP Application Shell
- **Category:** Core | **Priority:** P0 | **Effort:** High | **Target:** 1.0.0
- **Description:** Standalone Android app (APK) for paid updates and license management
- **Package Name:** `com.carrpod.tgapp` (separate from Bounce's `com.carrpod.bounce`)
- **Architecture:** Minimal Activity + Service + BroadcastReceiver
- **Keystore:** Must use **same signing key** as Bounce for APK update delivery (TG007)

### TG002: Purchase Verification
- **Category:** Core | **Priority:** P0 | **Effort:** Medium | **Target:** 1.0.0
- **Description:** Verify user purchased TGAPP via Google Play Billing
- **Implementation:** 
  - Client: Play Billing Library 6+ (`BillingClient`)
  - Server: Firebase Function validates receipt with Google Play Developer API
  - Output: Signed JWT license key (RS256, 30-day expiry)

### TG003: Device-Specific Keys
- **Category:** Core | **Priority:** P0 | **Effort:** Medium | **Target:** 1.0.0
- **Description:** License keys bound to device identity to prevent sharing
- **Binding:** Android ID + Package Signature + SafetyNet/Play Integrity attestation
- **Storage:** Android Keystore (hardware-backed StrongBox/TEE)

### TG004: Key Expiry/Renewal
- **Category:** Core | **Priority:** P1 | **Effort:** Medium | **Target:** 1.0.1
- **Description:** Subscription model with time-limited keys
- **Mechanism:** JWT `exp` claim; background renewal via WorkManager
- **Revenue:** Recurring subscription ($4.99/mo per vehicle)

---

## Forensic Context (Why TGAPP Exists)

**91 Versions Analyzed, $0 Revenue:**
- No in-app purchases, subscriptions, ads, or data monetization
- Pure hobby project across v1.0.0 → v1.0.91
- User requested separate paid app for updates + premium features

**Architecture Debt Driving Separation:**
- MainActivity: 1,416 lines (God class)
- Updater code: ~150 lines mixed with positioning logic
- Adding billing + licensing would worsen coupling

**TGAPP Solves:**
1. Revenue generation (Freemium: Bounce free, TGAPP premium)
2. Clean separation (Bounce = positioning, TGAPP = monetization)
3. Rapid updates (bypass Play Store review via TG007)
4. Fleet features gated behind license (TG009-TG012)

---

*End of Piece 01/13 — See Piece 02 for Bounce↔TGAPP Integration*