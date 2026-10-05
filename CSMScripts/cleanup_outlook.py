#!/usr/bin/env python3
"""
Outlook/Hotmail Cleanup Script — Junk & Large Email Cleaner
Uses Microsoft Graph API with existing token patterns.

INVOKE:
    python3 cleanup_outlook.py [--dry-run] [--junk] [--large] [--archive] [--threshold-MB N]

AUTH:
    Requires token at /tmp/kilo/hotmail_token.json (device code flow)
    Run dual_starlight_express.py --live --account jasonbrodsky@hotmail.com first to auth.
"""

import json, urllib.request, urllib.parse, re, time, sys, argparse, os
from datetime import datetime, timedelta

sys.stdout.reconfigure(line_buffering=True) if hasattr(sys.stdout, 'reconfigure') else None

TOKEN_PATH = '/tmp/kilo/hotmail_token.json'
GRAPH_BASE = 'https://graph.microsoft.com/v1.0'

# ─── JUNK DETECTION (from sweep_ads.py) ──────────────────
AD_DOMAINS = {
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

KEEP_DOMAINS = {
    'google.com', 'microsoft.com', 'accountprotection.microsoft.com',
    'yahoo.com', 'github.com', 'venmo.com', 'uber.com',
    'notification.evgo.com', 'net2source.com', 'stripe.com',
    'accessoticketing.com', 'accounts.google.com',
    'reply.kilocode.com', 'hotmail.com', 'live.com', 'outlook.com',
    'aegisc.space', 'ccac.edu', 'aol.com', 'protonmail.com',
    'icloud.com', 'me.com', 'gmail.com',
}

JUNK_KEYWORDS = [
    r'\$\d+\s*off', r'\d+%\s*off', r'save\s+\d+%', r'save\s+\$\d+',
    r'\bsale\b', r'\bdeal\b', r'\boffer\b', r'\bdiscount\b',
    r'\bnewsletter\b', r'\bunsubscribe\b', r'\bpromo', r'shop\s+now',
    r'don\'?t\s+miss', r'\bhurry\b', r'last\s+call', r'\bexclusive\b',
    r'price\s+drops?', r'special\s+offer', r'cash\s+back',
    r'free\s+(?:shipping|delivery)', r'\bclearance\b',
    r'flash\s+sale', r'member\s+exclusive', r'order\s+now',
    r'view\s+in\s+(?:web\s+)?browser', r'can\'?t\s+see\s+this',
]

PHISHING_PATTERNS = [
    r'payment\s+(?:info|method)\s+will\s+expire',
    r'update\s+(?:your\s+)?(?:payment|card|billing)',
    r'membership.*(?:paused|suspended|interrupted)',
]

# ─── GRAPH API ────────────────────────────────────────────
def load_token():
    with open(TOKEN_PATH) as f:
        t = json.load(f)
    if t.get('expires_on', 0) < time.time() + 60:
        print('❌ Token expired. Run dual_starlight_express.py --live to refresh.')
        sys.exit(1)
    return t['access_token']

HEADERS = {'Authorization': f'Bearer {load_token()}', 'Content-Type': 'application/json'}

def graph_call(path, body=None, method='GET'):
    url = GRAPH_BASE + path
    data = json.dumps(body).encode() if body else None
    req = urllib.request.Request(url, data=data, method=method)
    for k, v in HEADERS.items():
        req.add_header(k, v)
    try:
        resp = urllib.request.urlopen(req)
        raw = resp.read()
        return json.loads(raw) if raw else {'ok': True}
    except urllib.error.HTTPError as e:
        err = e.read().decode()
        if e.code == 401:
            print('❌ Token expired')
            sys.exit(1)
        if e.code == 429:
            print('⚠️ Rate limited')
            return None
        print(f'⚠️ HTTP {e.code}: {err[:100]}')
        return None
    except Exception as e:
        print(f'⚠️ Error: {e}')
        return None

# ─── FOLDER MANAGEMENT ────────────────────────────────────
def get_or_create_folder(name):
    folders = graph_call('/me/mailFolders?$select=id,displayName')
    fid = next((f['id'] for f in folders.get('value', []) if f['displayName'].lower() == name.lower()), None)
    if not fid:
        new = graph_call('/me/mailFolders', {'displayName': name}, method='POST')
        fid = new['id'] if new else None
        print(f'📁 Created folder: {name} ({fid})')
    return fid

def move_message(msg_id, dest_folder_id):
    return graph_call(f'/me/messages/{msg_id}/move', {'destinationId': dest_folder_id}, method='POST')

# ─── CLASSIFICATION ───────────────────────────────────────
def classify_message(msg):
    """Returns: 'junk', 'phishing', 'keep', 'large'"""
    subject = (msg.get('subject', '') or '').lower()
    from_info = msg.get('from', {})
    addr = (from_info.get('emailAddress', {}).get('address', '') or '').lower()
    name = (from_info.get('emailAddress', {}).get('name', '') or '').lower()
    body_preview = (msg.get('bodyPreview', '') or '').lower()
    size = msg.get('size', 0)
    has_attachments = msg.get('hasAttachments', False)
    
    domain = addr.split('@')[-1] if '@' in addr else ''
    text = f'{subject} {body_preview} {name}'
    
    # Check for phishing
    for p in PHISHING_PATTERNS:
        if re.search(p, text):
            return 'phishing'
    
    # Known ad domains
    if domain in AD_DOMAINS or addr in AD_DOMAINS:
        return 'junk'
    
    # Known keep domains
    if domain in KEEP_DOMAINS:
        return 'keep'
    
    # Keyword scoring
    junk_score = 0
    for kw in JUNK_KEYWORDS:
        if re.search(kw, text):
            junk_score += 2
    
    # Sender patterns
    if any(w in addr or w in name for w in
           ['noreply', 'no-reply', 'do-not-reply', 'promotions',
            'promos', 'newsletter', 'marketing', 'alerts']):
        junk_score += 3
    if any(w in domain for w in
           ['email.', 'e.', 'mail.', 'newsletter.', 'promo', 'marketing', 'emails.']):
        junk_score += 2
    if 'unsubscribe' in text:
        junk_score += 3
    
    # Large message check
    if size > 5_000_000 or (has_attachments and size > 2_000_000):
        return 'large'
    
    if junk_score >= 3:
        return 'junk'
    if junk_score >= 1:
        keep_score = sum(3 for pp in [r'^re:', r'\bhi\b.*(?:jason|there)',
                r'\binterview\b', r'\byour\s+resume\b', r'\bopportunity\b']
                if re.search(pp, text))
        return 'keep' if keep_score >= junk_score else 'junk'
    return 'keep'

# ─── MAIN OPERATIONS ──────────────────────────────────────
def scan_folder(folder_name, folder_id, max_pages=100, batch_size=50, dry_run=True):
    """Scan a folder and classify messages."""
    junk_folder_id = get_or_create_folder('Junk') if not dry_run else None
    large_folder_id = get_or_create_folder('Large_Emails') if not dry_run else None
    archive_folder_id = get_or_create_folder(f'Archive_{datetime.now().strftime("%Y-%m-%d")}') if not dry_run else None
    
    stats = {'junk': 0, 'phishing': 0, 'large': 0, 'keep': 0, 'moved': 0, 'total': 0}
    
    for page in range(max_pages):
        skip = page * batch_size
        q = urllib.parse.quote(
            f'$top={batch_size}&$skip={skip}&$select=id,subject,from,bodyPreview,receivedDateTime,size,hasAttachments,importance',
            safe='=&$')
        msgs = graph_call(f'/me/mailFolders/{folder_id}/messages?{q}')
        if not msgs or 'value' not in msgs or not msgs['value']:
            break
        
        for msg in msgs['value']:
            stats['total'] += 1
            classification = classify_message(msg)
            stats[classification] += 1
            
            size_mb = msg.get('size', 0) / 1_000_000
            subject = msg.get('subject', '(no subject)')[:60]
            from_addr = msg.get('from', {}).get('emailAddress', {}).get('address', 'unknown')
            
            if classification in ('junk', 'phishing', 'large'):
                action = 'DRY-RUN' if dry_run else 'MOVING'
                dest = {'junk': 'Junk', 'phishing': 'Junk', 'large': 'Large_Emails'}[classification]
                print(f'  {action} [{classification.upper()}] {size_mb:.1f}MB | {from_addr} | {subject}')
                
                if not dry_run:
                    dest_id = {'junk': junk_folder_id, 'phishing': junk_folder_id, 'large': large_folder_id}[classification]
                    if move_message(msg['id'], dest_id):
                        stats['moved'] += 1
                    time.sleep(0.1)
    
    return stats

def find_large_messages(threshold_mb=10, max_pages=50, batch_size=50, dry_run=True):
    """Find messages larger than threshold across all folders."""
    large_folder_id = get_or_create_folder('Large_Emails') if not dry_run else None
    stats = {'found': 0, 'moved': 0}
    
    # Get all folders
    folders = graph_call('/me/mailFolders?$select=id,displayName')
    folder_ids = [(f['id'], f['displayName']) for f in folders.get('value', [])]
    
    for folder_id, folder_name in folder_ids:
        if folder_name.lower() in ['junk', 'deleted items', 'large_emails']:
            continue
            
        print(f'\n📂 Scanning {folder_name}...')
        for page in range(max_pages):
            skip = page * batch_size
            q = urllib.parse.quote(
                f'$top={batch_size}&$skip={skip}&$select=id,subject,from,size,hasAttachments,receivedDateTime&$filter=size gt {threshold_mb * 1_000_000}',
                safe='=&$')
            msgs = graph_call(f'/me/mailFolders/{folder_id}/messages?{q}')
            if not msgs or 'value' not in msgs or not msgs['value']:
                break
            
            for msg in msgs['value']:
                stats['found'] += 1
                size_mb = msg['size'] / 1_000_000
                subject = msg.get('subject', '(no subject)')[:60]
                from_addr = msg.get('from', {}).get('emailAddress', {}).get('address', 'unknown')
                print(f'  📦 LARGE: {size_mb:.1f}MB | {from_addr} | {subject}')
                
                if not dry_run and folder_name.lower() != 'large_emails':
                    if move_message(msg['id'], large_folder_id):
                        stats['moved'] += 1
                    time.sleep(0.1)
    
    return stats

def archive_old_inbox(days=30, dry_run=True):
    """Move old inbox messages to dated archive folder."""
    archive_folder_id = get_or_create_folder(f'Archive_{datetime.now().strftime("%Y-%m-%d")}') if not dry_run else None
    cutoff = datetime.now() - timedelta(days=days)
    cutoff_str = cutoff.strftime('%Y-%m-%dT%H:%M:%SZ')
    
    stats = {'found': 0, 'moved': 0}
    
    for page in range(100):
        skip = page * 50
        q = urllib.parse.quote(
            f'$top=50&$skip={skip}&$select=id,subject,from,receivedDateTime&$filter=receivedDateTime lt {cutoff_str}',
            safe='=&$')
        msgs = graph_call(f'/me/mailFolders/inbox/messages?{q}')
        if not msgs or 'value' not in msgs or not msgs['value']:
            break
        
        for msg in msgs['value']:
            stats['found'] += 1
            subject = msg.get('subject', '(no subject)')[:60]
            from_addr = msg.get('from', {}).get('emailAddress', {}).get('address', 'unknown')
            print(f'  📦 ARCHIVE: {from_addr} | {subject}')
            
            if not dry_run:
                if move_message(msg['id'], archive_folder_id):
                    stats['moved'] += 1
                time.sleep(0.1)
    
    return stats

# ─── MAIN ─────────────────────────────────────────────────
def main():
    parser = argparse.ArgumentParser(description='Outlook/Hotmail Cleanup - Junk & Large Emails')
    parser.add_argument('--dry-run', action='store_true', default=True, help='Preview only (default)')
    parser.add_argument('--execute', action='store_true', help='Actually move messages')
    parser.add_argument('--junk', action='store_true', help='Clean junk from Inbox')
    parser.add_argument('--large', action='store_true', help='Find large messages (>10MB)')
    parser.add_argument('--archive', action='store_true', help='Archive old inbox messages (>30 days)')
    parser.add_argument('--all', action='store_true', help='Run all cleanup operations')
    parser.add_argument('--threshold-mb', type=int, default=10, help='Large message threshold in MB')
    parser.add_argument('--folder', default='inbox', help='Folder to scan (inbox, junk, etc.)')
    parser.add_argument('--max-pages', type=int, default=50, help='Max pages per folder')
    
    args = parser.parse_args()
    
    dry_run = not args.execute
    if dry_run:
        print('🔍 DRY RUN MODE - no messages will be moved')
    else:
        print('⚡ EXECUTE MODE - messages will be moved')
    
    if args.all:
        args.junk = args.large = args.archive = True
    
    # Get folder ID
    folders = graph_call('/me/mailFolders?$select=id,displayName')
    folder_id = next((f['id'] for f in folders.get('value', []) if f['displayName'].lower() == args.folder.lower()), None)
    if not folder_id:
        print(f'❌ Folder "{args.folder}" not found')
        sys.exit(1)
    
    print(f'\n{"="*60}')
    print(f'OUTLOOK CLEANUP - {datetime.now().strftime("%Y-%m-%d %H:%M:%S")}')
    print(f'Account: jasonbrodsky@hotmail.com')
    print(f'Folder: {args.folder}')
    print(f'{"="*60}\n')
    
    if args.junk:
        print(f'🧹 Scanning for junk/phishing in {args.folder}...')
        stats = scan_folder(args.folder, folder_id, max_pages=args.max_pages, dry_run=dry_run)
        print(f'\n📊 Results: {stats}')
    
    if args.large:
        print(f'\n📦 Finding messages >{args.threshold_mb}MB...')
        stats = find_large_messages(threshold_mb=args.threshold_mb, max_pages=args.max_pages, dry_run=dry_run)
        print(f'\n📊 Large messages: {stats}')
    
    if args.archive:
        print(f'\n📦 Archiving inbox messages >30 days...')
        stats = archive_old_inbox(days=30, dry_run=dry_run)
        print(f'\n📊 Archive: {stats}')
    
    print(f'\n✅ Done. Run with --execute to apply changes.')

if __name__ == '__main__':
    main()