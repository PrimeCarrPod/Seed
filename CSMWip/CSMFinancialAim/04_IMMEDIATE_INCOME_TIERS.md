# 04 - Immediate Income Tiers (Start This Week, Feed the Next Projects)

Your starting skills are the most valuable asset in this plan. Most of the repo's content is still unvalidated, so the fastest money comes from services and small, honest digital products. Shielding and Android products follow, once the foundation is in place.

Location assumptions: Santa Cruz, California. Items marked **verify** need a current check with the named agency or platform.

---

## Summary: the five tiers

| Tier | What you sell | First money | Start cost | Source in this repo |
|---|---|---|---|---|
| **T0** Tech services | Windows/Mac/Outlook/M365 setup, cleanup, migration, small-office IT | Days 1-7 | $0 | Your skills; `CSMScripts` Outlook tools (after sanitizing) |
| **T1** Digital products | 1920s Radio Design ebook; one reviewed Prime Electron PDF; APK build service | Weeks 1-3 | $0-50 | DeepResearch/1920s-Radio-Design; CSMScripts/android-toolkit |
| **T2** Android apps | Free Bounce, LandOLil, TGE E4 on Aptoide; later IAP or ads | Weeks 3-8 (fees and verification first) | ~$94 year one ($69 Aptoide + $25 Google) | CSMWip/05_BOUNCE, CSMApps/landolil, __PUBLISH_CSM__ |
| **T3** Shielding products | Certified shielding supplies (resell), measured test reports, branded passive line later | Weeks 2-6 | $200-500 (resell), $0-200 (test kit) | See `03_SHIELDING_PRODUCTS_TIER_PLAN.md` |
| **T4** B2B reports and consulting | Chile magnet briefing; model-bill briefs; evidence audits; docs audit | Months 2-4 | $0-500 | CSMMinesMagnets, 03_Legal_Enactment, CSMReadMe |

Run T0 and T1 at the same time. Start T2 and T3 in parallel once T0 is generating cash, because they have waiting periods (Google verification, supplier samples). Start T4 after one T1 product has sold, so you have a reference.

---

## T0 - Tech services (start today; income in 7 days)

**Offers to publish (one page each, flat price, you decide the figures after checking local competitors):**
1. Windows or Mac tune-up and backup setup
2. Data migration to a new computer (files, browser profiles, email, printers)
3. Outlook / Microsoft 365 setup, mailbox cleanup, shared-mailbox setup
4. Home-office network and printer setup
5. Small-office IT starter package (monthly support contract)
6. Backup and restore verification (test a restore, document it)

