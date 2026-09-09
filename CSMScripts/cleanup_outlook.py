#!/usr/bin/env python3
"""
Cleanup Outlook — Junk & Large Email Cleaner
=============================================
Scans jasonbrodsky@hotmail.com for:
- Junk emails (Junk Email folder + classification)
- Large emails (>10MB by default)
Logs progress to Drafts folder. Optionally deletes/archives.

Usage:
    python3 cleanup_outlook.py --junk --large --archive --execute
    python3 cleanup_outlook.py --junk --large --dry-run
"""

import os, sys, json, time, argparse, urllib.request, urllib.parse, urllib.error

# ─── CONFIG ──────────────────────────────────────────────
CONFIG = {
    'workspace': '/workspace/bb8f9c5f-e866-4346-a29c-8d72daa0ad2d/sessions/agent_2602494e-a931-4e3f-928b-de0b8c1ef748',
    'scratch': '/tmp/kilo',
    'client_id': os.environ.get('CSM_CLIENT_ID', '14d82eec-204b-4c2f-b7e8-296a70dab67e'),
    'tenant': os.environ.get('CSM_TENANT', None),
    'graph_base': 'https://graph.microsoft.com/v1.0',
    'account': 'jasonbrodsky@hotmail.com',
    'scopes': 'https://graph.microsoft.com/Mail.ReadWrite https://graph.microsoft.com/Mail.Send offline_access',
    'large_threshold_mb': 10,
    'batch_size': 50,
}

# ─── AUTH ────────────────────────────────────────────────
def load_cached_token():
    """Load cached token from disk if valid."""
    token_file = os.path.join(CONFIG['scratch'], 'hotmail_token.json')
    if os.path.exists(token_file):
        with open(token_file) as f:
            try:
                t = json.load(f)
                if t.get('expires_on', 0) > time.time() + 60:
                    return t
            except:
                pass
    return None

def device_code_auth():
    """Authenticate via device code flow."""
    cached = load_cached_token()
    if cached:
        print(f'\n🔑 USING CACHED TOKEN: {CONFIG["account"]} (expires in {int(cached["expires_on"] - time.time())}s)')
        return cached

    print(f'\n🔑 AUTHENTICATING: {CONFIG["account"]}')
    print(f'   Requesting device code...')

    tenant_path = CONFIG.get('tenant') or 'common'
    params = {'client_id': CONFIG['client_id'], 'scope': CONFIG['scopes']}
    data = urllib.parse.urlencode(params).encode()
    req = urllib.request.Request(
        f'https://login.microsoftonline.com/{tenant_path}/oauth2/v2.0/devicecode',
        data=data
    )
    req.add_header('Content-Type', 'application/x-www-form-urlencoded')
    r = json.loads(urllib.request.urlopen(req).read())
    code = r['user_code']
    dc = r['device_code']
    exp = int(r['expires_in'])

    print(f'''
╔══════════════════════════════════════════════════════════╗
║  DEVICE CODE: {code}                                  ║
║  URL: https://microsoft.com/devicelogin                 ║
║  ACCOUNT: {CONFIG["account"]}                      ║
║  EXPIRES: {exp//60} minutes                                       ║
║                                                        ║
║  STEPS:                                                ║
║  1. Open PRIVATE/INCOGNITO browser window              ║
║  2. Go to https://microsoft.com/devicelogin             ║
║  3. Enter code: {code}                            ║
║  4. Sign in as: {CONFIG["account"]}              ║
║  5. Approve MFA push on Authenticator app             ║
╚══════════════════════════════════════════════════════════╝
''')

    print('   Polling for authentication...', end='', flush=True)
    t0 = time.time()
    while time.time() - t0 < exp - 10:
        time.sleep(2)
        td = {
            'client_id': CONFIG['client_id'],
            'scope': CONFIG['scopes'],
            'grant_type': 'urn:ietf:params:oauth:grant-type:device_code',
            'code': dc
        }
        data = urllib.parse.urlencode(td).encode()
        req = urllib.request.Request(
            f'https://login.microsoftonline.com/{tenant_path}/oauth2/v2.0/token',
            data=data
        )
        req.add_header('Content-Type', 'application/x-www-form-urlencoded')
        try:
            tr = json.loads(urllib.request.urlopen(req).read())
            tr['expires_on'] = time.time() + int(tr.get('expires_in', 3600))

            token_file = os.path.join(CONFIG['scratch'], 'hotmail_token.json')
            os.makedirs(CONFIG['scratch'], exist_ok=True)
            with open(token_file, 'w') as f:
                json.dump(tr, f)

            print(f'\n   ✅ AUTHENTICATED: {CONFIG["account"]} ({tr.get("expires_in")}s)')
            return tr
        except urllib.error.HTTPError as e:
            err = json.loads(e.read())
            ecode = err.get('error', '')
            if ecode == 'authorization_pending':
                print('.', end='', flush=True)
                continue
            else:
                print(f'\n   ❌ AUTH ERROR: {ecode}')
                return None

    print('\n   ❌ TIMEOUT — device code expired')
    return None

