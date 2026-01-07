---
source: https://code.claude.com/docs/en/interactive-mode
scraped: 2026-01-07
method: bright_data
duration_ms: 1315
---

Interactive mode - Claude Code Docs

 

[Skip to main content](#content-area)

[Claude Code Docs home page![light logo](https://mintcdn.com/claude-code/o69F7a6qoW9vboof/logo/light.svg?fit=max&auto=format&n=o69F7a6qoW9vboof&q=85&s=536eade682636e84231afce2577f9509)![dark logo](https://mintcdn.com/claude-code/o69F7a6qoW9vboof/logo/dark.svg?fit=max&auto=format&n=o69F7a6qoW9vboof&q=85&s=0766b3221061e80143e9f300733e640b)](/docs)

![US](https://d3gk2c5xim1je2.cloudfront.net/flags/US.svg)

English

Search...

⌘KAsk AI

*   [Claude Developer Platform](https://platform.claude.com/)
*   [Claude Code on the Web](https://claude.ai/code)
*   [
    
    Claude Code on the Web
    
    ](https://claude.ai/code)

Search...

Navigation

Reference

Interactive mode

[Getting started

](/docs/en/overview)[Build with Claude Code

](/docs/en/sub-agents)[Deployment

](/docs/en/third-party-integrations)[Administration

](/docs/en/setup)[Configuration

](/docs/en/settings)[Reference

](/docs/en/cli-reference)[Resources

](/docs/en/legal-and-compliance)

##### Reference

*   [
    
    CLI reference
    
    
    
    ](/docs/en/cli-reference)
*   [
    
    Interactive mode
    
    
    
    ](/docs/en/interactive-mode)
*   [
    
    Slash commands
    
    
    
    ](/docs/en/slash-commands)
*   [
    
    Checkpointing
    
    
    
    ](/docs/en/checkpointing)
*   [
    
    Hooks reference
    
    
    
    ](/docs/en/hooks)
*   [
    
    Plugins reference
    
    
    
    ](/docs/en/plugins-reference)

  

On this page

*   [Keyboard shortcuts](#keyboard-shortcuts)
*   [General controls](#general-controls)
*   [Multiline input](#multiline-input)
*   [Quick commands](#quick-commands)
*   [Vim editor mode](#vim-editor-mode)
*   [Mode switching](#mode-switching)
*   [Navigation (NORMAL mode)](#navigation-normal-mode)
*   [Editing (NORMAL mode)](#editing-normal-mode)
*   [Command history](#command-history)
*   [Reverse search with Ctrl+R](#reverse-search-with-ctrl%2Br)
*   [Background bash commands](#background-bash-commands)
*   [How backgrounding works](#how-backgrounding-works)
*   [Bash mode with ! prefix](#bash-mode-with-prefix)
*   [See also](#see-also)

Reference

# Interactive mode

Copy page

Complete reference for keyboard shortcuts, input modes, and interactive features in Claude Code sessions.

Copy page

## 

[​

](#keyboard-shortcuts)

Keyboard shortcuts

Keyboard shortcuts may vary by platform and terminal. Press `?` to see available shortcuts for your environment. For example, Option key combinations on macOS may require configuring your terminal to use Option as a meta/escape key.

### 

[​

](#general-controls)

General controls

Shortcut

Description

Context

`Ctrl+C`

Cancel current input or generation

Standard interrupt

`Ctrl+D`

Exit Claude Code session

EOF signal

`Ctrl+L`

Clear terminal screen

Keeps conversation history

`Ctrl+O`

Toggle verbose output

Shows detailed tool usage and execution

`Ctrl+R`

Reverse search command history

Search through previous commands interactively

`Ctrl+V` (macOS/Linux) or `Alt+V` (Windows)

Paste image from clipboard

Pastes an image or path to an image file

`Up/Down arrows`

Navigate command history

Recall previous inputs

`Esc` + `Esc`

Rewind the code/conversation

Restore the code and/or conversation to a previous point

`Shift+Tab` or `Alt+M` (some configurations)

Toggle permission modes

Switch between Auto-Accept Mode, Plan Mode, and normal mode

`Option+P` (macOS) or `Alt+P` (Windows/Linux)

Switch model

Switch models without clearing your prompt

### 

[​

](#multiline-input)

Multiline input

Method

Shortcut

Context

Quick escape

`\` + `Enter`

Works in all terminals

macOS default

`Option+Enter`

Default on macOS

Terminal setup

`Shift+Enter`

After `/terminal-setup`

Control sequence

`Ctrl+J`

Line feed character for multiline

Paste mode

Paste directly

For code blocks, logs

Configure your preferred line break behavior in terminal settings. Run `/terminal-setup` to install Shift+Enter binding for iTerm2 and VS Code terminals.

### 

[​

](#quick-commands)

Quick commands

Shortcut

Description

Notes

`/` at start

Slash command

See [slash commands](/docs/en/slash-commands)

`!` at start

Bash mode

Run commands directly and add execution output to the session

`@`

File path mention

Trigger file path autocomplete

## 

[​

](#vim-editor-mode)

Vim editor mode

Enable vim-style editing with `/vim` command or configure permanently via `/config`.

### 

[​

](#mode-switching)

Mode switching

Command

Action

From mode

`Esc`

Enter NORMAL mode

INSERT

`i`

Insert before cursor

NORMAL

`I`

Insert at beginning of line

NORMAL

`a`

Insert after cursor

NORMAL

`A`

Insert at end of line

NORMAL

`o`

Open line below

NORMAL

`O`

Open line above

NORMAL

### 

[​

](#navigation-normal-mode)

Navigation (NORMAL mode)

Command

Action

`h`/`j`/`k`/`l`

Move left/down/up/right

`w`

Next word

`e`

End of word

`b`

Previous word

`0`

Beginning of line

`$`

End of line

`^`

First non-blank character

`gg`

Beginning of input

`G`

End of input

### 

[​

](#editing-normal-mode)

Editing (NORMAL mode)

Command

Action

`x`

Delete character

`dd`

Delete line

`D`

Delete to end of line

`dw`/`de`/`db`

Delete word/to end/back

`cc`

Change line

`C`

Change to end of line

`cw`/`ce`/`cb`

Change word/to end/back

`.`

Repeat last change

## 

[​

](#command-history)

Command history

Claude Code maintains command history for the current session:

*   History is stored per working directory
*   Cleared with `/clear` command
*   Use Up/Down arrows to navigate (see keyboard shortcuts above)
*   **Note**: History expansion (`!`) is disabled by default

### 

[​

](#reverse-search-with-ctrl+r)

Reverse search with Ctrl+R

Press `Ctrl+R` to interactively search through your command history:

1.  **Start search**: Press `Ctrl+R` to activate reverse history search
2.  **Type query**: Enter text to search for in previous commands - the search term will be highlighted in matching results
3.  **Navigate matches**: Press `Ctrl+R` again to cycle through older matches
4.  **Accept match**:
    *   Press `Tab` or `Esc` to accept the current match and continue editing
    *   Press `Enter` to accept and execute the command immediately
5.  **Cancel search**:
    *   Press `Ctrl+C` to cancel and restore your original input
    *   Press `Backspace` on empty search to cancel

The search displays matching commands with the search term highlighted, making it easy to find and reuse previous inputs.

## 

[​

](#background-bash-commands)

Background bash commands

Claude Code supports running bash commands in the background, allowing you to continue working while long-running processes execute.

### 

[​

](#how-backgrounding-works)

How backgrounding works

When Claude Code runs a command in the background, it runs the command asynchronously and immediately returns a background task ID. Claude Code can respond to new prompts while the command continues executing in the background. To run commands in the background, you can either:

*   Prompt Claude Code to run a command in the background
*   Press Ctrl+B to move a regular Bash tool invocation to the background. (Tmux users must press Ctrl+B twice due to tmux’s prefix key.)

**Key features:**

*   Output is buffered and Claude can retrieve it using the BashOutput tool
*   Background tasks have unique IDs for tracking and output retrieval
*   Background tasks are automatically cleaned up when Claude Code exits

**Common backgrounded commands:**

*   Build tools (webpack, vite, make)
*   Package managers (npm, yarn, pnpm)
*   Test runners (jest, pytest)
*   Development servers
*   Long-running processes (docker, terraform)

### 

[​

](#bash-mode-with-prefix)

Bash mode with `!` prefix

Run bash commands directly without going through Claude by prefixing your input with `!`:

Copy

Ask AI

    ! npm test
    ! git status
    ! ls -la
    

Bash mode:

*   Adds the command and its output to the conversation context
*   Shows real-time progress and output
*   Supports the same `Ctrl+B` backgrounding for long-running commands
*   Does not require Claude to interpret or approve the command

This is useful for quick shell operations while maintaining conversation context.

## 

[​

](#see-also)

See also

*   [Slash commands](/docs/en/slash-commands) - Interactive session commands
*   [Checkpointing](/docs/en/checkpointing) - Rewind Claude’s edits and restore previous states
*   [CLI reference](/docs/en/cli-reference) - Command-line flags and options
*   [Settings](/docs/en/settings) - Configuration options
*   [Memory management](/docs/en/memory) - Managing CLAUDE.md files

Was this page helpful?

YesNo

[CLI reference](/docs/en/cli-reference)[Slash commands](/docs/en/slash-commands)

⌘I

[Claude Code Docs home page![light logo](https://mintcdn.com/claude-code/o69F7a6qoW9vboof/logo/light.svg?fit=max&auto=format&n=o69F7a6qoW9vboof&q=85&s=536eade682636e84231afce2577f9509)![dark logo](https://mintcdn.com/claude-code/o69F7a6qoW9vboof/logo/dark.svg?fit=max&auto=format&n=o69F7a6qoW9vboof&q=85&s=0766b3221061e80143e9f300733e640b)](/docs)

[x](https://x.com/AnthropicAI)[linkedin](https://www.linkedin.com/company/anthropicresearch)

Company

[Anthropic](https://www.anthropic.com/company)[Careers](https://www.anthropic.com/careers)[Economic Futures](https://www.anthropic.com/economic-futures)[Research](https://www.anthropic.com/research)[News](https://www.anthropic.com/news)[Trust center](https://trust.anthropic.com/)[Transparency](https://www.anthropic.com/transparency)

Help and security

[Availability](https://www.anthropic.com/supported-countries)[Status](https://status.anthropic.com/)[Support center](https://support.claude.com/)

Learn

[Courses](https://www.anthropic.com/learn)[MCP connectors](https://claude.com/partners/mcp)[Customer stories](https://www.claude.com/customers)[Engineering blog](https://www.anthropic.com/engineering)[Events](https://www.anthropic.com/events)[Powered by Claude](https://claude.com/partners/powered-by-claude)[Service partners](https://claude.com/partners/services)[Startups program](https://claude.com/programs/startups)

Terms and policies

[Privacy policy](https://www.anthropic.com/legal/privacy)[Disclosure policy](https://www.anthropic.com/responsible-disclosure-policy)[Usage policy](https://www.anthropic.com/legal/aup)[Commercial terms](https://www.anthropic.com/legal/commercial-terms)[Consumer terms](https://www
