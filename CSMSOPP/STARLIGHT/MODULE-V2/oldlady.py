#!/usr/bin/env python3
"""
THE OLD LADY — BEEF CHECKER v3.0
═══════════════════════════════════════════════════════
CSMSOPP000004 · Starlight Courier Heuristic

"WHERE'S THE BEEF?"

PRINCIPLE (v3): The Old Lady never rewrites. She finds gaps
in existing content and fills them. Original text is sacred —
it stays. Beef is layered AROUND it, not in place of it.

RULES:
   - Paragraphs under 800 chars = PUNY → ADD BEEF (keep original, append beef)
   - Paragraphs 800-1200 chars = THIN → ADD BEEF
   - Paragraphs 1200+ chars = BEEFY → Leave alone
   - Never remove personalized greeting (P1) or close/signature (last 2)
   - Only beef the middle paragraphs
   - UNIQUE HEADERS: No two subject lines shall be identical

CAMPAIGN RULES:
   RULE #1 — NEVER AUTO-SEND: All drafts stay in Drafts for Jason approval.
   RULE #2 — DRAFTS ONLY: Leave prepared emails in Drafts folder.
   RULE #3 — BOUNCE TRACKING: Verify before sending.
"""

import json, re, time, os, sys, random
import urllib.request, urllib.parse

# ─── BEEF APPENDICES (not replacements) ────────────────
# These are appended AFTER existing content, not in place of it.

BEEF_WATSON = (
    '<p style="font-family:Georgia,serif;font-size:15px;color:#222;line-height:1.5;margin-top:1em">'
    'I need to pause here — the way Robin Williams would stop mid-riff and look directly at you '
    'with those eyes that said <em>this next part is important, are you listening?</em> — because '
    'what I am about to describe is not marketing. The materials I am going to describe — Aegis-C '
    'composite shielding, the Safe Pod enclosure architecture, MXene EMI materials, Basalt-fiber '
    'composites, the LoRa mesh network — exist as manufactured goods with published, peer-reviewed, '
    'independently-tested, NIST-traceable component-level shielding effectiveness data. Every single '
    'specification — every decibel, every micron, every milliohm, every megapascal, every kiloampere — '
    'is connected by an unbroken chain of calibrations to national measurement standards maintained '
    'by NIST in Boulder, Colorado. Everything we publish is governed by the Watson Oath: Do not harm '
    'the insured. Do not harm the risk pool. Do not harm the public trust. Do not harm professional '
    'integrity. Data Sacred. We do not exaggerate. We do not round up. We hand you the data package '
    'and we say: evaluate this on your own terms, with your own staff, using your own criteria.</p>'
)

BEEF_AEGIS = (
    '<p style="font-family:Georgia,serif;font-size:15px;color:#222;line-height:1.5;margin-top:1em">'
    '<strong>Aegis-C Composite Shielding.</strong> Let me show you what these numbers mean in practice. '
    'Shielding effectiveness: one hundred forty-eight to one hundred sixty-five decibels across the '
    'frequency range from one kilohertz to ten gigahertz. Decibels are logarithmic — every ten decibels '
    'is a factor of ten in field-strength reduction — and one hundred fifty decibels means the '
    'electromagnetic field inside the enclosure is one one-quadrillionth of the field outside. That is '
    'like taking every human being on Earth — all eight billion, two hundred million of us — and reducing '
    'that entire population down to a single person. The material: ZrB2-SiC ultra-high-temperature ceramic '
    'matrix with MXene Ti3C2Tx EMI layer at forty-five microns. Tested against MIL-STD-461G RS103 with '
    'margin across the full threat spectrum. Survives two thousand degrees Celsius while maintaining '
    'dielectric integrity. Implementation reduces modeled Probable Maximum Loss by seventy-two percent. '
    'SHIELD posture: calm methodical readiness. No bravado. Just metal, math, and measurements.</p>'
)

BEEF_MXENE = (
    '<p style="font-family:Georgia,serif;font-size:15px;color:#222;line-height:1.5;margin-top:1em">'
    '<strong>MXene EMI Materials.</strong> Max-een. Two-dimensional transition-metal carbide flakes, '
    'three atoms thick per layer — first synthesized at Drexel University, published in Science in 2016. '
    'The highest intrinsic electromagnetic shielding effectiveness per unit thickness of any synthetic '
    'material ever reported. At forty-five microns total film thickness — thinner than a human hair — '
    'MXene achieves shielding comparable to several millimeters of solid copper. One hundred times thinner, '
    'identical protection. The Holmes observation: when a material exists that is one hundred times thinner '
    'than copper and achieves equivalent shielding, and when it can be manufactured using solution-processing '
    'at industrial scale, then electromagnetic immunity has shifted from a bulk-materials problem to a '
    'thin-film integration solved at the PCB level. The physics is solved. What remains is deployment.</p>'
)

