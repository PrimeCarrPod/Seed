# 02 - APK Distribution on Aptoide: How It Works and What to Do

Correct domains: the store is **aptoide.com** (consumer store). The developer side is **connect.aptoide.com** (Aptoide Connect, documentation at docs.connect.aptoide.com). "apptoid.com" does not appear to be the right domain.

Facts below were checked against Aptoide's own documentation on the date of this report. Items marked **verify** should be re-checked in your Aptoide Connect console before you spend money.

---

## 1. Short answer: how the money works

- Aptoide is a store. You upload a signed APK, Aptoide's admin team reviews it, and it is published to Aptoide and partner stores.
- **Aptoide Connect currently supports free apps.** Its FAQ says: "Aptoide currently supports only free apps." Its developer agreement also mentions paid apps. **Verify in your console before relying on paid apps.**
- Revenue on Aptoide comes from **in-app products** (purchases inside the app), which you build with the Aptoide Billing SDK, or from **in-app advertising**. This is the model Aptoide describes: "developers can monetize their apps on Aptoide through in-app purchases using the Aptoide Billing SDK."
- Aptoide's marketing page advertises a **75% base split** of net sales on Aptoide and partner stores. Your exact rate is in the Revenue Share section of your console. **Verify.**
- **Cost:** Aptoide Connect account subscription is **$69 USD or EUR per year**, auto-renewing. Refundable within the first 30 days if none of your apps have been published. Without an active subscription, manual reviews do not start.
- **Google requirement (new this year):** Google's Android Developer Verification applies to apps installed on certified Android devices **regardless of where the app came from**, including Aptoide. See section 3.

Realistic expectation: a free app on Aptoide earns very little until it has installs. Treat the first apps as proof-of-work and lead generators, not as income, unless you drive traffic.

## 2. Your options for the Bounce / LandOLil / TGE apps

| Route | Cost | Can charge money? | Gate | Best for |
|---|---|---|---|---|
| Aptoide Connect (free app, in-app purchases or ads) | $69/yr + Google verification ($25 one-time) | Yes via IAP; paid apps unclear. Verify | Manual review, signed APK, verified developer, privacy policy | First store listing, proof of work |
| Google Play (one-time registration fee; currently $25, confirm) | One-time fee | Yes, paid apps and IAP | Strict policy review, Data Safety form, closed testing for new personal accounts (verify) | Main store for paid apps |
| Direct APK download (Gumroad, own site) | Platform fee | Yes | Google verification still applies on enforced devices; users must allow unknown sources | Not recommended for public sale |
| Aptoide free download only | $69/yr | No | Same as above | Visibility |

**Recommendation:** list **Bounce v1.0.92** on Aptoide as a free app, add ads or an optional in-app purchase later, and submit to Google Play when the privacy policy and permissions are cleaned up. Do not try to sell raw APK files.

## 3. Google Android Developer Verification (do this first)

This is a live requirement with a deadline already in effect.

- **Enforcement started September 30, 2026** in Brazil, Indonesia, Singapore, and Thailand, for installs from participating stores. GetApps (Xiaomi) and OPPO App Market are Aptoide Connect partners, so an Aptoide-distributed app can be affected there. Global enforcement is planned for 2027.
- **Unregistered apps are blocked** from normal install and update on certified devices where enforced. Installs over ADB from a computer still work.
- **Identity:** you verify once, as an individual or organization. Individuals provide a legal name, address, government photo ID, and proof of address. Organizations also need a D-U-N-S number (up to 30 business days).
- **Fee:** Full Distribution in the Android Developer Console is a one-time **US$25**. Limited Distribution is free but capped at 20 devices, so it cannot be used for public sale.
- **Package name registration:** each package name is registered with the SHA-256 fingerprint of the key that signs the APK users install. You prove ownership by building a release APK signed with that key and uploading it with a challenge file.
- If you already publish on Google Play with the same key, most registration is automatic.

## 4. Pre-submission checklist (per app)

### 4a. Signing (blocker for every app today)

Every "release" APK in the repo is signed with a debug key. The signer on the Bounce 1.0.92 APK is "Bounce Debug." Fix this first.

1. Create a release keystore **outside the repo**, for example `~/keys/csm_release.jks`. Store the password in a password manager. Never commit it or hard-code it in build scripts.
   ```bash
   keytool -genkeypair -v -keystore ~/keys/csm_release.jks -alias csm_release -keyalg RSA -keysize 4096 -validity 10000
   ```
2. Sign with apksigner using v2 and v3 signing (not v1-only):
   ```bash
   apksigner sign --ks ~/keys/csm_release.jks --ks-key-alias csm_release --out Bounce-release.apk Bounce-aligned.apk
   apksigner verify --print-certs Bounce-release.apk
   ```
   Read the passwords from environment variables or a prompt, not from the script.
3. Record the SHA-256 fingerprint from `apksigner verify --print-certs`. You will register it with Google.
4. Keep the release keystore backed up. If you lose it, you cannot update the app under the same package name.

### 4b. Package identity (verify before registering)

