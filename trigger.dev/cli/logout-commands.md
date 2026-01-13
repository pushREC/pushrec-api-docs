---
source: https://trigger.dev/docs/cli-logout-commands
scraped: 2026-01-13
---

# CLI logout command - Trigger.dev

## Overview

The `logout` CLI command removes your authentication credentials from the Trigger.dev CLI, ending your current session.

## Usage

Run the command like this:

```bash
npx trigger.dev@latest logout
```

Or with your preferred package manager:

```bash
pnpm dlx trigger.dev@latest logout
```

```bash
yarn dlx trigger.dev@latest logout
```

## Options

### Common options

These options are available on most commands.

**Login profile** (`--profile`)
- Specifies which login profile to use. Defaults to "default".

**API URL** (`--api-url` | `-a`)
- Overrides the default API endpoint. If not provided, uses `https://api.trigger.dev`. Can also be set via the `TRIGGER_API_URL` environment variable.

**Log level** (`--log-level` | `-l`)
- Sets CLI verbosity. Available levels: `debug`, `info`, `log`, `warn`, `error`, `none`. Defaults to `log`. Note: this only affects CLI output, not task logging.

**Skip telemetry** (`--skip-telemetry`)
- Disables anonymous usage data collection. Can alternatively be configured through the `TRIGGER_TELEMETRY_DISABLED` environment variable by setting it to any non-empty value.

**Help** (`--help` | `-h`)
- Displays command help information.

**Version** (`--version` | `-v`)
- Shows the installed CLI version number.
