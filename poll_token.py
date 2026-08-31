#!/usr/bin/env python3
import os, sys, json, time, urllib.request, urllib.parse

ws = '/workspace/bb8f9c5f-e866-4346-a29c-8d72daa0ad2d/sessions/agent_b5a7d01d-ebef-4a90-bc4b-206ab5177645'

# Load device code from workspace
with open(os.path.join(ws, 'device_code.json')) as f:
    dc_data = json.load(f)

client_id = '14d82eec-204b-4c2f-b7e8-296a70dab67e'
scopes = 'https://graph.microsoft.com/Mail.ReadWrite https://graph.microsoft.com/Mail.Send offline_access'
dc = dc_data['dc']
exp = dc_data['exp']
account = dc_data['account']

print(f'Polling for {account}...')
sys.stdout.flush()

t0 = time.time()
while time.time() - t0 < exp - 10:
    time.sleep(3)
    td = {
        'client_id': client_id,
        'scope': scopes,
        'grant_type': 'urn:ietf:params:oauth:grant-type:device_code',
        'code': dc
    }
    data = urllib.parse.urlencode(td).encode()
    req = urllib.request.Request(
        'https://login.microsoftonline.com/common/oauth2/v2.0/token',
        data=data
    )
    req.add_header('Content-Type', 'application/x-www-form-urlencoded')
    try:
        tr = json.loads(urllib.request.urlopen(req).read())
        tr['expires_on'] = time.time() + int(tr.get('expires_in', 3600))
        
        # Save token to workspace
        with open(os.path.join(ws, 'hotmail_token.json'), 'w') as f:
            json.dump(tr, f)
        
        print(f'AUTHENTICATED: {account}')
        print(f'Token saved to {ws}/hotmail_token.json')
        sys.stdout.flush()
        sys.exit(0)
    except urllib.error.HTTPError as e:
        err = json.loads(e.read())
        ecode = err.get('error', '')
        if ecode == 'authorization_pending':
            print('.', end='', flush=True)
            continue
        else:
            print(f'AUTH ERROR: {ecode}')
            sys.stdout.flush()
            sys.exit(1)

print('TIMEOUT')
sys.stdout.flush()
sys.exit(1)