def get_headers(token):
    return {
        'Authorization': f'Bearer {token["access_token"]}',
        'Content-Type': 'application/json'
    }

def graph_call(headers, path, body=None, method='GET'):
    """Make a Graph API call with error handling."""
    url = CONFIG['graph_base'] + path
    data = json.dumps(body).encode() if body else None
    req = urllib.request.Request(url, data=data, method=method)
    for k, v in headers.items():
        req.add_header(k, v)
    try:
        resp = urllib.request.urlopen(req)
        raw = resp.read()
        return json.loads(raw) if raw else {'ok': True}
    except urllib.error.HTTPError as e:
        err = e.read().decode()
        if e.code == 401:
            return None
        if e.code == 429:
            print(f'   ⚠️  RATE LIMIT — waiting...')
            time.sleep(5)
            return None
        if e.code == 403:
            print(f'   ⚠️  PERMISSION DENIED — check scopes')
            return None
        print(f'   ⚠️  HTTP {e.code}: {err[:100]}')
        return None

# ─── DRAFTS LOGGING ──────────────────────────────────────
def log_to_drafts(headers, subject, body_html):
    """Create a draft in the Drafts folder as a log entry."""
    draft = {
        'subject': subject,
        'body': {'contentType': 'HTML', 'content': body_html},
        'toRecipients': [{'emailAddress': {'address': CONFIG['account']}}]
    }
    data = json.dumps(draft).encode()
    req = urllib.request.Request(f'{CONFIG["graph_base"]}/me/messages', data=data, method='POST')
    for k, v in headers.items():
        req.add_header(k, v)
    try:
        resp = urllib.request.urlopen(req)
        return json.loads(resp.read())
    except urllib.error.HTTPError as e:
        print(f'   ⚠️  Failed to log to drafts: {e.code}')
        return None

def format_bytes(bytes_val):
    """Format bytes to human readable."""
    for unit in ['B', 'KB', 'MB', 'GB']:
        if bytes_val < 1024:
            return f'{bytes_val:.1f} {unit}'
        bytes_val /= 1024
    return f'{bytes_val:.1f} TB'

# ─── JUNK EMAIL SCAN ─────────────────────────────────────
def scan_junk_folder(headers, execute=False):
    """Scan Junk Email folder."""
    print('\n📧 SCANNING JUNK EMAIL FOLDER...')
    log_entries = []
    total_count = 0
    total_size = 0

    # Get Junk Email folder
    folders = graph_call(headers, '/me/mailFolders?$select=id,displayName')
    junk_id = next((f['id'] for f in folders.get('value', []) 
                    if f['displayName'].lower() in ['junk email', 'junk']), None)

    if not junk_id:
        print('   ⚠️  Junk Email folder not found')
        return []

    # Scan messages in junk folder
    next_url = f'/me/mailFolders/{junk_id}/messages?$top={CONFIG["batch_size"]}&$select=id,subject,from,receivedDateTime,size,hasAttachments&$orderby=receivedDateTime desc'
    
    while next_url:
        msgs = graph_call(headers, next_url)
        if not msgs:
            break

        for m in msgs.get('value', []):
            total_count += 1
            size = m.get('size', 0)
            total_size += size
            subject = m.get('subject', '(no subject)')
            from_addr = m.get('from', {}).get('emailAddress', {}).get('address', 'unknown')
            received = m.get('receivedDateTime', 'unknown')
            has_att = m.get('hasAttachments', False)
            
            log_entries.append({
                'id': m['id'],
                'subject': subject,
                'from': from_addr,
                'received': received,
                'size': size,
                'size_fmt': format_bytes(size),
                'has_attachments': has_att,
                'folder': 'Junk Email'
            })
            
            print(f'   [{total_count}] {subject[:60]} | {from_addr} | {format_bytes(size)} | {received}')

        next_url = msgs.get('@odata.nextLink')
        if next_url:
            next_url = next_url.replace(CONFIG['graph_base'], '')

    print(f'\n   📊 Junk folder: {total_count} messages, {format_bytes(total_size)} total')
    return log_entries

