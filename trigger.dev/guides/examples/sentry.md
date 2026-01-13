# Track Errors with Sentry - Trigger.dev Documentation

## Overview

This guide demonstrates how to automatically send errors and source maps to your Sentry project from Trigger.dev tasks. Source maps enable detailed stack traces by mapping minified code back to original source.

## Prerequisites

- A Sentry account and project
- A Trigger.dev account and project

## Setup

The implementation requires two files:

### 1. Build Configuration (`trigger.config.ts`)

Configure the build to upload source maps to Sentry during deployment using the Sentry esbuild plugin:

```typescript
import { defineConfig } from "@trigger.dev/sdk";
import { esbuildPlugin } from "@trigger.dev/build/extensions";
import { sentryEsbuildPlugin } from "@sentry/esbuild-plugin";

export default defineConfig({
  project: "<project ref>",
  build: {
    extensions: [
      esbuildPlugin(
        sentryEsbuildPlugin({
          org: "<your-sentry-org>",
          project: "<your-sentry-project>",
          authToken: process.env.SENTRY_AUTH_TOKEN,
        }),
        { placement: "last", target: "deploy" }
      ),
    ],
  },
});
```

**Environment Variables Required:**
- `SENTRY_AUTH_TOKEN`: Found in Sentry settings → developer settings → auth tokens
- `SENTRY_DSN`: Located in Sentry settings → projects → your project → client keys

### 2. Runtime Initialization (`trigger/init.ts`)

Initialize Sentry and register the global failure hook:

```typescript
import { tasks } from "@trigger.dev/sdk";
import * as Sentry from "@sentry/node";

Sentry.init({
  defaultIntegrations: false,
  dsn: process.env.SENTRY_DSN,
  environment: process.env.NODE_ENV === "production" ? "production" : "development",
});

tasks.onFailure(({ payload, error, ctx }) => {
  Sentry.captureException(error, {
    extra: {
      payload,
      ctx,
    },
  });
});
```

## Testing

Create a test task that deliberately fails:

```typescript
import { task } from "@trigger.dev/sdk";

export const sentryErrorTest = task({
  id: "sentry-error-test",
  retry: {
    maxAttempts: 1,
  },
  run: async () => {
    const error = new Error("This is a custom error that Sentry will capture");
    error.cause = { additionalContext: "This is additional context" };
    throw error;
  },
});
```

**To test:**
1. Deploy: `npx trigger.dev@latest deploy`
2. Navigate to dashboard's test page
3. Select `prod` environment and `sentryErrorTest` task
4. Click "Run test"
5. Errors should appear in your Sentry dashboard shortly after
