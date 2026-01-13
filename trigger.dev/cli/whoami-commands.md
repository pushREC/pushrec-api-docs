---
source: https://trigger.dev/docs/cli-whoami-commands
scraped: 2026-01-13
---

# CLI whoami Command

## Overview

The `whoami` command displays information about the currently logged-in user and project details in Trigger.dev.

## Usage

Run the command with one of these package managers:

**npm**
```bash
npx trigger.dev@latest whoami
```

**pnpm**
```bash
pnpm dlx trigger.dev@latest whoami
```

**yarn**
```bash
yarn dlx trigger.dev@latest whoami
```

## Options

### Common Options

The following options are available on most Trigger.dev CLI commands:

#### Login Profile
`--profile`

Specifies which login profile to use. Defaults to "default".

#### API URL
`--api-url | -a`

Overrides the default API endpoint. If not specified, uses `https://api.trigger.dev`. Can also be configured via the `TRIGGER_API_URL` environment variable.

#### Log Level
`--log-level | -l`

Sets the CLI verbosity. Valid options: `debug`, `info`, `log`, `warn`, `error`, `none`. This setting does not affect task logging. Defaults to `log`.

#### Skip Telemetry
`--skip-telemetry`

Opts out of anonymous telemetry collection. Can alternatively be set via the `TRIGGER_TELEMETRY_DISABLED` environment variable (set to any non-empty value).

#### Help
`--help | -h`

Displays help information for the command.

#### Version
`--version | -v`

Shows the CLI version number.
