Attach a small amount of data to a run and update it as the run progresses.

**
Copy page

You can attach up to 256KB of metadata to a run, which you can then access from inside the run function, via the API, Realtime, and in the dashboard. You can use metadata to store additional, structured information on a run. For example, you could store your user’s full name and corresponding unique identifier from your system on every task that is associated with that user. Or you could store the progress of a long-running task, or intermediate results that you want to access later.

## [​
](#usage)Usage

Add metadata to a run when triggering by passing it as an object to the `trigger` function:

Copy

Ask AI

```
const handle = await myTask.trigger(
 { message: "hello world" },
 { metadata: { user: { name: "Eric", id: "user_1234" } } }
);

```

You can get the current metadata at any time by calling `metadata.get()` or `metadata.current()` (only inside a run):

Copy

Ask AI

```
import { task, metadata } from "@trigger.dev/sdk";

export const myTask = task({
 id: "my-task",
 run: async (payload: { message: string }) => {
 // Get the whole metadata object
 const currentMetadata = metadata.current();
 console.log(currentMetadata);

 // Get a specific key
 const user = metadata.get("user");
 console.log(user.name); // "Eric"
 },
});

```

Any of these methods can be called anywhere “inside” the run function, or a function called from the run function:

Copy

Ask AI

```
import { task, metadata } from "@trigger.dev/sdk";

export const myTask = task({
 id: "my-task",
 run: async (payload: { message: string }) => {
 doSomeWork();
 },
});

async function doSomeWork() {
 // Set the value of a specific key
 metadata.set("progress", 0.5);
}

```

If you call any of the metadata methods outside of the run function, they will have no effect:

Copy

Ask AI

```
import { metadata } from "@trigger.dev/sdk";

// Somewhere outside of the run function
function doSomeWork() {
 metadata.set("progress", 0.5); // This will do nothing
}

```

This means it’s safe to call these methods anywhere in your code, and they will only have an effect when called inside the run function.

Calling `metadata.current()` or `metadata.get()` outside of the run function will always return
undefined.

These methods also work inside any task lifecycle hook, either attached to the specific task or the global hooks defined in your `trigger.config.ts` file.

myTasks.ts

trigger.config.ts

Copy

Ask AI

```
import { task, metadata } from "@trigger.dev/sdk";

export const myTask = task({
 id: "my-task",
 run: async (payload: { message: string }) => {
 // Your run function work here
 },
 onStart: async () => {
 metadata.set("progress", 0.5);
 },
 onSuccess: async () => {
 metadata.set("progress", 1.0);
 },
});

```

## 
[​
](#updates-api)Updates API

One of the more powerful features of metadata is the ability to update it as the run progresses. This is useful for tracking the progress of a run, storing intermediate results, or storing any other information that changes over time. (Combining metadata with [Realtime](/docs/realtime) can give you a live view of the progress of your runs.)
All metadata update methods (accept for `flush` and `stream`) are synchronous and will not block the run function. We periodically flush metadata to the database in the background, so you can safely update the metadata inside a run as often as you need to, without worrying about impacting the run’s performance.

### 
[​
](#set)set

Set the value of a key in the metadata object:

Copy

Ask AI

```
import { task, metadata } from "@trigger.dev/sdk";

export const myTask = task({
 id: "my-task",
 run: async (payload: { message: string }) => {
 // Do some work
 metadata.set("progress", 0.1);

 // Do some more work
 metadata.set("progress", 0.5);

 // Do even more work
 metadata.set("progress", 1.0);
 },
});

```

### 
[​
](#del)del

Delete a key from the metadata object:

Copy

Ask AI

```
import { task, metadata } from "@trigger.dev/sdk";

export const myTask = task({
 id: "my-task",
 run: async (payload: { message: string }) => {
 // Do some work
 metadata.set("progress", 0.1);

 // Do some more work
 metadata.set("progress", 0.5);

 // Remove the progress key
 metadata.del("progress");
 },
});

```

### 
[​
](#replace)replace

Replace the entire metadata object with a new object:

Copy

Ask AI

```
import { task, metadata } from "@trigger.dev/sdk";

export const myTask = task({
 id: "my-task",
 run: async (payload: { message: string }) => {
 // Do some work
 metadata.set("progress", 0.1);

 // Replace the metadata object
 metadata.replace({ user: { name: "Eric", id: "user_1234" } });
 },
});

```

### 
[​
](#append)append

Append a value to an array in the metadata object:

Copy

Ask AI

```
import { task, metadata } from "@trigger.dev/sdk";

export const myTask = task({
 id: "my-task",
 run: async (payload: { message: string }) => {
 // Do some work
 metadata.set("progress", 0.1);

 // Append a value to an array
 metadata.append("logs", "Step 1 complete");

 console.log(metadata.get("logs")); // ["Step 1 complete"]
 },
});

```

### 
[​
](#remove)remove

Remove a value from an array in the metadata object:

Copy

Ask AI

```
import { task, metadata } from "@trigger.dev/sdk";

export const myTask = task({
 id: "my-task",
 run: async (payload: { message: string }) => {
 // Do some work
 metadata.set("progress", 0.1);

 // Append a value to an array
 metadata.append("logs", "Step 1 complete");

 // Remove a value from the array
 metadata.remove("logs", "Step 1 complete");

 console.log(metadata.get("logs")); // []
 },
});

```

### 
[​
](#increment)increment

Increment a numeric value in the metadata object:

Copy

Ask AI

```
import { task, metadata } from "@trigger.dev/sdk";

export const myTask = task({
 id: "my-task",
 run: async (payload: { message: string }) => {
 // Do some work
 metadata.set("progress", 0.1);

 // Increment a value
 metadata.increment("progress", 0.4);

 console.log(metadata.get("progress")); // 0.5
 },
});

```

### 
[​
](#decrement)decrement

Decrement a numeric value in the metadata object:

Copy

Ask AI

```
import { task, metadata } from "@trigger.dev/sdk";

export const myTask = task({
 id: "my-task",
 run: async (payload: { message: string }) => {
 // Do some work
 metadata.set("progress", 0.5);

 // Decrement a value
 metadata.decrement("progress", 0.4);

 console.log(metadata.get("progress")); // 0.1
 },
});

```

### 
[​
](#stream)stream

As of SDK version 4.1.0**, `metadata.stream()` has been replaced by [Realtime Streams
v2](/docs/tasks/streams). We recommend using the new `streams.pipe()` API for better reliability,
unlimited stream length, and improved developer experience. The examples below are provided for
backward compatibility.

Capture a stream of values and make the stream available when using Realtime. See our [Realtime Streams v2](/docs/tasks/streams) documentation for the recommended approach.

Copy

Ask AI

```
import { task, metadata } from "@trigger.dev/sdk";

export const myTask = task({
 id: "my-task",
 run: async (payload: { message: string }) => {
 const readableStream = new ReadableStream({
 start(controller) {
 controller.enqueue("Step 1 complete");
 controller.enqueue("Step 2 complete");
 controller.enqueue("Step 3 complete");
 controller.close();
 },
 });

 // IMPORTANT: you must await the stream method
 const stream = await metadata.stream("logs", readableStream);

 // You can read from the returned stream locally
 for await (const value of stream) {
 console.log(value);
 }
 },
});

```

`metadata.stream` accepts any `AsyncIterable` or `ReadableStream` object. The stream will be captured and made available in the Realtime API. So for example, you could pass the body of a fetch response to `metadata.stream` to capture the response body and make it available in Realtime:

Copy

Ask AI

```
import { task, metadata } from "@trigger.dev/sdk";

export const myTask = task({
 id: "my-task",
 run: async (payload: { url: string }) => {
 logger.info("Streaming response", { url });

 const response = await fetch(url);

 if (!response.body) {
 throw new Error("Response body is not readable");
 }

 const stream = await metadata.stream(
 "fetch",
 response.body.pipeThrough(new TextDecoderStream())
 );

 let text = "";

 for await (const chunk of stream) {
 logger.log("Received chunk", { chunk });

 text += chunk;
 }

 return { text };
 },
});

```

Or the results of a streaming call to the OpenAI SDK:

Copy

Ask AI

```
import { task, metadata } from "@trigger.dev/sdk";
import OpenAI from "openai";

const openai = new OpenAI({
 apiKey: process.env.OPENAI_API_KEY,
});

export const myTask = task({
 id: "my-task",
 run: async (payload: { prompt: string }) => {
 const completion = await openai.chat.completions.create({
 messages: [{ role: "user", content: payload.prompt }],
 model: "gpt-3.5-turbo",
 stream: true,
 });

 const stream = await metadata.stream("openai", completion);

 let text = "";

 for await (const chunk of stream) {
 logger.log("Received chunk", { chunk });

 text += chunk.choices.map((choice) => choice.delta?.content).join("");
 }

 return { text };
 },
});

```

### 
[​
](#flush)flush

Flush the metadata to the database. The SDK will automatically flush the metadata periodically, so you don’t need to call this method unless you need to ensure that the metadata is persisted immediately.

Copy

Ask AI

```
import { task, metadata } from "@trigger.dev/sdk";

export const myTask = task({
 id: "my-task",
 run: async (payload: { message: string }) => {
 // Do some work
 metadata.set("progress", 0.1);

 // Flush the metadata to the database
 await metadata.flush();
 },
});

```

## 
[​
](#fluent-api)Fluent API

All of the update methods can be chained together in a fluent API:

Copy

Ask AI

```
import { task, metadata } from "@trigger.dev/sdk";

export const myTask = task({
 id: "my-task",
 run: async (payload: { message: string }) => {
 metadata
 .set("progress", 0.1)
 .append("logs", "Step 1 complete")
 .increment("progress", 0.4)
 .decrement("otherProgress", 0.1);
 },
});

```

## 
[​
](#parent-&-root-updates)Parent & root updates

Tasks that have been triggered by a parent task (a.k.a. a “child task”) can update the metadata of the parent task. This is useful for propagating progress information up the task hierarchy. You can also update the metadata of the root task (root = the initial task that was triggered externally, like from your backend).
To update the parent task’s metadata, use the `metadata.parent` accessor:

Copy

Ask AI

```
import { task, metadata } from "@trigger.dev/sdk";

export const myParentTask = task({
 id: "my-parent-task",
 run: async (payload: { message: string }) => {
 // Do some work
 metadata.set("progress", 0.1);

 // Trigger a child task
 await childTask.triggerAndWait({ message: "hello world" });
 },
});

export const childTask = task({
 id: "child-task",
 run: async (payload: { message: string }) => {
 // This will update the parent task's metadata
 metadata.parent.set("progress", 0.5);
 },
});

```

All of the update methods are available on `metadata.parent` and `metadata.root`:

Copy

Ask AI

```
metadata.parent.set("progress", 0.5);
metadata.parent.append("logs", "Step 1 complete");
metadata.parent.remove("logs", "Step 1 complete");
metadata.parent.increment("progress", 0.4);
metadata.parent.decrement("otherProgress", 0.1);
metadata.parent.stream("llm", readableStream); // Use streams.pipe() instead (v4.1+)

metadata.root.set("progress", 0.5);
metadata.root.append("logs", "Step 1 complete");
metadata.root.remove("logs", "Step 1 complete");
metadata.root.increment("progress", 0.4);
metadata.root.decrement("otherProgress", 0.1);
metadata.root.stream("llm", readableStream); // Use streams.pipe() instead (v4.1+)

```

You can also chain the update methods together:

Copy

Ask AI

```
metadata.parent
 .set("progress", 0.1)
 .append("logs", "Step 1 complete")
 .increment("progress", 0.4)
 .decrement("otherProgress", 0.1);

```

### 
[​
](#example)Example

An example of where you might use parent and root updates is in a task that triggers multiple child tasks in parallel. You could use the parent metadata to track the progress of the child tasks and update the parent task’s progress as each child task completes:

Copy

Ask AI

```
import { CSVRow, UploadedFileData, parseCSVFromUrl } from "@/utils";
import { batch, logger, metadata, schemaTask } from "@trigger.dev/sdk";

export const handleCSVRow = schemaTask({
 id: "handle-csv-row",
 schema: CSVRow,
 run: async (row, { ctx }) => {
 // Do some work with the row

 // Update the parent task's metadata with the progress of this row
 metadata.parent.increment("processedRows", 1).append("rowRuns", ctx.run.id);

 return row;
 },
});

export const handleCSVUpload = schemaTask({
 id: "handle-csv-upload",
 schema: UploadedFileData,
 run: async (file, { ctx }) => {
 metadata.set("status", "fetching");

 const rows = await parseCSVFromUrl(file.url);

 metadata.set("status", "processing").set("totalRows", rows.length);

 const results = await batch.triggerAndWait(
 rows.map((row) => ({ id: "handle-csv-row", payload: row }))
 );

 metadata.set("status", "complete");

 return {
 file,
 rows,
 results,
 };
 },
});

```

Combined with [Realtime](/docs/realtime), you could use this to show a live progress bar of the CSV processing in your frontend, like this:

## 
[​
](#more-metadata-task-examples)More metadata task examples

Using metadata updates in conjunction with our [Realtime React hooks](/docs/realtime/react-hooks/overview) can be a powerful way to build real-time UIs. Here are some example tasks demonstrating how to use metadata in your tasks to track progress, status, and more:

### 
[​
](#progress-tracking)Progress tracking

Track progress with percentage and current step:

Copy

Ask AI

```
import { task, metadata } from "@trigger.dev/sdk";

export const batchProcessingTask = task({
 id: "batch-processing",
 run: async (payload: { records: any[] }) => {
 for (let i = 0; i 

### 
[​
](#status-updates-with-logs)Status updates with logs

Append log entries while maintaining status:

Copy

Ask AI

```
import { task, metadata } from "@trigger.dev/sdk";

export const deploymentTask = task({
 id: "deployment",
 run: async (payload: { version: string }) => {
 metadata.set("status", "initializing");
 metadata.append("logs", "Starting deployment...");

 // Step 1
 metadata.set("status", "building");
 metadata.append("logs", "Building application...");
 await buildApplication();

 // Step 2
 metadata.set("status", "deploying");
 metadata.append("logs", "Deploying to production...");
 await deployToProduction();

 // Step 3
 metadata.set("status", "verifying");
 metadata.append("logs", "Running health checks...");
 await runHealthChecks();

 metadata.set("status", "completed");
 metadata.append("logs", "Deployment successful!");
 },
});

```

### 
[​
](#user-context-and-notifications)User context and notifications

Store user information and notification preferences:

Copy

Ask AI

```
import { task, metadata } from "@trigger.dev/sdk";

export const userTask = task({
 id: "user-task",
 run: async (payload: { userId: string; action: string }) => {
 // Set user context in metadata
 metadata.set("user", {
 id: payload.userId,
 action: payload.action,
 startedAt: new Date().toISOString(),
 });

 // Update status for user notifications
 metadata.set("notification", {
 type: "info",
 message: `Starting ${payload.action} for user ${payload.userId}`,
 });

 await performUserAction(payload);

 metadata.set("notification", {
 type: "success",
 message: `${payload.action} completed successfully`,
 });
 },
});

```

## 
[​
](#metadata-propagation)Metadata propagation

Metadata is NOT propagated to child tasks. If you want to pass metadata to a child task, you must do so explicitly:

Copy

Ask AI

```
import { task, metadata } from "@trigger.dev/sdk";

export const myTask = task({
 id: "my-task",
 run: async (payload: { message: string }) => {
 await metadata.set("progress", 0.5);
 await childTask.trigger(payload, { metadata: metadata.current() });
 },
});

```

## 
[​
](#type-safe-metadata)Type-safe metadata

The metadata APIs are currently loosely typed, accepting any object that is JSON-serializable:

Copy

Ask AI

```
// ❌ You can't pass a top-level array
const handle = await myTask.trigger(
 { message: "hello world" },
 { metadata: [{ user: { name: "Eric", id: "user_1234" } }] }
);

// ❌ You can't pass a string as the entire metadata:
const handle = await myTask.trigger(
 { message: "hello world" },
 { metadata: "this is the metadata" }
);

// ❌ You can't pass in a function or a class instance
const handle = await myTask.trigger(
 { message: "hello world" },
 { metadata: { user: () => "Eric", classInstance: new HelloWorld() } }
);

// ✅ You can pass in dates and other JSON-serializable objects
const handle = await myTask.trigger(
 { message: "hello world" },
 { metadata: { user: { name: "Eric", id: "user_1234" }, date: new Date() } }
);

```

If you pass in an object like a Date, it will be serialized to a string when stored in the
metadata. That also means that when you retrieve it using `metadata.get()` or
`metadata.current()`, you will get a string back. You will need to deserialize it back to a Date
object if you need to use it as a Date.

We recommend wrapping the metadata API in a [Zod](https://zod.dev) schema (or your validator library of choice) to provide type safety:

Copy

Ask AI

```
import { task, metadata } from "@trigger.dev/sdk";
import { z } from "zod";

const Metadata = z.object({
 user: z.object({
 name: z.string(),
 id: z.string(),
 }),
 date: z.coerce.date(), // Coerce the date string back to a Date object
});

type Metadata = z.infer;

// Helper function to get the metadata object in a type-safe way
// Note: you would probably want to use .safeParse instead of .parse in a real-world scenario
function getMetadata() {
 return Metadata.parse(metadata.current());
}

export const myTask = task({
 id: "my-task",
 run: async (payload: { message: string }) => {
 const metadata = getMetadata();
 console.log(metadata.user.name); // "Eric"
 console.log(metadata.user.id); // "user_1234"
 console.log(metadata.date); // Date object
 },
});

```

## 
[​
](#inspecting-metadata)Inspecting metadata

### 
[​
](#dashboard)Dashboard

You can view the metadata for a run in the Trigger.dev dashboard. The metadata will be displayed in the run details view:

### 
[​
](#api)API

You can use the `runs.retrieve()` SDK function to get the metadata for a run:

Copy

Ask AI

```
import { runs } from "@trigger.dev/sdk";

const run = await runs.retrieve("run_1234");

console.log(run.metadata);

```

See the [API reference](/docs/management/runs/retrieve) for more information.

## 
[​
](#size-limit)Size limit

The maximum size of the metadata object is 256KB. If you exceed this limit, the SDK will throw an error. If you are self-hosting Trigger.dev, you can increase this limit by setting the `TASK_RUN_METADATA_MAXIMUM_SIZE` environment variable. For example, to increase the limit to 16KB, you would set `TASK_RUN_METADATA_MAXIMUM_SIZE=16384`.
Was this page helpful?

YesNo

[Suggest edits](https://github.com/triggerdotdev/trigger.dev/edit/main/docs/runs/metadata.mdx)[Raise issue](https://github.com/triggerdotdev/trigger.dev/issues/new?title=Issue on docs&body=Path: /runs/metadata)

[Previous](/docs/tags)[StreamsStream data in realtime from your Trigger.dev tasks to your frontend or backend applications.

Next
](/docs/tasks/streams)
⌘I

On this page
- [Usage](#usage)
- [Updates API](#updates-api)
- [set](#set)
- [del](#del)
- [replace](#replace)
- [append](#append)
- [remove](#remove)
- [increment](#increment)
- [decrement](#decrement)
- [stream](#stream)
- [flush](#flush)
- [Fluent API](#fluent-api)
- [Parent & root updates](#parent-%26-root-updates)
- [Example](#example)
- [More metadata task examples](#more-metadata-task-examples)
- [Progress tracking](#progress-tracking)
- [Status updates with logs](#status-updates-with-logs)
- [User context and notifications](#user-context-and-notifications)
- [Metadata propagation](#metadata-propagation)
- [Type-safe metadata](#type-safe-metadata)
- [Inspecting metadata](#inspecting-metadata)
- [Dashboard](#dashboard)
- [API](#api)
- [Size limit](#size-limit)

[Trigger.dev home page](https://trigger.dev)[x](https://twitter.com/triggerdotdev)[github](https://github.com/triggerdotdev)[linkedin](https://www.linkedin.com/company/triggerdotdev)

Developers
[Changelog](https://trigger.dev/changelog)[Contributing](https://github.com/triggerdotdev/trigger.dev/blob/main/CONTRIBUTING.md)[Open source](https://github.com/triggerdotdev/trigger.dev?tab=Apache-2.0-1-ov-file#readme)[GitHub](https://github.com/triggerdotdev/trigger.dev)[OSS Friends](https://trigger.dev/oss-friends)

Product
[Pricing](https://trigger.dev/pricing)[How it works](https://trigger.dev/#how-it-works)[Features](https://trigger.dev/product)[Roadmap](https://feedback.trigger.dev/roadmap)[FAQs](https://trigger.dev/pricing#faqs)[Uptime status](https://status.trigger.dev/)

Company
[Blog](https://trigger.dev/blog)[Contact](https://trigger.dev/contact)[Careers](https://trigger.dev/jobs)[Privacy](https://trigger.dev/legal/privacy)[Terms of service](https://trigger.dev/legal)

[x](https://twitter.com/triggerdotdev)[github](https://github.com/triggerdotdev)[linkedin](https://www.linkedin.com/company/triggerdotdev)

[Powered by](https://www.mintlify.com?utm_campaign=poweredBy&utm_medium=referral&utm_source=trigger)