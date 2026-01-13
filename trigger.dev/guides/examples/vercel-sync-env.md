# Syncing Environment Variables from Your Vercel Projects

## Overview

This guide demonstrates automating the synchronization of environment variables from Vercel projects to Trigger.dev using a build extension.

## Build Configuration

To sync environment variables, add the `syncVercelEnvVars` build extension to your `trigger.config.ts` file. This extension automatically runs during each Trigger.dev deployment.

### Required Setup

You need to configure three environment variables:

- **VERCEL_ACCESS_TOKEN**: A personal access token from your Vercel account settings (generate at https://vercel.com/account/tokens)
- **VERCEL_PROJECT_ID**: Found in Project Settings > General > Project ID
- **VERCEL_TEAM_ID**: Optional, required only for team projects (found in Team Settings)

### Important Implementation Detail

"When running the build from a Vercel build environment (e.g., during a Vercel deployment), the environment variable values will be read from `process.env` instead of fetching them from the Vercel API."

The API determines which environment variables are configured for your project, but actual values come from the local environment in Vercel deployments.

### Configuration Example

```typescript
import { defineConfig } from "@trigger.dev/sdk";
import { syncVercelEnvVars } from "@trigger.dev/build/extensions/core";

export default defineConfig({
  project: "<project ref>",
  build: {
    extensions: [
      syncVercelEnvVars({
        vercelAccessToken: process.env.VERCEL_ACCESS_TOKEN,
        projectId: process.env.VERCEL_PROJECT_ID,
        vercelTeamId: process.env.VERCEL_TEAM_ID,
      }),
    ],
  },
});
```

## Deployment

Execute the deploy command to initiate the sync:

```bash
npx trigger.dev@latest deploy
```

Console output will confirm successful synchronization, and variables become available in your Trigger.dev dashboard.

## Related Resources

- **Next.js setup guide**: Configure Trigger.dev with Next.js using pages or app router
- **Next.js webhooks guide**: Create webhook handlers and trigger tasks
- **Fal.ai with Realtime**: Generate images with progress updates
- **Vercel AI SDK**: Integrate OpenAI, Anthropic, and other AI providers
