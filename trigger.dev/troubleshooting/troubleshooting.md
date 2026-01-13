# Trigger.dev Common Problems Documentation

## Overview
This page addresses common issues developers encounter when using Trigger.dev, organized by category: Development, Deployment, Project Setup, Runtime, and Framework-specific problems.

## Development Issues

**NPM Permission Errors (`EACCES: permission denied`)**
When npm cache encounters permission issues, clear the cache with `npm cache clean --force`, then adjust folder permissions using `sudo chown -R $(whoami) ~/.npm` if needed.

**Build Cache Problems**
Stop your local dev server, locate the hidden `.trigger` folder in your project directory, delete it, then restart the server.

**Yarn Plug'n'Play Conflicts**
If you see import resolution errors mentioning Yarn's manifest, check for a `.pnp.cjs` file in your home directory—a remnant from global Yarn PnP configuration. Removing it resolves the issue.

## Deployment Issues

**Build Failures**
Deploy commands include troubleshooting options: use `--log-level debug` for detailed output and `--dry-run` to build without deploying. Build logs help identify the root cause.

**Docker Configuration After Uninstalling Docker Desktop**
The system leaves behind `~/.docker/config.json` pointing to missing credential stores. Remove or update this file to fix credential errors.

**Native Module Loading (`No loader is configured for ".node" files`)**
Add problematic packages to `build.external` in `trigger.config.ts`. This prevents bundling native code that can't be processed by the build system.

**Package-Specific Build Conflicts**
Libraries like pino and @react-email packages have bundling incompatibilities. Add them to the `external` array in your build configuration.

**Corepack Compatibility (Node.js v22)**
Corepack isn't yet compatible with latest package manager signatures. Either downgrade to Node.js v20 LTS or install `corepack@latest` globally.

## Project Setup Requirements

**Supported Node.js Versions**
Minimum versions: v18.20+, v20.5+, v21.0+, v22.0+. Older versions lack required exports like `addAbortListener`.

## Runtime Issues

**Missing Environment Variables**
Tasks run separately from main applications. Set environment variables in the Trigger.dev dashboard, not just in your app's configuration.

**Prisma Client Initialization**
Prisma requires code generation before tasks run. Use the `prismaExtension` build extension to handle this automatically.

**Parallel Wait Functions Unsupported**
Functions like `wait.for()`, `wait.until()`, and `triggerAndWait()` can't execute simultaneously. Use batch trigger functions instead for parallel task execution.

**Subtask Triggering Issues**
Always `await` calls to `trigger`, `triggerAndWait`, `batchTrigger`, and `batchTriggerAndWait`—otherwise the process may terminate before network calls complete.

**API Rate Limiting**
Avoid calling `trigger()` in loops; use `batchTrigger()` instead, which supports up to 1,000 tasks per call (500 in earlier versions).

**Crypto Not Defined**
Node.js v19.0.0+ includes Crypto support. Upgrade to v20 or v22, or replace plain-string idempotency keys with `idempotencyKeys.create()`.

**Task Run Stalled**
Means heartbeats weren't received within 5 minutes. Blocking operations (infinite loops, heavy CPU work) cause this. Use `heartbeats.yield()` periodically in loops, or increase machine size for CPU-intensive tasks.

## Framework-Specific Issues

**NestJS Exception Handling**
NestJS's global exception filter swallows errors, making them invisible to Trigger.dev. Avoid using NestJS inside tasks; use plain code instead.

**React Not Defined**
Either import React directly or set TypeScript's `jsx` compiler option to `"react-jsx"`.

**Next.js Build Failures in CI**
Add `export const dynamic = "force-dynamic"` to route files to prevent static generation attempts.

**React Event Handler Binding**
Wrap event handler calls in arrow functions: `onClick={() => myTask()}` rather than `onClick={myTask}` to maintain proper context.
