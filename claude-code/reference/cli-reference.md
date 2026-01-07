---
source: https://code.claude.com/docs/en/cli-reference
scraped: 2026-01-07
section: reference
---

# Claude Code CLI Reference

## CLI Commands

| Command | Description | Example |
|---------|-------------|---------|
| `claude` | Start interactive REPL | `claude` |
| `claude "query"` | Start REPL with initial prompt | `claude "explain this project"` |
| `claude -p "query"` | Query via SDK, then exit | `claude -p "explain this function"` |
| `cat file \| claude -p "query"` | Process piped content | `cat logs.txt \| claude -p "explain"` |
| `claude -c` | Continue most recent conversation | `claude -c` |
| `claude -c -p "query"` | Continue via SDK | `claude -c -p "Check for type errors"` |
| `claude -r "<session>" "query"` | Resume session by ID or name | `claude -r "auth-refactor" "Finish this PR"` |
| `claude update` | Update to latest version | `claude update` |
| `claude mcp` | Configure Model Context Protocol (MCP) servers | See the Claude Code MCP documentation |

## CLI Flags

### Core Options

| Flag | Description | Example |
|------|-------------|---------|
| `--add-dir` | Add additional working directories for Claude to access | `claude --add-dir ../apps ../lib` |
| `--agent` | Specify an agent for the current session | `claude --agent my-custom-agent` |
| `--agents` | Define custom subagents dynamically via JSON | `claude --agents '{"reviewer":{"description":"Reviews code","prompt":"You are a code reviewer"}}'` |
| `--chrome` | Enable Chrome browser integration for web automation | `claude --chrome` |
| `--no-chrome` | Disable Chrome browser integration | `claude --no-chrome` |
| `-p, --print` | Print response without interactive mode | `claude -p "query"` |
| `-c, --continue` | Load the most recent conversation | `claude --continue` |
| `-r, --resume` | Resume a specific session by ID or name | `claude --resume auth-refactor` |
| `--session-id` | Use a specific session ID (must be valid UUID) | `claude --session-id "550e8400-e29b-41d4-a716-446655440000"` |
| `--fork-session` | Create new session ID when resuming | `claude --resume abc123 --fork-session` |
| `--ide` | Automatically connect to IDE on startup | `claude --ide` |

### Model & Configuration

| Flag | Description | Example |
|------|-------------|---------|
| `--model` | Set model with alias (`sonnet`, `opus`) or full name | `claude --model claude-sonnet-4-5-20250929` |
| `--betas` | Beta headers to include in API requests | `claude --betas interleaved-thinking` |
| `--fallback-model` | Automatic fallback when default is overloaded (print mode) | `claude -p --fallback-model sonnet "query"` |
| `--max-turns` | Limit agentic turns in non-interactive mode | `claude -p --max-turns 3 "query"` |

### Tools & Permissions

| Flag | Description | Example |
|------|-------------|---------|
| `--allowedTools` | Tools that execute without prompting | `"Bash(git log:*)" "Bash(git diff:*)" "Read"` |
| `--disallowedTools` | Tools removed from context | `"Bash(git log:*)" "Bash(git diff:*)" "Edit"` |
| `--tools` | Specify available tools (`""` for none, `"default"` for all) | `claude -p --tools "Bash,Edit,Read" "query"` |
| `--permission-mode` | Begin in specified permission mode | `claude --permission-mode plan` |
| `--permission-prompt-tool` | MCP tool for permission prompts (non-interactive) | `claude -p --permission-prompt-tool mcp_auth_tool "query"` |
| `--dangerously-skip-permissions` | Skip permission prompts | `claude --dangerously-skip-permissions` |

### System Prompt Customization

| Flag | Description | Example |
|------|-------------|---------|
| `--system-prompt` | Replace entire system prompt | `claude --system-prompt "You are a Python expert"` |
| `--system-prompt-file` | Load system prompt from file (print mode only) | `claude -p --system-prompt-file ./custom-prompt.txt "query"` |
| `--append-system-prompt` | Append to default prompt | `claude --append-system-prompt "Always use TypeScript"` |

