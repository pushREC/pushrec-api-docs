# API Documentation System

Zero-gap mirror of Claude ecosystem documentation with manual CLI triggers, deprecation tracking, and cross-reference indexing.

## Quick Start

```bash
# Clone this repo
git clone git@github.com:your-org/api-docs.git ~/api-docs

# Add CLI to PATH (add to ~/.zshrc or ~/.bashrc)
export PATH="$HOME/api-docs/scripts:$PATH"

# Update all documentation
api-docs update

# Check status
api-docs status
```

## Commands

| Command | Description |
|---------|-------------|
| `api-docs update` | Scrape all sources, detect changes |
| `api-docs update --source=claude-code` | Scrape specific source |
| `api-docs status` | Show coverage, staleness, deprecated items |
| `api-docs deprecate <file>` | Mark a doc as deprecated |
| `api-docs archive` | Move >30-day deprecated to `_deprecated/` |
| `api-docs diff <source>` | Show changes since last scrape |
| `api-docs validate` | Run all quality checks |
| `api-docs index` | Rebuild cross-reference index |

## Directory Structure

```
api-docs/
├── claude-code/          # Claude Code documentation (~43 pages)
├── claude-api/           # Claude API documentation (~35 pages)
├── agent-sdk/            # Claude Agent SDK (~12 pages)
├── _index/               # Cross-reference layer
│   ├── primitives.md     # Building blocks
│   ├── patterns.md       # Reusable patterns
│   ├── architectures.md  # System designs
│   └── synthesis.md      # Unified insights
├── _meta/                # Metadata tracking
│   ├── SOURCES.md        # All sources + URLs
│   ├── CHANGELOG.md      # Detected changes
│   ├── DEPRECATED.md     # Deprecation registry
│   ├── VALIDATION.md     # Quality metrics
│   └── hashes/           # Content hashes for change detection
└── scripts/              # CLI and automation
```

## Documentation Sources

| Source | URL | Pages |
|--------|-----|-------|
| Claude Code | https://docs.anthropic.com/en/docs/claude-code | ~43 |
| Claude API | https://docs.anthropic.com/en/api | ~35 |
| Agent SDK | https://github.com/anthropics/claude-code-sdk-python | ~12 |

## Deprecation Workflow

1. **Detection**: Manual via `api-docs deprecate` or auto when page returns 404
2. **Marking**: Adds frontmatter tag + warning banner immediately
3. **Tracking**: File remains in place for 30 days (visible in `api-docs status`)
4. **Archiving**: `api-docs archive` moves >30-day deprecated to `_deprecated/`

**Deprecation Banner Example:**
```markdown
> **DEPRECATED**: This feature was deprecated on 2025-01-07.
> **Replacement**: See [New Feature](url)
> **Archive Date**: 2025-02-06
```

## Change Detection

Uses SHA-256 hashing to detect changes:
- **ADDED**: New pages found during scrape
- **MODIFIED**: Content hash differs from previous scrape
- **REMOVED**: Page no longer exists (triggers deprecation)

All changes logged to `_meta/CHANGELOG.md`.

## Cross-Reference Index

The `_index/` folder maps documentation to conceptual layers:

| Layer | Purpose |
|-------|---------|
| `primitives.md` | Core building blocks (tools, models, configs) |
| `patterns.md` | Reusable patterns (prompting, error handling) |
| `architectures.md` | System designs (agents, multi-model) |
| `synthesis.md` | Unified insights across all sources |

## Obsidian Integration

Create a symlink from your vault:

```bash
ln -s ~/api-docs /path/to/vault/3-Resources/api-docs
```

Then use wikilinks:
- `[[3-Resources/api-docs/claude-code/build/hooks]]`
- `[[3-Resources/api-docs/_index/patterns]]`

## Quality Metrics

Tracked in `_meta/VALIDATION.md`:

| Metric | Target |
|--------|--------|
| Coverage | 100% of known pages |
| Freshness | <30 days average age |
| Frontmatter | All files have source URL + date |
| Index | Cross-reference up to date |

## Requirements

- Python 3.10+
- Claude Code CLI (for scraping via api-docs-finder skill)
- Git

## Cost

$0 - Uses existing Claude Code subscription for scraping.

---

*Version: 1.0.0*
*Last Updated: 2025-01-07*
