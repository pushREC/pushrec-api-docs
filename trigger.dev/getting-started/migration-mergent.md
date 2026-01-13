---
source: https://trigger.dev/docs/migration-mergent
scraped: 2026-01-13
---

# Migrating from Mergent to Trigger.dev

## Overview

Mergent is being absorbed into Resend, making this an ideal time to transition your background jobs and scheduled tasks to Trigger.dev, described as "a modern, developer-friendly platform for background jobs, workflows, and scheduling."

## Why Choose Trigger.dev

- **Long-running, reliable tasks** – Write standard async code without learning unfamiliar syntax
- **Automatic retries, concurrency, and scheduling** – Configure via your `trigger.config.ts` file
- **Local dev matching production** – Debug jobs locally with dashboard visibility
- **Scalability** – Deploy to Trigger.dev Cloud with zero infrastructure management or self-host

## Migration Steps

### Step 1: Set up Trigger.dev

1. Create an account at [Trigger.dev Cloud](https://cloud.trigger.dev)
2. Create an organization and project
3. Install the CLI and run the local dev server:

```shellscript
npx trigger.dev@latest init
npx trigger.dev@latest dev
```

You'll get a local server behaving like production with dashboard visibility.

### Step 2: Convert Your Mergent Tasks

#### Basic Mergent Task Example

```typescript
export async function processVideoTask(req: { body: { videoUrl: string } }) {
  const { videoUrl } = req.body;
  // Do some video processing
  const result = await processVideo(videoUrl);
  return { success: true, processedUrl: result.url };
}
```

This typically runs via Mergent's HTTP POST and dashboard registration.

#### Same Task in Trigger.dev

```typescript
import { task } from "@trigger.dev/sdk";

export const processVideoTask = task({
  id: "process-video",
  run: async (payload: { videoUrl: string }) => {
    const result = await processVideo(payload.videoUrl);
    return { success: true, processedUrl: result.url };
  },
});
```

**Key differences:**
- Tasks are functions deployed on managed workers, not HTTP handlers
- Typed payloads replace raw HTTP requests
- Built-in error handling eliminates manual retry/status management
- Export multiple tasks from one file

#### Scheduled Tasks

**Mergent approach** – Configure schedules in the dashboard to trigger HTTP endpoints:

```typescript
export async function dailyReportTask(req) {
  await sendDailyReport();
}
```

**Trigger.dev approach** – Define schedules in code:

```typescript
import { schedules } from "@trigger.dev/sdk";

export const dailyReportTask = schedules.task({
  id: "daily-report",
  cron: "0 0 * * *", // every day at midnight UTC
  run: async () => {
    await sendDailyReport();
  },
});
```

## Triggering Tasks

**Mergent** – Call the Mergent API with URL and payload:

```typescript
const Mergent = require("mergent");
const mergent = new Mergent("API_KEY");

mergent.tasks.create({
  request: {
    url: "https://your-app.com/api/processImage",
    body: JSON.stringify({ imageUrl: "...", filters: ["blur"] }),
    headers: { "Content-Type": "application/json" },
  },
  delay: { minutes: 5 },
});
```

**Trigger.dev** – Trigger directly from your codebase:

```typescript
import { processImageTask } from "@/trigger/processImage";

await processImageTask.trigger({
  imageUrl: "...",
  filters: ["blur"],
}, {
  delay: "5m",
});
```

Delay logic can also be handled inside tasks using `wait.for` or `wait.until`.

## Summary

- Mergent tasks use HTTP handlers; Trigger.dev deploys functions on managed workers
- Scheduling and retries are built-in and code-configured
- Tasks offer type safety and easier debugging
- No need to manage endpoints or HTTP manually

For advanced features like concurrency, retries, metadata, and task chaining, consult the [Trigger.dev documentation](https://trigger.dev/docs).