def scan_inbox_for_junk_classified(headers, execute=False):
    """Scan Inbox for emails classified as junk/spam."""
    print('\n📧 SCANNING INBOX FOR JUNK-CLASSIFIED EMAILS...')
    log_entries = []
    total_count = 0

    next_url = f'/me/mailFolders/inbox/messages?$top={CONFIG["batch_size"]}&$select=id,subject,from,receivedDateTime,size,hasAttachments,inferenceClassification&$orderby=receivedDateTime desc'
    
    while next_url:
        msgs = graph_call(headers, next_url)
        if not msgs:
            break

        for m in msgs.get('value', []):
            classification = m.get('inferenceClassification', 'focused')
            if classification == 'other':  # 'other' = junk/clutter in Graph
                total_count += 1
                size = m.get('size', 0)
                subject = m.get('subject', '(no subject)')
                from_addr = m.get('from', {}).get('emailAddress', {}).get('address', 'unknown')
                received = m.get('receivedDateTime', 'unknown')
                has_att = m.get('hasAttachments', False)
                
                log_entries.append({
                    'id': m['id'],
                    'subject': subject,
                    'from': from_addr,
                    'received': received,
                    'size': size,
                    'size_fmt': format_bytes(size),
                    'has_attachments': has_att,
                    'folder': 'Inbox (classified as junk)',
                    'classification': classification
                })
                
                print(f'   [{total_count}] {subject[:60]} | {from_addr} | {format_bytes(size)} | {received}')

        next_url = msgs.get('@odata.nextLink')
        if next_url:
            next_url = next_url.replace(CONFIG['graph_base'], '')

    print(f'\n   📊 Inbox junk-classified: {total_count} messages')
    return log_entries

# ─── LARGE EMAIL SCAN ────────────────────────────────────
def scan_large_emails(headers, execute=False):
    """Scan all folders for large emails."""
    print(f'\n📧 SCANNING FOR LARGE EMAILS (>{CONFIG["large_threshold_mb"]}MB)...')
    log_entries = []
    total_count = 0
    total_size = 0

    # Get all mail folders
    folders = graph_call(headers, '/me/mailFolders?$select=id,displayName')
    if not folders:
        return []

    folder_ids = [(f['id'], f['displayName']) for f in folders.get('value', [])]
    print(f'   Scanning {len(folder_ids)} folders...')

    for folder_id, folder_name in folder_ids:
        # Skip some system folders
        if folder_name.lower() in ['deleteditems', 'drafts', 'sentitems', 'conversation history']:
            continue

        next_url = f'/me/mailFolders/{folder_id}/messages?$top={CONFIG["batch_size"]}&$select=id,subject,from,receivedDateTime,size,hasAttachments&$orderby=size desc'
        
        folder_count = 0
        while next_url:
            msgs = graph_call(headers, next_url)
            if not msgs:
                break

            for m in msgs.get('value', []):
                size = m.get('size', 0)
                if size > CONFIG['large_threshold_mb'] * 1024 * 1024:
                    total_count += 1
                    folder_count += 1
                    total_size += size
                    subject = m.get('subject', '(no subject)')
                    from_addr = m.get('from', {}).get('emailAddress', {}).get('address', 'unknown')
                    received = m.get('receivedDateTime', 'unknown')
                    has_att = m.get('hasAttachments', False)
                    
                    log_entries.append({
                        'id': m['id'],
                        'subject': subject,
                        'from': from_addr,
                        'received': received,
                        'size': size,
                        'size_fmt': format_bytes(size),
                        'has_attachments': has_att,
                        'folder': folder_name
                    })
                    
                    print(f'   [{total_count}] {folder_name} | {subject[:50]} | {from_addr} | {format_bytes(size)}')

                # Since ordered by size desc, we can break when size drops below threshold
                elif size <= CONFIG['large_threshold_mb'] * 1024 * 1024:
                    break

            next_url = msgs.get('@odata.nextLink')
            if next_url:
                next_url = next_url.replace(CONFIG['graph_base'], '')
            else:
                break
        
        if folder_count > 0:
            print(f'   📁 {folder_name}: {folder_count} large emails')

    print(f'\n   📊 Large emails: {total_count} messages, {format_bytes(total_size)} total')
    return log_entries

