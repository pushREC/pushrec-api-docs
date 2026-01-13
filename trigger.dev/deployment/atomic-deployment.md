# Atomic Deploys - Trigger.dev Documentation

## Overview

Atomic deploys enable synchronization between application deployments and task versions. This ensures your app always uses compatible task versions, preventing version mismatches.

## How It Works

The process involves three steps:

1. **Deploy Tasks Without Promotion**: Use `npx trigger.dev deploy --skip-promotion` to create a new task version without setting it as default

2. **Capture Version**: The CLI outputs the deployment version for use in the next step

3. **Deploy Application**: Set an environment variable (e.g., `TRIGGER_VERSION`) to the captured version when deploying your app

## Two Implementation Approaches

### Option 1: Vercel CLI with GitHub Actions

This workflow deploys tasks, then deploys the application with the version as an environment variable, finally promoting the task version:

- Deploy Trigger.dev tasks with `--skip-promotion`
- Capture the deployment version from step output
- Deploy to Vercel, passing `TRIGGER_VERSION` environment variable
- Promote the task version after Vercel deployment succeeds

**Required Secrets**: `TRIGGER_ACCESS_TOKEN`, `VERCEL_TOKEN`

### Option 2: Vercel GitHub Integration

For automatic Vercel deployments via GitHub:

1. Disable auto-promotion in Vercel project settings
2. Wait for Vercel deployment completion
3. Deploy tasks to Trigger.dev
4. Manually promote the Vercel deployment

**Required Secrets**: `TRIGGER_ACCESS_TOKEN`, `VERCEL_TOKEN`, `VERCEL_PROJECT_ID`, `VERCEL_SCOPE_NAME`

## Key Benefit

"The @trigger.dev/sdk automatically uses the TRIGGER_VERSION environment variable to trigger the correct version" of your tasks, ensuring consistency across deployments.
