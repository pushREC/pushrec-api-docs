During your run you can wait for a period of time or for something to happen.

Copy page

Waiting allows you to write complex tasks as a set of async code, without having to schedule another task or poll for changes.
In the Trigger.dev Cloud we automatically pause execution of tasks when they are waiting for
longer than a few seconds.
When triggering and waiting for subtasks, the parent is checkpointed and while waiting does not count towards compute usage. When waiting for a time period (`wait.for` or `wait.until`), if the wait is longer than 5 seconds we checkpoint and it does not count towards compute usage.
FunctionWhat it does[wait.for()](/docs/wait-for)Waits for a specific period of time, e.g. 1 day.[wait.until()](/docs/wait-until)Waits until the provided `Date`.[wait.forToken()](/docs/wait-for-token)Pauses runs until a token is completed.

Was this page helpful?

YesNo

[Suggest edits](https://github.com/triggerdotdev/trigger.dev/edit/main/docs/wait.mdx)[Raise issue](https://github.com/triggerdotdev/trigger.dev/issues/new?title=Issue on docs&body=Path: /wait)

[Previous](/docs/errors-retrying)[Wait forWait for a period of time, then continue execution.

Next
](/docs/wait-for)
⌘I

[Trigger.dev home page](https://trigger.dev)[x](https://twitter.com/triggerdotdev)[github](https://github.com/triggerdotdev)[linkedin](https://www.linkedin.com/company/triggerdotdev)

Developers
[Changelog](https://trigger.dev/changelog)[Contributing](https://github.com/triggerdotdev/trigger.dev/blob/main/CONTRIBUTING.md)[Open source](https://github.com/triggerdotdev/trigger.dev?tab=Apache-2.0-1-ov-file#readme)[GitHub](https://github.com/triggerdotdev/trigger.dev)[OSS Friends](https://trigger.dev/oss-friends)

Product
[Pricing](https://trigger.dev/pricing)[How it works](https://trigger.dev/#how-it-works)[Features](https://trigger.dev/product)[Roadmap](https://feedback.trigger.dev/roadmap)[FAQs](https://trigger.dev/pricing#faqs)[Uptime status](https://status.trigger.dev/)

Company
[Blog](https://trigger.dev/blog)[Contact](https://trigger.dev/contact)[Careers](https://trigger.dev/jobs)[Privacy](https://trigger.dev/legal/privacy)[Terms of service](https://trigger.dev/legal)

[x](https://twitter.com/triggerdotdev)[github](https://github.com/triggerdotdev)[linkedin](https://www.linkedin.com/company/triggerdotdev)

[Powered by](https://www.mintlify.com?utm_campaign=poweredBy&utm_medium=referral&utm_source=trigger)