# ─── EXECUTE CLEANUP ─────────────────────────────────────
def execute_cleanup(headers, junk_entries, large_entries, archive_folder='Cleanup_Archive'):
    """Execute the cleanup: move to archive folder and/or delete."""
    print('\n🧹 EXECUTING CLEANUP...')
    
    # Create or get archive folder
    folders = graph_call(headers, '/me/mailFolders?$select=id,displayName')
    archive_id = next((f['id'] for f in folders.get('value', []) 
                       if f['displayName'] == archive_folder), None)

    if not archive_id:
        new = graph_call(headers, '/me/mailFolders', 
                        {'displayName': archive_folder}, method='POST')
        archive_id = new['id'] if new else None
        print(f'   📁 Created archive folder: {archive_folder}')

    if not archive_id:
        print('   ❌ Could not create/access archive folder')
        return {'archived': 0, 'deleted': 0, 'errors': 0}

    archived = 0
    deleted = 0
    errors = 0

    # Archive junk emails
    for entry in junk_entries:
        try:
            result = graph_call(headers, f'/me/messages/{entry["id"]}/move',
                               {'destinationId': archive_id}, method='POST')
            if result is not None:
                archived += 1
                print(f'   ✅ Archived: {entry["subject"][:50]}')
            else:
                errors += 1
        except Exception as e:
            errors += 1
            print(f'   ❌ Error archiving {entry["id"]}: {e}')

    # Archive large emails
    for entry in large_entries:
        try:
            result = graph_call(headers, f'/me/messages/{entry["id"]}/move',
                               {'destinationId': archive_id}, method='POST')
            if result is not None:
                archived += 1
                print(f'   ✅ Archived: {entry["subject"][:50]}')
            else:
                errors += 1
        except Exception as e:
            errors += 1
            print(f'   ❌ Error archiving {entry["id"]}: {e}')

    print(f'\n   📊 Cleanup complete: {archived} archived, {deleted} deleted, {errors} errors')
    return {'archived': archived, 'deleted': deleted, 'errors': errors}

