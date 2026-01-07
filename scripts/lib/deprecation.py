#!/usr/bin/env python3
"""
deprecation.py - Deprecation tracking and archiving

Handles:
1. Marking files as deprecated (adds frontmatter + banner)
2. Tracking deprecated files in registry
3. Archiving files older than configured days
"""

import argparse
import os
import re
import shutil
from datetime import datetime, timedelta
from pathlib import Path
from typing import Any, Dict, List, Optional

# Import shared config
from config import load_config, get_sources, get_setting, ConfigError


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


def add_deprecation_banner(content: str, date: str, replacement: str = "TBD", archive_after_days: int = 30) -> str:
    """Add deprecation warning banner after frontmatter."""
    archive_date = (datetime.strptime(date, "%Y-%m-%d") + timedelta(days=archive_after_days)).strftime("%Y-%m-%d")

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


def update_registry(registry_path: Path, file_path: str, date: str, archive_after_days: int = 30) -> bool:
    """Update deprecation registry with new entry. Returns True on success."""
    try:
        registry_path.parent.mkdir(parents=True, exist_ok=True)

        if not registry_path.exists():
            with open(registry_path, "w", encoding="utf-8") as f:
                f.write("# Deprecation Registry\n\n")
                f.write("Tracking deprecated documentation files.\n\n")
                f.write("| File | Deprecated Date | Archive Date | Status |\n")
                f.write("|------|-----------------|--------------|--------|\n")

        archive_date = (datetime.strptime(date, "%Y-%m-%d") + timedelta(days=archive_after_days)).strftime("%Y-%m-%d")

        with open(registry_path, "a", encoding="utf-8") as f:
            f.write(f"| `{file_path}` | {date} | {archive_date} | pending |\n")
        return True
    except PermissionError:
        print(f"[ERROR] Permission denied writing registry: {registry_path}")
        return False
    except Exception as e:
        print(f"[ERROR] Failed to update registry: {e}")
        return False


def mark_deprecated(file_path: Path, repo: Path, replacement: str = "TBD", archive_after_days: int = 30) -> bool:
    """Mark a file as deprecated. Returns True on success."""
    if not file_path.exists():
        print(f"[ERROR] File not found: {file_path}")
        return False

    try:
        with open(file_path, "r", encoding="utf-8") as f:
            content = f.read()
    except PermissionError:
        print(f"[ERROR] Permission denied reading: {file_path}")
        return False
    except UnicodeDecodeError:
        print(f"[ERROR] Invalid encoding in: {file_path}")
        return False
    except Exception as e:
        print(f"[ERROR] Failed to read file: {e}")
        return False

    # Check if already deprecated
    if "status: deprecated" in content:
        print(f"[SKIP] Already deprecated: {file_path}")
        return True

    date = datetime.now().strftime("%Y-%m-%d")

    # Add frontmatter and banner
    content = add_deprecation_frontmatter(content, date)
    content = add_deprecation_banner(content, date, replacement, archive_after_days)

    try:
        with open(file_path, "w", encoding="utf-8") as f:
            f.write(content)
    except PermissionError:
        print(f"[ERROR] Permission denied writing: {file_path}")
        return False
    except Exception as e:
        print(f"[ERROR] Failed to write file: {e}")
        return False

    # Update registry
    relative_path = str(file_path.relative_to(repo))
    registry_path = repo / "_meta" / "DEPRECATED.md"
    update_registry(registry_path, relative_path, date, archive_after_days)

    print(f"[MARKED] {relative_path}")
    return True


def get_deprecated_date(file_path: Path) -> Optional[datetime]:
    """Extract deprecated_date from file frontmatter."""
    try:
        with open(file_path, "r", encoding="utf-8") as f:
            content = f.read()
    except Exception as e:
        print(f"[ERROR] Failed to read {file_path}: {e}")
        return None

    match = re.search(r"deprecated_date:\s*(\d{4}-\d{2}-\d{2})", content)
    if match:
        try:
            return datetime.strptime(match.group(1), "%Y-%m-%d")
        except ValueError:
            return None
    return None


def archive_old_files(repo: Path, config: Dict) -> None:
    """Move files deprecated > archive_after_days to _deprecated folders."""
    sources = get_sources(config)
    archive_after_days = get_setting(config, "archive_after_days", 30)
    today = datetime.now()
    archived = 0
    errors = 0

    print(f"Archiving files deprecated >{archive_after_days} days ago...")

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
            if age >= archive_after_days:
                # Move to _deprecated
                try:
                    deprecated_dir.mkdir(parents=True, exist_ok=True)
                    dest = deprecated_dir / md_file.name
                    shutil.move(str(md_file), str(dest))
                    print(f"[ARCHIVED] {md_file.relative_to(repo)} -> _deprecated/")
                    archived += 1
                except PermissionError:
                    print(f"[ERROR] Permission denied moving: {md_file}")
                    errors += 1
                except Exception as e:
                    print(f"[ERROR] Failed to archive {md_file}: {e}")
                    errors += 1

    if archived == 0 and errors == 0:
        print(f"No files ready for archiving (none >{archive_after_days} days deprecated)")
    else:
        print(f"\nArchived {archived} file(s), {errors} error(s)")


def main():
    parser = argparse.ArgumentParser(description="Deprecation management")
    parser.add_argument("--mark", help="Mark file as deprecated")
    parser.add_argument("--archive", action="store_true", help="Archive old files")
    parser.add_argument("--repo", required=True, help="Repository root path")
    parser.add_argument("--replacement", default="TBD", help="Replacement doc URL")
    args = parser.parse_args()

    repo = Path(args.repo)

    # Load config (no hardcoding)
    try:
        config = load_config()
    except ConfigError as e:
        print(e)
        return

    archive_after_days = get_setting(config, "archive_after_days", 30)

    if args.mark:
        mark_deprecated(Path(args.mark), repo, args.replacement, archive_after_days)
    elif args.archive:
        archive_old_files(repo, config)
    else:
        print("Usage: deprecation.py --mark <file> | --archive")


if __name__ == "__main__":
    main()
