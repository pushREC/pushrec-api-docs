---
source: https://trigger.dev/docs/cli-promote-commands
scraped: 2026-01-13
---

# CLI Promote Command

## Overview

The `promote` command enables you to elevate a previously deployed version to become the current active version in your Trigger.dev environment.

## Basic Usage

```bash
npx trigger.dev@latest promote [version]
```

### Package Manager Variants

**pnpm:**
```bash
pnpm dlx trigger.dev@latest promote [version]
```

**yarn:**
```bash
yarn dlx trigger.dev@latest promote [version]
```

## Arguments

### Deployment Version `[version]`

Specifies which previously deployed iteration should be promoted to active status. This must reference a version that has already been deployed to your environment.

## Common Options

### Login Profile `--profile`

Designates which authentication profile to use. Falls back to "default" if not specified.

### API URL `--api-url | -a`

Overrides the default API endpoint. If omitted, defaults to `https://api.trigger.dev`. You can also configure this via the `TRIGGER_API_URL` environment variable.

### Log Level `--log-level | -l`

Controls CLI output verbosity. Valid options: `debug`, `info`, `log`, `warn`, `error`, `none`. Defaults to `log`. Note: this setting does not affect task-level logging.

### Skip Telemetry `--skip-telemetry`

Disables analytics data transmission. Configure via `TRIGGER_TELEMETRY_DISABLED` environment variable by setting it to any non-empty value.

### Help `--help | -h`

Displays command documentation and available options.

### Version `--version | -v`

Shows the installed CLI version number.
