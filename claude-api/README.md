# Claude API Documentation

> **Status:** Complete
> **Last Updated:** 2026-01-07
> **Source:** docs.anthropic.com

## Contents

| Type | Count |
|------|-------|
| Markdown files | 209 |
| API Reference | 60 files |
| Build Guides | 42 files |
| Prompt Library | 66 files |
| OpenAPI spec | Yes |

## Quick Start

```bash
# Set API key
export ANTHROPIC_API_KEY="your-key-here"

# Test API
curl https://api.anthropic.com/v1/messages \
  -H "x-api-key: $ANTHROPIC_API_KEY" \
  -H "anthropic-version: 2023-06-01" \
  -H "content-type: application/json" \
  -d '{"model": "claude-sonnet-4-20250514", "max_tokens": 100, "messages": [{"role": "user", "content": "Hello"}]}'
```

## API Categories

| Category | Endpoints | Description |
|----------|-----------|-------------|
| **Messages** | `/v1/messages` | Chat completions |
| **Models** | `/v1/models` | List available models |
| **Admin** | `/v1/admin/*` | Organization management |
| **Beta** | `/v1/beta/*` | Files, Skills APIs |

## Documentation Structure

```
claude-api/
├── en-api-*.md           # API reference (60 files)
├── en-build-with-claude-*.md  # Build guides (42 files)
├── en-agents-and-tools-*.md   # Tool use (17 files)
├── en-about-claude-*.md       # Model info (12 files)
├── en-resources-*.md          # Prompt library (66 files)
├── api-reference/             # OpenAPI spec
└── curl/                      # cURL examples
```

## Resources

- [API Reference](https://docs.anthropic.com/en/api)
- [Build with Claude](https://docs.anthropic.com/en/build-with-claude)
- [Python SDK](https://github.com/anthropics/anthropic-sdk-python)
- [TypeScript SDK](https://github.com/anthropics/anthropic-sdk-typescript)
