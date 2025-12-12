#!/usr/bin/env python3
import argparse, sys, requests
from datetime import datetime

def now(): return datetime.utcnow().isoformat() + "Z"

def check(url, expected=200, timeout=5, verify=False):
    try:
        r = requests.get(url, timeout=timeout, verify=verify)
        return (r.status_code == expected, r.status_code, r.text[:200])
    except requests.exceptions.RequestException as e:
        return (False, 'ERR', str(e))

if __name__ == "__main__":
    p = argparse.ArgumentParser()
    p.add_argument("--url", required=True)
    p.add_argument("--expected", type=int, default=200)
    p.add_argument("--timeout", type=int, default=5)
    p.add_argument("--verify", action='store_true', default=False)
    args = p.parse_args()

    ok, status, info = check(args.url, args.expected, args.timeout, args.verify)
    out = {"time": now(), "url": args.url, "healthy": ok, "status": status, "info": info}
    print(out)
    sys.exit(0 if ok else 2)

