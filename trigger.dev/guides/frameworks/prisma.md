# Prisma Setup Guide for Trigger.dev

## Overview
This guide demonstrates how to integrate Prisma ORM with Trigger.dev, including testing tasks and viewing runs on the dashboard.

## Prerequisites
- Node.js project with `package.json`
- TypeScript installed
- PostgreSQL database (local or accessible via connection string)
- Prisma ORM installed and initialized
- `DATABASE_URL` environment variable configured

## Initial Setup Steps

### 1. CLI Initialization
Run the Trigger.dev init command to scaffold your project:
```bash
npx trigger.dev@latest init
```

This creates a `trigger.config.ts` file, establishes a `/trigger` directory, and provides an example task.

### 2. Development Server
Start the local development server:
```bash
npx trigger.dev@latest dev
```

This watches for task changes and communicates with the Trigger.dev platform.

### 3. Dashboard Testing
Access the Test page from the CLI output to run your example task and observe the run page updating in real-time.

## Creating a Prisma Task

### Task Implementation
Create `/trigger/prisma-add-new-user.ts`:

```typescript
import { PrismaClient } from "@prisma/client";
import { task } from "@trigger.dev/sdk";

const prisma = new PrismaClient();

export const addNewUser = task({
  id: "prisma-add-new-user",
  run: async (payload: { name: string; email: string; id: number }) => {
    const { name, email, id } = payload;
    const user = await prisma.user.create({
      data: { name, email, id }
    });
    return { message: `New user added: ${user.id}` };
  }
});
```

**Requirement:** Your Prisma schema must include a `user` model with `id`, `name`, and `email` fields.

### Build Configuration
Configure `/trigger.config.js` to include Prisma in the build:

```javascript
export default defineConfig({
  project: "<project ref>",
  build: {
    extensions: [
      prismaExtension({
        mode: "legacy",
        version: "5.20.0",
        schema: "prisma/schema.prisma"
      })
    ]
  }
});
```

The `prismaExtension` requires a `mode` parameter—use `"legacy"` for standard setups.

### Optional: Prisma Instrumentation
For detailed query logging, add to `trigger.config.js`:

```javascript
import { PrismaInstrumentation } from "@prisma/instrumentation";

export default defineConfig({
  instrumentations: [new PrismaInstrumentation()]
});
```

## Deployment

### Deploy Your Task
```bash
npx trigger.dev@latest deploy
```

### Configure Environment Variables
In the Trigger.dev dashboard, navigate to Environment Variables and add your `DATABASE_URL` for production.

### Test the Deployed Task
Use the dashboard Test page with this JSON payload:
```json
{
  "name": "John Doe",
  "email": "john@example.com",
  "id": 12345
}
```

Upon successful execution, a new user record appears in your database.

## Next Steps
- Explore the [Tasks overview](/tasks/overview) documentation
- Review [Writing tasks](/writing-tasks-introduction) fundamentals
- Learn [CLI deployment](/cli-deploy) options
- Implement [GitHub Actions](/github-actions) for automated deployment
