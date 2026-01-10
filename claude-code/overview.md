---
title: Claude Code Overview
source: https://code.claude.com/docs/en/overview
scraped: 2026-01-10
---

# Claude Code Overview

Learn about Claude Code, Anthropic's agentic coding tool that lives in your terminal and helps you turn ideas into code faster than ever before.

## Get started in 30 seconds

### Prerequisites

- A [Claude subscription](https://claude.com/pricing) (Pro, Max, Teams, or Enterprise) or [Claude Console](https://console.anthropic.com/) account

### Install Claude Code

**Native Install (Recommended) - macOS, Linux, WSL:**

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

**NPM (Node.js 18+ required):**

```bash
npm install -g @anthropic-ai/claude-code
```

### Start using Claude Code

```bash
cd your-project
claude
```

You'll be prompted to log in on first use. [Continue with Quickstart (5 minutes)](/docs/en/quickstart)

**Note:** Claude Code automatically keeps itself up to date. See advanced setup for installation options, manual updates, or uninstallation instructions.

## What Claude Code does for you

- **Build features from descriptions**: Tell Claude what you want to build in plain English. It will make a plan, write the code, and ensure it works.

- **Debug and fix issues**: Describe a bug or paste an error message. Claude Code will analyze your codebase, identify the problem, and implement a fix.

- **Navigate any codebase**: Ask anything about your team's codebase, and get a thoughtful answer back. Claude Code maintains awareness of your entire project structure, can find up-to-date information from the web, and with MCP can pull from external data sources like Google Drive, Figma, and Slack.

- **Automate tedious tasks**: Fix fiddly lint issues, resolve merge conflicts, and write release notes. Do all this in a single command from your developer machines, or automatically in CI.

## Why developers love Claude Code

- **Works in your terminal**: Not another chat window. Not another IDE. Claude Code meets you where you already work, with the tools you already love.

- **Takes action**: Claude Code can directly edit files, run commands, and create commits. Need more? MCP lets Claude read your design docs in Google Drive, update your tickets in Jira, or use your custom developer tooling.

- **Unix philosophy**: Claude Code is composable and scriptable. `tail -f app.log | claude -p "Slack me if you see any anomalies appear in this log stream"` works. Your CI can run `claude -p "If there are new text strings, translate them into French and raise a PR for @lang-fr-team to review"`.

- **Enterprise-ready**: Use the Claude API, or host on AWS or GCP. Enterprise-grade security, privacy, and compliance is built-in.

## Next steps

- **[Quickstart](/docs/en/quickstart)** - See Claude Code in action with practical examples
- **[Common workflows](/docs/en/common-workflows)** - Step-by-step guides for common workflows
- **[Troubleshooting](/docs/en/troubleshooting)** - Solutions for common issues with Claude Code
- **[IDE setup](/docs/en/vs-code)** - Add Claude Code to your IDE

## Additional resources

- **[About Claude Code](https://claude.com/product/claude-code)** - Learn more about Claude Code on claude.com
- **[Build with the Agent SDK](https://docs.claude.com/en/docs/agent-sdk/overview)** - Create custom AI agents with the Claude Agent SDK
- **[Host on AWS or GCP](/docs/en/third-party-integrations)** - Configure Claude Code with Amazon Bedrock or Google Vertex AI
- **[Settings](/docs/en/settings)** - Customize Claude Code for your workflow
- **[Commands](/docs/en/cli-reference)** - Learn about CLI commands and controls
- **[Reference implementation](https://github.com/anthropics/claude-code/tree/main/.devcontainer)** - Clone our development container reference implementation
- **[Security](/docs/en/security)** - Discover Claude Code's safeguards and best practices for safe usage
- **[Privacy and data usage](/docs/en/data-usage)** - Understand how Claude Code handles your data

## Key Features Summary

Claude Code is Anthropic's official CLI tool that:

- Operates directly in your terminal
- Provides agentic coding assistance
- Can edit files, run commands, and create commits
- Integrates with external tools via Model Context Protocol (MCP)
- Supports enterprise deployments on AWS, GCP, and more
- Includes built-in security and compliance features
- Works with various IDEs and CI/CD systems
