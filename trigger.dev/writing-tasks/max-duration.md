Set a maximum duration for a task to run.

Copy page

The `maxDuration` parameter sets a maximum compute time limit for tasks. When a task exceeds this duration, it will be automatically stopped. This helps prevent runaway tasks and manage compute resources effectively.
You must set a default maxDuration in your `trigger.config.ts` file, which will apply to all tasks unless overridden:
/config/trigger.config.ts

Copy

Ask AI

```
import { defineConfig } from "@trigger.dev/sdk";

export default defineConfig({
 project: "proj_gtcwttqhhtlasxgfuhxs",
 maxDuration: 60, // 60 seconds or 1 minute
});

```

The minimum maxDuration is 5 seconds. If you want to avoid timeouts, set this value to a very large number of seconds.

You can set the `maxDuration` for a run in the following ways:

- Across all your tasks in the [config](/docs/config/config-file#max-duration)

- On a specific task

- On a specific run when you [trigger a task](/docs/triggering#maxduration)

## 
[​
](#how-it-works)How it works

The `maxDuration` is set in seconds, and is compared to the CPU time elapsed since the start of a single execution (which we call [attempts](/docs/runs#attempts)) of the task. The CPU time is the time that the task has been actively running on the CPU, and does not include time spent waiting during the following:

- `wait.for` calls

- `triggerAndWait` calls

- `batchTriggerAndWait` calls

You can inspect the CPU time of a task inside the run function with our `usage` utility:

/trigger/max-duration.ts

Copy

Ask AI

```
import { task, usage } from "@trigger.dev/sdk";

export const maxDurationTask = task({
 id: "max-duration-task",
 maxDuration: 300, // 300 seconds or 5 minutes
 run: async (payload: any, { ctx }) => {
 let currentUsage = usage.getCurrent();

 currentUsage.attempt.durationMs; // The CPU time in milliseconds since the start of the run
 },
});

```

The above value will be compared to the `maxDuration` you set. If the task exceeds the `maxDuration`, it will be stopped with the following error:

## 
[​
](#configuring-for-a-task)Configuring for a task

You can set a `maxDuration` on a specific task:

/trigger/max-duration-task.ts

Copy

Ask AI

```
import { task } from "@trigger.dev/sdk";

export const maxDurationTask = task({
 id: "max-duration-task",
 maxDuration: 300, // 300 seconds or 5 minutes
 run: async (payload: any, { ctx }) => {
 //...
 },
});

```

This will override the default `maxDuration` set in the config file. If you have a config file with a default `maxDuration` of 60 seconds, and you set a `maxDuration` of 300 seconds on a task, the task will run for 300 seconds.
You can “turn off” the Max duration set in your config file for a specific task like so:

/trigger/max-duration-task.ts

Copy

Ask AI

```
import { task, timeout } from "@trigger.dev/sdk";

export const maxDurationTask = task({
 id: "max-duration-task",
 maxDuration: timeout.None, // No max duration
 run: async (payload: any, { ctx }) => {
 //...
 },
});

```

## 
[​
](#configuring-for-a-run)Configuring for a run

You can set a `maxDuration` on a specific run when you trigger a task:

/trigger/max-duration.ts

Copy

Ask AI

```
import { maxDurationTask } from "./trigger/max-duration-task";

// Trigger the task with a maxDuration of 300 seconds
const run = await maxDurationTask.trigger(
 { foo: "bar" },
 {
 maxDuration: 300, // 300 seconds or 5 minutes
 }
);

```

You can also set the `maxDuration` to `timeout.None` to turn off the max duration for a specific run:

/trigger/max-duration.ts

Copy

Ask AI

```
import { maxDurationTask } from "./trigger/max-duration-task";
import { timeout } from "@trigger.dev/sdk";

// Trigger the task with no maxDuration
const run = await maxDurationTask.trigger(
 { foo: "bar" },
 {
 maxDuration: timeout.None, // No max duration
 }
);

```

## 
[​
](#maxduration-in-run-context)maxDuration in run context

You can access the `maxDuration` set for a run in the run context:

/trigger/max-duration-task.ts

Copy

Ask AI

```
import { task } from "@trigger.dev/sdk";

export const maxDurationTask = task({
 id: "max-duration-task",
 maxDuration: 300, // 300 seconds or 5 minutes
 run: async (payload: any, { ctx }) => {
 console.log(ctx.run.maxDuration); // 300
 },
});

```

## 
[​
](#maxduration-and-lifecycle-functions)maxDuration and lifecycle functions

When a task run exceeds the `maxDuration`, the lifecycle functions `cleanup`, `onSuccess`, and `onFailure` will not be called.
Was this page helpful?

YesNo

[Suggest edits](https://github.com/triggerdotdev/trigger.dev/edit/main/docs/runs/max-duration.mdx)[Raise issue](https://github.com/triggerdotdev/trigger.dev/issues/new?title=Issue on docs&body=Path: /runs/max-duration)

[Previous](/docs/idempotency)[TagsTags allow you to easily filter runs in the dashboard and when using the SDK.

Next
](/docs/tags)
⌘I

On this page
- [How it works](#how-it-works)
- [Configuring for a task](#configuring-for-a-task)
- [Configuring for a run](#configuring-for-a-run)
- [maxDuration in run context](#maxduration-in-run-context)
- [maxDuration and lifecycle functions](#maxduration-and-lifecycle-functions)

[Trigger.dev home page](https://trigger.dev)[x](https://twitter.com/triggerdotdev)[github](https://github.com/triggerdotdev)[linkedin](https://www.linkedin.com/company/triggerdotdev)

Developers
[Changelog](https://trigger.dev/changelog)[Contributing](https://github.com/triggerdotdev/trigger.dev/blob/main/CONTRIBUTING.md)[Open source](https://github.com/triggerdotdev/trigger.dev?tab=Apache-2.0-1-ov-file#readme)[GitHub](https://github.com/triggerdotdev/trigger.dev)[OSS Friends](https://trigger.dev/oss-friends)

Product
[Pricing](https://trigger.dev/pricing)[How it works](https://trigger.dev/#how-it-works)[Features](https://trigger.dev/product)[Roadmap](https://feedback.trigger.dev/roadmap)[FAQs](https://trigger.dev/pricing#faqs)[Uptime status](https://status.trigger.dev/)

Company
[Blog](https://trigger.dev/blog)[Contact](https://trigger.dev/contact)[Careers](https://trigger.dev/jobs)[Privacy](https://trigger.dev/legal/privacy)[Terms of service](https://trigger.dev/legal)

[x](https://twitter.com/triggerdotdev)[github](https://github.com/triggerdotdev)[linkedin](https://www.linkedin.com/company/triggerdotdev)

[Powered by](https://www.mintlify.com?utm_campaign=poweredBy&utm_medium=referral&utm_source=trigger)