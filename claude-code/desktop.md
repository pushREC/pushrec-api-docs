---
source: https://code.claude.com/docs/en/desktop
scraped: 2026-01-09
api_provider: Anthropic
discovery_tier: 3
verified: true
method: webfetch_cleaned
---

# Claude Code on Desktop

Run Claude Code tasks locally or on secure cloud infrastructure with the Claude desktop app.

**Download:** [claude.ai/download](https://claude.ai/download)

**Access:** Max, Pro, Team, and Enterprise users

**Status:** Preview

## Features

- **Parallel local sessions with git worktrees**: Run multiple Claude Code sessions simultaneously in the same repository, each with its own isolated git worktree
- **Include files listed in your .gitignore in your worktrees**: Automatically copy files in your .gitignore, like .env, to new worktrees using .worktreeinclude
- **Launch Claude Code on the web**: Kick off secure cloud sessions directly from the desktop app

## Installation

Download and install the Claude Desktop app from [claude.ai/download](https://claude.ai/download).

**Limitation:** Local sessions not available on Windows arm64 architectures.

## Using Git Worktrees

Claude Code on desktop enables running multiple Claude Code sessions in the same repository using Git worktrees. Each session gets its own isolated worktree, allowing Claude to work on different tasks without conflicts.

- **Default location:** `~/.claude-worktrees` (configurable in settings)
- **Requirement:** If you start a local session in a folder that does not have Git initialized, the desktop app will not create a new worktree

### Copying Files Ignored with .gitignore

When Claude Code creates a worktree, files ignored via `.gitignore` aren't automatically available. Including a `.worktreeinclude` file solves this by specifying which ignored files should be copied to new worktrees.

Create a `.worktreeinclude` file in your repository root:

```text
.env
.env.local
.env.*
**/.claude/settings.local.json
```

The file uses `.gitignore`-style patterns. When a worktree is created, files matching these patterns that are also in your `.gitignore` will be copied from your main repository to the worktree.

**Important:** Only files that are both matched by `.worktreeinclude` AND listed in `.gitignore` are copied. This prevents accidentally duplicating tracked files.

## Launch Claude Code on the Web

From the desktop app, you can kick off Claude Code sessions that run on Anthropic's secure cloud infrastructure. To start a web session from desktop, select a remote environment when creating a new session.

See [Claude Code on the web](/docs/en/claude-code-on-the-web) for more details.

## Bundled Claude Code Version

Claude Code on desktop includes a bundled, stable version of Claude Code to ensure a consistent experience for all desktop users.

- **Required download:** Downloaded on first launch even if a version of Claude Code exists on the computer
- **Auto-updates:** Desktop automatically manages version updates and cleans up old versions
- **Version differences:** The bundled Claude Code version in Desktop may differ from the latest CLI version. Desktop prioritizes stability while the CLI may have newer features.

## Environment Configuration

For local environments, Claude Code on desktop automatically extracts your `$PATH` environment variable from your shell configuration. This allows local sessions to access development tools like `yarn`, `npm`, `node`, and other commands available in your terminal without additional setup.

### Custom Environment Variables

1. Select "Local" environment
2. Click the settings button (to the right)
3. Update local environment variables in `.env` format

Example:

```text
API_KEY=your_api_key
DEBUG=true

# Multiline values - wrap in quotes
CERT="-----BEGIN CERT-----
MIIE...
-----END CERT-----"
```

Environment variable values are masked in the UI for security.

## Enterprise Configuration

Organizations can:
- Disable local Claude Code use via the `isClaudeCodeForDesktopEnabled` [enterprise policy option](https://support.claude.com/en/articles/12622667-enterprise-configuration#h_003283c7cb)
- Disable Claude Code on the web in [admin settings](https://claude.ai/admin-settings/claude-code)

## Skill Loading (Not Documented)

**Note:** The official docs do NOT mention skills for Desktop. Based on architecture:

- Desktop bundles Claude Code CLI
- CLI loads skills from `~/.claude/skills/` and `.claude/skills/`
- **Inference:** Desktop likely loads skills the same way

**To verify:** Open Claude Code in Desktop and ask "What Skills are available?"

## Related Resources

- [Claude Code on the web](/docs/en/claude-code-on-the-web)
- [Claude Desktop support articles](https://support.claude.com/en/collections/16163169-claude-desktop)
- [Enterprise Configuration](https://support.claude.com/en/articles/12622667-enterprise-configuration)
- [Common workflows](/docs/en/common-workflows)
- [Settings reference](/docs/en/settings)
- [Skills documentation](/docs/en/skills)

---

*Updated: 2026-01-09*
*Source: https://code.claude.com/docs/en/desktop*