BEEF_POD = (
    '<p style="font-family:Georgia,serif;font-size:15px;color:#222;line-height:1.5;margin-top:1em">'
    '<strong>The Safe Pod SP-4 Architecture.</strong> Where materials meet the real world — an actual '
    'enclosure that an actual electrician mounts to an actual equipment rack. Eighty decibels of shielding '
    'at one gigahertz under IEEE 299-2006. Outer shell: two millimeters of continuously-welded Type 304 '
    'stainless steel. Inner: MuMETAL liner with permeability exceeding one hundred thousand. Five kVA '
    'double-conversion UPS with toroidal isolation at one hundred thirty decibels CMRR. GDT+TVS hybrid '
    'protection at forty kiloamperes per channel. Exothermic-welded copper ground at under zero-point-two '
    'milliohms. Operating range: negative forty to positive eighty-five Celsius. Two-thousand-hour burn-in '
    'at rated load: zero I/O failures. Coulson would nod once and say: "Deploy it."</p>'
)

BEEF_BASALT = (
    '<p style="font-family:Georgia,serif;font-size:15px;color:#222;line-height:1.5;margin-top:1em">'
    '<strong>Basalt-Fiber Composites and LoRa Mesh IoT.</strong> Volcanic rock melted at fourteen hundred '
    'Celsius, extruded into thirteen-micron filaments. Twelve hundred megapascals tensile — thirty percent '
    'higher than E-glass. Dielectric exceeding twenty kilovolts per millimeter — inherently, permanently, '
    'unalterably non-conductive. Five-thousand-hour salt-fog immersion: zero degradation. LoRa Mesh IoT: '
    'two hundred fifty-six nodes, self-healing at nine hundred fifteen megahertz, fifteen kilometers '
    'point-to-point. Battery-backed, solar-rechargeable, deployable in under sixty seconds. When primary '
    'networks go dark during a geomagnetic storm, the mesh continues reporting from every node. It answers '
    'one question: <em>is the equipment still online?</em> Babbitt would count every node. NANU NANU!</p>'
)

BEEF_MAP = {
    'watson': BEEF_WATSON, 'oath': BEEF_WATSON, 'data sacred': BEEF_WATSON,
    'aegis': BEEF_AEGIS, 'shielding': BEEF_AEGIS, 'shield': BEEF_AEGIS,
    'mxene': BEEF_MXENE, 'ti3c2': BEEF_MXENE, 'carbide': BEEF_MXENE,
    'pod': BEEF_POD, 'sp-4': BEEF_POD, 'sp4': BEEF_POD, 'enclosure': BEEF_POD,
    'basalt': BEEF_BASALT, 'lora': BEEF_BASALT, 'volcanic': BEEF_BASALT,
}

# ─── HEADER VARIATIONS ─────────────────────────────────
# Each recipient gets a unique subject from their context.
# NAME CLEANING: removes batch codes, standardizes formatting.

SUBJECT_PATTERNS = [
    "Aegis-C Shielding Data for {name} — Carrington Storm Motors",
    "The Reinsurance Mitigation Layer — {name} — Carrington Storm Motors",
    "Systemic Space-Weather Risk Data for {name} — Carrington Storm Motors",
    "Infrastructure Resilience Data — {name} — Carrington Storm Motors",
    "What Your Risk Model Is Missing — Physical-Layer CME Data for {name}",
    "The Mitigation Column — Aegis-C Shielding for {name}",
    "Solar Cycle 25 Infrastructure Data — {name} — Carrington Storm Motors",
    "Electromagnetic Resilience Engineering Data — {name}",
    "The Hardening Layer Underneath Your Systemic Risk Model — {name}",
    "Carrington Storm Motors — Shielding Effectiveness Data for {name}",
    "From Warning to Hardening — CME Resilience Data for {name}",
    "The Materials That Protect Infrastructure — {name} Data Package",
]

def clean_recipient_name(raw_name):
    """Remove batch codes and standardize recipient names."""
    import re
    n = raw_name
    for pat in [r'BATCH-\d+\s*#\d+\s*[-\u2013\u2014]\s*',
                r'B\d+-E\d+\s*', r'B\d+\s*']:
        n = re.sub(pat, '', n).strip()
    n = re.sub(r'\s*[-\u2013\u2014]\s*', ', ', n)
    n = re.sub(r'\s+/', ' & ', n)
    if 'jason' in n.lower() or 'brodsky' in n.lower():
        n = 'Jason'
    return n if n else 'Team'

def unique_subject(company, sector, index):
    pattern = SUBJECT_PATTERNS[index % len(SUBJECT_PATTERNS)]
    return pattern.format(company=company, sector=sector)


