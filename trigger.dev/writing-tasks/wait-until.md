Wait until a date, then continue execution.

Copy page

This example sends a reminder email to a user at the specified datetime.
/trigger/reminder-email.ts

Copy

Ask AI

```
export const sendReminderEmail = task({
 id: "send-reminder-email",
 run: async (payload: { to: string; name: string; date: string }) => {
 //wait until the date
 await wait.until({ date: new Date(payload.date) });

 //todo send email
 const { data, error } = await resend.emails.send({
 from: "[email protected]",
 to: payload.to,
 subject: "Don't forget…",
 html: `Hello ${payload.name},

...
`,
 });
 },
});

```

This allows you to write linear code without having to worry about the complexity of scheduling or managing cron jobs.
In the Trigger.dev Cloud we automatically pause execution of tasks when they are waiting for
longer than a few seconds.
When triggering and waiting for subtasks, the parent is checkpointed and while waiting does not count towards compute usage. When waiting for a time period (`wait.for` or `wait.until`), if the wait is longer than 5 seconds we checkpoint and it does not count towards compute usage.

## 
[​

](#throwifinthepast)`throwIfInThePast`

You can optionally throw an error if the date is already in the past when the function is called:

Copy

Ask AI

```
await wait.until({ date: new Date(date), throwIfInThePast: true });

```

You can of course use try/catch if you want to do something special in this case.

## 
[​
](#wait-idempotency)Wait idempotency

You can pass an idempotency key to any wait function, allowing you to skip waits if the same idempotency key is used again. This can be useful if you want to skip waits when retrying a task, for example:

Copy

Ask AI

```
// Specify the idempotency key and TTL when waiting until a date:
await wait.until({
 date: futureDate,
 idempotencyKey: "my-idempotency-key",
 idempotencyKeyTTL: "1h",
});

```

Was this page helpful?

YesNo

[Suggest edits](https://github.com/triggerdotdev/trigger.dev/edit/main/docs/wait-until.mdx)[Raise issue](https://github.com/triggerdotdev/trigger.dev/issues/new?title=Issue on docs&body=Path: /wait-until)

[Previous](/docs/wait-for)[Wait for tokenWait until a token is completed using waitpoint tokens.

Next
](/docs/wait-for-token)
⌘I

On this page
- [throwIfInThePast](#throwifinthepast)
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