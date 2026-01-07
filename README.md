---
created: 2026-01-07
tags: [type/resource, api-docs]
status: active
---

# Anthropic API Documentation Mirror

Complete local mirror of all Anthropic documentation for Claude Code, Claude API, and Agent SDK.

## Quick Stats

| Source | Pages | Size | Last Updated |
|--------|-------|------|--------------|
| Claude Code | 48 | ~1 MB | 2026-01-07 |
| Claude API | 209 | ~4 MB | 2026-01-07 |
| Agent SDK | 6 | ~300 KB | 2026-01-07 |
| **Total** | **263** | **~5.3 MB** | 2026-01-07 |

## Directory Structure

```
api-docs/
├── README.md                 # This file
├── claude-code/              # Claude Code CLI documentation (48 pages)
├── claude-api/               # Claude API & Platform docs (209 pages)
├── agent-sdk/                # Agent SDK reference (6 pages)
├── _meta/                    # Scrape reports and metadata
└── _index/                   # Cross-reference indices (future)
```

## Usage

### From Vault (Obsidian)

Access via wikilinks:
- `[[3-Resources/api-docs/claude-code/hooks]]` - Hooks reference
- `[[3-Resources/api-docs/claude-api/en-api-messages-create]]` - Messages API
- `[[3-Resources/api-docs/agent-sdk/en-agent-sdk-python]]` - Python SDK

## Source URLs

| Source | Base URL |
|--------|----------|
| Claude Code | `https://code.claude.com/docs/en/` |
| Claude API | `https://docs.anthropic.com/en/` |
| Agent SDK | `https://docs.anthropic.com/en/agent-sdk/` |

## Scraping Method

All pages scraped using **Bright Data** (100% success rate):
- JavaScript rendering enabled
- CAPTCHA bypass built-in
- Average scrape time: ~425ms/page

## Frontmatter Format

All documentation files include:
```yaml
---
source: https://...         # Original URL
scraped: YYYY-MM-DD         # Scrape date
method: bright_data         # Scraping method
duration_ms: NNN            # Scrape duration
---
```
