# Node.js Setup Guide - Trigger.dev

## Overview
This guide demonstrates how to integrate Trigger.dev into an existing Node.js project, test example tasks, and monitor runs through the dashboard.

## Prerequisites
- Active Node.js project setup
- TypeScript installed in your environment
- "Valid Trigger.dev account created"
- New Trigger.dev project initialized

## Initial Setup Process

### Step 1: CLI Initialization
Run the initialization command in your project root:

```bash
# npm
npx trigger.dev@latest init

# pnpm
pnpm dlx trigger.dev@latest init

# yarn
yarn dlx trigger.dev@latest init
```

This command performs several operations:
- Authenticates your CLI session if needed
- Creates a `trigger.config.ts` configuration file at the project root
- Prompts you to specify the `/trigger` directory location
- Generates the `/trigger` directory with sample task files (`/trigger/example.[ts/js]`)

When prompted, select the "Hello World" example task for testing purposes.

### Step 2: Development Server
Execute the development command:

```bash
# npm
npx trigger.dev@latest dev

# pnpm
pnpm dlx trigger.dev@latest dev

# yarn
yarn dlx trigger.dev@latest dev
```

This server:
- Monitors `/trigger` directory for file changes
- Manages task registration with Trigger.dev platform
- Handles bidirectional communication for run execution
- Automatically updates `@trigger.dev/*` packages (with prior confirmation)

### Step 3: Dashboard Testing
Access the Test page via URLs provided by the dev command:

- Locate your Example task in the task list
- Enter payload data in the JSON editor (optional for example task)
- Configure run options and create templates as needed
- Execute the run using the "Run test" button

### Step 4: Run Monitoring
View the completed run on the dedicated run page:

- Live-updating status display
- Real-time execution feedback
- Terminal output showing task status and run log links

## Recommended Next Steps

**[Tasks Overview]** - "Learn what tasks are and their options"

**[Writing Tasks]** - "Learn how to write your own tasks"

**[CLI Deployment]** - "Learn how to deploy your task manually using the CLI"

**[GitHub Actions Deployment]** - "Learn how to deploy your task using GitHub actions"