**Where to list (free or low cost):**
- Google Business Profile for your service area (Santa Cruz and the surrounding area). Verify your address or service-area setting as offered by Google. This is free and drives local calls.
- Upwork and Fiverr for remote support (set up a profile with two or three gigs; the platforms take a service fee; verify current rates).
- Nextdoor and local community groups (follow each group's self-promotion rules).
- Local small businesses in person: dentists, realtors, accountants, cafes. Bring a one-page service menu.

**Business setup (California, verify each):**
- Sole proprietor is the simplest start. Register a fictitious business name (DBA) with the Santa Cruz County Clerk if you use a business name.
- City of Santa Cruz business tax certificate (verify the current requirement and fee).
- A separate bank account for business income. Keep every receipt.
- Seller's permit from the California Department of Tax and Fee Administration (CDTFA) is required before you sell tangible goods (T3 Tier S1). Register before the first sale. Services and digital products have different sales-tax rules; verify with CDTFA.
- Set aside a percentage of profit for self-employment and income tax. Consult a CPA when income starts.

**Sanitize before using any repo scripts for client work:** the Outlook and Graph tools in `CSMScripts` contain token paths and personal data (see `01_REPO_PORTFOLIO_EVALUATION.md` section 9). Do not run them against a client mailbox until they are rewritten to use the client's own consent and credentials.

---

## T1 - Digital products (weeks 1-3)

### Product 1: "1920s Radio Design" PDF or ebook
- **Source:** `DeepResearch` 1920s Radio Design compendium (15 parts, 289 lines; maturity 4). Lowest-risk content in the repo.
- **Steps:**
  1. Combine the 15 parts into one document in order. Remove duplicated sections.
  2. Add a cover, table of contents, and a short "about" page.
  3. Use only public-domain or licensed images. Note image sources in the back matter.
  4. Export to PDF. Test on a phone.
  5. List on Gumroad or Payhip (digital download). Verify each platform's fees.
  6. Price guideline (estimate): $5-12. Test two prices.
- **Next:** a companion "radio restoration checklist" if the first one sells.

### Product 2: Android APK build and sign service
- **Source:** `CSMScripts/android-toolkit` (the only verified end-to-end pipeline: aapt2, javac, d8, zipalign, apksigner).
- **Before selling:** remove hard-coded passwords, replace `curl -k` with verified downloads, and create a documented template. Use the release keystore approach in `02_APK_APTOIDE_PLAYBOOK.md`.
- **Offer:** "I will build, sign, and prepare your Android APK for distribution." Price as a fixed fee per app (estimate); list on Upwork.

### Product 3: One reviewed "Prime Electron" PDF (conditional)
- **Source:** `CSMPublished` or `01_SubAtomic_Prime_Electron_Canonical` (maturity 3-4).
- **Condition:** label it "speculative theoretical framework, not peer reviewed." Remove any claims stated as established fact. Do not sell until a physicist has reviewed the sample chapter.

### Not yet
- DRONE-X build guide (`CSMFAB0200`): hold until one drone has been built and flight-tested. Sell only after a real build.
- CSMProtonics white paper: publish free as a lead magnet, with a disclaimer, before any paid sale.

---

## T2 - Android apps on Aptoide (weeks 3-8)

The full procedure is in `02_APK_APTOIDE_PLAYBOOK.md`. Summary:

1. **Week 1-2 (prerequisites):** create a release keystore; re-sign Bounce; confirm the package name; write a privacy policy and terms; prepare icon, feature graphic, and screenshots.
2. **Week 2:** create the Google Android Developer account (one-time US$25 Full Distribution), complete identity verification, and register the package name with the release key fingerprint. Start early; verification takes time.
3. **Week 2-3:** subscribe to Aptoide Connect ($69/yr), complete the submission for Bounce v1.0.92 as a free app.
4. **Week 6-8:** submit LandOLil v7b after fixing its icon and signature. Skip TGE E5 (placeholder).
5. **Monetization after approval:** add ads or an optional in-app purchase using Aptoide Billing SDK (verify ads and in-app product terms in the console).

Expectation: small revenue until installs grow. The apps are your proof of software delivery.

---

## T3 - Shielding products (weeks 2-6)

See `03_SHIELDING_PRODUCTS_TIER_PLAN.md`. Short sequence:

1. **Week 2:** contact 2-3 suppliers for certified static-shielding bags or RF pouches. Request the test certificates. Order samples.
2. **Week 2-3:** run the Wi-Fi measured-attenuation method on one sample; write a one-page test report; keep raw logs.
3. **Week 3-4:** register the seller's permit (CDTFA). List 10-20 units on Etsy or eBay (or Amazon, if its electronics and claims rules allow). Use only supplier-certified and self-measured numbers.
4. **Week 4-6:** sell the measured test-report service to people with shielding products they want to check.

Hard rule: no Carrington, GIC, EMP, or EMF-health claims. The repo's CSMFAB and CSMQuantum numbers are unverified.

---

## T4 - B2B reports and consulting (months 2-4)

Pick one and finish it before starting another.

| Offer | Source | Work to finish | Buyer | Notes |
|---|---|---|---|---|
| Chile magnetic-minerals briefing | CSMMinesMagnets (DOC-01 to DOC-10 done) | Refresh sources, add source table, fact-check, write executive summary | Magnet startups, investors, traders, suppliers | Most complete B2B asset in the repo; the 60-document plan is not required for the first sale |
| Model-bill briefing for advocacy | 03_Legal_Enactment Act 01 or Act 23 | Attorney review of form and legal accuracy; cover memo | Trade associations, policy shops, local governments | Do not present as enacted law; bills are unsponsored drafts |
| Evidence audit of a financial or technical claim | CSMPro financial model | Choose one claim (for example, the ceramic bearing cost), trace each input to a source, write a 2-page evidence sheet | Resilience vendors | Useful for honest positioning |
| Repo documentation audit | CSMReadMe pipeline | One-page offer and one before/after sample | Small software teams | Uses your existing repo tooling |
| Shielding test plan consulting | Your T3 method | Write a one-page test plan template | Product makers | Pricing per plan |

Grants and SBIR are longer-term (T5). The SAM/UEI registration and eligibility checks in CSMGrantCampaigns and CSMReach are required first. Do not submit until eligibility is confirmed.

---

## The flywheel: each tier creates assets for the next

```
T0 services ─► cash + testimonials + local contacts ─► fund T3 samples and T2 fees
T1 ebook/PDF ─► email list + sales page ─► launch point for T2 apps and T3 products
T2 apps ─► privacy policy, signing, store process ─► reused for landing-page template and android-toolkit service
T3 test data ─► measured numbers ─► replace unverified figures in CSMFAB/CSMQuantum docs
T4 reports ─► references and case studies ─► higher-priced consulting and grant credibility
```

Concrete next projects this creates (each one feeds the next tier):
1. **Shielding test report template** (T3 to T4): one reusable report format with method and limits.
2. **android-toolkit cleanup** (T1 to T2): remove credentials, add tests, produce a single "build and sign" CLI.
3. **Aptoide and Google listing kit** (T2): privacy policy, terms, and listing templates reused for each app.
4. **Chile briefing v1** (T4): DOC-01 to DOC-10 packaged with a source appendix.
5. **1920s radio series v2** (T1): if product 1 sells, add a second volume.

---

## 30 / 60 / 90 day schedule

**Days 1-7**
- [ ] Publish T0 service menu (6 items) on Google Business Profile, Upwork, and Fiverr.
- [ ] Rotate every credential listed in `01_REPO_PORTFOLIO_EVALUATION.md` section 9 (you do this with the account owners). Remove credentials from the repo files.
- [ ] Open a separate business bank account; start a receipts folder.
- [ ] Assemble the 1920s Radio Design PDF draft.

**Days 8-30**
- [ ] First T0 client (target: first paid job within 2 weeks).
- [ ] List the 1920s Radio Design PDF on one storefront; test price.
- [ ] Create Google Developer account; start identity verification.
- [ ] Order shielding supply samples; register CDTFA seller's permit before the first sale.
- [ ] Write Bounce privacy policy; re-sign Bounce with a release key.

**Days 31-60**
- [ ] Submit Bounce to Aptoide as free; add the Google package registration.
- [ ] Publish the first measured shielding test report.
- [ ] List shielding supplies (10-20 units).
- [ ] Choose one T4 offer and produce a sample.

**Days 61-90**
- [ ] Submit LandOLil to Aptoide after icon and signature fixes.
- [ ] Decide on in-app purchase or ad model based on installs.
- [ ] Review sales and service revenue; scale only the tier that produced cash.
- [ ] Decide whether to pursue the DHS SBIR (requires entity registration and confirmed solicitation).

---

## Stop-doing list (this matters more than any new idea)

- Stop generating more Acts, volumes, and articles until one of them sells. The repo's bottleneck is verification and packaging, not production volume.
- Stop listing dollar projections in any document you share. Replace them with measured or quoted figures.
- Do not sell any document that contains EMF-health, medical, or "protection" claims.
- Do not run unreviewed scripts against client or personal email.

## Risk register (short)

| Risk | Impact | Control |
|---|---|---|
| Health or safety claims in products | Regulatory action, refunds, liability | Claims rules in `03_...`; remove before sale |
| Hard-coded credentials in repo | Account takeover, reputational damage | Rotate and remove before any publishing (T2, T1) |
| Debug-signed or missing-key apps | Rejected uploads, blocked updates | Release keystore; Google verification |
| Personal data in logs and outreach files | Privacy violation | Keep private; sanitize before any sharing |
| Mass unsolicited email | Spam complaints, legal exposure | Stop mass sends; use opt-in lists |
| Unverified citations | Reputational damage | Fact-check top claims before any sale |
| Missing business registrations | Fines, unpaid sales tax | CDTFA, DBA, business tax certificate |
| Taking on too many tiers | No sales anywhere | Run one product per tier at a time |

## Costs at a glance (planning estimates; verify before paying)

- Google Android Developer account: $25 one-time.
- Aptoide Connect subscription: $69 per year.
- Shielding samples and first stock: $200-500.
- Local business registration and seller's permit: fees vary; verify with the City, County, and CDTFA.
- Lab coupon test for real shielding-effectiveness data: get quotes; not included.

Start with T0 today. Its income is the cash flow that pays for everything else.
