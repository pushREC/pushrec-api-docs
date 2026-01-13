# How to Upgrade the Trigger.dev Packages

## Overview

Trigger.dev recommends upgrading packages when fixes and features are released to ensure optimal performance and access to the latest improvements.

## Update Command

Run the following in your project directory:

```shellscript
npx trigger.dev@latest update
```

This command automatically updates all Trigger.dev packages to their latest versions.

## Running the CLI Locally

When executing CLI commands locally, use the latest version:

```shellscript
npx trigger.dev@latest dev
npx trigger.dev@latest deploy
```

These commands also offer upgrade prompts if your version is outdated.

## GitHub Actions Deployment

When deploying through GitHub Actions:

1. **Locate workflow files** in `.github/workflows/` directory
2. **Update the version** in the run command (e.g., `npx trigger.dev@3.0.0 deploy`)

**Important:** Version mismatches cause deployment failures, so version updates are essential.

## Package.json Dev Dependency

Add Trigger.dev CLI as a dev dependency:

```json
{
  "devDependencies": {
    "trigger.dev": "3.0.0"
  }
}
```

Ensure this version matches your `@trigger.dev/sdk` package version.

With the package installed, run commands via:
- `npm exec trigger.dev`
- `pnpm exec trigger.dev`
- `yarn exec trigger.dev`

**Recommended approach:** Add scripts to your `package.json`:

```json
{
  "scripts": {
    "dev:trigger": "trigger dev",
    "deploy:trigger": "trigger deploy"
  }
}
```

Then execute with `npm run dev:trigger` or `npm run deploy:trigger`.
