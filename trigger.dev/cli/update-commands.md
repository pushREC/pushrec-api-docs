---
source: https://trigger.dev/docs/cli-update-commands
scraped: 2026-01-13
---

# CLI Update Command

## Overview

The `update` command allows you to update the Trigger.dev CLI to the latest version.

## Usage

Run the command using your preferred package manager:

```bash
npx trigger.dev@latest update
```

Or with pnpm:

```bash
pnpm dlx trigger.dev@latest update
```

Or with yarn:

```bash
yarn dlx trigger.dev@latest update
```

## Options

### Common Options

These options are available on most Trigger.dev CLI commands:

**Log Level** (`--log-level | -l`)
Sets the CLI's verbosity level. Choose from `debug`, `info`, `log`, `warn`, `error`, or `none`. This setting only affects CLI output, not task logging. Defaults to `log`.

**Skip Telemetry** (`--skip-telemetry`)
Disables telemetry data collection. You can also set the `TRIGGER_TELEMETRY_DISABLED` environment variable to any non-empty value to achieve the same result.

**Help** (`--help | -h`)
Displays help documentation for the command.

**Version** (`--version | -v`)
Shows the current CLI version number.