### Output & Debugging

| Flag | Description | Example |
|------|-------------|---------|
| `--output-format` | Output format (`text`, `json`, `stream-json`) | `claude -p "query" --output-format json` |
| `--input-format` | Input format for print mode | `claude -p --output-format json --input-format stream-json` |
| `--include-partial-messages` | Include partial streaming events | `claude -p --output-format stream-json --include-partial-messages "query"` |
| `--verbose` | Enable verbose logging | `claude --verbose` |
| `--debug` | Enable debug mode with optional category filtering | `claude --debug "api,mcp"` |
| `--enable-lsp-logging` | Enable verbose LSP logging | `claude --enable-lsp-logging` |

### Configuration Files

| Flag | Description | Example |
|------|-------------|---------|
| `--settings` | Load settings from JSON file or string | `claude --settings ./settings.json` |
| `--setting-sources` | Comma-separated sources (`user`, `project`, `local`) | `claude --setting-sources user,project` |
| `--plugin-dir` | Load plugins from directories (repeatable) | `claude --plugin-dir ./my-plugins` |
| `--mcp-config` | Load MCP servers from JSON files/strings | `claude --mcp-config ./mcp.json` |
| `--strict-mcp-config` | Only use MCP servers from `--mcp-config` | `claude --strict-mcp-config --mcp-config ./mcp.json` |

### Structured Output

| Flag | Description | Example |
|------|-------------|---------|
| `--json-schema` | Get validated JSON output matching schema | `claude -p --json-schema '{"type":"object","properties":{...}}' "query"` |

### Utility

| Flag | Description | Example |
|------|-------------|---------|
| `-v, --version` | Output version number | `claude -v` |

## Agents Flag Format

The `--agents` flag accepts a JSON object defining custom subagents:

```bash
claude --agents '{
  "code-reviewer": {
    "description": "Expert code reviewer. Use proactively after code changes.",
    "prompt": "You are a senior code reviewer. Focus on code quality, security, and best practices.",
    "tools": ["Read", "Grep", "Glob", "Bash"],
    "model": "sonnet"
  },
  "debugger": {
    "description": "Debugging specialist for errors and test failures.",
    "prompt": "You are an expert debugger. Analyze errors, identify root causes, and provide fixes."
  }
}'
```

### Subagent Fields

| Field | Required | Description |
|-------|----------|-------------|
| `description` | Yes | Natural language description of when to invoke |
| `prompt` | Yes | System prompt guiding behavior |
| `tools` | No | Array of specific tools (e.g., `["Read", "Edit", "Bash"]`) |
| `model` | No | Model alias: `sonnet`, `opus`, or `haiku` |

## System Prompt Flags

Claude Code provides three flags for customizing the system prompt:

| Flag | Behavior | Modes | Use Case |
|------|----------|-------|----------|
| `--system-prompt` | **Replaces** entire default prompt | Interactive + Print | Complete control over Claude's behavior |
| `--system-prompt-file` | **Replaces** with file contents | Print only | Load prompts from files for reproducibility |
| `--append-system-prompt` | **Appends** to default prompt | Interactive + Print | Add instructions while preserving defaults |

### When to Use Each

**`--system-prompt`**: Complete control, removes all default Claude Code instructions
```bash
claude --system-prompt "You are a Python expert who only writes type-annotated code"
```

**`--system-prompt-file`**: Load from file for team consistency
```bash
claude -p --system-prompt-file ./prompts/code-review.txt "Review this PR"
```

**`--append-system-prompt`**: Add requirements while keeping defaults (recommended)
```bash
claude --append-system-prompt "Always use TypeScript and include JSDoc comments"
```

> **Note**: `--system-prompt` and `--system-prompt-file` are mutually exclusive.
