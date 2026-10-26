# 03 - Shielding Products: Tiered Path (Honest, Testable, Sellable)

Scope: the shielding and protection products in the repository (CSMFAB, CSMMetal, CSMQuantum, CSMArchive, CSMHuman). The repository contains **designs and claims, but no test data**. Anything you sell must be backed by measurements you make or a certified supplier's documentation.

## 1. Where the repo stands on shielding

| Asset | What it is | Test data? | Usable for sale now? |
|---|---|---|---|
| CSMFAB 01 Aegis-C panel | ZrB2-SiC/MXene wall panel concept | None (claims 92 dB, unverified) | No. Make coupons and test first |
| CSMQuantum 01 MXene shielding | 92 dB at 45 µm claim; $55-75/kg in-house claim | None | No. Scoping study only |
| CSMFAB P007 Faraday Alarm | $340 home GIC alarm spec | None; no PCB or firmware | No. Electronics need certification |
| CSMFAB AegisHome02 dielectric coating | 7 drafts; coupon test plan | None | After coupon tests |
| CSMFAB 01/08/09 Aegis home products | Specs, pricing models | None | No |
| CSMFAB 0114/0200 drones and electronics | Build manuals | None | No. Drones and powered gear need compliance |
| CSMArchive V3 compendium | 25 volumes, fictional catalog | None | Only as a clearly labeled design study |

Conclusion: the repo does not yet contain a shielding product you can sell as a performance product. You can sell three things now: **certified supplier products with honest labels**, **a measured test report** (which you can produce), and **a design study** (labeled as such).

## 2. Claims rules (apply to every tier)

- **Allowed:** "Reduces measured Wi-Fi signal by X dB in our test (method described, date, device)." "Static-shielding bag, supplier-certified to [standard]." "RF pouch, tested by [lab] at [frequency]."
- **Not allowed without third-party lab data:** "EMP-proof," "GIC-proof," "Carrington-safe," "blocks all radiation," "protects against nuclear or solar events," "100% shielding," any dB value you did not measure.
- **Not allowed at all:** EMF health claims (cancer, DNA, sleep, "healing" frequencies). These are an FTC and consumer-protection problem. CSMHuman and CSMMetal contain such claims; strip them before any sale.
- **Powered products** (chargers, alarms, drones, electronic cushions or insoles) need regulatory compliance before sale: FCC Part 15 for radio or digital devices, safety listing (UL or ETL) for mains-powered items, and battery shipping rules for lithium cells. Verify with a compliance consultant. Avoid this tier until you have a budget for it.
- **Keep a test log** for every claim: device, method, distance, frequency, date, photos, raw numbers.

## 3. Tier S1 - Resell certified shielding supplies (fastest, $0-300 start)

**What:** static-shielding bags (for drives, SSDs, motherboards, electronics storage) and RF-shielding pouches (phone or key fob pouches). Both are standard retail products.

