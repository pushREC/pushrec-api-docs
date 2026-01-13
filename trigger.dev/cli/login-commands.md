---
source: https://trigger.dev/docs/cli-login-commands
scraped: 2026-01-13
---

# CLI Login Command - Trigger.dev

## Overview

The `login` command allows you to authenticate with Trigger.dev using the CLI.

## Basic Usage

```bash
npx trigger.dev@latest login
```

Alternative package managers:

```bash
pnpm dlx trigger.dev@latest login
```

```bash
yarn dlx trigger.dev@latest login
```

## Options

### Common Options

These options are available on most commands:

**--profile**
Specifies which login profile to use. Defaults to "default".

**--api-url | -a**
Overrides the default API URL (https://api.trigger.dev). Can also be set via the `TRIGGER_API_URL` environment variable.

**--log-level | -l**
Sets the CLI log level. Available options: `debug`, `info`, `log`, `warn`, `error`, `none`. Defaults to `log`. Note: This only affects CLI output, not task logging.

**--skip-telemetry**
Disables telemetry data collection. Can alternatively be set via the `TRIGGER_TELEMETRY_DISABLED` environment variable.

**--help | -h**
Displays help information for the command.

**--version | -v**
Shows the CLI version number.
