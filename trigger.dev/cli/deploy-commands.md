---
source: https://trigger.dev/docs/cli-deploy-commands
scraped: 2026-01-13
---

# CLI Deploy Command Documentation

## Overview

The `deploy` command is used to deploy tasks to Trigger.dev. When executed, it performs several automated steps including package updates, code compilation, deployment, and task registration.

## Basic Usage

```bash
npx trigger.dev@latest deploy
```

Alternative package managers:
```bash
pnpm dlx trigger.dev@latest deploy
yarn dlx trigger.dev@latest deploy
```

## Deployment Process

The command executes four main steps:

1. Optionally updates packages when running locally
2. Compiles and bundles the code
3. Deploys code to the Trigger.dev instance
4. Registers tasks as a new version in the environment (prod by default)

## Important Note

The deployment will fail in CI environments if version mismatches are detected. It's recommended to test locally using the `dev` command before deployment and avoid bypassing version checks.

## Arguments

### Project Path `[path]`

Specifies the project directory. Defaults to the current directory if not provided.

## Options

### Config File `--config | -c`

Specifies the config file name. Defaults to `trigger.config.ts`.

### Project Reference `--project-ref | -p`

The project reference. Required only when no config file exists.

### Environment File `--env-file`

Loads environment variables from a specified file. Note that this only affects the CLI process environment, not the deployed tasks.

### Skip Update Check `--skip-update-check`

Skips checking for package updates to `@trigger.dev`.

### Environment `--env | -e`

Defaults to `prod`. Options include `staging` or `preview`. Using `preview` automatically detects the branch name from git.

### Preview Branch `--branch | -b`

Manually specifies the branch when using `--env preview`. Examples: `--branch my-branch` or `-b my-branch`.

### Dry Run `--dry-run`

Creates a deployable build without deploying. Prints the build path for inspection.

### Skip Promotion `--skip-promotion`

Prevents automatically promoting the newly deployed version to "current" status.

### Skip Environment Variable Syncing `--skip-sync-env-vars`

Disables syncing environment variables with the Trigger.dev instance.

### Local Build `--local-build`

Forces building the deployment image locally using Docker. This is automatic when self-hosting.

## Common Options

### Login Profile `--profile`

Selects which login profile to use. Defaults to "default".

### API URL `--api-url | -a`

Overrides the default API URL (`https://api.trigger.dev`). Can also be set via the `TRIGGER_API_URL` environment variable.

### Log Level `--log-level | -l`

Sets CLI verbosity. Options: `debug`, `info`, `log`, `warn`, `error`, `none`. Defaults to `log`. Does not affect task logging.

### Skip Telemetry `--skip-telemetry`

Opts out of telemetry data transmission. Can also be set via the `TRIGGER_TELEMETRY_DISABLED` environment variable.

### Help `--help | -h`

Displays help information for the command.

### Version `--version | -v`

Shows the CLI version number.

## CI/CD Deployment

For non-interactive authentication in CI environments (GitHub Actions, GitLab CI, Jenkins), set the `TRIGGER_ACCESS_TOKEN` environment variable. See the CI/GitHub Actions guide for detailed instructions.

## Self-Hosted Deployment

When self-hosting, builds occur locally by default. After logging into your self-hosted instance via CLI:

```bash
npx trigger.dev@latest deploy
```

For CI/CD with self-hosting, set both `TRIGGER_ACCESS_TOKEN` and `TRIGGER_API_URL` environment variables. Refer to the GitHub Actions documentation for additional details.