**How:**
1. Find 2-3 wholesale or private-label suppliers (ESD and packaging suppliers, nickel-copper fabric pouch makers). Ask for the test report or certificate for the product. For ESD bags, ask for the surface-resistivity and shielding data and the standard they were tested against (common references: ANSI/ESD S541 for packaging, ANSI/ESD S20.20 for ESD programs; **verify the current standard numbers with the supplier**).
2. Order 1 sample of each. Test one yourself (section 6) and record the results.
3. Write listings that use only the supplier's certified numbers plus your own measured numbers, labeled as such.
4. Sell on Etsy, eBay, or Amazon Seller Central (check each platform's fees and rules for electronics claims). Start with 10-20 units; reorder what sells.

**Income mechanics:** buy at wholesale, sell at retail with shipping. Margin depends on supplier cost; compute it per unit before ordering. Keep receipts.

**Why this first:** no engineering, no certification you must do yourself, no claims you cannot back up, and you already know how to support the customer.

## 4. Tier S2 - Measured shielding test service and report (weeks 2-6, $0-200 start)

**What:** a simple, honest measurement service. Buyers pay for a measured attenuation report on a shielding product (their pouch, bag, box, or enclosure), or a DIY test kit.

**Method (low-cost, repeatable, clearly limited):**
1. Use a Wi-Fi analyzer app on an Android phone or laptop that reports RSSI in dBm, or a USB Wi-Fi scanner. Note the phone model.
2. Fix the transmitter (a known router or hotspot) and the receiver at set positions. Place them 3 m apart in a room with no moving objects. Record 30 readings each for a baseline.
3. Place the product's shielded enclosure between them without touching the antennas. Record 30 readings.
4. Report the mean difference in dBm and the standard deviation. Repeat at 2.4 GHz and 5 GHz if the analyzer supports both.
5. Include the limitations: RSSI is coarse (typically a few dB of noise), indoors, not calibrated, not a standards-based SE test.

**Output:** a 2-4 page PDF report per product (method, photos, table, conclusion, limitations). Sell for a fixed fee.

**Upgrade path:** for a real shielding-effectiveness figure you need a lab test. Standards to ask labs about: ASTM D4935 (planar material SE), and IEEE 299 for enclosures (verify current revisions). Get quotes before committing; do not quote lab prices from this repo, which contain unverified figures.

## 5. Tier S3 - Branded Aegis line with real data (months 2-6, $500-5,000)

**What:** your own brand (for example a shielded storage or accessory line) built on the repo's materials thinking, but only after tests.

**Steps:**
1. Pick one product that needs no certification (passive: a pouch, a storage box, a drive sleeve, a window film test sample). **Exclude** anything electronic in this tier.
2. Make 3-5 prototypes (sewn fabric pouch, coated panel coupon). Test with the S2 method and one commercial lab quote for ASTM D4935 on one coupon.
3. Publish the data sheet with measured values and conditions. Sell at a price that covers materials and time.
4. Use the MXene and Aegis-C material notes only after a lab measures the real material. CSMQuantum 01 and CSMFAB 01 currently contain unverified SE and cost claims.

**Candidate products from the repo that are passive (suitable for S3):**
- CSMFAB 034 EV dielectric window film (needs optical and EMI tests).
- CSMFAB 037 pet cargo liner (needs vibration and pet-safety testing; sewn product).
- CSMFAB 036 armrest and 030 headrest (passive foam; test damping first, and avoid crash-related claims).
- CSMFAB 016 non-conductive hardware and 017 dielectric rope (needs tensile tests; no certification claims).
- CSMFAB 0107 geopolymer mix (cube tests; sell as a mix design, not a shield).

## 6. Tier S4 - Design and consulting (months 3-12)

- **Sell the design package, not the outcome:** the repo's specs (CSMFAB 0104 fencing, 0107 geopolymer, 012 pipe, 013 wiring, 014 stove vent, 015 tools) can be sold as design drafts with an explicit "requires licensed engineer review" note.
- **Test-plan consulting:** using your S2 method, offer a fixed-fee test plan for shielding products made by others.
- **Desktop-support crossover:** you can offer on-site or remote setup and documentation for shielded storage, backup-drive protection, and data-recovery prevention. This is a services business that uses the products you sell in S1.

Do not sell engineering conclusions for structures, bridges, power infrastructure, or medical devices. The repo's bridge analysis (CSMMetal) and substation/pipeline proposals (CSMFAB 0104 to 0106, P004) need licensed PE review before any use.

## 7. What to avoid entirely for now

| Product or claim | Why |
|---|---|
| Carrington, GIC, EMP "protection" for homes, bridges, or grids | No test data; professional liability |
| EMF health or "healing frequency" products | Medical and consumer-protection exposure (CSMHuman, CSMMetal, DeepResearch) |
| Electronic chargers, alarms, drones, electronic insoles, EV charger kit (CSMFAB 051) | FCC, safety listing, battery and shipping rules |
| Children's car seat (CSMFAB 028 CLOUD-NEST) | Federal crash standard (FMVSS 213) |
| Bio-Sync cushion with MR fluid and biofeedback (CSMMetal) | Electronics, flammability, biofeedback claims |
| Hydrogen, lithium, or pressure-vessel items | Hazmat and pressure certification |

## 8. Cost and time summary

| Tier | Start cost (estimate) | Time to first sale | Main risk |
|---|---|---|---|
| S1 resell certified shielding supplies | $200-500 for samples and first stock | 1-3 weeks | Thin margin; supplier claims |
| S2 measured test service and report | $0-200 (analyzer app, a phone, a router) | 2-6 weeks | Method limits; keep claims narrow |
| S3 branded passive line with data | $500-5,000 (prototypes, one lab coupon) | 2-6 months | Lab cost; product liability |
| S4 design and consulting | $0 | 3-12 months | Needs credibility and reviews |

All dollar costs above are planning estimates. Confirm supplier prices and lab quotes before you spend.
