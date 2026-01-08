---
source: https://openrouter.ai/docs/guides/guides/claude-code-integration
scraped: 2026-01-08
---

# Claude Code with OpenRouter

## Overview

Claude Code is an agentic tool that can be configured to work with OpenRouter, enabling access to multiple AI models beyond Anthropic's offerings. Highly capable models (like Claude Opus 4.5, GPT 5.2, etc.) deliver optimal results for complex coding tasks.

## Installation Options

Users can install Claude Code via:

- **Native installation** (macOS, Linux, WSL, or Windows PowerShell)
- **npm package** (requires Node.js 18+)

## Configuration Steps

### Environment Variables Setup

The core connection requires three settings:

1. `ANTHROPIC_BASE_URL="https://openrouter.ai/api"`
2. `ANTHROPIC_AUTH_TOKEN` set to your OpenRouter API key
3. `ANTHROPIC_API_KEY=""` (must be explicitly blank)

Configuration can be set via shell profiles or project-level settings files at `.claude/settings.local.json`.

### Verification

Users can confirm connectivity using the `/status` command within Claude Code or by monitoring the OpenRouter Activity Dashboard.

## Model Configuration

### Default Behavior

OpenRouter automatically maps Anthropic model aliases (Sonnet, Opus, Haiku) to appropriate models.

### Custom Model Selection

Override defaults using environment variables like:

```bash
export ANTHROPIC_DEFAULT_SONNET_MODEL="openai/gpt-5.1-codex-max"
```

**Critical requirement:** Selected models must support tool use, as Claude Code depends on this for file operations, terminal execution, and code editing.

### Advanced Options

Users can leverage OpenRouter Presets for complex setups, including fallback models and custom routing rules.

## Integration with GitHub Actions

The official Claude Code GitHub Action supports OpenRouter by passing credentials through the `anthropic_api_key` parameter and setting `ANTHROPIC_BASE_URL` in environment variables.

## Key Troubleshooting Points

- Tool use support is mandatory for Claude Code functionality
- `ANTHROPIC_API_KEY` must be explicitly empty to prevent conflicts
- Minimum 128k context window recommended for optimal performance
- OpenRouter doesn't log source code unless users opt-in to prompt logging
