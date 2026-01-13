# Remix Setup Guide - Trigger.dev Documentation

## Overview
This guide demonstrates how to integrate Trigger.dev into an existing Remix project, test tasks, and monitor execution through the dashboard.

## Prerequisites
- Existing Remix project with TypeScript installed
- Active Trigger.dev account and project created

## Initial Setup

### Step 1: Run CLI Init Command
Execute the initialization command in your project root:

```bash
npx trigger.dev@latest init
```

This performs several actions:
- Authenticates with the CLI if needed
- Creates `trigger.config.ts` file
- Prompts for `/trigger` directory location
- Generates example task file (`/trigger/example.[ts/js]`)

Install the "Hello World" example task when prompted for testing.

### Step 2: Run Dev Command
Start the development server:

```bash
npx trigger.dev@latest dev
```

This server watches the `/trigger` directory, registers tasks with Trigger.dev, and manages execution lifecycle.

### Step 3: Test Via Dashboard
Access the Test page from CLI output URLs. Select the Example task and execute without additional payload requirements. The dashboard displays live run status with real-time updates.

### Step 4: View Run Details
Completed runs display on the run page with live reload capability, showing execution progress and logs.

## Environment Configuration

### Local Secret Key Setup
Set `TRIGGER_SECRET_KEY` in your `.env` file using the DEV secret from the API Keys dashboard page. This enables task triggering from your Remix application.

## Task Triggering in Remix

### Create API Route
Add file `app/routes/api.hello-world.ts`:

```typescript
import type { helloWorldTask } from "../../src/trigger/example";
import { tasks } from "@trigger.dev/sdk";

export async function loader() {
  const handle = await tasks.trigger<typeof helloWorldTask>(
    "hello-world",
    "James"
  );

  return new Response(JSON.stringify(handle), {
    headers: { "Content-Type": "application/json" },
  });
}
```

Run your Remix app (`npm run dev`) alongside the Trigger.dev dev server. Visit `http://localhost:3000/api/trigger` to execute the task.

## Environment Variables

Add variables in the dashboard's "Environment Variables" section for local dev, staging, and production environments, or configure programmatically via code.

## Deployment

### Manual Deploy
```bash
npx trigger.dev@latest deploy
```

### Alternative Deployment Methods
- **GitHub Actions**: Automatically deploy on code changes
- **Vercel Integration**: In-progress official integration

## Vercel Edge Functions Deployment

### Configuration Steps

1. **Update API Route** - Add edge runtime:
```typescript
export const config = {
  runtime: "edge",
};

export async function action({ request }: { request: Request }) {
  const payload = await request.json();
  const handle = await tasks.trigger<typeof helloWorldTask>(
    "hello-world",
    payload
  );
  return new Response(JSON.stringify(handle), {
    headers: { "Content-Type": "application/json" },
  });
}
```

2. **Create/Update vercel.json**:
```json
{
  "buildCommand": "npm run vercel-build",
  "devCommand": "npm run dev",
  "framework": "remix",
  "installCommand": "npm install",
  "outputDirectory": "build/client"
}
```

3. **Update package.json Scripts**:
```json
{
  "scripts": {
    "build": "remix vite:build",
    "dev": "remix vite:dev",
    "start": "remix-serve ./build/server/index.js",
    "typecheck": "tsc",
    "vercel-build": "remix vite:build && cp -r ./public ./build/client"
  }
}
```

4. **Deploy to Vercel** - Push code and configure project
5. **Add Environment Variables** - Set `TRIGGER_SECRET_KEY` in Vercel settings
6. **Test Production** - Use curl to verify deployment:
```bash
curl -X POST https://your-app.vercel.app/api/hello-world \
  -H "Content-Type: application/json" \
  -d '{"name": "James"}'
```

## Key Notes

- Type-only imports ensure edge runtime compatibility
- `@trigger.dev/sdk` supports edge environments natively
- The `vercel-build` script copies static assets properly
- Edge runtime configuration improves performance on Vercel's network

## Additional Resources
- [Remix Webhooks Guide](/guides/frameworks/remix-webhooks)
- [Tasks Overview](/docs/tasks/overview)
- [Writing Tasks](/docs/writing-tasks-introduction)
- [CLI Deploy Command](/docs/cli-deploy)
- [GitHub Actions Deployment](/docs/github-actions)
