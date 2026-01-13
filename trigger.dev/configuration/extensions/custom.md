# Custom Build Extensions Documentation

## Overview
Custom build extensions allow developers to hook into Trigger.dev's build system and customize how projects are built and deployed. They enable modifications to the bundle and container image during the build process.

## Key Capabilities
Build extensions support:
- Adding files to the build
- Managing external dependencies
- Integrating esbuild plugins
- Adding npm dependencies
- Installing system packages in the build container
- Running build container commands
- Setting environment variables
- Syncing variables to Trigger.dev projects

## Basic Structure
Extensions are configured in `trigger.config.ts` with a required `name` property and optional hook functions. The simplest form logs a message during build initialization.

## Creating Extensions

### Inline Definition
Extensions can be defined directly in the config file with a name and async hook functions like `onBuildStart`.

### Extracted Function Pattern
For better organization, extract extensions into separate functions. This requires importing `BuildExtension` from `"@trigger.dev/build"` (matching the `@trigger.dev/sdk` version).

## Build Hooks

**externalsForTarget**: Adds dependencies to the externals list for runtime availability without bundling.

**onBuildStart**: Executes before build begins; receives `BuildContext`. This is where esbuild plugins must be registered via `context.registerPlugin()`.

**onBuildComplete**: Runs after build finishes with both `BuildContext` and `BuildManifest`. Use `context.addLayer()` to add build layers.

## BuildContext Properties
- `target`: Either "dev" or "deploy"
- `config`: Project configuration object
- `resolvePath()`: Resolves paths relative to project directory
- `registerPlugin()`: Registers esbuild plugins
- `addLayer()`: Adds build layers with dependencies and commands

## BuildLayer Structure
Includes:
- `id`: Unique identifier
- `commands`: Array of build container commands
- `image.pkgs`: System packages to install
- `image.instructions`: Dockerfile instructions
- `build.env`: Build-stage environment variables
- `deploy.env`: Runtime environment variables for Trigger.dev
- `dependencies`: npm packages as key-value pairs

## Conditional Logic
Use `context.target` to differentiate behavior between development and production builds, enabling target-specific configurations.

## Debugging
Enable debug logging with `--log-level debug` flag. The `--dry-run` flag on deploy generates the Containerfile without actual deployment, useful for troubleshooting the build output.

## Environment Variables
Build-stage variables are only available during container construction. Deploy-stage variables sync to Trigger.dev for task runtime access.

---
Source: https://trigger.dev/docs/config/extensions/custom
