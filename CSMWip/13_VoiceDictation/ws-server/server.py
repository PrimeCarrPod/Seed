#!/usr/bin/env python3
"""
VoiceDictation WebSocket Bridge Server — Pure Python (asyncio + websockets)
Runs in Debian/cloud environment. No Node.js required.

Protocol:
- Android connects, sends: {"type":"text","payload":"recognized words"}
- Server broadcasts to all Chrome extension clients
- Chrome extension identifies with: {"clientType":"chrome"}
"""

import asyncio
import json
import signal
import sys
from typing import Set

import websockets

PORT = 8765
HOST = "0.0.0.0"

android_clients: Set[websockets.WebSocketServerProtocol] = set()
chrome_clients: Set[websockets.WebSocketServerProtocol] = set()


async def broadcast_to_chrome(message: dict):
    """Relay message from Android to all connected Chrome clients."""
    payload = json.dumps(message)
    disconnected = set()
    for client in chrome_clients:
        try:
            await client.send(payload)
        except websockets.exceptions.ConnectionClosed:
            disconnected.add(client)
    for client in disconnected:
        chrome_clients.discard(client)


async def handle_connection(websocket: websockets.WebSocketServerProtocol, path: str):
    client_ip = websocket.remote_address[0] if websocket.remote_address else "unknown"
    print(f"[VoiceDictation] New connection from {client_ip} on path {path}")
    
    client_type = None
    
    try:
        async for message in websocket:
            try:
                msg = json.loads(message)
            except json.JSONDecodeError:
                print(f"[VoiceDictation] Invalid JSON from {client_ip}: {message[:100]}")
                continue
            
            # Identify client type on first meaningful message
            if client_type is None:
                if msg.get("clientType") == "chrome":
                    client_type = "chrome"
                    chrome_clients.add(websocket)
                    print(f"[VoiceDictation] Registered Chrome client ({len(chrome_clients)} total)")
                    continue
                elif msg.get("type") == "text" or msg.get("clientType") == "android":
                    client_type = "android"
                    android_clients.add(websocket)
                    print(f"[VoiceDictation] Registered Android client ({len(android_clients)} total)")
            
            # Handle text messages from Android
            if client_type == "android" and msg.get("type") == "text" and msg.get("payload"):
                print(f"[VoiceDictation] Relaying text: '{msg['payload']}'")
                await broadcast_to_chrome(msg)
                
    except websockets.exceptions.ConnectionClosed:
        pass
    finally:
        if client_type == "android":
            android_clients.discard(websocket)
            print(f"[VoiceDictation] Android disconnected ({len(android_clients)} remaining)")
        elif client_type == "chrome":
            chrome_clients.discard(websocket)
            print(f"[VoiceDictation] Chrome disconnected ({len(chrome_clients)} remaining)")
        else:
            print("[VoiceDictation] Unknown client disconnected")


async def main():
    print(f"[VoiceDictation] WS Server starting on ws://{HOST}:{PORT}")
    print(f"[VoiceDictation] Android should connect to ws://<DEBIAN_IP>:{PORT}/dictation")
    print(f"[VoiceDictation] Chrome extension connects to ws://localhost:{PORT}")
    
    server = await websockets.serve(handle_connection, HOST, PORT)
    
    # Graceful shutdown
    loop = asyncio.get_running_loop()
    stop_event = asyncio.Event()
    
    def signal_handler():
        print("\n[VoiceDictation] Shutting down...")
        stop_event.set()
    
    for sig in (signal.SIGINT, signal.SIGTERM):
        try:
            loop.add_signal_handler(sig, signal_handler)
        except NotImplementedError:
            # Windows doesn't support add_signal_handler
            pass
    
    await stop_event.wait()
    server.close()
    await server.wait_closed()
    print("[VoiceDictation] Server closed")


if __name__ == "__main__":
    try:
        asyncio.run(main())
    except KeyboardInterrupt:
        pass