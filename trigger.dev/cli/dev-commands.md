---
source: https://trigger.dev/docs/cli-dev-commands
scraped: 2026-01-13
---

# CLI dev command

The `trigger.dev dev` command runs a local server to execute Trigger.dev tasks.

## Command Usage

```bash
npx trigger.dev@latest dev
```

Available through npm, pnpm, and yarn package managers.

## How It Works

The command initiates a server on your machine that:
- Listens for incoming task executions
- Performs an automatic update check (with user prompt)
- Displays terminal output with dashboard links for each run
- Executes each task in a separate Node process to prevent blocking

## Configuration Options

### Task Execution

| Option | Flag | Description |
|--------|------|-------------|
| Config file | `--config`, `-c` | Specifies config filename; defaults to `trigger.config.ts` |
| Project ref | `--project-ref`, `-p` | Required if no config file exists |
| Env file | `--env-file` | Loads environment variables for CLI process only |
| Skip updates | `--skip-update-check` | Bypasses `@trigger.dev` package version checks |
| Build analysis | `--analyze` | Shows import timing details for debugging startup performance |

### Common CLI Options

| Option | Flag | Description |
|--------|------|-------------|
| Login profile | `--profile` | Selects authentication profile; defaults to "default" |
| API URL | `--api-url`, `-a` | Overrides default endpoint (`https://api.trigger.dev`) |
| Log level | `--log-level`, `-l` | Sets verbosity: `debug`, `info`, `log`, `warn`, `error`, `none` |
| Skip telemetry | `--skip-telemetry` | Disables anonymous usage data collection |
| Help | `--help`, `-h` | Displays command reference |
| Version | `--version`, `-v` | Shows CLI version number |

## Running Concurrently

To run alongside your framework's development server, install the `concurrently` package:

```bash
npm install --save-dev concurrently
```

Add to `package.json`:

```json
{
  "scripts": {
    "dev": "concurrently --raw --kill-others npm:dev:*",
    "dev:trigger": "npx trigger.dev@latest dev"
  }
}
```

Replace framework-specific scripts (e.g., `dev:next`, `dev:remix`) as needed.
