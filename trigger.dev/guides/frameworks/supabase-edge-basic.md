# Triggering Tasks from Supabase Edge Functions - Documentation Summary

## Overview
This guide demonstrates how to set up Supabase edge functions to trigger Trigger.dev tasks. Edge functions can activate tasks either from third-party events (like Stripe payments) or Supabase database changes.

## Prerequisites
- Supabase CLI installed
- Docker Desktop (required since CLI v1.123.4 for deploying Edge Functions)
- TypeScript installed
- Active Trigger.dev account and project

## Initial Setup Process

The setup involves six key steps:

**Step 1-2: Project Initialization**
Create a Supabase project and add a `package.json` file (if using Deno). The package.json must include TypeScript as a dev dependency to enable Trigger.dev SDK functionality.

**Step 3: CLI Initialization**
Run `npx trigger.dev@latest init` to scaffold the project. This creates a trigger.config.ts file, establishes a `/trigger` directory, and provides an example task.

**Step 4-5: Local Development**
Execute `npx trigger.dev@latest dev` to start a local server. The CLI watches for changes in the `/trigger` directory and manages task registration. Test the setup using the dashboard's Test page without requiring any payload input.

## Edge Function Creation and Deployment

**Creating the Function:**
Use `supabase functions new edge-function-trigger` to generate a new edge function.

**Code Implementation:**
The edge function must:
- Import only the `type` from task definitions (critical distinction)
- Use `tasks.trigger<typeof helloWorldTask>("hello-world", "payload")` syntax
- Import Node-based tasks only as types; never add "npm:" prefix to imports within task files

**Deployment Command:**
Execute `supabase functions deploy edge-function-trigger --no-verify-jwt` to deploy.

The `--no-verify-jwt` flag removes JWT requirements for this hello-world example, though the documentation recommends consulting the "Supabase Authentication guide" for production configurations using JWT or service role keys.

## Configuration in Supabase Dashboard

Navigate to Project Settings → Edge Functions and add a new secret:
- **Key:** `TRIGGER_SECRET_KEY`
- **Value:** Your Trigger.dev prod secret key (obtained from cloud.trigger.dev API keys page)

## Task Deployment and Triggering

After deploying your task to Trigger.dev cloud using `npx trigger.dev@latest deploy`, access your edge function's URL through the Supabase dashboard. Opening this URL in a browser triggers the task. Successful execution displays "OK" on screen, with the task run visible in your Trigger.dev dashboard.

## Key Warnings and Notes

- Type-only imports are mandatory to prevent runtime errors in Deno environments
- Task files must remain in the `/trigger` folder (Node runtime requirement)
- Docker Desktop installation is essential for Edge Function deployment
- The guide provides links to advanced authentication documentation for production use cases
