# Drizzle Setup Guide - Trigger.dev

## Overview

This guide demonstrates how to integrate Drizzle ORM with Trigger.dev, including testing tasks locally and viewing runs through the dashboard.

## Prerequisites

- Existing Node.js project with `package.json`
- TypeScript installed
- PostgreSQL database (local or remote)
- Drizzle ORM installed and initialized
- `DATABASE_URL` environment variable configured

## Initial Setup (Optional)

### Step 1: Initialize Trigger.dev

Run the initialization command:
```bash
npx trigger.dev@latest init
```

This creates:
- `trigger.config.ts` configuration file
- `/trigger` directory
- Example task file (`/trigger/example.ts` or `.js`)

### Step 2: Start Development Server

```bash
npx trigger.dev@latest dev
```

This server watches for changes, registers tasks, and communicates with the Trigger.dev platform.

### Step 3: Test via Dashboard

Visit the Test page and select the example task. Run it to verify setup works properly.

## Creating a Production Task

### Task Implementation

Create `/trigger/drizzle-add-new-user.ts`:

```typescript
import { eq } from "drizzle-orm";
import { task } from "@trigger.dev/sdk";
import { users } from "src/db/schema";
import { drizzle } from "drizzle-orm/node-postgres";

const db = drizzle(process.env.DATABASE_URL!);

export const addNewUser = task({
  id: "drizzle-add-new-user",
  run: async (payload: typeof users.$inferInsert) => {
    const [user] = await db.insert(users).values(payload).returning();

    return {
      createdUser: user,
      message: "User created and updated successfully",
    };
  },
});
```

**Requirement:** Users table schema must include `name`, `age`, and `email` fields.

### Build Configuration

Update `trigger.config.js` to mark `pg` as external:

```javascript
import { defineConfig } from "@trigger.dev/sdk";

export default defineConfig({
  project: "<project ref>",
  build: {
    externals: ["pg"],
  },
});
```

The `pg` package is a PostgreSQL client for Node.js that shouldn't be bundled.

### Deployment

Deploy using:
```bash
npx trigger.dev@latest deploy
```

### Environment Variables

Add `DATABASE_URL` to Trigger.dev dashboard under Environment Variables for your production environment.

### Testing

Trigger the task via the dashboard with this payload structure:

```json
{
  "name": "<user-name>",
  "age": "<user-age>",
  "email": "<user-email>"
}
```

Example: `{"name": "John Doe", "age": 25, "email": "john@doe.test"}`

## Next Steps

- **Tasks Overview:** Understand task concepts and options
- **Writing Tasks:** Learn task development patterns
- **CLI Deploy:** Manual deployment instructions
- **GitHub Actions:** Automate deployments via CI/CD
