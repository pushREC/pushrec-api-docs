Configure what you want to happen when there is more than one run at a time.

Copy page

When you trigger a task, it isn’t executed immediately. Instead, the task [run](/docs/runs) is placed into a queue for execution.
By default, each task gets its own queue and the concurrency is only limited by your environment concurrency limit. If you need more control (for example, to limit concurrency or share limits across multiple tasks), you can define a custom queue as described later.
Controlling concurrency is useful when you have a task that can’t be run concurrently, or when you want to limit the number of runs to avoid overloading a resource.
It’s important to note that only actively executing runs count towards concurrency limits. Runs that are delayed or waiting in a queue do not consume concurrency slots until they begin execution.

## [​
](#default-concurrency)Default concurrency

By default, all tasks have an unbounded concurrency limit, limited only by the overall concurrency limits of your environment.

Your environment has a base concurrency limit and a burstable limit (default burst factor of 2.0x
the base limit). Individual queues are limited by the base concurrency limit, not the burstable
limit. For example, if your base limit is 10, your environment can burst up to 20 concurrent runs,
but any single queue can have at most 10 concurrent runs. If you’re a paying customer you can
request higher burst limits by [contacting us](https://www.trigger.dev/contact).

## 
[​
](#setting-task-concurrency)Setting task concurrency

You can set the concurrency limit for a task by setting the `concurrencyLimit` property on the task’s queue. This limits the number of runs that can be executing at any one time:

/trigger/one-at-a-time.ts

Copy

Ask AI

```
// This task will only run one at a time
export const oneAtATime = task({
 id: "one-at-a-time",
 queue: {
 concurrencyLimit: 1,
 },
 run: async (payload) => {
 //...
 },
});

```

This is useful if you need to control access to a shared resource, like a database or an API that has rate limits.

## 
[​
](#sharing-concurrency-between-tasks)Sharing concurrency between tasks

As well as putting queue settings directly on a task, you can define a queue and reuse it across multiple tasks. This allows you to share the same concurrency limit:

/trigger/queue.ts

Copy

Ask AI

```
export const myQueue = queue({
 name: "my-queue",
 concurrencyLimit: 1,
});

export const task1 = task({
 id: "task-1",
 queue: myQueue,
 run: async (payload: { message: string }) => {
 // ...
 },
});

export const task2 = task({
 id: "task-2",
 queue: myQueue,
 run: async (payload: { message: string }) => {
 // ...
 },
});

```

In this example, `task1` and `task2` share the same queue, so only one of them can run at a time.

## 
[​
](#setting-the-queue-when-you-trigger-a-run)Setting the queue when you trigger a run

When you trigger a task you can override the default queue. This is really useful if you sometimes have high priority runs.
The task and queue definition:

/trigger/override-concurrency.ts

Copy

Ask AI

```
const paidQueue = queue({
 name: "paid-users",
 concurrencyLimit: 10,
});

export const generatePullRequest = task({
 id: "generate-pull-request",
 queue: {
 //normally when triggering this task it will be limited to 1 run at a time
 concurrencyLimit: 1,
 },
 run: async (payload) => {
 //todo generate a PR using OpenAI
 },
});

```

Triggering from your backend and overriding the queue:

app/api/push/route.ts

Copy

Ask AI

```
import { generatePullRequest } from "~/trigger/override-concurrency";

export async function POST(request: Request) {
 const data = await request.json();

 if (data.branch === "main") {
 //trigger the task, with the paid users queue
 const handle = await generatePullRequest.trigger(data, {
 // Set the paid users queue
 queue: "paid-users",
 });

 return Response.json(handle);
 } else {
 //triggered with the default queue (concurrency of 1)
 const handle = await generatePullRequest.trigger(data);
 return Response.json(handle);
 }
}

```

## 
[​
](#concurrency-keys-and-per-tenant-queuing)Concurrency keys and per-tenant queuing

If you’re building an application where you want to run tasks for your users, you might want a separate queue for each of your users (or orgs, projects, etc.).
You can do this by using `concurrencyKey`. It creates a copy of the queue for each unique value of the key.
Your backend code:

app/api/pr/route.ts

Copy

Ask AI

```
import { generatePullRequest } from "~/trigger/override-concurrency";

export async function POST(request: Request) {
 const data = await request.json();

 if (data.isFreeUser) {
 //the "free-users" queue has a concurrency limit of 1
 const handle = await generatePullRequest.trigger(data, {
 queue: "free-users",
 //this creates a free-users queue for each user
 concurrencyKey: data.userId,
 });

 //return a success response with the handle
 return Response.json(handle);
 } else {
 //the "paid-users" queue has a concurrency limit of 10
 const handle = await generatePullRequest.trigger(data, {
 queue: "paid-users",
 //this creates a paid-users queue for each user
 concurrencyKey: data.userId,
 });

 //return a success response with the handle
 return Response.json(handle);
 }
}

```

## 
[​
](#concurrency-and-subtasks)Concurrency and subtasks

When you trigger a task that has subtasks, the subtasks will not inherit the queue from the parent task. Unless otherwise specified, subtasks will run on their own queue

/trigger/subtasks.ts

Copy

Ask AI

```
export const parentTask = task({
 id: "parent-task",
 run: async (payload) => {
 //trigger a subtask
 await subtask.triggerAndWait(payload);
 },
});

// This subtask will run on its own queue
export const subtask = task({
 id: "subtask",
 run: async (payload) => {
 //...
 },
});

```

## 
[​
](#waits-and-concurrency)Waits and concurrency

With our [task checkpoint system](/docs/how-it-works#the-checkpoint-resume-system), tasks can wait at various waitpoints (like waiting for subtasks to complete, delays, or external events). The way this system interacts with the concurrency system is important to understand.
Concurrency is only released when a run reaches a waitpoint and is checkpointed. When a run is checkpointed, it transitions to the `WAITING` state and releases its concurrency slot back to both the queue and the environment, allowing other runs to execute or resume.
This means that:

- Only actively executing runs count towards concurrency limits

- Runs in the `WAITING` state (checkpointed at waitpoints) do not consume concurrency slots

- You can have more runs in the `WAITING` state than your queue’s concurrency limit

- When a waiting run resumes (e.g., when a subtask completes), it must re-acquire a concurrency slot

For example, if you have a queue with a `concurrencyLimit` of 1:

- You can only have exactly 1 run executing at a time

- You may have multiple runs in the `WAITING` state that belong to that queue

- When the executing run reaches a waitpoint and checkpoints, it releases its slot

- The next queued run can then begin execution

### 
[​
](#waiting-for-a-subtask-on-a-different-queue)Waiting for a subtask on a different queue

When a parent task triggers and waits for a subtask on a different queue, the parent task will checkpoint and release its concurrency slot once it reaches the wait point. This prevents environment deadlocks where all concurrency slots would be occupied by waiting tasks.

/trigger/waiting.ts

Copy

Ask AI

```
export const parentTask = task({
 id: "parent-task",
 queue: {
 concurrencyLimit: 1,
 },
 run: async (payload) => {
 //trigger a subtask and wait for it to complete
 await subtask.triggerAndWait(payload);
 // The parent task checkpoints here and releases its concurrency slot
 // allowing other tasks to execute while waiting
 },
});

export const subtask = task({
 id: "subtask",
 run: async (payload) => {
 //...
 },
});

```

When the parent task reaches the `triggerAndWait` call, it checkpoints and transitions to the `WAITING` state, releasing its concurrency slot back to both its queue and the environment. Once the subtask completes, the parent task will resume and re-acquire a concurrency slot.
Was this page helpful?

YesNo

[Suggest edits](https://github.com/triggerdotdev/trigger.dev/edit/main/docs/queue-concurrency.mdx)[Raise issue](https://github.com/triggerdotdev/trigger.dev/issues/new?title=Issue on docs&body=Path: /queue-concurrency)

[Previous](/docs/wait-for-token)[VersioningWe use atomic versioning to ensure that started tasks are not affected by changes to the task code.

Next
](/docs/versioning)
⌘I

On this page
- [Default concurrency](#default-concurrency)
- [Setting task concurrency](#setting-task-concurrency)
- [Sharing concurrency between tasks](#sharing-concurrency-between-tasks)
- [Setting the queue when you trigger a run](#setting-the-queue-when-you-trigger-a-run)
- [Concurrency keys and per-tenant queuing](#concurrency-keys-and-per-tenant-queuing)
- [Concurrency and subtasks](#concurrency-and-subtasks)
- [Waits and concurrency](#waits-and-concurrency)
- [Waiting for a subtask on a different queue](#waiting-for-a-subtask-on-a-different-queue)

[Trigger.dev home page](https://trigger.dev)[x](https://twitter.com/triggerdotdev)[github](https://github.com/triggerdotdev)[linkedin](https://www.linkedin.com/company/triggerdotdev)

Developers
[Changelog](https://trigger.dev/changelog)[Contributing](https://github.com/triggerdotdev/trigger.dev/blob/main/CONTRIBUTING.md)[Open source](https://github.com/triggerdotdev/trigger.dev?tab=Apache-2.0-1-ov-file#readme)[GitHub](https://github.com/triggerdotdev/trigger.dev)[OSS Friends](https://trigger.dev/oss-friends)

Product
[Pricing](https://trigger.dev/pricing)[How it works](https://trigger.dev/#how-it-works)[Features](https://trigger.dev/product)[Roadmap](https://feedback.trigger.dev/roadmap)[FAQs](https://trigger.dev/pricing#faqs)[Uptime status](https://status.trigger.dev/)

Company
[Blog](https://trigger.dev/blog)[Contact](https://trigger.dev/contact)[Careers](https://trigger.dev/jobs)[Privacy](https://trigger.dev/legal/privacy)[Terms of service](https://trigger.dev/legal)

[x](https://twitter.com/triggerdotdev)[github](https://github.com/triggerdotdev)[linkedin](https://www.linkedin.com/company/triggerdotdev)

[Powered by](https://www.mintlify.com?utm_campaign=poweredBy&utm_medium=referral&utm_source=trigger)