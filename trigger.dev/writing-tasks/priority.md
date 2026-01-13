Specify a priority when triggering a run.

Copy page

You can set a priority when you trigger a run. This allows you to prioritize some of your runs over others, so they are started sooner. This is very useful when:

- You have critical work that needs to start more quickly (and you have long queues).

- You want runs for your premium users to take priority over free users.

The value for priority is a time offset in seconds that determines the order of dequeuing.

If you specify a priority of `10` the run will dequeue before runs that were triggered with no priority 8 seconds ago, like in this example:
Copy

Ask AI

```
// no priority = 0
await myTask.trigger({ foo: "bar" });

//... imagine 8s pass by

// this run will start before the run above that was triggered 8s ago (with no priority)
await myTask.trigger({ foo: "bar" }, { priority: 10 });

```

If you passed a value of `3600` the run would dequeue before runs that were triggered an hour ago (with no priority).

Setting a high priority will not allow you to beat runs from other organizations. It will only affect the order of your own runs.

Was this page helpful?

YesNo

[Suggest edits](https://github.com/triggerdotdev/trigger.dev/edit/main/docs/runs/priority.mdx)[Raise issue](https://github.com/triggerdotdev/trigger.dev/issues/new?title=Issue on docs&body=Path: /runs/priority)

[Previous](/docs/context)[Hidden tasksCreate tasks that are not exported from your trigger files but can still be executed.

Next
](/docs/hidden-tasks)
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