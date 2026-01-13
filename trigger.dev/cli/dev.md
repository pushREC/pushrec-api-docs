---
source: https://trigger.dev/docs/cli-dev
scraped: 2026-01-13
---

# CLI dev command

The `trigger.dev dev` command is used to run your tasks locally.

## Overview

This runs a server on your machine that can execute Trigger.dev tasks:

### Installation

**npm**
```shellscript
npx trigger.dev@latest dev
```

**pnpm**
```shellscript
pnpm dlx trigger.dev@latest dev
```

**yarn**
```shellscript
yarn dlx trigger.dev@latest dev
```

## Key Features

The command performs an initial update check to prevent version mismatches, failed deploys, and other errors. Users are always prompted before proceeding.

The terminal displays confirmation that the server is running and listening for tasks. When a task executes, you'll see it in the terminal along with a dashboard link for viewing the run.

Each task runs in a separate Node process, meaning long-running tasks won't block other tasks from executing.

## Command Options

### Configuration

| Option | Flag | Description |
|--------|------|-------------|
| Config file | `--config` or `-c` | Name of the config file at project path; defaults to `trigger.config.ts` |
| Project ref | `--project-ref` or `-p` | Project ref; required if no config file exists |
| Env file | `--env-file` | Load environment variables from a file (hydrates CLI process only, not tasks) |
| Skip update check | `--skip-update-check` | Skip checking for package updates |
| Analyze build output | `--analyze` | Displays detailed import timings, useful for debugging run start times |

### Common Options

| Option | Flag | Description |
|--------|------|-------------|
| Login profile | `--profile` | Login profile to use; defaults to "default" |
| API URL | `--api-url` or `-a` | Overrides default API URL; defaults to `https://api.trigger.dev` |
| Log level | `--log-level` or `-l` | CLI log level: debug, info, log, warn, error, or none; defaults to log |
| Skip telemetry | `--skip-telemetry` | Opt-out of telemetry data collection |
| Help | `--help` or `-h` | Shows command help information |
| Version | `--version` or `-v` | Displays CLI version number |

## Concurrent Development

To run the dev server alongside your application framework:

Install the `concurrently` package:
```shellscript
npm install --save-dev concurrently
```

Add scripts to your `package.json`:
```json
{
  "scripts": {
    "dev": "concurrently --raw --kill-others npm:dev:*",
    "dev:trigger": "npx trigger.dev@latest dev",
    "dev:next": "next dev",
    "dev:remix": "remix dev"
  }
}
```

This allows the Trigger.dev dev server and your application server to run simultaneously in a single terminal window.
