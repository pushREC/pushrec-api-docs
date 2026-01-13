# Sync env vars - Trigger.dev Documentation

## Overview

The `syncEnvVars` build extension automatically synchronizes environment variables from external services into Trigger.dev prior to deployment. This proves particularly useful when leveraging secret management platforms like Infisical or AWS Secrets Manager.

## Core Functionality

The extension accepts an asynchronous callback function that returns environment variables to be synchronized. The callback receives a context object containing:

- **environment**: The deployment target (e.g., production, staging)
- **projectRef**: Your Trigger.dev project identifier
- **env**: Currently configured environment variables in Trigger.dev

## Basic Implementation

```typescript
import { defineConfig } from "@trigger.dev/sdk";
import { syncEnvVars } from "@trigger.dev/build/extensions/core";

export default defineConfig({
  build: {
    extensions: [
      syncEnvVars(async (ctx) => {
        return [
          { name: "SECRET_KEY", value: "secret-value" },
          { name: "ANOTHER_SECRET", value: "another-secret-value" },
        ];
      }),
    ],
  },
});
```

## Infisical Integration Example

The documentation provides a comprehensive example using Infisical SDK for retrieving secrets:

```typescript
import { defineConfig } from "@trigger.dev/sdk";
import { syncEnvVars } from "@trigger.dev/build/extensions/core";
import { InfisicalSDK } from "@infisical/sdk";

export default defineConfig({
  build: {
    extensions: [
      syncEnvVars(async (ctx) => {
        const client = new InfisicalSDK();

        await client.auth().universalAuth.login({
          clientId: process.env.INFISICAL_CLIENT_ID!,
          clientSecret: process.env.INFISICAL_CLIENT_SECRET!,
        });

        const { secrets } = await client.secrets().listSecrets({
          environment: ctx.environment,
          projectId: process.env.INFISICAL_PROJECT_ID!,
        });

        return secrets.map((secret) => ({
          name: secret.secretKey,
          value: secret.secretValue,
        }));
      }),
    ],
  },
});
```

## syncVercelEnvVars

Syncs environment variables from Vercel projects to Trigger.dev.

**Authentication Requirements:**
- Set `VERCEL_ACCESS_TOKEN` and `VERCEL_PROJECT_ID` as environment variables
- For team projects, also configure `VERCEL_TEAM_ID`
- Generate tokens via Vercel dashboard with appropriate project scope

**Vercel Build Environment Behavior:**
When executing within Vercel's build environment, values are read from `process.env` rather than the API, allowing integration-specific variables (such as Neon database credentials) to be utilized.

**Basic Usage:**
```typescript
export default defineConfig({
  project: "<project ref>",
  build: {
    extensions: [syncVercelEnvVars()],
  },
});
```

**With Arguments:**
```typescript
extensions: [
  syncVercelEnvVars({
    projectId: "your-vercel-project-id",
    vercelAccessToken: "your-vercel-access-token",
    vercelTeamId: "your-vercel-team-id",
  }),
];
```

## syncNeonEnvVars

Syncs environment variables from Neon database projects, automatically detecting branches and constructing appropriate connection strings.

**Authentication:**
- Configure `NEON_ACCESS_TOKEN` and `NEON_PROJECT_ID`
- Generate access tokens via Neon dashboard

**Vercel Integration Note:**
The extension skips execution in Vercel environments where Neon's integration handles synchronization automatically.

**Configuration Options:**
```typescript
syncNeonEnvVars({
  projectId: "your-neon-project-id",
  neonAccessToken: "your-neon-access-token",
  branch: "your-branch-name",
  databaseName: "your-database-name",
  roleName: "your-role-name",
  envVarPrefix: "MY_PREFIX_",
})
```

**Synced Variables:**
- `DATABASE_URL` (pooled connection)
- `DATABASE_URL_UNPOOLED` (direct connection)
- `POSTGRES_URL`, `POSTGRES_URL_NO_SSL`, `POSTGRES_URL_NON_POOLING`
- `POSTGRES_PRISMA_URL` (Prisma-optimized)
- `POSTGRES_HOST`, `POSTGRES_USER`, `POSTGRES_PASSWORD`, `POSTGRES_DATABASE`
- `PGHOST`, `PGHOST_UNPOOLED`, `PGUSER`, `PGPASSWORD`, `PGDATABASE`

**Important Note:** This extension skips execution for production environments, targeting preview/staging deployments exclusively.

---
Source: https://trigger.dev/docs/config/extensions/syncEnvVars
