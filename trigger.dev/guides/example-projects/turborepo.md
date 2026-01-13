# Turborepo Monorepo with Prisma - Trigger.dev Documentation

## Overview

This guide presents two example projects demonstrating integration of Prisma and Trigger.dev within a Turborepo monorepo setup. Both examples feature a task triggered from a Next.js app using a server action that leverages Prisma to add users to a database table, differing primarily in installation and configuration approaches.

## Example 1: Trigger.dev and Prisma as Packages

### Key Features

- Built using Turborepo CLI following official Prisma and Turborepo documentation
- Uses pnpm as the package manager
- Tasks package (`@repo/tasks`) for creating and executing Trigger.dev tasks
- Database package (`@repo/db`) using Prisma ORM for database interactions
- Next.js example app (`apps/web`) demonstrating task triggering via server actions
- Supports popular Postgres databases including Supabase and Neon

### Project Structure

**apps/web/** - Next.js frontend with server actions for task triggering
**packages/database/** - Prisma ORM configuration and schema
**packages/tasks/** - Trigger.dev tasks package with configuration
**packages/ui/** - UI components

### Critical Configuration Details

The `trigger.config.ts` file must include the Prisma build extension with the specific version number being used. "You must include the version of Prisma you are using in the trigger.config.ts file, otherwise the Prisma build extension will not work."

### Important Setup Note

When initializing Trigger.dev in a blank packages folder, you must add a `package.json` file first to prevent initialization files from being added to the monorepo root.

### Repository Access

Complete code available at: https://github.com/triggerdotdev/examples/tree/main/monorepos/turborepo-prisma-tasks-package

## Example 2: Prisma Package with Trigger.dev in Next.js App

### Architecture

This approach separates concerns differently—Prisma remains as a package while Trigger.dev installs directly within the Next.js application. This configuration suits projects preferring centralized task management within the frontend application.

### Features

- Database package (`@repo/db`) with Prisma ORM
- Trigger.dev initialized directly in the Next.js app
- Tasks defined in `src/trigger/` directory
- Demonstrates server action-based task triggering

### Repository Access

Complete implementation: https://github.com/triggerdotdev/examples/tree/main/monorepos/turborepo-prisma-tasks-trigger

## Implementation Patterns

Both examples follow consistent patterns:

- **Task Triggering**: Button clicks in the Next.js interface trigger tasks via server actions
- **Database Operations**: Prisma handles all database interactions
- **File Organization**: Clear separation between database packages, task definitions, and application code
- **Dependencies**: Each workspace declares necessary dependencies through package.json files

## Getting Started

Refer to the README files in each GitHub repository for detailed setup and execution instructions specific to your chosen architecture.
