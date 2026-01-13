How to use the built-in logging and tracing system.

Copy page

The run log shows you exactly what happened in every run of your tasks. It is comprised of logs, traces and spans.

## [​
](#logs)Logs

You can use `console.log()`, `console.error()`, etc as normal and they will be shown in your run log. This is the standard function so you can use it as you would in any other JavaScript or TypeScript code. Logs from any functions/packages will also be shown.

### 
[​
](#logger)logger

We recommend that you use our `logger` object which creates structured logs. Structured logs will make it easier for you to search the logs to quickly find runs.

/trigger/logging.ts

Copy

Ask AI

```
import { task, logger } from "@trigger.dev/sdk";

export const loggingExample = task({
 id: "logging-example",
 run: async (payload: { data: Record }) => {
 //the first parameter is the message, the second parameter must be a key-value object (Record)
 logger.debug("Debug message", payload.data);
 logger.log("Log message", payload.data);
 logger.info("Info message", payload.data);
 logger.warn("You've been warned", payload.data);
 logger.error("Error message", payload.data);
 },
});

```

## 
[​
](#tracing-and-spans)Tracing and spans

Tracing is a way to follow the flow of your code. It’s very useful for debugging and understanding how your code is working, especially with long-running or complex tasks.
Trigger.dev uses OpenTelemetry tracing under the hood. With automatic tracing for many things like task triggering, task attempts, HTTP requests, and more.

NameDescriptionTask triggersTask triggersTask attemptsTask attemptsHTTP requestsHTTP requests made by your code.

### 
[​
](#adding-instrumentations)Adding instrumentations

You can [add instrumentations](/docs/config/config-file#instrumentations). The Prisma one above will automatically trace all Prisma queries.

### 
[​
](#add-custom-traces)Add custom traces

If you want to add custom traces to your code, you can use the `logger.trace` function. It will create a new OTEL trace and you can set attributes on it.

Copy

Ask AI

```
import { logger, task } from "@trigger.dev/sdk";

export const customTrace = task({
 id: "custom-trace",
 run: async (payload) => {
 //you can wrap code in a trace, and set attributes
 const user = await logger.trace("fetch-user", async (span) => {
 span.setAttribute("user.id", "1");

 //...do stuff

 //you can return a value
 return {
 id: "1",
 name: "John Doe",
 fetchedAt: new Date(),
 };
 });

 const usersName = user.name;
 },
});

```

Was this page helpful?

YesNo

[Suggest edits](https://github.com/triggerdotdev/trigger.dev/edit/main/docs/logging.mdx)[Raise issue](https://github.com/triggerdotdev/trigger.dev/issues/new?title=Issue on docs&body=Path: /logging)

[Previous](/docs/writing-tasks-introduction)[Errors & RetryingHow to deal with errors and write reliable tasks.

Next
](/docs/errors-retrying)
⌘I

On this page
- [Logs](#logs)
- [logger](#logger)
- [Tracing and spans](#tracing-and-spans)
- [Adding instrumentations](#adding-instrumentations)
- [Add custom traces](#add-custom-traces)

[Trigger.dev home page](https://trigger.dev)[x](https://twitter.com/triggerdotdev)[github](https://github.com/triggerdotdev)[linkedin](https://www.linkedin.com/company/triggerdotdev)

Developers
[Changelog](https://trigger.dev/changelog)[Contributing](https://github.com/triggerdotdev/trigger.dev/blob/main/CONTRIBUTING.md)[Open source](https://github.com/triggerdotdev/trigger.dev?tab=Apache-2.0-1-ov-file#readme)[GitHub](https://github.com/triggerdotdev/trigger.dev)[OSS Friends](https://trigger.dev/oss-friends)

Product
[Pricing](https://trigger.dev/pricing)[How it works](https://trigger.dev/#how-it-works)[Features](https://trigger.dev/product)[Roadmap](https://feedback.trigger.dev/roadmap)[FAQs](https://trigger.dev/pricing#faqs)[Uptime status](https://status.trigger.dev/)

Company
[Blog](https://trigger.dev/blog)[Contact](https://trigger.dev/contact)[Careers](https://trigger.dev/jobs)[Privacy](https://trigger.dev/legal/privacy)[Terms of service](https://trigger.dev/legal)

[x](https://twitter.com/triggerdotdev)[github](https://github.com/triggerdotdev)[linkedin](https://www.linkedin.com/company/triggerdotdev)

[Powered by](https://www.mintlify.com?utm_campaign=poweredBy&utm_medium=referral&utm_source=trigger)