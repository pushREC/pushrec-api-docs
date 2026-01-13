---
source: https://trigger.dev/docs/cli-list-profiles-commands
scraped: 2026-01-13
---

# CLI list-profiles Command Documentation

## Overview

The `list-profiles` command is part of the Trigger.dev CLI toolkit. It displays available profiles for your Trigger.dev configuration.

## Usage

Run the command using any of these package managers:

**npm:**
```shellscript
npx trigger.dev@latest list-profiles
```

**pnpm:**
```shellscript
pnpm dlx trigger.dev@latest list-profiles
```

**yarn:**
```shellscript
yarn dlx trigger.dev@latest list-profiles
```

## Available Options

### Common Options

These flags work across most CLI commands:

**Log Level** (`--log-level` or `-l`)
- Configures the CLI's verbosity level
- Available values: `debug`, `info`, `log`, `warn`, `error`, `none`
- Default: `log`
- Note: This setting only affects CLI output, not your task logging

**Skip Telemetry** (`--skip-telemetry`)
- Disables telemetry data collection for your CLI session
- Alternative: Set the `TRIGGER_TELEMETRY_DISABLED` environment variable to any non-empty value

**Help** (`--help` or `-h`)
- Displays command-specific help information

**Version** (`--version` or `-v`)
- Shows the installed CLI version number
