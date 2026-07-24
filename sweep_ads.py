#!/usr/bin/env python3
import json, urllib.request, urllib.parse, re, time, sys
sys.stdout.reconfigure(line_buffering=True) if hasattr(sys.stdout, 'reconfigure') else None

TK = '/tmp/kilo/hotmail_token.json'
with open(TK) as f:
    tok = json.load(f)['access_token']
H = {'Authorization': f'Bearer {tok}', 'Content-Type': 'application/json'}
GR = 'https://graph.microsoft.com/v1.0'

def g(p, b=None, m='GET'):
    u = GR + p
    d = json.dumps(b).encode() if b else None
    r = urllib.request.Request(u, data=d, method=m)
    for k, v in H.items():
        r.add_header(k, v)
    try:
        resp = urllib.request.urlopen(r)
        raw = resp.read()
        return json.loads(raw) if raw else {'ok': True}
    except:
        return None

AD = {
    'e.vitaminshoppe.com', 'my.pizzahut.com', 'mail.pizzahut.com',
    'chronicguru.com', 'mail.padsplit.com', 'iluv.southwest.com',
    'raleysstores.com', 'newsletter.pilotflyingj.com',
    'email.musiciansfriend.com', 'e.avis.com', 'e.sonesta.com',
    'sg.newsletter.agoda-emails.com', 'team.holafly.com',
    'drivecampaigns.com', 'chargepoint.com',
    'mail.wholefoodsmarket.com', 'emails.hertz.com',
    'sebastianstachon.com', 'wymbritseradiel.com',
    'autodeskcommunications.com', 'mail.guitarcenter.com',
}

KP = {
    'google.com', 'microsoft.com', 'accountprotection.microsoft.com',
    'yahoo.com', 'github.com', 'venmo.com', 'uber.com',
    'notification.evgo.com', 'net2source.com', 'stripe.com',
    'accessoticketing.com', 'accounts.google.com',
    'reply.kilocode.com', 'hotmail.com', 'live.com', 'outlook.com',
    'aegisc.space', 'ccac.edu', 'aol.com', 'protonmail.com',
    'icloud.com', 'me.com', 'gmail.com',
}

KW = [
    r'\$\d+\s*off', r'\d+%\s*off', r'save\s+\d+%', r'save\s+\$\d+',
    r'\bsale\b', r'\bdeal\b', r'\boffer\b', r'\bdiscount\b',
    r'\bnewsletter\b', r'\bunsubscribe\b', r'\bpromo', r'shop\s+now',
    r'don\'?t\s+miss', r'\bhurry\b', r'last\s+call', r'\bexclusive\b',
    r'price\s+drops?', r'special\s+offer', r'cash\s+back',
    r'free\s+(?:shipping|delivery)', r'\bclearance\b',
    r'flash\s+sale', r'member\s+exclusive', r'order\s+now',
    r'view\s+in\s+(?:web\s+)?browser', r'can\'?t\s+see\s+this',
]

def classify(m):
    s = (m.get('subject', '') or '').lower()
    f = m.get('from', {})
    a = (f.get('emailAddress', {}).get('address', '') or '').lower()
    n = (f.get('emailAddress', {}).get('name', '') or '').lower()
    bd = (m.get('bodyPreview', '') or '').lower()
    x = f'{s} {bd} {n}'
    d = a.split('@')[-1] if '@' in a else ''

    for p in [
        r'payment\s+(?:info|method)\s+will\s+expire',
        r'update\s+(?:your\s+)?(?:payment|card|billing)',
        r'membership.*(?:paused|suspended|interrupted)',
    ]:
        if re.search(p, x):
            return 'phishing'

    if d in AD or a in AD:
        return 'ad'
    if d in KP:
        return 'keep'

    ad = sum(2 for p in KW if re.search(p, x))
    if any(w in a or w in n for w in
           ['noreply', 'no-reply', 'do-not-reply', 'promotions',
            'promos', 'newsletter', 'marketing', 'alerts']):
        ad += 3
    if any(w in d for w in
           ['email.', 'e.', 'mail.', 'newsletter.', 'promo', 'marketing', 'emails.']):
        ad += 2
    if 'unsubscribe' in x:
        ad += 3

    if ad >= 3:
        return 'ad'
    if ad >= 1:
        p = sum(3 for pp in [r'^re:', r'\bhi\b.*(?:jason|there)',
                r'\binterview\b', r'\byour\s+resume\b', r'\bopportunity\b']
                if re.search(pp, x))
        return 'keep' if p >= ad else 'ad'
    return 'keep'


folds = g('/me/mailFolders?$top=99&$select=id,displayName')
FID = next((f['id'] for f in folds['value']
            if 'non-personal' in f.get('displayName', '').lower()), None)
if not FID:
    print('no folder', flush=True)
    sys.exit(1)

total = 0
bs = 100
skip = 0
print(f'START SWEEP at {time.strftime("%H:%M:%S")}', flush=True)

for pg in range(500):
    q = urllib.parse.quote(
        f'$top={bs}&$skip={skip}&$select=id,subject,from,bodyPreview,receivedDateTime',
        safe='=&$')
    msgs = g(f'/me/mailFolders/inbox/messages?{q}')
    if not msgs or 'value' not in msgs or not msgs['value']:
        break
    vs = msgs['value']
    tm = [m for m in vs if classify(m) in ('ad', 'phishing')]
    mv = 0
    for m in tm:
        r = g(f'/me/messages/{m["id"]}/move', {'destinationId': FID}, m='POST')
        if r:
            mv += 1
    total += mv
    pct = len(tm) / len(vs) * 100
    print(f'p{pg+1:>3}|{skip}-{skip+len(vs)}|{mv:>3}m({pct:.0f}%)|S{total}', flush=True)
    skip += bs
    time.sleep(0.3)

print(f'DONE: {total} total moved', flush=True)
