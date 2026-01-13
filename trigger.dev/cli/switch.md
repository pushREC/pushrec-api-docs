---
source: https://trigger.dev/docs/cli-switch
scraped: 2026-01-13
---

# CLI switch command

The `trigger.dev switch` command enables users to switch between different profiles in their Trigger.dev configuration.

## Usage

Run the command with the following syntax:

```bash
npx trigger.dev@latest switch [profile]
```

Available package managers:
- **npm**: `npx trigger.dev@latest switch [profile]`
- **pnpm**: `pnpm dlx trigger.dev@latest switch [profile]`
- **yarn**: `yarn dlx trigger.dev@latest switch [profile]`

## Behavior

When executed, the command switches to the specified profile. If no profile argument is provided, the CLI lists all available profiles and runs interactively, allowing you to select one.

## Arguments

**[profile]** (optional)
The target profile to activate. Omitting this parameter triggers an interactive selection mode displaying all accessible profiles.