def old_lady_inspect(paragraph_text):
    if '<!--beefed-->' in paragraph_text:
        return 'BEEFY'
    clean = re.sub(r'<[^>]+>', '', paragraph_text)
    clean = re.sub(r'&[a-z]+;', '', clean)
    if len(clean) < 800:
        return 'NEEDS BEEF'
    if len(clean) < 1200 and any(kw in paragraph_text.lower() for kw in BEEF_MAP):
        return 'NEEDS BEEF'
    return 'BEEFY'


def old_lady_beef_it(paragraph_text):
    """
    v3: KEEPS the original paragraph and APPENDS beef below it.
    NEVER replaces. Original is the foundation — beef fills gaps.
    """
    text_lower = paragraph_text.lower()
    beef = BEEF_WATSON  # Default

    for keyword, beef_block in BEEF_MAP.items():
        if keyword in text_lower:
            beef = beef_block
            break

    # Return original + beef appended, marked so pass 2 skips it
    return paragraph_text + beef + '<!--beefed-->'


def process_all_drafts(token_path='/tmp/kilo/hotmail_token.json'):
    """Run Old Lady on all drafts. Additive beef only."""

    with open(token_path) as f:
        tok = json.load(f)['access_token']
    H = {'Authorization': f'Bearer {tok}', 'Content-Type': 'application/json'}
    GR = 'https://graph.microsoft.com/v1.0'

    def g(p, body_dict=None, method='GET'):
        u = GR + p; d = json.dumps(body_dict).encode() if body_dict else b''
        r = urllib.request.Request(u, data=d if d else None, method=method)
        for k, v in H.items(): r.add_header(k, v)
        try:
            resp = urllib.request.urlopen(r); raw = resp.read()
            return json.loads(raw) if raw else {'ok': True}
        except:
            return None

    q = urllib.parse.quote('$top=200&$select=id,subject,toRecipients,body', safe='=&$')
    drafts = g(f'/me/mailFolders/drafts/messages?{q}')
    if not drafts or 'value' not in drafts:
        print('No drafts found')
        return 0, 0

    external = []
    for m in drafts['value']:
        tos = m.get('toRecipients', [])
        if not tos: continue
        a = tos[0]['emailAddress']['address'].lower()
        if any(w in a for w in ['hotmail.com', 'outlook.com', 'aegisc.space']): continue
        external.append(m)

    total = 0
    beefed = 0

    for i, m in enumerate(external):
        body = m.get('body', {}).get('content', '')
        if not body: continue

        paras = re.findall(r'(<p[^>]*>.*?</p>)', body, re.DOTALL)
        if len(paras) < 3: continue
        total += 1

        # Keep P1 (greeting) and last 2 (close + sig)
        modified = False
        new_paras = [paras[0]]
        for j, para in enumerate(paras[1:-2], 1):
            inspection = old_lady_inspect(para)
            if inspection == 'NEEDS BEEF':
                new_paras.append(old_lady_beef_it(para))
                modified = True
            else:
                new_paras.append(para)
        new_paras.extend(paras[-2:])

        if not modified:
            continue

        html_head = body[:body.find(paras[0])]
        html_tail = body[body.rfind(paras[-1]) + len(paras[-1]):]
        new_body = html_head + ''.join(new_paras) + html_tail

        # Add body-level marker so pass 2 skips beefed bodies
        new_body = new_body.replace('<body ', '<body data-oldlady-beefed="true" ', 1)

        # Also check body-level marker
        if 'data-oldlady-beefed="true"' in body:
            continue  # Already processed by a previous pass
        subj = m.get('subject', '')
        to_name = m.get('toRecipients', [{}])[0].get('emailAddress', {}).get('name', 'Team')
        company = clean_recipient_name(to_name)
        new_subj = unique_subject(company, '', i)
        patch = {'body': {'contentType': 'HTML', 'content': new_body},
                 'subject': new_subj}

        mid = m['id']
        result = g(f'/me/messages/{mid}', patch, method='PATCH')
        if result:
            beefed += 1
            emp_ref = ['💪', '🥩', '🍖', '💎', '⚡'][i % 5]
            addr = m['toRecipients'][0]['emailAddress']['address'][:40]
            print(f'  {emp_ref} {addr:<42} | BEEFED | {len(new_body)}c')

    return total, beefed


if __name__ == '__main__':
    print('👵 THE OLD LADY v3.0 — "WHERE\'S THE BEEF?"')
    print('   Mode: ADDITIVE — original content preserved, beef appended')
    print('   Headers: UNIQUE per recipient')
    print()

    # PASS 1
    print('═══ PASS 1 ═══')
    t1, b1 = process_all_drafts()
    print(f'   Inspected: {t1} | Beefed: {b1}\n')

    # PASS 2
    print('═══ PASS 2 ═══')
    t2, b2 = process_all_drafts()
    print(f'   Inspected: {t2} | Beefed: {b2}\n')

    print(f'🎯 COMPLETE: Pass 1 beefed {b1}, Pass 2 beefed {b2} of {t1} total')
    print(f'   RULE #1: All drafts remain in Drafts for Jason approval.')
