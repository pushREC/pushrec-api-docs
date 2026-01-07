---
source: https://code.claude.com/docs/en/iam
scraped: 2026-01-07
api_provider: Anthropic
discovery_tier: 3
verified: false
method: bright_data
duration_ms: 1920
---
dentity and Access Management - Claude Code Docs

 

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

Administration

Identity and Access Management

[Getting started

](/docs/en/overview)[Build with Claude Code

](/docs/en/sub-agents)[Deployment

](/docs/en/third-party-integrations)[Administration

](/docs/en/setup)[Configuration

](/docs/en/settings)[Reference

](/docs/en/cli-reference)[Resources

](/docs/en/legal-and-compliance)

##### Administration

*   [
    
    Advanced installation
    
    
    
    ](/docs/en/setup)
*   [
    
    Identity and Access Management
    
    
    
    ](/docs/en/iam)
*   [
    
    Security
    
    
    
    ](/docs/en/security)
*   [
    
    Data usage
    
    
    
    ](/docs/en/data-usage)
*   [
    
    Monitoring
    
    
    
    ](/docs/en/monitoring-usage)
*   [
    
    Costs
    
    
    
    ](/docs/en/costs)
*   [
    
    Analytics
    
    
    
    ](/docs/en/analytics)
*   [
    
    Create and distribute a plugin marketplace
    
    
    
    ](/docs/en/plugin-marketplaces)

  

On this page

