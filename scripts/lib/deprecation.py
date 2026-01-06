#!/usr/bin/env python3
"""
deprecation.py - Deprecation tracking and archiving

Handles:
1. Marking files as deprecated (adds frontmatter + banner)
2. Tracking deprecated files in registry
3. Archiving files older than 30 days
"""

import argparse
import os
import re
import shutil
from datetime import datetime, timedelta
from pathlib import Path
from typing import Dict, List, Optional


DEPRECATION_BANNER = """
> **DEPRECATED**: This feature was deprecated on {date}.
> **Replacement**: {replacement}
> **Archive Date**: {archive_date}

---

"""


def add_deprecation_frontmatter(content: str, date: str) -> str:
    """Add deprecation fields to frontmatter."""
    if content.startswith("---"):
        # Find end of frontmatter
        try:
            end_idx = content.index("---", 3)
            frontmatter = content[3:end_idx].strip()
            rest = content[end_idx + 3:].lstrip()

            # Add deprecation fields
            new_frontmatter = frontmatter + f"\nstatus: deprecated\ndeprecated_date: {date}"

            return f"---\n{new_frontmatter}\n---\n\n{rest}"
        except ValueError:
            pass

    # No frontmatter, add one
    return f"""---
status: deprecated
deprecated_date: {date}
---

{content}"""


def add_deprecation_banner(content: str, date: str, replacement: str = "TBD") -> str:
    """Add deprecation warning banner after frontmatter."""
    archive_date = (datetime.strptime(date, "%Y-%m-%d") + timedelta(days=30)).strftime("%Y-%m-%d")

    banner = DEPRECATION_BANNER.format(
        date=date,
        replacement=replacement,
        archive_date=archive_date
    )

    if content.startswith("---"):
        try:
            end_idx = content.index("---", 3)
            frontmatter = content[:end_idx + 3]
            rest = content[end_idx + 3:].lstrip()
            return frontmatter + "\n\n" + banner + rest
        except ValueError:
            pass

    return banner + content


def update_registry(registry_path: Path, file_path: str, date: str) -> None:
    """Update deprecation registry with new entry."""
    registry_path.parent.mkdir(parents=True, exist_ok=True)

    if not registry_path.exists():
        with open(registry_path, "w") as f:
            f.write("# Deprecation Registry\n\n")
            f.write("Tracking deprecated documentation files.\n\n")
            f.write("| File | Deprecated Date | Archive Date | Status |\n")
            f.write("|------|-----------------|--------------|--------|\n")

    archive_date = (datetime.strptime(date, "%Y-%m-%d") + timedelta(days=30)).strftime("%Y-%m-%d")

    with open(registry_path, "a") as f:
        f.write(f"| `{file_path}` | {date} | {archive_date} | pending |\n")


def mark_deprecated(file_path: Path, repo: Path, replacement: str = "TBD") -> None:
    """Mark a file as deprecated."""
    if not file_path.exists():
        print(f"[ERROR] File not found: {file_path}")
        return

    with open(file_path, "r", encoding="utf-8") as f:
        content = f.read()

    # Check if already deprecated
    if "status: deprecated" in content:
        print(f"[SKIP] Already deprecated: {file_path}")
        return

    date = datetime.now().strftime("%Y-%m-%d")

    # Add frontmatter and banner
    content = add_deprecation_frontmatter(content, date)
    content = add_deprecation_banner(content, date, replacement)

    with open(file_path, "w", encoding="utf-8") as f:
        f.write(content)

    # Update registry
    relative_path = str(file_path.relative_to(repo))
    registry_path = repo / "_meta" / "DEPRECATED.md"
    update_registry(registry_path, relative_path, date)

    print(f"[MARKED] {relative_path}")


def get_deprecated_date(file_path: Path) -> Optional[datetime]:
    """Extract deprecated_date from file frontmatter."""
    with open(file_path, "r", encoding="utf-8") as f:
        content = f.read()

    match = re.search(r"deprecated_date:\s*(\d{4}-\d{2}-\d{2})", content)
    if match:
        return datetime.strptime(match.group(1), "%Y-%m-%d")
    return None


def archive_old_files(repo: Path) -> None:
    """Move files deprecated >30 days to _deprecated folders."""
    sources = ["claude-code", "claude-api", "agent-sdk"]
    today = datetime.now()
    archived = 0

    for source in sources:
        source_dir = repo / source
        deprecated_dir = source_dir / "_deprecated"

        if not source_dir.exists():
            continue

        for md_file in source_dir.rglob("*.md"):
            # Skip already archived
            if "_deprecated" in str(md_file):
                continue

            deprecated_date = get_deprecated_date(md_file)
            if deprecated_date is None:
                continue

            age = (today - deprecated_date).days
            if age >= 30:
                # Move to _deprecated
                deprecated_dir.mkdir(parents=True, exist_ok=True)
                dest = deprecated_dir / md_file.name
                shutil.move(str(md_file), str(dest))
                print(f"[ARCHIVED] {md_file.relative_to(repo)} -> _deprecated/")
                archived += 1

    if archived == 0:
        print("No files ready for archiving (none >30 days deprecated)")
    else:
        print(f"\nArchived {archived} file(s)")


def main():
    parser = argparse.ArgumentParser(description="Deprecation management")
    parser.add_argument("--mark", help="Mark file as deprecated")
    parser.add_argument("--archive", action="store_true", help="Archive old files")
    parser.add_argument("--repo", required=True, help="Repository root path")
    parser.add_argument("--replacement", default="TBD", help="Replacement doc URL")
    args = parser.parse_args()

    repo = Path(args.repo)

    if args.mark:
        mark_deprecated(Path(args.mark), repo, args.replacement)
    elif args.archive:
        archive_old_files(repo)
    else:
        print("Usage: deprecation.py --mark <file> | --archive")


if __name__ == "__main__":
    main()
