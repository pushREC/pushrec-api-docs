---
source: https://code.claude.com/docs/en/plugin-marketplaces
scraped: 2026-01-07
method: bright_data
duration_ms: 1911
---

Create and distribute a plugin marketplace - Claude Code Docs

 

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

Create and distribute a plugin marketplace

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

*   [Overview](#overview)
*   [Walkthrough: create a local marketplace](#walkthrough%3A-create-a-local-marketplace)
*   [Create the marketplace file](#create-the-marketplace-file)
*   [Marketplace schema](#marketplace-schema)
*   [Required fields](#required-fields)
*   [Owner fields](#owner-fields)
*   [Optional metadata](#optional-metadata)
*   [Plugin entries](#plugin-entries)
*   [Required fields](#required-fields-2)
*   [Optional plugin fields](#optional-plugin-fields)
*   [Plugin sources](#plugin-sources)
*   [Relative paths](#relative-paths)
*   [GitHub repositories](#github-repositories)
*   [Git repositories](#git-repositories)
*   [Advanced plugin entries](#advanced-plugin-entries)
*   [Host and distribute marketplaces](#host-and-distribute-marketplaces)
*   [Host on GitHub (recommended)](#host-on-github-recommended)
*   [Host on other git services](#host-on-other-git-services)
*   [Test locally before distribution](#test-locally-before-distribution)
*   [Require marketplaces for your team](#require-marketplaces-for-your-team)
*   [Enterprise marketplace restrictions](#enterprise-marketplace-restrictions)
*   [Common configurations](#common-configurations)
*   [How restrictions work](#how-restrictions-work)
*   [Validation and testing](#validation-and-testing)
*   [Troubleshooting](#troubleshooting)
*   [Marketplace not loading](#marketplace-not-loading)
*   [Marketplace validation errors](#marketplace-validation-errors)
*   [Plugin installation failures](#plugin-installation-failures)
*   [Files not found after installation](#files-not-found-after-installation)
*   [See also](#see-also)

Administration

# Create and distribute a plugin marketplace

Copy page

Build and host plugin marketplaces to distribute Claude Code extensions across teams and communities.

Copy page

A plugin marketplace is a catalog that lets you distribute plugins to others. Marketplaces provide centralized discovery, version tracking, automatic updates, and support for multiple source types (git repositories, local paths, and more). This guide shows you how to create your own marketplace to share plugins with your team or community. Looking to install plugins from an existing marketplace? See [Discover and install prebuilt plugins](/docs/en/discover-plugins).

## 

[​

](#overview)

Overview

Creating and distributing a marketplace involves:

1.  **Creating plugins**: build one or more plugins with commands, agents, hooks, MCP servers, or LSP servers. This guide assumes you already have plugins to distribute; see [Create plugins](/docs/en/plugins) for details on how to create them.
2.  **Creating a marketplace file**: define a `marketplace.json` that lists your plugins and where to find them (see [Create the marketplace file](#create-the-marketplace-file)).
3.  **Host the marketplace**: push to GitHub, GitLab, or another git host (see [Host and distribute marketplaces](#host-and-distribute-marketplaces)).
4.  **Share with users**: users add your marketplace with `/plugin marketplace add` and install individual plugins (see [Discover and install plugins](/docs/en/discover-plugins)).

Once your marketplace is live, you can update it by pushing changes to your repository. Users refresh their local copy with `/plugin marketplace update`.

## 

[​

](#walkthrough:-create-a-local-marketplace)

Walkthrough: create a local marketplace

This example creates a marketplace with one plugin: a `/review` command for code reviews. You’ll create the directory structure, add a slash command, create the plugin manifest and marketplace catalog, then install and test it.

1

Create the directory structure

Copy

Ask AI

    mkdir -p my-marketplace/.claude-plugin
    mkdir -p my-marketplace/plugins/review-plugin/.claude-plugin
    mkdir -p my-marketplace/plugins/review-plugin/commands
    

2

Create the plugin command

Create a Markdown file that defines what the `/review` command does.

my-marketplace/plugins/review-plugin/commands/review.md

Copy

Ask AI

    Review the code I've selected or the recent changes for:
    - Potential bugs or edge cases
    - Security concerns
    - Performance issues
    - Readability improvements
    
    Be concise and actionable.
    

3

Create the plugin manifest

Create a `plugin.json` file that describes the plugin. The manifest goes in the `.claude-plugin/` directory.

my-marketplace/plugins/review-plugin/.claude-plugin/plugin.json

Copy

Ask AI

    {
      "name": "review-plugin",
      "description": "Adds a /review command for quick code reviews",
      "version": "1.0.0"
    }
    

4

Create the marketplace file

Create the marketplace catalog that lists your plugin.

my-marketplace/.claude-plugin/marketplace.json

Copy

Ask AI

    {
      "name": "my-plugins",
      "owner": {
        "name": "Your Name"
      },
      "plugins": [
        {
          "name": "review-plugin",
          "source": "./plugins/review-plugin",
          "description": "Adds a /review command for quick code reviews"
        }
      ]
    }
    

5

Add and install

Add the marketplace and install the plugin.

Copy

Ask AI

    /plugin marketplace add ./my-marketplace
    /plugin install review-plugin@my-plugins
    

6

Try it out

Select some code in your editor and run your new command.

Copy

Ask AI

    /review
    

To learn more about what plugins can do, including hooks, agents, MCP servers, and LSP servers, see [Plugins](/docs/en/plugins).

**How plugins are installed**: When users install a plugin, Claude Code copies the plugin directory to a cache location. This means plugins can’t reference files outside their directory using paths like `../shared-utils`, because those files won’t be copied.If you need to share files across plugins, use symlinks (which are followed during copying) or restructure your marketplace so the shared directory is inside the plugin source path. See [Plugin caching and file resolution](/docs/en/plugins-reference#plugin-caching-and-file-resolution) for details.

## 

[​

](#create-the-marketplace-file)

Create the marketplace file

Create `.claude-plugin/marketplace.json` in your repository root. This file defines your marketplace’s name, owner information, and a list of plugins with their sources. Each plugin entry needs at minimum a `name` and `source` (where to fetch it from). See the [full schema](#marketplace-schema) below for all available fields.

Copy

Ask AI

    {
      "name": "company-tools",
      "owner": {
        "name": "DevTools Team",
        "email": "[email protected]"
      },
      "plugins": [
        {
          "name": "code-formatter",
          "source": "./plugins/formatter",
          "description": "Automatic code formatting on save",
          "version": "2.1.0",
          "author": {
            "name": "DevTools Team"
          }
        },
        {
          "name": "deployment-tools",
          "source": {
            "source": "github",
            "repo": "company/deploy-plugin"
          },
          "description": "Deployment automation tools"
        }
      ]
    }
    

## 

[​

](#marketplace-schema)

Marketplace schema

### 

[​

](#required-fields)

Required fields

Field

Type

Description

Example

`name`

string

Marketplace identifier (kebab-case, no spaces). This is public-facing: users see it when installing plugins (for example, `/plugin install my-tool@your-marketplace`).

`"acme-tools"`

`owner`

object

Marketplace maintainer information ([see fields below](#owner-fields))

`plugins`

array

List of available plugins

See below

**Reserved names**: The following marketplace names are reserved for official Anthropic use and cannot be used by third-party marketplaces: `claude-code-marketplace`, `claude-code-plugins`, `claude-plugins-official`, `anthropic-marketplace`, `anthropic-plugins`, `agent-skills`, `life-sciences`. Names that impersonate official marketplaces (like `official-claude-plugins` or `anthropic-tools-v2`) are also blocked.

### 

[​

](#owner-fields)

Owner fields

Field

Type

Required

Description

`name`

string

Yes

Name of the maintainer or team

`email`

string

No

Contact email for the maintainer

### 

[​

](#optional-metadata)

Optional metadata

Field

Type

Description

`metadata.description`

string

Brief marketplace description

`metadata.version`

string

Marketplace version

`metadata.pluginRoot`

string

Base directory prepended to relative plugin source paths (for example, `"./plugins"` lets you write `"source": "formatter"` instead of `"source": "./plugins/formatter"`)

## 

[​

](#plugin-entries)

Plugin entries

Each plugin entry in the `plugins` array describes a plugin and where to find it. You can include any field from the [plugin manifest schema](/docs/en/plugins-reference#plugin-manifest-schema) (like `description`, `version`, `author`, `commands`, `hooks`, etc.), plus these marketplace-specific fields: `source`, `category`, `tags`, and `strict`.

### 

[​

](#required-fields-2)

Required fields

Field

Type

Description

`name`

string

Plugin identifier (kebab-case, no spaces). This is public-facing: users see it when installing (for example, `/plugin install my-plugin@marketplace`).

`source`

string|object

Where to fetch the plugin from (see [Plugin sources](#plugin-sources) below)

### 

[​

](#optional-plugin-fields)

Optional plugin fields

**Standard metadata fields:**

Field

Type

Description

`description`

string

Brief plugin description

`version`

string

Plugin version

`author`

object

Plugin author information (`name` required, `email` optional)

`homepage`

string

Plugin homepage or documentation URL

`repository`

string

Source code repository URL

`license`

string

SPDX license identifier (for example, MIT, Apache-2.0)

`keywords`

array

Tags for plugin discovery and categorization

`category`

string

Plugin category for organization

`tags`

array

Tags for searchability

`strict`

boolean

Controls whether plugins need their own `plugin.json` file. When `true` (default), the plugin source must contain a `plugin.json`, and any fields you add here in the marketplace entry get merged with it. When `false`, the plugin doesn’t need its own `plugin.json`; the marketplace entry itself defines everything about the plugin. Use `false` when you want to define simple plugins entirely in your marketplace file.

**Component configuration fields:**

Field

Type

Description

`commands`

string|array

Custom paths to command files or directories

`agents`

string|array

Custom paths to agent files

`hooks`

string|object

Custom hooks configuration or path to hooks file

`mcpServers`

string|object

MCP server configurations or path to MCP config

`lspServers`

string|object

LSP server configurations or path to LSP config

## 

[​

](#plugin-sources)

Plugin sources

### 

[​

](#relative-paths)

Relative paths

For plugins in the same repository:

Copy

Ask AI

    {
      "name": "my-plugin",
      "source": "./plugins/my-plugin"
    }
    

### 

[​

](#github-repositories)

GitHub repositories

Copy

Ask AI

    {
      "name": "github-plugin",
      "source": {
        "source": "github",
        "repo": "owner/plugin-repo"
      }
    }
    

### 

[​

](#git-repositories)

Git repositories

Copy

Ask AI

    {
      "name": "git-plugin",
      "source": {
        "source": "url",
        "url": "https://gitlab.com/team/plugin.git"
      }
    }
    

### 

[​

](#advanced-plugin-entries)

Advanced plugin entries

This example shows a plugin entry using many of the optional fields, including custom paths for commands, agents, hooks, and MCP servers:

Copy

Ask AI

    {
      "name": "enterprise-tools",
      "source": {
        "source": "github",
        "repo": "company/enterprise-plugin"
      },
      "description": "Enterprise workflow automation tools",
      "version": "2.1.0",
      "author": {
        "name": "Enterprise Team",
        "email": "[email protected]"
      },
      "homepage": "https://docs.example.com/plugins/enterprise-tools",
      "repository": "https://github.com/company/enterprise-plugin",
      "license": "MIT",
      "keywords": ["enterprise", "workflow", "automation"],
      "category": "productivity",
      "commands": [
        "./commands/core/",
        "./commands/enterprise/",
        "./commands/experimental/preview.md"
      ],
      "agents": ["./agents/security-reviewer.md", "./agents/compliance-checker.md"],
      "hooks": {
        "PostToolUse": [
          {
            "matcher": "Write|Edit",
            "hooks": [
              {
                "type": "command",
                "command": "${CLAUDE_PLUGIN_ROOT}/scripts/validate.sh"
              }
            ]
          }
        ]
      },
      "mcpServers": {
        "enterprise-db": {
          "command": "${CLAUDE_PLUGIN_ROOT}/servers/db-server",
          "args": ["--config", "${CLAUDE_PLUGIN_ROOT}/config.json"]
        }
      },
      "strict": false
    }
    

Key things to notice:

*   **`commands` and `agents`**: You can specify multiple directories or individual files. Paths are relative to the plugin root.
*   **`${CLAUDE_PLUGIN_ROOT}`**: Use this variable in hooks and MCP server configs to reference files within the plugin’s installation directory. This is necessary because plugins are copied to a cache location when installed.
*   **`strict: false`**: Since this is set to false, the plugin doesn’t need its own `plugin.json`. The marketplace entry defines everything.

## 

[​

](#host-and-distribute-marketplaces)

Host and distribute marketplaces

### 

[​

](#host-on-github-recommended)

Host on GitHub (recommended)

GitHub provides the easiest distribution method:

1.  **Create a repository**: Set up a new repository for your marketplace
2.  **Add marketplace file**: Create `.claude-plugin/marketplace.json` with your plugin definitions
3.  **Share with teams**: Users add your marketplace with `/plugin marketplace add owner/repo`

**Benefits**: Built-in version control, issue tracking, and team collaboration features.

### 

[​

](#host-on-other-git-services)

Host on other git services

Any git hosting service works, such as GitLab, Bitbucket, and self-hosted servers. Users add with the full repository URL:

Copy

Ask AI

    /plugin marketplace add https://gitlab.com/company/plugins.git
    

### 

[​

](#test-locally-before-distribution)

Test locally before distribution

Test your marketplace locally before sharing:

Copy

Ask AI

    /plugin marketplace add ./my-local-marketplace
    /plugin install test-plugin@my-local-marketplace
    

For the full range of add commands (GitHub, Git URLs, local paths, remote URLs), see [Add marketplaces](/docs/en/discover-plugins#add-marketplaces).

### 

[​

](#require-marketplaces-for-your-team)

Require marketplaces for your team

You can configure your repository so team members are automatically prompted to install your marketplace when they trust the project folder. Add your marketplace to `.claude/settings.json`:

Copy

Ask AI

    {
      "extraKnownMarketplaces": {
        "company-tools": {
          "source": {
            "source": "github",
            "repo": "your-org/claude-plugins"
          }
        }
      }
    }
    

You can also specify which plugins should be enabled by default:

Copy

Ask AI

    {
      "enabledPlugins": {
        "code-formatter@company-tools": true,
        "deployment-tools@company-tools": true
      }
    }
    

For full configuration options, see [Plugin settings](/docs/en/settings#plugin-settings).

### 

[​

](#enterprise-marketplace-restrictions)

Enterprise marketplace restrictions

For organizations requiring strict control over plugin sources, enterprise administrators can restrict which plugin marketplaces users are allowed to add using the [`strictKnownMarketplaces`](/docs/en/settings#strictknownmarketplaces) setting in managed settings. When `strictKnownMarketplaces` is configured in managed settings, the restriction behavior depends on the value:

Value

Behavior

Undefined (default)

No restrictions. Users can add any marketplace

Empty array `[]`

Complete lockdown. Users cannot add any new marketplaces

List of sources

Users can only add marketplaces that match the allowlist exactly

#### 

[​

](#common-configurations)

Common configurations

Disable all marketplace additions:

Copy

Ask AI

    {
      "strictKnownMarketplaces": []
    }
    

Allow specific marketplaces only:

Copy

Ask AI

    {
      "strictKnownMarketplaces": [
        {
          "source": "github",
          "repo": "acme-corp/approved-plugins"
        },
        {
          "source": "github",
          "repo": "acme-corp/security-tools",
          "ref": "v2.0"
        },
        {
          "source": "url",
          "url": "https://plugins.example.com/marketplace.json"
        }
      ]
    }
    

#### 

[​

](#how-restrictions-work)

How restrictions work

Restrictions are validated early in the plugin installation process, before any network requests or filesystem operations occur. This prevents unauthorized marketplace access attempts. The allowlist uses exact matching. For a marketplace to be allowed, all specified fields must match exactly:

*   For GitHub sources: `repo` is required, and `ref` or `path` must also match if specified in the allowlist
*   For URL sources: the full URL must match exactly

Because `strictKnownMarketplaces` is set in [managed settings](/docs/en/settings#settings-file-locations), individual users and project configurations cannot override these restrictions. For complete configuration details including all supported source types and comparison with `extraKnownMarketplaces`, see the [strictKnownMarketplaces reference](/docs/en/settings#strictknownmarketplaces).

## 

[​

](#validation-and-testing)

Validation and testing

Test your marketplace before sharing. Validate your marketplace JSON syntax:

Copy

Ask AI

    claude plugin validate .
    

Or from within Claude Code:

Copy

Ask AI

    /plugin validate .
    

Add the marketplace for testing:

Copy

Ask AI

    /plugin marketplace add ./path/to/marketplace
    

Install a test plugin to verify everything works:

Copy

Ask AI

    /plugin install test-plugin@marketplace-name
    

For complete plugin testing workflows, see [Test your plugins locally](/docs/en/plugins#test-your-plugins-locally). For technical troubleshooting, see [Plugins reference](/docs/en/plugins-reference).

## 

[​

](#troubleshooting)

Troubleshooting

### 

[​

](#marketplace-not-loading)

Marketplace not loading

**Symptoms**: Can’t add marketplace or see plugins from it **Solutions**:

*   Verify the marketplace URL is accessible
*   Check that `.claude-plugin/marketplace.json` exists at the specified path
*   Ensure JSON syntax is valid using `claude plugin validate` or `/plugin validate`
*   For private repositories, confirm you have access permissions

### 

[​

](#marketplace-validation-errors)

Marketplace validation errors

Run `claude plugin validate .` or `/plugin validate .` from your marketplace directory to check for issues. Common errors:

Error

Cause

Solution

`File not found: .claude-plugin/marketplace.json`

Missing manifest

Create `.claude-plugin/marketplace.json` with required fields

`Invalid JSON syntax: Unexpected token...`

JSON syntax error

Check for missing commas, extra commas, or unquoted strings

`Duplicate plugin name "x" found in marketplace`

Two plugins share the same name

Give each plugin a unique `name` value

`plugins[0].source: Path traversal not allowed`

Source path contains `..`

Use paths relative to marketplace root without `..`

**Warnings** (non-blocking):

*   `Marketplace has no plugins defined`: add at least one plugin to the `plugins` array
*   `No marketplace description provided`: add `metadata.description` to help users understand your marketplace
*   `Plugin "x" uses npm source which is not yet fully implemented`: use `github` or local path sources instead

### 

[​

](#plugin-installation-failures)

Plugin installation failures

**Symptoms**: Marketplace appears but plugin installation fails **Solutions**:

*   Verify plugin source URLs are accessible
*   Check that plugin directories contain required files
*   For GitHub sources, ensure repositories are public or you have access
*   Test plugin sources manually by cloning/downloading

### 

[​

](#files-not-found-after-installation)

Files not found after installation

**Symptoms**: Plugin installs but references to files fail, especially files outside the plugin directory **Cause**: Plugins are copied to a cache directory rather than used in-place. Paths that reference files outside the plugin’s directory (such as `../shared-utils`) won’t work because those files aren’t copied. **Solutions**: See [Plugin caching and file resolution](/docs/en/plugins-reference#plugin-caching-and-file-resolution) for workarounds including symlinks and directory restructuring. For additional debugging tools and common issues, see [Debugging and development tools](/docs/en/plugins-reference#debugging-and-development-tools).

## 

[​

](#see-also)

See also

*   [Discover and install prebuilt plugins](/docs/en/discover-plugins) - Installing plugins from existing marketplaces
*   [Plugins](/docs/en/plugins) - Creating your own plugins
*   [Plugins reference](/docs/en/plugins-reference) - Complete technical specifications and schemas
*   [Plugin settings](/docs/en/settings#plugin-settings) - Plugin configuration options
*   [strictKnownMarketplaces reference](/docs/en/settings#strictknownmarketplaces) - Enterprise marketplace restrictions

Was this page helpful?

YesNo

[Analytics](/docs/en/analytics)

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

[Privacy policy](https://www.anthropic.com/legal/privacy)[Disclosure policy](https://www.anthropic.com/responsible-disclosure-policy)[Usage policy](https://www.anthropic.com/legal/aup)[Commercial terms](https://www.anthropic.com
