---
source: https://code.claude.com/docs/en/overview
scraped: 2026-01-07
section: getting-started
---

# Claude Code Overview

Claude Code is Anthropic's official CLI for Claude, an agentic coding tool that lives in your terminal and helps you turn ideas into code faster than ever before.

## Get Started in 30 Seconds

### Prerequisites
- A [Claude.ai](https://claude.ai) (recommended) or [Claude Console](https://console.anthropic.com/) account

### Installation Methods

**macOS, Linux, WSL (Native Install - Recommended):**
```bash
curl -fsSL https://claude.ai/install.sh | bash
```

**Windows PowerShell:**
```powershell
irm https://claude.ai/install.ps1 | iex
```

**Windows CMD:**
```cmd
curl -fsSL https://claude.ai/install.cmd -o install.cmd && install.cmd && del install.cmd
```

**Homebrew:**
```bash
brew install --cask claude-code
```

**NPM (requires Node.js 18+):**
```bash
npm install -g @anthropic-ai/claude-code
```

### Start Using Claude Code
```bash
cd your-project
claude
```

You'll be prompted to log in on first use. Claude Code automatically keeps itself up to date.

## What Claude Code Does for You

### 1. **Build Features from Descriptions**
Tell Claude what you want to build in plain English. It will make a plan, write the code, and ensure it works.

### 2. **Debug and Fix Issues**
Describe a bug or paste an error message. Claude Code will analyze your codebase, identify the problem, and implement a fix.

### 3. **Navigate Any Codebase**
Ask anything about your team's codebase and get thoughtful answers back. Claude Code maintains awareness of your entire project structure, can find up-to-date information from the web, and with [MCP](/docs/en/mcp) can pull from external data sources like Google Drive, Figma, and Slack.

### 4. **Automate Tedious Tasks**
Fix fiddly lint issues, resolve merge conflicts, and write release notes. Do all this in a single command from your developer machines, or automatically in CI.

## Why Developers Love Claude Code

### 1. **Works in Your Terminal**
Not another chat window. Not another IDE. Claude Code meets you where you already work, with the tools you already love.

### 2. **Takes Action**
Claude Code can directly edit files, run commands, and create commits. Need more? [MCP](/docs/en/mcp) lets Claude read your design docs in Google Drive, update your tickets in Jira, or use your custom developer tooling.

### 3. **Unix Philosophy**
Claude Code is composable and scriptable. Examples that work:
```bash
tail -f app.log | claude -p "Slack me if you see any anomalies appear in this log stream"
```

Your CI can run:
```bash
claude -p "If there are new text strings, translate them into French and raise a PR for @lang-fr-team to review"
```

### 4. **Enterprise-Ready**
Use the Claude API, or host on AWS or GCP. Enterprise-grade security, privacy, and compliance is built-in.

## Next Steps

- **[Quickstart](/docs/en/quickstart)** - See Claude Code in action with practical examples
- **[Common workflows](/docs/en/common-workflows)** - Step-by-step guides for common workflows
- **[Troubleshooting](/docs/en/troubleshooting)** - Solutions for common issues with Claude Code
- **[IDE setup](/docs/en/vs-code)** - Add Claude Code to your IDE

## Additional Resources

- **[About Claude Code](https://claude.com/product/claude-code)** - Learn more about Claude Code on claude.com
- **[Build with the Agent SDK](https://docs.claude.com/en/docs/agent-sdk/overview)** - Create custom AI agents with the Claude Agent SDK
- **[Host on AWS or GCP](/docs/en/third-party-integrations)** - Configure Claude Code with Amazon Bedrock or Google Vertex AI
- **[Settings](/docs/en/settings)** - Customize Claude Code for your workflow
- **[Commands](/docs/en/cli-reference)** - Learn about CLI commands and controls
- **[Reference Implementation](https://github.com/anthropics/claude-code/tree/main/.devcontainer)** - Clone the development container reference implementation
- **[Security](/docs/en/security)** - Discover Claude Code's safeguards and best practices
- **[Privacy and Data Usage](/docs/en/data-usage)** - Understand how Claude Code handles your data
