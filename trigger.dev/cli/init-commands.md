---
source: https://trigger.dev/docs/cli-init-commands
scraped: 2026-01-13
---

# CLI Init Command - Trigger.dev

## Overview

The `trigger.dev init` command initializes a new Trigger.dev project in your codebase. Execute it with:

```bash
npx trigger.dev@latest init
```

Alternatively, use your preferred package manager:

```bash
pnpm dlx trigger.dev@latest init
```

```bash
yarn dlx trigger.dev@latest init
```

## Options

### `--javascript`
By default, the initialization assumes TypeScript usage. Include this flag to set up a JavaScript-based project instead.

### `--project-ref` | `-p`
Specify the project reference to use during initialization.

### `--tag` | `-t`
Define which version of the `@trigger.dev/sdk` package to install. Defaults to the latest available release.

### `--skip-package-install`
Skip the automatic installation of the `@trigger.dev/sdk` package after project setup.

### `--override-config`
Replace any existing configuration file if one is already present.

### `--pkg-args`
Pass additional arguments to your package manager as comma-separated values for multiple arguments.

## Common Options

These flags work across most CLI commands:

### `--profile`
Select which login profile to use. Defaults to "default" if not specified.

### `--api-url` | `-a`
Override the default API endpoint. When not provided, uses `https://api.trigger.dev`. You can also set this via the `TRIGGER_API_URL` environment variable.

### `--log-level` | `-l`
Set the CLI logging verbosity. Available choices: `debug`, `info`, `log`, `warn`, `error`, and `none`. Note this only affects CLI output, not your task logging. Defaults to `log`.

### `--skip-telemetry`
Disable telemetry collection. Configure this through the `TRIGGER_TELEMETRY_DISABLED` environment variable by setting it to any non-empty value.

### `--help` | `-h`
Display command help documentation.

### `--version` | `-v`
Show the current CLI version number.
