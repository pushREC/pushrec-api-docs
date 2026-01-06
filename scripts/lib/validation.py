#!/usr/bin/env python3
"""
validation.py - Quality checks for documentation

Validates:
- Frontmatter presence and required fields
- File structure
- Coverage metrics
- Staleness detection
"""

import argparse
import os
import re
from datetime import datetime, timedelta
from pathlib import Path
from typing import Dict, List, Optional, Tuple


def parse_frontmatter(content: str) -> Optional[Dict[str, str]]:
    """Extract YAML frontmatter from markdown content."""
    if not content.startswith("---"):
        return None

    try:
        end_idx = content.index("---", 3)
        frontmatter_text = content[3:end_idx].strip()

        # Simple YAML parsing (key: value)
        result = {}
        for line in frontmatter_text.split("\n"):
            if ":" in line:
                key, value = line.split(":", 1)
                result[key.strip()] = value.strip().strip('"').strip("'")
        return result
    except ValueError:
        return None


def validate_file(file_path: Path) -> Tuple[bool, List[str]]:
    """
    Validate a single documentation file.

    Returns:
        Tuple of (is_valid, list of issues)
    """
    issues = []

    try:
        with open(file_path, "r", encoding="utf-8") as f:
            content = f.read()
    except Exception as e:
        return False, [f"Cannot read file: {e}"]

    # Check minimum content length
    if len(content) < 500:
        issues.append("Content too short (<500 chars)")

    # Check frontmatter
    frontmatter = parse_frontmatter(content)
    if frontmatter is None:
        issues.append("Missing frontmatter")
    else:
        # Check required fields
        if "source" not in frontmatter:
            issues.append("Missing 'source' in frontmatter")
        if "scraped" not in frontmatter:
            issues.append("Missing 'scraped' date in frontmatter")

    # Check for proper heading
    if not re.search(r"^#\s+.+", content, re.MULTILINE):
        issues.append("Missing main heading (# Title)")

    is_valid = len(issues) == 0
    return is_valid, issues


def get_file_age(file_path: Path) -> int:
    """Get file age in days based on modification time."""
    mtime = datetime.fromtimestamp(os.path.getmtime(file_path))
    return (datetime.now() - mtime).days


def count_files(source_dir: Path) -> Tuple[int, int]:
    """Count total and deprecated files."""
    total = 0
    deprecated = 0

    for md_file in source_dir.rglob("*.md"):
        if "_deprecated" in str(md_file):
            deprecated += 1
        else:
            total += 1

    return total, deprecated


def generate_status(repo: Path) -> None:
    """Generate and print status report."""
    sources = ["claude-code", "claude-api", "agent-sdk"]

    print("=" * 60)
    print("API DOCUMENTATION STATUS")
    print("=" * 60)
    print()

    total_files = 0
    total_deprecated = 0
    total_stale = 0
    total_issues = 0

    for source in sources:
        source_dir = repo / source
        if not source_dir.exists():
            print(f"{source}: NOT INITIALIZED")
            continue

        files, deprecated = count_files(source_dir)
        total_files += files
        total_deprecated += deprecated

        # Check staleness and validation
        stale = 0
        issues = 0

        for md_file in source_dir.rglob("*.md"):
            if "_deprecated" in str(md_file):
                continue

            age = get_file_age(md_file)
            if age > 30:
                stale += 1

            is_valid, _ = validate_file(md_file)
            if not is_valid:
                issues += 1

        total_stale += stale
        total_issues += issues

        status = "OK" if issues == 0 and stale == 0 else "NEEDS ATTENTION"
        print(f"{source}:")
        print(f"  Files: {files}")
        print(f"  Deprecated: {deprecated}")
        print(f"  Stale (>30 days): {stale}")
        print(f"  Issues: {issues}")
        print(f"  Status: {status}")
        print()

    # Summary
    print("-" * 60)
    print("SUMMARY")
    print("-" * 60)
    print(f"Total Files: {total_files}")
    print(f"Total Deprecated: {total_deprecated}")
    print(f"Total Stale: {total_stale}")
    print(f"Total Issues: {total_issues}")

    if total_files > 0:
        coverage = 100  # Would need expected count from sources.yaml
        freshness = 100 - (total_stale / total_files * 100) if total_files > 0 else 0
        print(f"Freshness: {freshness:.1f}%")

    overall = "HEALTHY" if total_issues == 0 and total_stale == 0 else "NEEDS UPDATE"
    print(f"\nOverall Status: {overall}")


def full_validation(repo: Path) -> None:
    """Run full validation on all files."""
    sources = ["claude-code", "claude-api", "agent-sdk"]

    print("Running full validation...")
    print()

    all_valid = True

    for source in sources:
        source_dir = repo / source
        if not source_dir.exists():
            continue

        print(f"=== {source} ===")

        for md_file in sorted(source_dir.rglob("*.md")):
            if "_deprecated" in str(md_file):
                continue

            relative_path = md_file.relative_to(source_dir)
            is_valid, issues = validate_file(md_file)

            if is_valid:
                print(f"  [OK] {relative_path}")
            else:
                all_valid = False
                print(f"  [FAIL] {relative_path}")
                for issue in issues:
                    print(f"         - {issue}")

        print()

    if all_valid:
        print("All files passed validation!")
    else:
        print("Some files have validation issues.")


def main():
    parser = argparse.ArgumentParser(description="Documentation validation")
    parser.add_argument("--repo", required=True, help="Repository root path")
    parser.add_argument("--status", action="store_true", help="Show status report")
    parser.add_argument("--full", action="store_true", help="Full validation")
    args = parser.parse_args()

    repo = Path(args.repo)

    if args.status:
        generate_status(repo)
    elif args.full:
        full_validation(repo)
    else:
        generate_status(repo)


if __name__ == "__main__":
    main()