- `05_BOUNCE/AndroidManifest.xml` declares `com.csmlabs.bounce` and versionName 1.0.
- The inventory agent reported the 1.0.92 APK as `com.carrpod.bounce`.
- Confirm the package ID in the APK you will upload:
  ```bash
  aapt2 dump badging CSMWip/05_BOUNCE/FINAL_DELIVERABLES/apks/Bounce-v1.0.92.apk | head -3
  ```
- Pick one package name for the store and keep it. Changing it later creates a new app.

### 4c. Store and legal assets (missing everywhere)

- **Privacy policy** hosted at a public URL. Bounce uses location-related and Wi-Fi/BLE scanning and device sensors, so the policy must explain exactly what is collected, why, and whether it leaves the device. The app runs from local assets, which helps; state that clearly.
- **Terms of service** (short, plain language).
- **Support email** you will read.
- **Listing:** title, short description, long description, category, and content rating answers.
- **Icon:** 512x512 PNG. Bounce has an icon; LandOLil's icon reference is broken and must be fixed.
- **Feature graphic and at least 4 phone screenshots.** Capture them from a real device or emulator.
- **Version metadata:** the in-app HTML title still says v1.0.91. Fix it before release.
- **Permissions review:** remove any permission the app does not use (LandOLil only needs INTERNET if it actually loads remote content).

### 4d. Build hygiene

- Increment `versionCode` for every upload. Aptoide rejects a version code that is too low.
- Use `zipalign -f 4` before signing with apksigner.
- Test install on a physical Android device before submission.

## 5. Submission steps on Aptoide Connect

1. Create an account at connect.aptoide.com and subscribe ($69/yr). Confirm the console shows an active subscription.
2. Complete the Android developer identity verification (Google, section 3).
3. In the console, click **Add App**, choose **Android**, answer "Is your app in Google Play?" with **No**, and enter the package name.
4. Prove ownership of the package name (follow the prompt; it may use a signed APK challenge).
5. Upload the signed APK (`.apk`, plus `.obb` if used).
6. If you add in-app purchases later, integrate the Aptoide Billing SDK and test in the sandbox before the release.
7. Choose distribution countries (start with United States) and channels.
8. Enter app information, localized assets, and the privacy policy link.
9. Complete the Certified Developer Distribution Policy annex (data privacy questions).
10. Submit. Review is manual. Approval publishes the app to Aptoide and partner stores automatically; you can also schedule the release.

Review restrictions to read before submitting: "Restrictions" and "Review Process" pages in the docs.

## 6. Order of work for the first two apps

**Bounce v1.0.92**
1. Confirm package name (4b).
2. Create release keystore; re-sign (4a).
3. Fix in-app version title; set versionCode.
4. Write privacy policy and terms; host on a free static page (GitHub Pages, Netlify, or Cloudflare Pages).
5. Capture icon, feature graphic, and screenshots.
6. Google verification and package registration.
7. Aptoide subscription and submission.

**LandOLil v7b**
1. Fix `android:icon` and add PNG mipmaps (current icon is adaptive-only).
2. Re-sign with v2 and v3 (the current APK is v1-only and may be rejected on newer Android).
3. Remove INTERNET if not needed.
4. Privacy policy, listing assets, submission.

**TGE E4 v4.0.0-E4**
1. The keystore referenced by its build script is missing. Create a new release key instead; do not try to reproduce the debug key.
2. Add icon densities and version attributes in the manifest source.
3. Privacy policy, listing assets, submission.

**Do not submit TGE E5.** It is a 17 KB placeholder shell.

## 7. Money-making sequence for apps (after first approval)

1. Free listing for installs and reviews.
2. Add an optional in-app purchase (for example, an unlock for advanced visualization) using the Aptoide Billing SDK, tested in sandbox.
3. Repeat the same process for the next app (LandOLil), reusing the privacy policy template and the release pipeline.
4. Later, submit the paid or IAP versions to Google Play, which supports paid apps directly.

## 8. Honest risks

- Aptoide's own documentation is not fully consistent about paid apps (FAQ says free only; agreement mentions paid). Verify with support before building a paid model around it.
- The $69 annual fee and $25 Google fee are fixed costs. Each app needs at least one install to recover them through IAP or ads.
- Bounce asks for location, nearby Wi-Fi, Bluetooth, and activity-recognition permissions. Be specific in the privacy policy, and expect a review question about each one.
- A debug-signed build can be rejected by Aptoide, and it cannot be registered under Google verification as a production key. Fix signing first.
- Keep the release keystore, the Google Developer account, and the Aptoide login under your own name and a dedicated email address.

## 9. Sources (Aptoide and Google)

- Aptoide Connect: developer subscription, submission overview, FAQs, billing SDK, and Android Developer Verification pages at docs.connect.aptoide.com
- Developer Distribution Agreement: connect.aptoide.com/developers-distribution-policy
- Aptoide FAQ on monetization: en.aptoide.com/company/faq/how-do-developers-monetize-apps-on-aptoide
- Google Play Console Help and Android Developer Console guides (for verification steps)

Please confirm current fees and policies on those pages before paying; they change.
