# Deployment Documentation for Trigger.dev

## Overview
The documentation covers deploying tasks to Trigger.dev production environments through the CLI deploy command.

## Key Deployment Steps

**Initial Setup:**
- Log in via CLI: `npx trigger.dev login`
- Deploy tasks: `npx trigger.dev deploy`
- Deployment creates snapshots of tasks, protecting against code changes affecting running instances

**Production Triggering:**
Users set the `TRIGGER_SECRET_KEY` environment variable to the production API key, enabling task execution against deployed versions.

## Versioning System

**Current Version Behavior:**
Each deployment automatically increments version numbers and promotes them to "current" status. "A single environment can only have a single current version at a time." The current version determines which code executes for new task runs.

**Version Locking:**
- Optional `version` parameter targets specific deployments
- `TRIGGER_VERSION` environment variable sets global version preference
- Child tasks using `triggerAndWait()` automatically lock to parent versions

**Promotion Control:**
The `--skip-promotion` flag allows testing without affecting live runs, with manual promotion via CLI or dashboard afterward.

## Environment Options

**Staging Deployments:**
Use `--env staging` to create isolated environments. Currently supports two environments (prod and staging); multiple environments are planned.

**Local Builds:**
The `--force-local-build` flag enables local compilation, requiring Docker and Docker Buildx installation. This provides fallback when remote builders experience issues.

## Environment Variables & Troubleshooting

Configure variables through the dashboard or build extensions (syncEnvVars, syncVercelEnvVars).

**Diagnostic Tools:**
- `--dry-run` shows build contents without deploying
- `--log-level debug` provides detailed deployment information

**Common Issues:**
- Native `.node` files require adding packages to `build.external` configuration
- Node.js v22 corepack compatibility issues resolve through downgrading or updating corepack globally
