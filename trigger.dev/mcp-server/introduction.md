# MCP Introduction - Trigger.dev Documentation

## Overview

The Trigger.dev MCP (Model Context Protocol) Server enables AI assistants to interact directly with Trigger.dev projects through a comprehensive toolset including documentation search, project initialization, task management, run triggering, and deployment capabilities.

## Installation

### Automatic Installation (Recommended)

The quickest setup method uses an interactive wizard:

```bash
npx trigger.dev@latest install-mcp
```

This guides users through:
1. Selecting MCP clients to configure
2. Choosing installation scope (user, project, or local)
3. Automatically configuring selected clients

### Command Line Options

**Core Options:**
- `-p, --project-ref <project ref>` — Scope server to specific Trigger.dev project
- `-t, --tag <package tag>` — Specify CLI package version (default: latest/v4-beta)
- `--dev-only` — Restrict to development environment
- `--yolo` — Install across all supported clients automatically
- `--scope <scope>` — Choose scope: user, project, or local
- `--client <clients...>` — Target specific client(s)

**Configuration Options:**
- `--log-file <log file>` — Write logs to file
- `-a, --api-url <value>` — Configure custom API URL
- `-l, --log-level <level>` — Set log level (debug, info, log, warn, error, none)

## Authentication

"You can use the MCP server without authentication with the search_docs tool, but for any other tool call you will need to authenticate the MCP server via the same method as the Trigger.dev CLI."

## Supported MCP Clients

| Client | Scope | Config File | Documentation |
|--------|-------|------------|----------------|
| Claude Code | user, project, local | ~/.claude.json or ./.mcp.json | Claude Code MCP Docs |
| Cursor | user, project | ~/.cursor/mcp.json | Cursor MCP Docs |
| VSCode | user, project | ~/Library/Application Support/Code/User/mcp.json | VSCode MCP Docs |
| Zed | user | ~/.config/zed/settings.json | Zed Context Servers Docs |
| Windsurf | user | ~/.codeium/windsurf/mcp_config.json | Windsurf MCP Docs |
| Gemini CLI | user, project | ~/.gemini/settings.json | Gemini CLI MCP Tutorial |
| Charm Crush | user, project, local | ~/.config/crush/crush.json | Charm MCP Docs |
| Cline | user | ~/Library/Application Support/Code/User/globalStorage/... | Cline MCP Docs |
| OpenAI Codex CLI | user | ~/.codex/config.toml | OpenAI Codex Docs |
| Sourcegraph AMP | user | ~/.config/amp/settings.json | Sourcegraph AMP MCP Docs |
| opencode | user, project | ~/.config/opencode/opencode.json | opencode MCP Docs |

## Manual Configuration

For unsupported clients:
- **Server Name:** `trigger`
- **Command:** `npx`
- **Arguments:** `["trigger.dev@latest", "mcp"]`

### JSON Configuration Example

```json
{
  "mcpServers": {
    "trigger": {
      "command": "npx",
      "args": ["trigger.dev@latest", "mcp"]
    }
  }
}
```

### TOML Configuration Example

```toml
[mcp_servers.trigger]
command = "npx"
args = ["trigger.dev@latest", "mcp"]
```

## Environment-Specific Configuration

### Development Only

```json
{
  "mcpServers": {
    "trigger": {
      "command": "npx",
      "args": ["trigger.dev@latest", "mcp", "--dev-only"]
    }
  }
}
```

### Project-Scoped

```json
{
  "mcpServers": {
    "trigger": {
      "command": "npx",
      "args": ["trigger.dev@latest", "mcp", "--project-ref", "proj_your_project_ref"]
    }
  }
}
```

## Installation Examples

Install for all supported clients:
```bash
npx trigger.dev@latest install-mcp --yolo
```

Install for specific clients:
```bash
npx trigger.dev@latest install-mcp --client claude-code cursor --scope user
```

Install with development environment restriction:
```bash
npx trigger.dev@latest install-mcp --dev-only --project-ref proj_abc123
```

## Verification

After installation, restart your MCP client and locate the "trigger" server. It should connect automatically and provide access to all Trigger.dev tools.

## Getting Started

Once installed, users can query the AI assistant with:
- "Search the trigger docs for a ffmpeg example"
- "Initialize trigger.dev in my project"
- "Get all tasks in my project"
- "Trigger my foobar task with a sample payload"
- "Deploy my project to staging/production"

## Next Steps

Explore available MCP tools in the Trigger.dev MCP Tools documentation.
