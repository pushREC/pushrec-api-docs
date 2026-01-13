Wait for a period of time, then continue execution.

Copy page

Inside your tasks you can wait for a period of time before you want execution to continue.
/trigger/long-task.ts

Copy

Ask AI

```
export const veryLongTask = task({
 id: "very-long-task",
 run: async (payload) => {
 await wait.for({ seconds: 5 });

 await wait.for({ minutes: 10 });

 await wait.for({ hours: 1 });

 await wait.for({ days: 1 });

 await wait.for({ weeks: 1 });

 await wait.for({ months: 1 });

 await wait.for({ years: 1 });
 },
});

```

This allows you to write linear code without having to worry about the complexity of scheduling or managing cron jobs.
In the Trigger.dev Cloud we automatically pause execution of tasks when they are waiting for
longer than a few seconds.
When triggering and waiting for subtasks, the parent is checkpointed and while waiting does not count towards compute usage. When waiting for a time period (`wait.for` or `wait.until`), if the wait is longer than 5 seconds we checkpoint and it does not count towards compute usage.

## 
[​
](#wait-idempotency)Wait idempotency

You can pass an idempotency key to any wait function, allowing you to skip waits if the same idempotency key is used again. This can be useful if you want to skip waits when retrying a task, for example:

Copy

Ask AI

```
// Specify the idempotency key and TTL when waiting for a duration:
await wait.for({ seconds: 10 }, { idempotencyKey: "my-idempotency-key", idempotencyKeyTTL: "1h" });

```

Was this page helpful?

YesNo

[Suggest edits](https://github.com/triggerdotdev/trigger.dev/edit/main/docs/wait-for.mdx)[Raise issue](https://github.com/triggerdotdev/trigger.dev/issues/new?title=Issue on docs&body=Path: /wait-for)

[Previous](/docs/wait)[Wait untilWait until a date, then continue execution.

Next
](/docs/wait-until)
⌘I

On this page
- [Wait idempotency](#wait-idempotency)

[Trigger.dev home page](https://trigger.dev)[x](https://twitter.com/triggerdotdev)[github](https://github.com/triggerdotdev)[linkedin](https://www.linkedin.com/company/triggerdotdev)

Developers
[Changelog](https://trigger.dev/changelog)[Contributing](https://github.com/triggerdotdev/trigger.dev/blob/main/CONTRIBUTING.md)[Open source](https://github.com/triggerdotdev/trigger.dev?tab=Apache-2.0-1-ov-file#readme)[GitHub](https://github.com/triggerdotdev/trigger.dev)[OSS Friends](https://trigger.dev/oss-friends)

Product
[Pricing](https://trigger.dev/pricing)[How it works](https://trigger.dev/#how-it-works)[Features](https://trigger.dev/product)[Roadmap](https://feedback.trigger.dev/roadmap)[FAQs](https://trigger.dev/pricing#faqs)[Uptime status](https://status.trigger.dev/)

Company
[Blog](https://trigger.dev/blog)[Contact](https://trigger.dev/contact)[Careers](https://trigger.dev/jobs)[Privacy](https://trigger.dev/legal/privacy)[Terms of service](https://trigger.dev/legal)

[x](https://twitter.com/triggerdotdev)[github](https://github.com/triggerdotdev)[linkedin](https://www.linkedin.com/company/triggerdotdev)

[Powered by](https://www.mintlify.com?utm_campaign=poweredBy&utm_medium=referral&utm_source=trigger)