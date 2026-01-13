An API call or operation is “idempotent” if it has the same result when called more than once.

Copy page

We currently support idempotency at the task level, meaning that if you trigger a task with the same `idempotencyKey` twice, the second request will not create a new task run.

## [​
](#idempotencykey-option)`idempotencyKey` option

You can provide an `idempotencyKey` to ensure that a task is only triggered once with the same key. This is useful if you are triggering a task within another task that might be retried:

Copy

Ask AI

```
import { idempotencyKeys, task } from "@trigger.dev/sdk";

export const myTask = task({
 id: "my-task",
 retry: {
 maxAttempts: 4,
 },
 run: async (payload: any) => {
 // This idempotency key will be unique to this task run, meaning the childTask will only be triggered once across all retries
 const idempotencyKey = await idempotencyKeys.create("my-task-key");

 // childTask will only be triggered once with the same idempotency key
 await childTask.trigger({ foo: "bar" }, { idempotencyKey });

 // Do something else, that may throw an error and cause the task to be retried
 throw new Error("Something went wrong");
 },
});

```

You can use the `idempotencyKeys.create` SDK function to create an idempotency key before passing it to the `options` object.
We automatically inject the run ID when generating the idempotency key when running inside a task by default. You can turn it off by passing the `scope` option to `idempotencyKeys.create`:

Copy

Ask AI

```
import { idempotencyKeys, task } from "@trigger.dev/sdk";

export const myTask = task({
 id: "my-task",
 retry: {
 maxAttempts: 4,
 },
 run: async (payload: any) => {
 // This idempotency key will be globally unique, meaning only a single task run will be triggered with this key
 const idempotencyKey = await idempotencyKeys.create("my-task-key", { scope: "global" });

 // childTask will only be triggered once with the same idempotency key
 await childTask.trigger({ foo: "bar" }, { idempotencyKey });
 },
});

```

If you are triggering a task from your backend code, you can use the `idempotencyKeys.create` SDK function to create an idempotency key.

Copy

Ask AI

```
import { idempotencyKeys, tasks } from "@trigger.dev/sdk";

// You can also pass an array of strings to create a idempotency key
const idempotencyKey = await idempotencyKeys.create([myUser.id, "my-task"]);
await tasks.trigger("my-task", { some: "data" }, { idempotencyKey });

```

You can also pass a string to the `idempotencyKey` option, without first creating it with `idempotencyKeys.create`.

Copy

Ask AI

```
import { myTask } from "./trigger/myTasks";

// You can also pass an array of strings to create a idempotency key
await myTask.trigger({ some: "data" }, { idempotencyKey: myUser.id });

```

Make sure you provide sufficiently unique keys to avoid collisions.

You can pass the `idempotencyKey` when calling `batchTrigger` as well:

Copy

Ask AI

```
import { tasks } from "@trigger.dev/sdk";

await tasks.batchTrigger("my-task", [
 {
 payload: { some: "data" },
 options: { idempotencyKey: await idempotencyKeys.create(myUser.id) },
 },
]);

```

## 
[​
](#idempotencykeyttl-option)`idempotencyKeyTTL` option

The `idempotencyKeyTTL` option defines a time window during which a task with the same idempotency key will only run once. Here’s how it works:

- When you trigger a task with an idempotency key and set `idempotencyKeyTTL: "5m"`, it creates a 5-minute window.

- During this window, any subsequent triggers with the same idempotency key will return the original task run instead of creating a new one.

- Once the TTL window expires, the next trigger with that idempotency key will create a new task run and start a new time window.

By default idempotency keys are stored for 30 days. You can change this by passing the `idempotencyKeyTTL` option when triggering a task:

Copy

Ask AI

```
import { idempotencyKeys, task, wait } from "@trigger.dev/sdk";

export const myTask = task({
 id: "my-task",
 retry: {
 maxAttempts: 4,
 },
 run: async (payload: any) => {
 const idempotencyKey = await idempotencyKeys.create("my-task-key");

 // The idempotency key will expire after 60 seconds
 await childTask.trigger({ foo: "bar" }, { idempotencyKey, idempotencyKeyTTL: "60s" });

 await wait.for({ seconds: 61 });

 // The idempotency key will have expired, so the childTask will be triggered again
 await childTask.trigger({ foo: "bar" }, { idempotencyKey });

 // Do something else, that may throw an error and cause the task to be retried
 throw new Error("Something went wrong");
 },
});

```

You can use the following units for the `idempotencyKeyTTL` option:

- `s` for seconds (e.g. `60s`)

- `m` for minutes (e.g. `5m`)

- `h` for hours (e.g. `2h`)

- `d` for days (e.g. `3d`)

## 
[​
](#payload-based-idempotency)Payload-based idempotency

We don’t currently support payload-based idempotency, but you can implement it yourself by hashing the payload and using the hash as the idempotency key.

Copy

Ask AI

```
import { idempotencyKeys, task } from "@trigger.dev/sdk";
import { createHash } from "node:crypto";

// Somewhere in your code
const idempotencyKey = await idempotencyKeys.create(hash(childPayload));
// childTask will only be triggered once with the same idempotency key
await tasks.trigger("child-task", { some: "payload" }, { idempotencyKey });

// Create a hash of the payload using Node.js crypto
// Ideally, you'd do a stable serialization of the payload before hashing, to ensure the same payload always results in the same hash
function hash(payload: any): string {
 const hash = createHash("sha256");
 hash.update(JSON.stringify(payload));
 return hash.digest("hex");
}

```

## 
[​
](#resetting-idempotency-keys)Resetting idempotency keys

You can reset an idempotency key to clear it from all associated runs. This is useful if you need to allow a task to be triggered again with the same idempotency key.
When you reset an idempotency key, it will be cleared for all runs that match both the task identifier and the idempotency key in the current environment. This allows you to trigger the task again with the same key.

Copy

Ask AI

```
import { idempotencyKeys } from "@trigger.dev/sdk";

// Reset an idempotency key for a specific task
await idempotencyKeys.reset("my-task", "my-idempotency-key");

```

The `reset` function requires both parameters:

- `taskIdentifier`: The identifier of the task (e.g., `"my-task"`)

- `idempotencyKey`: The idempotency key to reset

After resetting, any subsequent triggers with the same idempotency key will create new task runs instead of returning the existing ones.

Resetting an idempotency key only affects runs in the current environment. The reset is scoped to the specific task identifier and idempotency key combination.

## 
[​
](#important-notes)Important notes

Idempotency keys, even the ones scoped globally, are actually scoped to the task and the environment. This means that you cannot collide with keys from other environments (e.g. dev will never collide with prod), or to other projects and orgs.
If you use the same idempotency key for triggering different tasks, the tasks will not be idempotent, and both tasks will be triggered. There’s currently no way to make multiple tasks idempotent with the same key.
Was this page helpful?

YesNo

[Suggest edits](https://github.com/triggerdotdev/trigger.dev/edit/main/docs/idempotency.mdx)[Raise issue](https://github.com/triggerdotdev/trigger.dev/issues/new?title=Issue on docs&body=Path: /idempotency)

[Previous](/docs/machines)[Max durationSet a maximum duration for a task to run.

Next
](/docs/runs/max-duration)
⌘I

On this page
- [idempotencyKey option](#idempotencykey-option)
- [idempotencyKeyTTL option](#idempotencykeyttl-option)
- [Payload-based idempotency](#payload-based-idempotency)
- [Resetting idempotency keys](#resetting-idempotency-keys)
- [Important notes](#important-notes)

[Trigger.dev home page](https://trigger.dev)[x](https://twitter.com/triggerdotdev)[github](https://github.com/triggerdotdev)[linkedin](https://www.linkedin.com/company/triggerdotdev)

Developers
[Changelog](https://trigger.dev/changelog)[Contributing](https://github.com/triggerdotdev/trigger.dev/blob/main/CONTRIBUTING.md)[Open source](https://github.com/triggerdotdev/trigger.dev?tab=Apache-2.0-1-ov-file#readme)[GitHub](https://github.com/triggerdotdev/trigger.dev)[OSS Friends](https://trigger.dev/oss-friends)

Product
[Pricing](https://trigger.dev/pricing)[How it works](https://trigger.dev/#how-it-works)[Features](https://trigger.dev/product)[Roadmap](https://feedback.trigger.dev/roadmap)[FAQs](https://trigger.dev/pricing#faqs)[Uptime status](https://status.trigger.dev/)

Company
[Blog](https://trigger.dev/blog)[Contact](https://trigger.dev/contact)[Careers](https://trigger.dev/jobs)[Privacy](https://trigger.dev/legal/privacy)[Terms of service](https://trigger.dev/legal)

[x](https://twitter.com/triggerdotdev)[github](https://github.com/triggerdotdev)[linkedin](https://www.linkedin.com/company/triggerdotdev)

[Powered by](https://www.mintlify.com?utm_campaign=poweredBy&utm_medium=referral&utm_source=trigger)