# ─── MAIN ────────────────────────────────────────────────
def main():
    parser = argparse.ArgumentParser(description='Cleanup Outlook — Junk & Large Email Cleaner')
    parser.add_argument('--junk', action='store_true', help='Scan for junk emails')
    parser.add_argument('--large', action='store_true', help='Scan for large emails')
    parser.add_argument('--archive', action='store_true', help='Archive found emails to Cleanup_Archive folder')
    parser.add_argument('--execute', action='store_true', help='Actually perform cleanup (not dry-run)')
    parser.add_argument('--dry-run', action='store_true', help='Scan only, no changes (default)')
    parser.add_argument('--threshold', type=int, default=10, help='Large email threshold in MB (default: 10)')
    parser.add_argument('--account', default='jasonbrodsky@hotmail.com', help='Email account to clean')
    args = parser.parse_args()

    if not args.junk and not args.large:
        parser.error('At least one of --junk or --large required')

    CONFIG['account'] = args.account
    CONFIG['large_threshold_mb'] = args.threshold

    print('''
╔══════════════════════════════════════════════════════════════╗
║           OUTLOOK CLEANUP — jasonbrodsky@hotmail.com         ║
║        Junk & Large Email Scanner + Archiver                 ║
╚══════════════════════════════════════════════════════════════╝
''')

    # Phase 1: Auth
    token = device_code_auth()
    if not token:
        print('\n❌ Authentication failed. Exiting.')
        sys.exit(1)

    headers = get_headers(token)

    all_entries = []

    # Phase 2: Scan
    if args.junk:
        all_entries.extend(scan_junk_folder(headers))
        all_entries.extend(scan_inbox_for_junk_classified(headers))

    if args.large:
        all_entries.extend(scan_large_emails(headers))

    if not all_entries:
        print('\n✅ No emails found matching criteria.')
        return

    # Phase 3: Log to Drafts
    print('\n📝 LOGGING RESULTS TO DRAFTS FOLDER...')
    
    # Summary log
    junk_count = sum(1 for e in all_entries if 'Junk' in e['folder'])
    large_count = sum(1 for e in all_entries if 'Junk' not in e['folder'] and e['size'] > CONFIG['large_threshold_mb'] * 1024 * 1024)
    total_size = sum(e['size'] for e in all_entries)

    summary_html = f'''
<html><body>
<h2>🧹 Outlook Cleanup Log — {time.strftime("%Y-%m-%d %H:%M:%S UTC", time.gmtime())}</h2>
<p><strong>Account:</strong> {CONFIG['account']}</p>
<p><strong>Scan criteria:</strong> {'Junk' if args.junk else ''} {' + ' if args.junk and args.large else ''} {'Large (>'+str(CONFIG['large_threshold_mb'])+'MB)' if args.large else ''}</p>
<p><strong>Mode:</strong> {'EXECUTE' if args.execute else 'DRY RUN'}</p>
<hr>
<h3>Summary</h3>
<ul>
<li>Junk emails found: {junk_count}</li>
<li>Large emails found: {large_count}</li>
<li>Total emails: {len(all_entries)}</li>
<li>Total size: {format_bytes(total_size)}</li>
</ul>
<hr>
<h3>Details</h3>
<table border="1" cellpadding="5" cellspacing="0">
<tr><th>Folder</th><th>Subject</th><th>From</th><th>Received</th><th>Size</th><th>Attachments</th></tr>
'''
    for e in all_entries:
        summary_html += f'<tr><td>{e["folder"]}</td><td>{e["subject"]}</td><td>{e["from"]}</td><td>{e["received"]}</td><td>{e["size_fmt"]}</td><td>{"Yes" if e["has_attachments"] else "No"}</td></tr>'

    summary_html += '</table></body></html>'

    log_to_drafts(headers, f'[Cleanup Log] {len(all_entries)} emails found — {time.strftime("%Y-%m-%d %H:%M")}', summary_html)
    print('   ✅ Summary draft created')

    # Phase 4: Execute if requested
    if args.execute and args.archive:
        result = execute_cleanup(headers, 
                                [e for e in all_entries if 'Junk' in e['folder']],
                                [e for e in all_entries if 'Junk' not in e['folder']])
        
        # Log execution result
        exec_html = f'''
<html><body>
<h2>🧹 Cleanup Execution Log — {time.strftime("%Y-%m-%d %H:%M:%S UTC", time.gmtime())}</h2>
<p><strong>Account:</strong> {CONFIG['account']}</p>
<p><strong>Archived:</strong> {result['archived']}</p>
<p><strong>Deleted:</strong> {result['deleted']}</p>
<p><strong>Errors:</strong> {result['errors']}</p>
</body></html>
'''
        log_to_drafts(headers, f'[Cleanup Execution] {result["archived"]} archived — {time.strftime("%Y-%m-%d %H:%M")}', exec_html)
        print('   ✅ Execution log draft created')
    elif args.execute and not args.archive:
        print('\n⚠️  --execute requires --archive to move emails to archive folder')
    else:
        print('\n🔍 DRY RUN COMPLETE — No changes made. Use --archive --execute to perform cleanup.')

    print('\n✅ DONE — Check your Drafts folder for logs.')

if __name__ == '__main__':
    main()