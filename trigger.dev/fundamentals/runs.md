Understanding the lifecycle of task run execution in Trigger.dev

**
Copy page

In Trigger.dev, the concepts of runs and attempts are fundamental to understanding how tasks are executed and managed. This article explains these concepts in detail and provides insights into the various states a run can go through during its lifecycle.

## [​
](#what-are-runs)What are runs?

A run is created when you trigger a task (e.g. calling `yourTask.trigger({ foo: "bar" })`). It represents a single instance of a task being executed and contains the following key information:

- A unique run ID

- The current status of the run

- The payload (input data) for the task

- Lots of other metadata

## 
[​
](#the-run-lifecycle)The run lifecycle

A run can go through various** states during its lifecycle. The following diagram illustrates a typical state transition where a single run is triggered and completes successfully:

Runs can also find themselves in lots of other states depending on what’s happening at any given time. The following sections describe all the possible states in more detail.

### 
[​
](#initial-states)Initial states

 **Pending version**:
The task is waiting for a version update because it cannot execute without additional information (task, queue, etc.).
 **Delayed**: When a run is triggered
with a delay, it enters this state until the specified delay period has passed.
 **Queued**: The run is ready
to be executed and is waiting in the queue.
 **Dequeued**: The task has been dequeued and is being sent to a worker to start executing.

### 
[​
](#execution-states)Execution states

 **Executing**: The task is
currently being executed by a worker.
 **Waiting**: You have used a
[triggerAndWait()](/docs/triggering#yourtask-triggerandwait), [batchTriggerAndWait()](/docs/triggering#yourtask-batchtriggerandwait) or a [wait function](/docs/wait). When the wait is complete, the task will resume execution.

### 
[​
](#final-states)Final states

 **Completed**: The task has successfully
finished execution.
 **Canceled**: The run was manually canceled
by the user.
 **Failed**: The task has failed
to complete successfully due to an error in the task code.
 **Timed out**: Task has
failed because it exceeded its `maxDuration`.
 **Crashed**: The worker process crashed
during execution (likely due to an Out of Memory error) and won’t be retried.
 **System failure**: An unrecoverable system
error has occurred.
 **Expired**: The run’s [Time-to-Live](#time-to-live-ttl)
(TTL) has passed before it could start executing.

## 
[​
](#attempts)Attempts

An attempt represents a single execution of a task within a run. A run can have one or more attempts, depending on the task’s retry settings and whether it fails. Each attempt has:

- A unique attempt ID

- A status

- An output (if successful) or an error (if failed)

When a task fails, it will be retried according to its retry settings, creating new attempts until it either succeeds or reaches the retry limit.

## 
[​
](#run-completion)Run completion

A run is considered finished when:

- The last attempt succeeds, or

- The task has reached its retry limit and all attempts have failed

At this point, the run will have either an output (if successful) or an error (if failed).

## 
[​
](#boolean-helpers)Boolean helpers

Run objects returned from the API and Realtime include convenient boolean helper methods to check the run’s status:

**Copy

Ask AI

```
import { runs } from "@trigger.dev/sdk";

const run = await runs.retrieve("run_1234");

if (run.isCompleted) {
 console.log("Run completed successfully");
}

```

- `isQueued`**: Returns `true` when the status is `QUEUED`, `PENDING_VERSION`, or `DELAYED`

- **`isExecuting`**: Returns `true` when the status is `EXECUTING` or `DEQUEUED`. These count against your concurrency limits.

- **`isWaiting`**: Returns `true` when the status is `WAITING`. These do not count against your concurrency limits.

- **`isCompleted`**: Returns `true` when the status is any of the completed statuses

- **`isCanceled`**: Returns `true` when the status is `CANCELED`

- **`isFailed`**: Returns `true` when the status is any of the failed statuses

- **`isSuccess`**: Returns `true` when the status is `COMPLETED`

These helpers are also available when subscribing to Realtime run updates:

Copy

Ask AI

```
import { runs } from "@trigger.dev/sdk";

for await (const run of runs.subscribeToRun("run_1234")) {
 if (run.isCompleted) {
 console.log("Run completed successfully!");
 break;
 }
}

```

## 
[​
](#advanced-run-features)Advanced run features

### 
[​
](#idempotency-keys)Idempotency Keys

When triggering a task, you can provide an idempotency key to ensure the task is executed only once, even if triggered multiple times. This is useful for preventing duplicate executions in distributed systems.

Copy

Ask AI

```
await yourTask.trigger({ foo: "bar" }, { idempotencyKey: "unique-key" });

```

- If a run with the same idempotency key is already in progress, the new trigger will be ignored.

- If the run has already finished, the previous output or error will be returned.

See our [Idempotency docs](/docs/idempotency) for more information.

### 
[​
](#canceling-runs)Canceling runs

You can cancel an in-progress run using the API or the dashboard:

Copy

Ask AI

```
await runs.cancel(runId);

```

When a run is canceled:
– The task execution is stopped
– The run is marked as canceled
– The task will not be retried
– Any in-progress child runs are also canceled

### 
[​
](#time-to-live-ttl)Time-to-live (TTL)

TTL is a time-to-live setting that defines the maximum duration a run can remain in a queued state before being automatically expired. You can set a TTL when triggering a run:

Copy

Ask AI

```
await yourTask.trigger({ foo: "bar" }, { ttl: "10m" });

```

If the run hasn’t started within the specified TTL, it will automatically expire, returning the status `Expired`. This is useful for time-sensitive tasks where immediate execution is important. For example, when you queue many runs simultaneously and exceed your concurrency limits, some runs might be delayed - using TTL ensures they only execute if they can start within your specified timeframe.
Note that dev runs automatically have a 10-minute TTL. In Staging and Production environments, no TTL is set by default.

### 
[​
](#delayed-runs)Delayed runs

You can schedule a run to start after a specified delay:

Copy

Ask AI

```
await yourTask.trigger({ foo: "bar" }, { delay: "1h" });

```

This is useful for tasks that need to be executed at a specific time in the future.

### 
[​
](#replaying-runs)Replaying runs

You can create a new run with the same payload as a previous run:

Copy

Ask AI

```
await runs.replay(runId);

```

This is useful for re-running a task with the same input, especially for debugging or recovering from failures. The new run will use the latest version of the task.
You can also replay runs from the dashboard using the same or different payload. Learn how to do this [here](/docs/replaying).

### 
[​
](#waiting-for-runs)Waiting for runs

#### 
[​
](#triggerandwait)triggerAndWait()

The `triggerAndWait()` function triggers a task and then lets you wait for the result before continuing. [Learn more about triggerAndWait()](/docs/triggering#yourtask-triggerandwait).

#### 
[​
](#batchtriggerandwait)batchTriggerAndWait()

Similar to `triggerAndWait()`, the `batchTriggerAndWait()` function lets you batch trigger a task and wait for all the results [Learn more about batchTriggerAndWait()](/docs/triggering#yourtask-batchtriggerandwait).

### 
[​
](#runs-api)Runs API

#### 
[​
](#runs-list)runs.list()

List runs in a specific environment. You can filter the runs by status, created at, task identifier, version, and more:

Copy

Ask AI

```
import { runs } from "@trigger.dev/sdk";

// Get the first page of runs, returning up to 20 runs
let page = await runs.list({ limit: 20 });

for (const run of page.data) {
 console.log(run);
}

// Keep getting the next page until there are no more runs
while (page.hasNextPage()) {
 page = await page.getNextPage();
 // Do something with the next page of runs
}

```

You can also use an Async Iterator to get all runs:

Copy

Ask AI

```
import { runs } from "@trigger.dev/sdk";

for await (const run of runs.list({ limit: 20 })) {
 console.log(run);
}

```

You can provide multiple filters to the `list()` function to narrow down the results:

Copy

Ask AI

```
import { runs } from "@trigger.dev/sdk";

const response = await runs.list({
 status: ["QUEUED", "EXECUTING"], // Filter by status
 taskIdentifier: ["my-task", "my-other-task"], // Filter by task identifier
 from: new Date("2024-04-01T00:00:00Z"), // Filter by created at
 to: new Date(),
 version: "20241127.2", // Filter by deployment version,
 tag: ["tag1", "tag2"], // Filter by tags
 batch: "batch_1234", // Filter by batch ID
 schedule: "sched_1234", // Filter by schedule ID
});

```

#### 
[​
](#runs-retrieve)runs.retrieve()

Fetch a single run by it’s ID:

Copy

Ask AI

```
import { runs } from "@trigger.dev/sdk";

const run = await runs.retrieve(runId);

```

You can provide the type of the task to correctly type the `run.payload` and `run.output`:

Copy

Ask AI

```
import { runs } from "@trigger.dev/sdk";
import type { myTask } from "./trigger/myTask";

const run = await runs.retrieve(runId);

console.log(run.payload.foo); // string
console.log(run.output.bar); // string

```

If you have just triggered a run, you can pass the entire response object to `retrieve()` and the response will already be typed:

Copy

Ask AI

```
import { runs, tasks } from "@trigger.dev/sdk";
import type { myTask } from "./trigger/myTask";

const response = await tasks.trigger({ foo: "bar" });
const run = await runs.retrieve(response);

console.log(run.payload.foo); // string
console.log(run.output.bar); // string

```

#### 
[​
](#runs-cancel)runs.cancel()

Cancel a run:

Copy

Ask AI

```
import { runs } from "@trigger.dev/sdk";

await runs.cancel(runId);

```

#### 
[​
](#runs-replay)runs.replay()

Replay a run:

Copy

Ask AI

```
import { runs } from "@trigger.dev/sdk";

await runs.replay(runId);

```

#### 
[​
](#runs-reschedule)runs.reschedule()

Updates a delayed run with a new delay. Only valid when the run is in the DELAYED state.

Copy

Ask AI

```
import { runs } from "@trigger.dev/sdk";

await runs.reschedule(runId, { delay: "1h" });

```

### 
[​
](#real-time-updates)Real-time updates

Subscribe to changes to a specific run in real-time:

Copy

Ask AI

```
import { runs } from "@trigger.dev/sdk";

for await (const run of runs.subscribeToRun(runId)) {
 console.log(run);
}

```

Similar to `runs.retrieve()`, you can provide the type of the task to correctly type the `run.payload` and `run.output`:

Copy

Ask AI

```
import { runs } from "@trigger.dev/sdk";
import type { myTask } from "./trigger/myTask";

for await (const run of runs.subscribeToRun(runId)) {
 console.log(run.payload.foo); // string
 console.log(run.output?.bar); // string | undefined
}

```

For more on real-time updates, see the [Realtime](/docs/realtime) documentation.

### 
[​
](#triggering-runs-for-undeployed-tasks)Triggering runs for undeployed tasks

It’s possible to trigger a run for a task that hasn’t been deployed yet. The run will enter the “Waiting for deploy” state until the task is deployed. Once deployed, the run will be queued and executed normally.
This feature is particularly useful in CI/CD pipelines where you want to trigger tasks before the deployment is complete.
Was this page helpful?

YesNo

[Suggest edits](https://github.com/triggerdotdev/trigger.dev/edit/main/docs/runs.mdx)[Raise issue](https://github.com/triggerdotdev/trigger.dev/issues/new?title=Issue on docs&body=Path: /runs)

[Previous](/docs/triggering)[API keysHow to authenticate with Trigger.dev so you can trigger tasks.

Next
](/docs/apikeys)
⌘I

On this page
- [What are runs?](#what-are-runs)
- [The run lifecycle](#the-run-lifecycle)
- [Initial states](#initial-states)
- [Execution states](#execution-states)
- [Final states](#final-states)
- [Attempts](#attempts)
- [Run completion](#run-completion)
- [Boolean helpers](#boolean-helpers)
- [Advanced run features](#advanced-run-features)
- [Idempotency Keys](#idempotency-keys)
- [Canceling runs](#canceling-runs)
- [Time-to-live (TTL)](#time-to-live-ttl)
- [Delayed runs](#delayed-runs)
- [Replaying runs](#replaying-runs)
- [Waiting for runs](#waiting-for-runs)
- [triggerAndWait()](#triggerandwait)
- [batchTriggerAndWait()](#batchtriggerandwait)
- [Runs API](#runs-api)
- [runs.list()](#runs-list)
- [runs.retrieve()](#runs-retrieve)
- [runs.cancel()](#runs-cancel)
- [runs.replay()](#runs-replay)
- [runs.reschedule()](#runs-reschedule)
- [Real-time updates](#real-time-updates)
- [Triggering runs for undeployed tasks](#triggering-runs-for-undeployed-tasks)

[Trigger.dev home page](https://trigger.dev)[x](https://twitter.com/triggerdotdev)[github](https://github.com/triggerdotdev)[linkedin](https://www.linkedin.com/company/triggerdotdev)

Developers
[Changelog](https://trigger.dev/changelog)[Contributing](https://github.com/triggerdotdev/trigger.dev/blob/main/CONTRIBUTING.md)[Open source](https://github.com/triggerdotdev/trigger.dev?tab=Apache-2.0-1-ov-file#readme)[GitHub](https://github.com/triggerdotdev/trigger.dev)[OSS Friends](https://trigger.dev/oss-friends)

Product
[Pricing](https://trigger.dev/pricing)[How it works](https://trigger.dev/#how-it-works)[Features](https://trigger.dev/product)[Roadmap](https://feedback.trigger.dev/roadmap)[FAQs](https://trigger.dev/pricing#faqs)[Uptime status](https://status.trigger.dev/)

Company
[Blog](https://trigger.dev/blog)[Contact](https://trigger.dev/contact)[Careers](https://trigger.dev/jobs)[Privacy](https://trigger.dev/legal/privacy)[Terms of service](https://trigger.dev/legal)

[x](https://twitter.com/triggerdotdev)[github](https://github.com/triggerdotdev)[linkedin](https://www.linkedin.com/company/triggerdotdev)

[Powered by](https://www.mintlify.com?utm_campaign=poweredBy&utm_medium=referral&utm_source=trigger)