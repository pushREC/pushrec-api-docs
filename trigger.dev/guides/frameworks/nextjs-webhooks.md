# Triggering Tasks with Webhooks in Next.js - Trigger.dev Documentation

## Overview

This guide demonstrates how to create webhook handlers in Next.js applications to trigger Trigger.dev tasks. The implementation differs based on whether you're using the Pages Router or App Router architecture.

## Prerequisites

- A Next.js project configured with Trigger.dev
- cURL installed for testing webhook endpoints locally

## Implementation Approaches

### Pages Router Implementation

Create a file at `pages/api/webhook-handler.ts`:

```typescript
import { helloWorldTask } from "@/trigger/example";
import { tasks } from "@trigger.dev/sdk";
import type { NextApiRequest, NextApiResponse } from "next";

export default async function handler(req: NextApiRequest, res: NextApiResponse) {
  const payload = req.body;
  await tasks.trigger<typeof helloWorldTask>("hello-world", payload);
  res.status(200).json({ message: "OK" });
}
```

The handler extracts the request body and passes it to the task trigger mechanism.

### App Router Implementation

Create a file at `app/api/webhook-handler/route.ts`:

```typescript
import type { helloWorldTask } from "@/trigger/example";
import { tasks } from "@trigger.dev/sdk";
import { NextResponse } from "next/server";

export async function POST(req: Request) {
  const payload = await req.json();
  await tasks.trigger<typeof helloWorldTask>("hello-world", payload);
  return NextResponse.json("OK", { status: 200 });
}
```

This approach uses Next.js 13+ conventions with async route handlers.

## Local Testing Procedure

**Step 1: Start Services**
- Run `npm run dev` in one terminal for the Next.js application
- Execute `npx trigger.dev@latest dev` in another terminal for the Trigger.dev development server

**Step 2: Send Test Webhook**

Use cURL to POST sample data:

```bash
curl -X POST -H "Content-Type: application/json" \
  -d '{"Name": "John Doe", "Age": "87"}' \
  http://localhost:3000/api/webhook-handler
```

**Step 3: Verify Execution**

Check the dashboard at https://cloud.trigger.dev for successful task runs displaying your webhook payload.

## Key Differences Between Routers

The Pages Router uses `NextApiRequest` and `NextApiResponse` types, while the App Router employs the native `Request` and `NextResponse` objects from the Web API standard. Both achieve identical functionality through their respective architectural patterns.

## Related Resources

- Next.js setup guide for Trigger.dev
- Webhook overview documentation
- Additional example projects using Fal.ai and Vercel AI SDK