*   [Authentication methods](#authentication-methods)
*   [Claude API authentication](#claude-api-authentication)
*   [Cloud provider authentication](#cloud-provider-authentication)
*   [Access control and permissions](#access-control-and-permissions)
*   [Permission system](#permission-system)
*   [Configuring permissions](#configuring-permissions)
*   [Permission modes](#permission-modes)
*   [Working directories](#working-directories)
*   [Tool-specific permission rules](#tool-specific-permission-rules)
*   [Additional permission control with hooks](#additional-permission-control-with-hooks)
*   [Enterprise managed settings](#enterprise-managed-settings)
*   [Settings precedence](#settings-precedence)
*   [Credential management](#credential-management)

Administration

# Identity and Access Management

Copy page

Learn how to configure user authentication, authorization, and access controls for Claude Code in your organization.

Copy page

## 

[​

](#authentication-methods)

Authentication methods

Setting up Claude Code requires access to Anthropic models. For teams, you can set up Claude Code access in one of four ways:

*   Claude API via the Claude Console
*   Amazon Bedrock
*   Microsoft Foundry
*   Google Vertex AI

### 

[​

](#claude-api-authentication)

Claude API authentication

**To set up Claude Code access for your team via Claude API:**

1.  Use your existing Claude Console account or create a new Claude Console account
2.  You can add users through either method below:
    *   Bulk invite users from within the Console (Console -> Settings -> Members -> Invite)
    *   [Set up SSO](https://support.claude.com/en/articles/10280258-setting-up-single-sign-on-on-the-api-console)
3.  When inviting users, they need one of the following roles:
    *   “Claude Code” role means users can only create Claude Code API keys
    *   “Developer” role means users can create any kind of API key
4.  Each invited user needs to complete these steps:
    *   Accept the Console invite
    *   [Check system requirements](/docs/en/setup#system-requirements)
    *   [Install Claude Code](/docs/en/setup#installation)
    *   Login with Console account credentials

### 

[​

](#cloud-provider-authentication)

Cloud provider authentication

**To set up Claude Code access for your team via Bedrock, Vertex, or Azure:**

1.  Follow the [Bedrock docs](/docs/en/amazon-bedrock), [Vertex docs](/docs/en/google-vertex-ai), or [Microsoft Foundry docs](/docs/en/microsoft-foundry)
2.  Distribute the environment variables and instructions for generating cloud credentials to your users. Read more about how to [manage configuration here](/docs/en/settings).
3.  Users can [install Claude Code](/docs/en/setup#installation)

## 

[​

](#access-control-and-permissions)

Access control and permissions

We support fine-grained permissions so that you’re able to specify exactly what the agent is allowed to do (e.g. run tests, run linter) and what it is not allowed to do (e.g. update cloud infrastructure). These permission settings can be checked into version control and distributed to all developers in your organization, as well as customized by individual developers.

### 

[​

](#permission-system)

Permission system

Claude Code uses a tiered permission system to balance power and safety:

Tool Type

Example

Approval Required

”Yes, don’t ask again” Behavior

Read-only

File reads, LS, Grep

No

N/A

Bash Commands

Shell execution

Yes

Permanently per project directory and command

File Modification

Edit/write files

Yes

Until session end

### 

[​

](#configuring-permissions)

Configuring permissions

You can view & manage Claude Code’s tool permissions with `/permissions`. This UI lists all permission rules and the settings.json file they are sourced from.

*   **Allow** rules will allow Claude Code to use the specified tool without further manual approval.
*   **Ask** rules will ask the user for confirmation whenever Claude Code tries to use the specified tool. Ask rules take precedence over allow rules.
*   **Deny** rules will prevent Claude Code from using the specified tool. Deny rules take precedence over allow and ask rules.
*   **Additional directories** extend Claude’s file access to directories beyond the initial working directory.
*   **Default mode** controls Claude’s permission behavior when encountering new requests.

Permission rules use the format: `Tool` or `Tool(optional-specifier)` A rule that is just the tool name matches any use of that tool. For example, adding `Bash` to the list of allow rules would allow Claude Code to use the Bash tool without requiring user approval.

#### 

[​

](#permission-modes)

Permission modes

Claude Code supports several permission modes that can be set as the `defaultMode` in [settings files](/docs/en/settings#settings-files):

Mode

Description

`default`

Standard behavior - prompts for permission on first use of each tool

`acceptEdits`

Automatically accepts file edit permissions for the session

`plan`

Plan Mode - Claude can analyze but not modify files or execute commands

`dontAsk`

Auto-denies tools unless pre-approved via `/permissions` or [`permissions.allow`](/docs/en/settings#permission-settings) rules

`bypassPermissions`

Skips all permission prompts (requires safe environment - see warning below)

#### 

[​

](#working-directories)

Working directories

By default, Claude has access to files in the directory where it was launched. You can extend this access:

*   **During startup**: Use `--add-dir <path>` CLI argument
*   **During session**: Use `/add-dir` slash command
*   **Persistent configuration**: Add to `additionalDirectories` in [settings files](/docs/en/settings#settings-files)

Files in additional directories follow the same permission rules as the original working directory - they become readable without prompts, and file editing permissions follow the current permission mode.

#### 

[​

](#tool-specific-permission-rules)

Tool-specific permission rules

Some tools support more fine-grained permission controls: **Bash**

*   `Bash(npm run build)` Matches the exact Bash command `npm run build`
*   `Bash(npm run test:*)` Matches Bash commands starting with `npm run test`
*   `Bash(curl http://site.com/:*)` Matches curl commands that start with exactly `curl http://site.com/`

Claude Code is aware of shell operators (like `&&`) so a prefix match rule like `Bash(safe-cmd:*)` won’t give it permission to run the command `safe-cmd && other-cmd`

Important limitations of Bash permission patterns:

1.  This tool uses **prefix matches**, not regex or glob patterns
2.  The wildcard `:*` only works at the end of a pattern to match any continuation
3.  Patterns like `Bash(curl http://github.com/:*)` can be bypassed in many ways:
    *   Options before URL: `curl -X GET http://github.com/...` won’t match
    *   Different protocol: `curl https://github.com/...` won’t match
    *   Redirects: `curl -L http://bit.ly/xyz` (redirects to github)
    *   Variables: `URL=http://github.com && curl $URL` won’t match
    *   Extra spaces: `curl http://github.com` won’t match

For more reliable URL filtering, consider:

*   Using the WebFetch tool with `WebFetch(domain:github.com)` permission
*   Instructing Claude Code about your allowed curl patterns via CLAUDE.md
*   Using hooks for custom permission validation

**Read & Edit** `Edit` rules apply to all built-in tools that edit files. Claude will make a best-effort attempt to apply `Read` rules to all built-in tools that read files like Grep, Glob, and LS. Read & Edit rules both follow the [gitignore](https://git-scm.com/docs/gitignore) specification with four distinct pattern types:

Pattern

Meaning

Example

Matches

`//path`

**Absolute** path from filesystem root

`Read(//Users/alice/secrets/**)`

`/Users/alice/secrets/**`

`~/path`

Path from **home** directory

`Read(~/Documents/*.pdf)`

`/Users/alice/Documents/*.pdf`

`/path`

Path **relative to settings file**

`Edit(/src/**/*.ts)`

`<settings file path>/src/**/*.ts`

`path` or `./path`

Path **relative to current directory**

`Read(*.env)`

`<cwd>/*.env`

A pattern like `/Users/alice/file` is NOT an absolute path - it’s relative to your settings file! Use `//Users/alice/file` for absolute paths.

*   `Edit(/docs/**)` - Edits in `<project>/docs/` (NOT `/docs/`!)
*   `Read(~/.zshrc)` - Reads your home directory’s `.zshrc`
*   `Edit(//tmp/scratch.txt)` - Edits the absolute path `/tmp/scratch.txt`
*   `Read(src/**)` - Reads from `<current-directory>/src/`

**WebFetch**

*   `WebFetch(domain:example.com)` Matches fetch requests to example.com

**MCP**

*   `mcp__puppeteer` Matches any tool provided by the `puppeteer` server (name configured in Claude Code)
*   `mcp__puppeteer__*` Wildcard syntax that also matches all tools from the `puppeteer` server
*   `mcp__puppeteer__puppeteer_navigate` Matches the `puppeteer_navigate` tool provided by the `puppeteer` server

### 

[​

](#additional-permission-control-with-hooks)

Additional permission control with hooks

[Claude Code hooks](/docs/en/hooks-guide) provide a way to register custom shell commands to perform permission evaluation at runtime. When Claude Code makes a tool call, PreToolUse hooks run before the permission system runs, and the hook output can determine whether to approve or deny the tool call in place of the permission system.

### 

[​

](#enterprise-managed-settings)

Enterprise managed settings

For enterprise deployments of Claude Code, administrators can configure and distribute settings to their organization through the [Claude.ai admin console](https://claude.ai/admin-settings/claude-code). These settings are fetched automatically when users authenticate and cannot be overridden locally. This feature is available to Claude for Enterprise customers. If you don’t see this option in your admin console, contact your Anthropic account team to have the feature enabled. For organizations that prefer file-based policy distribution, Claude Code also supports `managed-settings.json` files that can be deployed to [system directories](/docs/en/settings#settings-files). These policy files follow the same format as regular settings files and cannot be overridden by user or project settings.

### 

[​

](#settings-precedence)

Settings precedence

When multiple settings sources exist, they are applied in the following order (highest to lowest precedence):

1.  Managed settings (via Claude.ai admin console)
2.  File-based managed settings (`managed-settings.json`)
3.  Command line arguments
4.  Local project settings (`.claude/settings.local.json`)
5.  Shared project settings (`.claude/settings.json`)
6.  User settings (`~/.claude/settings.json`)

This hierarchy ensures that organizational policies are always enforced while still allowing flexibility at the project and user levels where appropriate.

## 

[​

](#credential-management)

Credential management

Claude Code securely manages your authentication credentials:

*   **Storage location**: On macOS, API keys, OAuth tokens, and other credentials are stored in the encrypted macOS Keychain.
*   **Supported authentication types**: Claude.ai credentials, Claude API credentials, Azure Auth, Bedrock Auth, and Vertex Auth.
*   **Custom credential scripts**: The [`apiKeyHelper`](/docs/en/settings#available-settings) setting can be configured to run a shell script that returns an API key.
*   **Refresh intervals**: By default, `apiKeyHelper` is called after 5 minutes or on HTTP 401 response. Set `CLAUDE_CODE_API_KEY_HELPER_TTL_MS` environment variable for custom refresh intervals.

Was this page helpful?

YesNo

[Advanced installation](/docs/en/setup)[Security](/docs/en/security)

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

[Privacy policy](https://www.anthropic.com/legal/privacy)[Disclosure policy](https://www.anthropic.com/responsible-disclosure-policy)[Usage policy](https://www.anthropic.com/legal/aup)[Commercial terms](https://www.anthropic.com/legal/commercial-te
