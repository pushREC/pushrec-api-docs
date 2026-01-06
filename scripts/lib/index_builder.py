#!/usr/bin/env python3
"""
index_builder.py - Cross-reference index generation

Builds the _index/ layer by:
1. Scanning all documentation files
2. Matching content against layer keywords
3. Generating cross-reference markdown files
"""

import argparse
import re
from collections import defaultdict
from datetime import datetime
from pathlib import Path
from typing import Dict, List, Set

try:
    import yaml
except ImportError:
    yaml = None


# Default layer keywords if config not available
DEFAULT_LAYERS = {
    "primitives": {
        "description": "Core building blocks",
        "keywords": ["tool", "model", "config", "parameter", "option", "setting",
                     "environment", "variable", "flag", "argument"]
    },
    "patterns": {
        "description": "Reusable patterns",
        "keywords": ["pattern", "practice", "technique", "strategy", "approach",
                     "workflow", "pipeline", "best practice", "example"]
    },
    "architectures": {
        "description": "System designs",
        "keywords": ["architecture", "system", "design", "structure", "integration",
                     "deployment", "orchestration", "multi-agent", "agent"]
    },
    "synthesis": {
        "description": "Unified insights",
        "keywords": ["overview", "summary", "comparison", "tradeoff", "decision",
                     "recommendation", "guide", "introduction", "getting started"]
    }
}


def load_layer_config(config_path: Path) -> Dict:
    """Load layer configuration from sources.yaml."""
    if yaml is None or not config_path.exists():
        return DEFAULT_LAYERS

    with open(config_path, "r") as f:
        config = yaml.safe_load(f)

    return config.get("index_layers", DEFAULT_LAYERS)


def extract_title(content: str) -> str:
    """Extract the main title from markdown content."""
    match = re.search(r"^#\s+(.+)$", content, re.MULTILINE)
    return match.group(1) if match else "Untitled"


def match_layers(content: str, layers: Dict) -> Set[str]:
    """Determine which layers a document belongs to based on keywords."""
    content_lower = content.lower()
    matched = set()

    for layer_name, layer_config in layers.items():
        keywords = layer_config.get("keywords", [])
        for keyword in keywords:
            if keyword.lower() in content_lower:
                matched.add(layer_name)
                break

    return matched


def scan_documentation(repo: Path, layers: Dict) -> Dict[str, List[Dict]]:
    """Scan all documentation and categorize by layer."""
    sources = ["claude-code", "claude-api", "agent-sdk"]
    layer_docs = defaultdict(list)

    for source in sources:
        source_dir = repo / source
        if not source_dir.exists():
            continue

        for md_file in source_dir.rglob("*.md"):
            # Skip deprecated and README files
            if "_deprecated" in str(md_file) or md_file.name == "README.md":
                continue

            try:
                with open(md_file, "r", encoding="utf-8") as f:
                    content = f.read()
            except Exception:
                continue

            title = extract_title(content)
            relative_path = md_file.relative_to(repo)
            matched_layers = match_layers(content, layers)

            doc_info = {
                "title": title,
                "path": str(relative_path),
                "source": source
            }

            for layer in matched_layers:
                layer_docs[layer].append(doc_info)

    return layer_docs


def generate_layer_file(layer_name: str, layer_config: Dict, docs: List[Dict]) -> str:
    """Generate markdown content for a layer index file."""
    content = f"""---
layer: {layer_name}
updated: {datetime.now().strftime('%Y-%m-%d')}
---

# {layer_name.title()}

{layer_config.get('description', '')}

## Documents

| Title | Source | Path |
|-------|--------|------|
"""

    # Sort by source, then title
    sorted_docs = sorted(docs, key=lambda x: (x["source"], x["title"]))

    for doc in sorted_docs:
        content += f"| {doc['title']} | {doc['source']} | [[{doc['path']}]] |\n"

    content += f"\n---\n\n*{len(docs)} documents in this layer*\n"

    return content


def build_index(repo: Path, config_path: Path) -> None:
    """Build the complete cross-reference index."""
    layers = load_layer_config(config_path)
    layer_docs = scan_documentation(repo, layers)

    index_dir = repo / "_index"
    index_dir.mkdir(parents=True, exist_ok=True)

    # Generate each layer file
    for layer_name, layer_config in layers.items():
        docs = layer_docs.get(layer_name, [])
        content = generate_layer_file(layer_name, layer_config, docs)

        layer_file = index_dir / f"{layer_name}.md"
        with open(layer_file, "w") as f:
            f.write(content)

        print(f"[INDEX] {layer_name}: {len(docs)} documents")

    # Generate index README
    readme_content = f"""---
updated: {datetime.now().strftime('%Y-%m-%d')}
---

# Cross-Reference Index

Conceptual organization of documentation across all sources.

## Layers

| Layer | Description | Documents |
|-------|-------------|-----------|
"""

    for layer_name, layer_config in layers.items():
        doc_count = len(layer_docs.get(layer_name, []))
        readme_content += f"| [[{layer_name}]] | {layer_config.get('description', '')} | {doc_count} |\n"

    readme_content += f"""
## How It Works

Documents are automatically categorized based on keyword matching:

"""

    for layer_name, layer_config in layers.items():
        keywords = layer_config.get("keywords", [])[:5]
        readme_content += f"- **{layer_name}**: {', '.join(keywords)}...\n"

    readme_content += "\n---\n\n*Rebuild with: `api-docs index`*\n"

    with open(index_dir / "README.md", "w") as f:
        f.write(readme_content)

    print(f"\n[COMPLETE] Index built with {len(layers)} layers")


def main():
    parser = argparse.ArgumentParser(description="Build cross-reference index")
    parser.add_argument("--repo", required=True, help="Repository root path")
    parser.add_argument("--config", required=True, help="Path to sources.yaml")
    args = parser.parse_args()

    repo = Path(args.repo)
    config = Path(args.config)

    build_index(repo, config)


if __name__ == "__main__":
    main()
