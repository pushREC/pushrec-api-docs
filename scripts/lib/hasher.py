#!/usr/bin/env python3
"""
hasher.py - Content hash-based change detection

Stores SHA-256 hashes of each doc page and detects:
- ADDED: New pages found during scrape
- MODIFIED: Content hash differs from previous
- REMOVED: Page no longer exists (triggers deprecation)
"""

import argparse
import hashlib
import json
import os
from datetime import datetime
from pathlib import Path
from typing import Dict, List, Optional, Tuple

# Import shared config
from config import load_config, get_sources, ConfigError


def compute_hash(file_path: Path) -> Optional[str]:
    """Compute SHA-256 hash of file content."""
    try:
        with open(file_path, "rb") as f:
            return hashlib.sha256(f.read()).hexdigest()
    except FileNotFoundError:
        print(f"[ERROR] File not found: {file_path}")
        return None
    except PermissionError:
        print(f"[ERROR] Permission denied: {file_path}")
        return None
    except Exception as e:
        print(f"[ERROR] Failed to hash {file_path}: {e}")
        return None


def load_hashes(hash_file: Path) -> Dict[str, str]:
    """Load stored hashes from JSON file."""
    if not hash_file.exists():
        return {}

    try:
        with open(hash_file, "r", encoding="utf-8") as f:
            return json.load(f)
    except json.JSONDecodeError as e:
        print(f"[ERROR] Corrupted hash file {hash_file}: {e}")
        print(f"[INFO] Recreating hash file from scratch")
        return {}
    except PermissionError:
        print(f"[ERROR] Permission denied reading: {hash_file}")
        return {}
    except Exception as e:
        print(f"[ERROR] Failed to load hashes from {hash_file}: {e}")
        return {}


def save_hashes(hash_file: Path, hashes: Dict[str, str]) -> bool:
    """Save hashes to JSON file. Returns True on success."""
    try:
        hash_file.parent.mkdir(parents=True, exist_ok=True)
        with open(hash_file, "w", encoding="utf-8") as f:
            json.dump(hashes, f, indent=2, sort_keys=True)
        return True
    except PermissionError:
        print(f"[ERROR] Permission denied writing: {hash_file}")
        return False
    except Exception as e:
        print(f"[ERROR] Failed to save hashes to {hash_file}: {e}")
        return False


def compute_all_hashes(source_dir: Path) -> Dict[str, str]:
    """Compute hashes for all markdown files in a source directory."""
    hashes = {}
    for md_file in source_dir.rglob("*.md"):
        # Skip _deprecated folder
        if "_deprecated" in str(md_file):
            continue
        relative_path = str(md_file.relative_to(source_dir))
        file_hash = compute_hash(md_file)
        if file_hash is not None:
            hashes[relative_path] = file_hash
    return hashes


def detect_changes(
    old_hashes: Dict[str, str],
    new_hashes: Dict[str, str]
) -> Tuple[List[str], List[str], List[str]]:
    """
    Compare old and new hashes to detect changes.

    Returns:
        Tuple of (added, modified, removed) file lists
    """
    old_files = set(old_hashes.keys())
    new_files = set(new_hashes.keys())

    added = list(new_files - old_files)
    removed = list(old_files - new_files)

    # Check for modifications in files that exist in both
    modified = []
    for file in old_files & new_files:
        if old_hashes[file] != new_hashes[file]:
            modified.append(file)

    return sorted(added), sorted(modified), sorted(removed)


def log_changes(
    changelog_path: Path,
    source: str,
    added: List[str],
    modified: List[str],
    removed: List[str]
) -> bool:
    """Append changes to changelog. Returns True on success."""
    if not (added or modified or removed):
        return True

    timestamp = datetime.now().strftime("%Y-%m-%d %H:%M:%S")

    entry = f"\n## {timestamp} - {source}\n\n"

    if added:
        entry += "### Added\n"
        for f in added:
            entry += f"- `{f}`\n"
        entry += "\n"

    if modified:
        entry += "### Modified\n"
        for f in modified:
            entry += f"- `{f}`\n"
        entry += "\n"

    if removed:
        entry += "### Removed (Deprecation Triggered)\n"
        for f in removed:
            entry += f"- `{f}`\n"
        entry += "\n"

    try:
        changelog_path.parent.mkdir(parents=True, exist_ok=True)
        with open(changelog_path, "a", encoding="utf-8") as f:
            f.write(entry)
        return True
    except PermissionError:
        print(f"[ERROR] Permission denied writing changelog: {changelog_path}")
        return False
    except Exception as e:
        print(f"[ERROR] Failed to write changelog: {e}")
        return False


def main():
    parser = argparse.ArgumentParser(description="Hash-based change detection")
    parser.add_argument("--repo", required=True, help="Repository root path")
    parser.add_argument("--source", help="Specific source to check")
    parser.add_argument("--diff", action="store_true", help="Show diff only")
    args = parser.parse_args()

    repo = Path(args.repo)
    meta_dir = repo / "_meta"
    hashes_dir = meta_dir / "hashes"
    changelog_path = meta_dir / "CHANGELOG.md"

    # Load sources from config (no hardcoding)
    try:
        config = load_config()
        sources = get_sources(config)
    except ConfigError as e:
        print(e)
        return

    if args.source:
        if args.source not in sources:
            print(f"[ERROR] Unknown source: '{args.source}'. Available: {sources}")
            return
        sources = [args.source]

    for source in sources:
        source_dir = repo / source
        if not source_dir.exists():
            print(f"[SKIP] Source directory not found: {source}")
            continue

        hash_file = hashes_dir / f"{source}.json"
        old_hashes = load_hashes(hash_file)
        new_hashes = compute_all_hashes(source_dir)

        added, modified, removed = detect_changes(old_hashes, new_hashes)

        if args.diff:
            print(f"\n=== {source} ===")
            if added:
                print(f"Added ({len(added)}):")
                for f in added:
                    print(f"  + {f}")
            if modified:
                print(f"Modified ({len(modified)}):")
                for f in modified:
                    print(f"  ~ {f}")
            if removed:
                print(f"Removed ({len(removed)}):")
                for f in removed:
                    print(f"  - {f}")
            if not (added or modified or removed):
                print("  No changes")
        else:
            # Save new hashes and log changes
            save_hashes(hash_file, new_hashes)
            log_changes(changelog_path, source, added, modified, removed)

            total_changes = len(added) + len(modified) + len(removed)
            print(f"[{source}] {len(new_hashes)} files, {total_changes} changes")


if __name__ == "__main__":
    main()
