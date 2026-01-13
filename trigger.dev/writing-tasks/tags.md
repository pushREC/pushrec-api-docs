Tags allow you to easily filter runs in the dashboard and when using the SDK.

Copy page

## [​
](#what-are-tags)What are tags?

We support up to 10 tags per run. Each one must be a string between 1 and 128 characters long.
We recommend prefixing your tags with their type and then an underscore or colon. For example, `user_123456` or `video:123`.

Many great APIs, like Stripe, already prefix their IDs with the type and an underscore. Like
`cus_123456` for a customer.

We don’t enforce prefixes but if you use them you’ll find it easier to filter and it will be clearer what the tag represents.

## 
[​
](#how-to-add-tags)How to add tags

There are two ways to add tags to a run:

- When triggering the run.

- Inside the `run` function, using `tags.add()`.

### 
[​
](#1-adding-tags-when-triggering-the-run)1. Adding tags when triggering the run

You can add tags when triggering a run using the `tags` option. All the different [trigger](/docs/triggering) methods support this.

trigger

batchTrigger

Copy

Ask AI

```
const handle = await myTask.trigger(
 { message: "hello world" },
 { tags: ["user_123456", "org_abcdefg"] }
);

```

This will create a run with the tags `user_123456` and `org_abcdefg`. They look like this in the runs table:

### 
[​
](#2-adding-tags-inside-the-run-function)2. Adding tags inside the `run` function

Use the `tags.add()` function to add tags to a run from inside the `run` function. This will add the tag `product_1234567` to the run:

Copy

Ask AI

```
import { task, tags } from "@trigger.dev/sdk";

export const myTask = task({
 id: "my-task",
 run: async (payload: { message: string }, { ctx }) => {
 // Get the tags from when the run was triggered using the context
 // This is not updated if you add tags during the run
 logger.log("Tags from the run context", { tags: ctx.run.tags });

 // Add tags during the run (a single string or array of strings)
 await tags.add("product_1234567");
 },
});

```

Reminder: you can only have up to 10 tags per run. If you call `tags.add()` and the total number of tags will be more than 10 we log an error and ignore the new tags. That includes tags from triggering and from inside the run function.

### 
[​
](#propagating-tags-to-child-runs)Propagating tags to child runs

Tags do not propagate to child runs automatically. By default runs have no tags and you have to set them explicitly.
It’s easy to propagate tags if you want:

Copy

Ask AI

```
export const myTask = task({
 id: "my-task",
 run: async (payload: Payload, { ctx }) => {
 // Pass the tags from ctx into the child run
 const { id } = await otherTask.trigger(
 { message: "triggered from myTask" },
 { tags: ctx.run.tags }
 );
 },
});

```

## 
[​
](#filtering-runs-by-tags)Filtering runs by tags

You can filter runs by tags in the dashboard and in the SDK.

### 
[​
](#in-the-dashboard)In the dashboard

On the Runs page open the filter menu, choose “Tags” and then start typing in the name of the tag you want to filter by. You can select it and it will restrict the results to only runs with that tag. You can add multiple tags to filter by more than one.

### 
[​
](#using-runs-list)Using `runs.list()`

You can provide filters to the `runs.list` SDK function, including an array of tags.

Copy

Ask AI

```
import { runs } from "@trigger.dev/sdk";

// Loop through all runs with the tag "user_123456" that have completed
for await (const run of runs.list({ tag: "user_123456", status: ["COMPLETED"] })) {
 console.log(run.id, run.taskIdentifier, run.finishedAt, run.tags);
}

```

Was this page helpful?

YesNo

[Suggest edits](https://github.com/triggerdotdev/trigger.dev/edit/main/docs/tags.mdx)[Raise issue](https://github.com/triggerdotdev/trigger.dev/issues/new?title=Issue on docs&body=Path: /tags)

[Previous](/docs/runs/max-duration)[MetadataAttach a small amount of data to a run and update it as the run progresses.

Next
](/docs/runs/metadata)
⌘I

On this page
- [What are tags?](#what-are-tags)
- [How to add tags](#how-to-add-tags)
- [1. Adding tags when triggering the run](#1-adding-tags-when-triggering-the-run)
- [2. Adding tags inside the run function](#2-adding-tags-inside-the-run-function)
- [Propagating tags to child runs](#propagating-tags-to-child-runs)
- [Filtering runs by tags](#filtering-runs-by-tags)
- [In the dashboard](#in-the-dashboard)
- [Using runs.list()](#using-runs-list)

[Trigger.dev home page](https://trigger.dev)[x](https://twitter.com/triggerdotdev)[github](https://github.com/triggerdotdev)[linkedin](https://www.linkedin.com/company/triggerdotdev)

Developers
[Changelog](https://trigger.dev/changelog)[Contributing](https://github.com/triggerdotdev/trigger.dev/blob/main/CONTRIBUTING.md)[Open source](https://github.com/triggerdotdev/trigger.dev?tab=Apache-2.0-1-ov-file#readme)[GitHub](https://github.com/triggerdotdev/trigger.dev)[OSS Friends](https://trigger.dev/oss-friends)

Product
[Pricing](https://trigger.dev/pricing)[How it works](https://trigger.dev/#how-it-works)[Features](https://trigger.dev/product)[Roadmap](https://feedback.trigger.dev/roadmap)[FAQs](https://trigger.dev/pricing#faqs)[Uptime status](https://status.trigger.dev/)

Company
[Blog](https://trigger.dev/blog)[Contact](https://trigger.dev/contact)[Careers](https://trigger.dev/jobs)[Privacy](https://trigger.dev/legal/privacy)[Terms of service](https://trigger.dev/legal)

[x](https://twitter.com/triggerdotdev)[github](https://github.com/triggerdotdev)[linkedin](https://www.linkedin.com/company/triggerdotdev)

[Powered by](https://www.mintlify.com?utm_campaign=poweredBy&utm_medium=referral&utm_source=trigger)