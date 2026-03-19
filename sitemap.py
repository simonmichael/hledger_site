#!/usr/bin/env python3
"""Generate a sitemap.xml from .html files in a directory.
Drop-in replacement for `sscli -b BASE_URL -r DIR`, requiring only python 3.

Usage: sitemap.py [-b BASE_URL] [-r DIR] [-o OUTPUT]
  -b  Base URL          (default: https://hledger.org)
  -r  Root directory    (default: out/)
  -o  Output file       (default: DIR/sitemap.xml)
"""
import argparse, os, sys
from datetime import datetime, timezone

def main():
    p = argparse.ArgumentParser(description="Generate sitemap.xml from .html files")
    p.add_argument("-b", "--base-url", default="https://hledger.org",
                   help="Base URL for the site (default: https://hledger.org)")
    p.add_argument("-r", "--root", default="out/",
                   help="Root directory to scan (default: out/)")
    p.add_argument("-o", "--output", default=None,
                   help="Output file (default: ROOT/sitemap.xml)")
    args = p.parse_args()

    root = args.root.rstrip("/")
    base = args.base_url.rstrip("/")
    output = args.output or os.path.join(root, "sitemap.xml")

    paths = []
    for dirpath, _dirs, files in os.walk(root):
        for f in files:
            if f.endswith(".html"):
                full = os.path.join(dirpath, f)
                rel = os.path.relpath(full, root)
                paths.append(rel)
    paths.sort()

    with open(output, "w") as out:
        out.write('<?xml version="1.0" encoding="UTF-8"?>\n')
        out.write('<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">\n')
        for path in paths:
            out.write(f"  <url><loc>{base}/{path}</loc></url>\n")
        out.write("</urlset>\n")

    print(f"sitemap: wrote {len(paths)} URLs to {output}")

if __name__ == "__main__":
    main()
