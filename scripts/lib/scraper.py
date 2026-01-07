#!/usr/bin/env python3
"""
scraper.py - Documentation scraping orchestration

This module generates scraping instructions for the Claude Code session.
Actual scraping is done via the api-docs-finder skill in the calling session.

The scraper:
1. Loads source configuration from sources.yaml
2. Generates scraping prompts for each source
3. Outputs instructions for the Claude session to execute

IMPORTANT: Model Optimization
- Use 'haiku' for scraping tasks (fast, cheap)
- Use 'sonnet' for synthesis tasks
- NEVER use 'opus' unless absolutely required
"""

import argparse
import json
import os
from datetime import datetime
from pathlib import Path
from typing import Dict, List, Optional

# Model selection for cost optimization
# Task tool accepts: "haiku", "sonnet", "opus"
TASK_MODEL_MAP = {
    "scrape": "haiku",      # Fast extraction, high volume
    "validate": "haiku",    # Quick checks, pass/fail
    "hash": "haiku",        # Mechanical operation
    "deprecate": "haiku",   # Simple file edits
    "index": "sonnet",      # Keyword matching, categorization
    "synthesize": "sonnet", # Pattern recognition, complex
}


def get_recommended_model(task_type: str) -> str:
    """
    Get recommended model for a task type.

    Args:
        task_type: One of 'scrape', 'validate', 'hash', 'deprecate', 'index', 'synthesize'

    Returns:
        Model string: 'haiku' or 'sonnet'
    """
    return TASK_MODEL_MAP.get(task_type, "haiku")  # Default to haiku for cost

try:
    import yaml
except ImportError:
    yaml = None


def load_config(config_path: Path) -> Dict:
    """Load sources configuration."""
    if yaml is None:
        # Fallback: parse YAML manually for basic structure
        with open(config_path, "r") as f:
            content = f.read()
        # Basic parsing - in production, require PyYAML
        print("[WARN] PyYAML not installed. Using default config.")
        return {
            "sources": {
                "claude-code": {
                    "name": "Claude Code Documentation",
                    "base_url": "https://docs.anthropic.com/en/docs/claude-code",
                    "output_dir": "claude-code"
                },
                "claude-api": {
                    "name": "Claude API Documentation",
                    "base_url": "https://docs.anthropic.com/en/api",
                    "output_dir": "claude-api"
                },
                "agent-sdk": {
                    "name": "Claude Agent SDK",
                    "base_url": "https://github.com/anthropics/claude-code-sdk-python",
                    "output_dir": "agent-sdk"
                }
            }
        }

    with open(config_path, "r") as f:
        return yaml.safe_load(f)


def generate_scrape_instructions(source: str, config: Dict, output_dir: Path) -> str:
    """
    Generate instructions for scraping a source.

    These instructions are meant to be executed by invoking the api-docs-finder
    skill in HARVEST mode from the calling Claude session.
    """
    source_config = config["sources"].get(source)
    if not source_config:
        return f"[ERROR] Unknown source: {source}"

    instructions = f"""
================================================================================
SCRAPING INSTRUCTIONS: {source_config['name']}
================================================================================

COST OPTIMIZATION: Use model="haiku" for all scraping Task tool calls
                   (50x cheaper than Opus, sufficient for extraction)

To scrape this source, run the following in your Claude Code session:

1. Invoke the api-docs-finder skill in HARVEST mode:

   /api-docs-finder HARVEST {source_config['base_url']}

   OR use Task tool with model optimization:

   Task(
     description="Scrape {source} docs",
     prompt="Fetch all pages from {source_config['base_url']}...",
     subagent_type="general-purpose",
     model="haiku"  # <-- CRITICAL: Use haiku for cost savings
   )

2. Save output to: {output_dir}/{source_config['output_dir']}/

3. Add frontmatter to each file:
   ---
   source: {source_config['base_url']}
   scraped: {datetime.now().strftime('%Y-%m-%d')}
   ---

4. Organize files according to the section structure in sources.yaml

MODEL GUIDANCE:
- Scraping/fetching: model="haiku" (fast, cheap)
- Validation: model="haiku"
- Synthesis/indexing: model="sonnet" (only when needed)

================================================================================
"""
    return instructions


def scrape_source(source: str, config: Dict, output_dir: Path) -> None:
    """
    Initiate scraping for a source.

    Note: This prints instructions. Actual scraping requires Claude session
    to invoke api-docs-finder skill.
    """
    print(generate_scrape_instructions(source, config, output_dir))

    # Create output directory structure
    source_config = config["sources"].get(source)
    if source_config:
        source_dir = output_dir / source_config["output_dir"]
        source_dir.mkdir(parents=True, exist_ok=True)

        # Create source README
        readme_path = source_dir / "README.md"
        if not readme_path.exists():
            with open(readme_path, "w") as f:
                f.write(f"""---
source: {source_config.get('base_url', 'N/A')}
created: {datetime.now().strftime('%Y-%m-%d')}
---

# {source_config['name']}

Documentation mirror from official sources.

**Source URL:** {source_config.get('base_url', 'N/A')}

## Status

- [ ] Initial scrape pending
- [ ] Content validated
- [ ] Index updated

## Sections

{chr(10).join(f"- [ ] {s}" for s in source_config.get('sections', []))}
""")
            print(f"[CREATED] {readme_path.relative_to(output_dir)}")


def main():
    parser = argparse.ArgumentParser(description="Documentation scraping")
    parser.add_argument("--source", help="Specific source to scrape")
    parser.add_argument("--all", action="store_true", help="Scrape all sources")
    parser.add_argument("--config", required=True, help="Path to sources.yaml")
    parser.add_argument("--output", required=True, help="Output directory")
    args = parser.parse_args()

    config_path = Path(args.config)
    output_dir = Path(args.output)

    if not config_path.exists():
        print(f"[ERROR] Config not found: {config_path}")
        return

    config = load_config(config_path)

    if args.source:
        scrape_source(args.source, config, output_dir)
    elif args.all:
        for source in config["sources"]:
            scrape_source(source, config, output_dir)
    else:
        print("Usage: scraper.py --source=<source> | --all")


if __name__ == "__main__":
    main()
