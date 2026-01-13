Create tasks that are not exported from your trigger files but can still be executed.

Copy page

Hidden tasks are tasks that are not exported from your trigger files but can still be executed. These tasks are only accessible to other tasks within the same file or module where they’re defined.
trigger/my-task.ts

Copy

Ask AI

```
import { task } from "@trigger.dev/sdk";

// This is a hidden task - not exported
const internalTask = task({
 id: "internal-processing",
 run: async (payload: any, { ctx }) => {
 // Internal processing logic
 },
});

```

Hidden tasks are useful for creating internal workflows that should only be triggered by other tasks in the same file:

trigger/my-workflow.ts

Copy

Ask AI

```
import { task } from "@trigger.dev/sdk";

// Hidden task for internal use
const processData = task({
 id: "process-data",
 run: async (payload: { data: string }, { ctx }) => {
 // Process the data
 return { processed: payload.data.toUpperCase() };
 },
});

// Public task that uses the hidden task
export const mainWorkflow = task({
 id: "main-workflow",
 run: async (payload: any, { ctx }) => {
 const result = await processData.trigger({ data: payload.input });
 return result;
 },
});

```

You can also create packages of reusable tasks that can be imported and used without needing to re-export them:

trigger/my-task.ts

Copy

Ask AI

```
import { task } from "@trigger.dev/sdk";
import { sendToSlack } from "@repo/tasks"; // Hidden task from another package

export const notificationTask = task({
 id: "send-notification",
 run: async (payload: any, { ctx }) => {
 await sendToSlack.trigger(payload);
 },
});

```

Was this page helpful?

YesNo

[Suggest edits](https://github.com/triggerdotdev/trigger.dev/edit/main/docs/hidden-tasks.mdx)[Raise issue](https://github.com/triggerdotdev/trigger.dev/issues/new?title=Issue on docs&body=Path: /hidden-tasks)

[Previous](/docs/runs/priority)[trigger.config.tsThis file is used to configure your project and how it's built.

Next
](/docs/config/config-file)
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