---
source: https://trigger.dev/docs/quick-start
scraped: 2026-01-13
---

# Quick Start - Trigger.dev

## Overview

This guide walks through getting started with Trigger.dev in three minutes using the CLI and SDK. The process involves creating a configuration file, setting up an example task, running it locally, and viewing execution logs.

## Steps to Get Started

### 1. Create a Trigger.dev Account

Choose between:
- Using the [Trigger.dev Cloud](https://cloud.trigger.dev)
- Self-hosting the service

### 2. Create Your First Project

After account creation, complete these steps in the application:
1. Fill in account details
2. Create your first Organization and Project

### 3. Run the CLI Init Command

Execute the initialization command in your project root:

```bash
# npm
npx trigger.dev@latest init

# pnpm
pnpm dlx trigger.dev@latest init

# yarn
yarn dlx trigger.dev@latest init
```

This command will:
- Authenticate you with the CLI
- Create a `trigger.config.ts` file in the project root
- Prompt for `/trigger` directory location
- Generate `/trigger/example.[ts/js]` with sample code

When prompted, select the "Hello World" example task for testing.

### 4. Run the CLI Dev Command

Start the local development server:

```bash
# npm
npx trigger.dev@latest dev

# pnpm
pnpm dlx trigger.dev@latest dev

# yarn
yarn dlx trigger.dev@latest dev
```

This server watches the `/trigger` directory, registers tasks with the platform, manages executions, and handles data synchronization. The CLI can also update `@trigger.dev/*` packages to prevent version conflicts (with your consent).

### 5. Test via Dashboard

Access the Test page from the URLs provided by the dev command. You should see:
- The Example task in the task list
- A JSON payload editor (not needed for this example)
- Configuration options and run templates
- A "Run test" button to execute the task

### 6. View Your Run

After clicking "Run test," you'll see the run page with live-updating status information. The terminal will also display task status and links to the run log.

## Next Steps

- **Triggering Tasks**: Learn how to trigger tasks from your application code
- **Writing Tasks**: Understand task fundamentals and best practices
