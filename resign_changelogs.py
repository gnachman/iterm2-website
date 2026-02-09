#!/usr/bin/env python3
"""
Re-sign changelog files with a new GPG signature.

This script finds all .changelog files containing PGP signatures,
extracts the hash, and re-signs it with gpg --clearsign.

Before running, ensure gpg-agent has your passphrase cached by signing
something manually first.
"""

import glob
import re
import subprocess
import sys
import tempfile
from pathlib import Path
from typing import Optional, Tuple


def extract_hash_from_pgp_block(content: str) -> Optional[str]:
    """Extract the SHA-256 hash from a PGP signed message block."""
    # Pattern to match the hash between "Hash: SHA256" line and the signature
    pattern = r'-----BEGIN PGP SIGNED MESSAGE-----\s*\nHash: SHA256\s*\n\n([a-f0-9]{64})\n-----BEGIN PGP SIGNATURE-----'
    match = re.search(pattern, content)
    if match:
        return match.group(1)
    return None


def find_pgp_block(content: str) -> Optional[Tuple[int, int]]:
    """Find the start and end positions of the entire PGP block."""
    start_marker = "-----BEGIN PGP SIGNED MESSAGE-----"
    end_marker = "-----END PGP SIGNATURE-----"

    start = content.find(start_marker)
    if start == -1:
        return None

    end = content.find(end_marker, start)
    if end == -1:
        return None

    return (start, end + len(end_marker))


def sign_hash(hash_value: str) -> Optional[str]:
    """Sign a hash using gpg --clearsign and return the signed message."""
    with tempfile.NamedTemporaryFile(mode='w', suffix='.txt', delete=False) as f:
        f.write(hash_value + '\n')
        temp_path = f.name

    try:
        result = subprocess.run(
            ['gpg', '--clearsign', temp_path],
            capture_output=True,
            text=True
        )

        if result.returncode != 0:
            print(f"GPG error: {result.stderr}", file=sys.stderr)
            return None

        # Read the signed output
        signed_path = temp_path + '.asc'
        with open(signed_path, 'r') as f:
            return f.read().strip()
    finally:
        # Clean up temp files
        Path(temp_path).unlink(missing_ok=True)
        Path(temp_path + '.asc').unlink(missing_ok=True)


def process_file(filepath: str, dry_run: bool = False) -> bool:
    """Process a single changelog file. Returns True if modified."""
    with open(filepath, 'r') as f:
        content = f.read()

    # Extract the hash
    hash_value = extract_hash_from_pgp_block(content)
    if not hash_value:
        return False

    # Find the PGP block boundaries
    block_pos = find_pgp_block(content)
    if not block_pos:
        return False

    print(f"Processing: {filepath}")
    print(f"  Hash: {hash_value}")

    if dry_run:
        print("  (dry run - skipping signature)")
        return True

    # Generate new signature
    new_signature = sign_hash(hash_value)
    if not new_signature:
        print(f"  ERROR: Failed to sign", file=sys.stderr)
        return False

    # Replace the old PGP block with the new one
    new_content = content[:block_pos[0]] + new_signature + content[block_pos[1]:]

    with open(filepath, 'w') as f:
        f.write(new_content)

    print("  Signed successfully")
    return True


def main():
    import argparse
    parser = argparse.ArgumentParser(description='Re-sign changelog PGP signatures')
    parser.add_argument('--dry-run', action='store_true',
                        help='Show what would be done without signing')
    parser.add_argument('--file', type=str,
                        help='Process only this specific file')
    args = parser.parse_args()

    if args.file:
        files = [args.file]
    else:
        files = sorted(glob.glob('downloads/*/*.changelog'))

    processed = 0
    skipped = 0
    errors = 0

    for filepath in files:
        try:
            if process_file(filepath, dry_run=args.dry_run):
                processed += 1
            else:
                skipped += 1
        except Exception as e:
            print(f"ERROR processing {filepath}: {e}", file=sys.stderr)
            errors += 1

    print(f"\nSummary: {processed} processed, {skipped} skipped (no signature), {errors} errors")


if __name__ == '__main__':
    main()
