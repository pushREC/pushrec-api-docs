How to authenticate with Trigger.dev so you can trigger tasks.

Copy page

### [​
](#authentication-and-your-secret-keys)Authentication and your secret keys

When you [trigger a task](/docs/triggering) from your backend code, you need to set the `TRIGGER_SECRET_KEY` environment variable.
Each environment has its own secret key. You can find the value on the API keys page in the Trigger.dev dashboard:

For preview branches, you need to also set the `TRIGGER_PREVIEW_BRANCH` environment variable as
well. You can find the value on the API keys page when you’re on the preview branch.

### 
[​
](#automatically-configuring-the-sdk)Automatically Configuring the SDK

To automatically configure the SDK with your secret key, you can set the `TRIGGER_SECRET_KEY` environment variable. The SDK will automatically use this value when calling API methods (like `trigger`).

.env

Copy

Ask AI

```
TRIGGER_SECRET_KEY="tr_dev_…"
TRIGGER_PREVIEW_BRANCH="my-branch" # Only needed for preview branches

```

You can do the same if you are self-hosting and need to change the default URL by using `TRIGGER_API_URL`.

.env

Copy

Ask AI

```
TRIGGER_API_URL="https://trigger.example.com"
TRIGGER_PREVIEW_BRANCH="my-branch" # Only needed for preview branches

```

The default URL is `https://api.trigger.dev`.

### 
[​
](#manually-configuring-the-sdk)Manually Configuring the SDK

If you prefer to manually configure the SDK, you can call the `configure` method:

Copy

Ask AI

```
import { configure } from "@trigger.dev/sdk";
import { myTask } from "./trigger/myTasks";

configure({
 secretKey: "tr_dev_1234", // WARNING: Never actually hardcode your secret key like this
 previewBranch: "my-branch", // Only needed for preview branches
 baseURL: "https://mytrigger.example.com", // Optional
});

async function triggerTask() {
 await myTask.trigger({ userId: "1234" }); // This will use the secret key and base URL you configured
}

```

Was this page helpful?

YesNo

[Suggest edits](https://github.com/triggerdotdev/trigger.dev/edit/main/docs/apikeys.mdx)[Raise issue](https://github.com/triggerdotdev/trigger.dev/issues/new?title=Issue on docs&body=Path: /apikeys)

[Previous](/docs/runs)[OverviewTasks are the core of Trigger.dev. They are long-running processes that are triggered by events.

Next
](/docs/writing-tasks-introduction)
⌘I

On this page
- [Authentication and your secret keys](#authentication-and-your-secret-keys)
- [Automatically Configuring the SDK](#automatically-configuring-the-sdk)
- [Manually Configuring the SDK](#manually-configuring-the-sdk)

[Trigger.dev home page](https://trigger.dev)[x](https://twitter.com/triggerdotdev)[github](https://github.com/triggerdotdev)[linkedin](https://www.linkedin.com/company/triggerdotdev)

Developers
[Changelog](https://trigger.dev/changelog)[Contributing](https://github.com/triggerdotdev/trigger.dev/blob/main/CONTRIBUTING.md)[Open source](https://github.com/triggerdotdev/trigger.dev?tab=Apache-2.0-1-ov-file#readme)[GitHub](https://github.com/triggerdotdev/trigger.dev)[OSS Friends](https://trigger.dev/oss-friends)

Product
[Pricing](https://trigger.dev/pricing)[How it works](https://trigger.dev/#how-it-works)[Features](https://trigger.dev/product)[Roadmap](https://feedback.trigger.dev/roadmap)[FAQs](https://trigger.dev/pricing#faqs)[Uptime status](https://status.trigger.dev/)

Company
[Blog](https://trigger.dev/blog)[Contact](https://trigger.dev/contact)[Careers](https://trigger.dev/jobs)[Privacy](https://trigger.dev/legal/privacy)[Terms of service](https://trigger.dev/legal)

[x](https://twitter.com/triggerdotdev)[github](https://github.com/triggerdotdev)[linkedin](https://www.linkedin.com/company/triggerdotdev)

[Powered by](https://www.mintlify.com?utm_campaign=poweredBy&utm_medium=referral&utm_source=trigger)