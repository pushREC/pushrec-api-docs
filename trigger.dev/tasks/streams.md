Realtime Streams allow you to pipe streaming data from your Trigger.dev tasks to your frontend or backend applications in real-time. This is perfect for use cases like streaming AI completions, progress updates, or any continuous data flow.

Streams v2 requires SDK version **4.1.0 or later**. Make sure to upgrade your `@trigger.dev/sdk`
and `@trigger.dev/react-hooks` packages to use these features. If you’re on an earlier version,
see the [metadata.stream()](/docs/runs/metadata#stream) documentation.

## 
[​
](#overview)Overview

Streams v2 is a major upgrade that provides:

- **Unlimited stream length** (previously capped at 2000 chunks)

- **Unlimited active streams per run** (previously 5)

- **Improved reliability** with automatic resumption on connection loss

- **28-day stream retention** (previously 1 day)

- **Multiple client streams** can pipe to a single stream

- **Enhanced dashboard visibility** for viewing stream data in real-time

## 
[​
](#enabling-streams-v2)Enabling Streams v2

Streams v2 is **automatically enabled** when triggering runs from the SDK using 4.1.0 or later. If you aren’t triggering via the SDK, you’ll need to explicitly enable v2 streams via setting the `x-trigger-realtime-streams-version=v2` header when triggering the task.
If you’d like to **opt-out** of the v2 streams, you can see so in one of the following two ways:

### 
[​
](#option-1:-configure-the-sdk)Option 1: Configure the SDK

**Copy

Ask AI

```
import { auth } from "@trigger.dev/sdk";

auth.configure({
 future: {
 v2RealtimeStreams: false,
 },
});

```

### 
[​
](#option-2:-environment-variable)Option 2: Environment Variable

Set the `TRIGGER_V2_REALTIME_STREAMS=0` environment variable in your backend code (where you trigger tasks).

## 
[​
](#limits-comparison)Limits Comparison

LimitStreams v1Streams v2Maximum stream length2000UnlimitedNumber of active streams per run5UnlimitedMaximum streams per run10UnlimitedMaximum stream TTL1 day28 daysMaximum stream size10MB300 MiB

## 
[​
](#quick-start)Quick Start

The recommended workflow for using Realtime Streams v2:

- Define your streams** in a shared location using `streams.define()`

- **Use the defined stream** in your tasks with `.pipe()`, `.append()`, or `.writer()`

- **Read from the stream** using `.read()` or the `useRealtimeStream` hook in React

This approach gives you full type safety, better code organization, and easier maintenance as your application grows.

## 
[​
](#defining-typed-streams-recommended)Defining Typed Streams (Recommended)

The recommended way to work with streams is to define them once with `streams.define()`. This allows you to specify the chunk type and stream ID in one place, and then reuse that definition throughout your codebase with full type safety.

### 
[​
](#creating-a-defined-stream)Creating a Defined Stream

Define your streams in a shared location (like `app/streams.ts` or `trigger/streams.ts`):

Copy

Ask AI

```
import { streams, InferStreamType } from "@trigger.dev/sdk";

// Define a stream with a specific type
export const aiStream = streams.define({
 id: "ai-output",
});

// Export the type for use in frontend components
export type AIStreamPart = InferStreamType;

```

You can define streams for any JSON-serializable type:

Copy

Ask AI

```
import { streams, InferStreamType } from "@trigger.dev/sdk";
import { UIMessageChunk } from "ai";

// Stream for AI UI message chunks
export const aiStream = streams.define({
 id: "ai",
});

// Stream for progress updates
export const progressStream = streams.define({
 id: "progress",
});

// Stream for simple text
export const logStream = streams.define({
 id: "logs",
});

// Export types
export type AIStreamPart = InferStreamType;
export type ProgressStreamPart = InferStreamType;
export type LogStreamPart = InferStreamType;

```

### 
[​
](#using-defined-streams-in-tasks)Using Defined Streams in Tasks

Once defined, you can use all stream methods on your defined stream:

Copy

Ask AI

```
import { task } from "@trigger.dev/sdk";
import { aiStream } from "./streams";

export const streamTask = task({
 id: "stream-task",
 run: async (payload: { prompt: string }) => {
 // Get a stream from an AI service, database, etc.
 const stream = await getAIStream(payload.prompt);

 // Pipe the stream using your defined stream
 const { stream: readableStream, waitUntilComplete } = aiStream.pipe(stream);

 // Option A: Iterate over the stream locally
 for await (const chunk of readableStream) {
 console.log("Received chunk:", chunk);
 }

 // Option B: Wait for the stream to complete
 await waitUntilComplete();

 return { message: "Stream completed" };
 },
});

```

#### 
[​
](#reading-from-a-stream)Reading from a Stream

Use the defined stream’s `read()` method to consume data from anywhere (frontend, backend, or another task):

Copy

Ask AI

```
import { aiStream } from "./streams";

const stream = await aiStream.read(runId);

for await (const chunk of stream) {
 console.log(chunk); // chunk is typed as the stream's chunk type
}

```

With options:

Copy

Ask AI

```
const stream = await aiStream.read(runId, {
 timeoutInSeconds: 60, // Stop if no data for 60 seconds
 startIndex: 10, // Start from the 10th chunk
});

```

#### 
[​
](#appending-to-a-stream)Appending to a Stream

Use the defined stream’s `append()` method to add a single chunk:

Copy

Ask AI

```
import { task } from "@trigger.dev/sdk";
import { aiStream, progressStream, logStream } from "./streams";

export const appendTask = task({
 id: "append-task",
 run: async (payload) => {
 // Append to different streams with full type safety
 await logStream.append("Processing started");
 await progressStream.append({ step: "Initialization", percent: 0 });

 // Do some work...

 await progressStream.append({ step: "Processing", percent: 50 });
 await logStream.append("Step 1 complete");

 // Do more work...

 await progressStream.append({ step: "Complete", percent: 100 });
 await logStream.append("All steps complete");
 },
});

```

#### 
[​
](#writing-multiple-chunks)Writing Multiple Chunks

Use the defined stream’s `writer()` method for more complex stream writing:

Copy

Ask AI

```
import { task } from "@trigger.dev/sdk";
import { logStream } from "./streams";

export const writerTask = task({
 id: "writer-task",
 run: async (payload) => {
 const { waitUntilComplete } = logStream.writer({
 execute: ({ write, merge }) => {
 // Write individual chunks
 write("Chunk 1");
 write("Chunk 2");

 // Merge another stream
 const additionalStream = ReadableStream.from(["Chunk 3", "Chunk 4", "Chunk 5"]);
 merge(additionalStream);
 },
 });

 await waitUntilComplete();
 },
});

```

### 
[​
](#using-defined-streams-in-react)Using Defined Streams in React

Defined streams work seamlessly with the `useRealtimeStream` hook:

Copy

Ask AI

```
"use client";

import { useRealtimeStream } from "@trigger.dev/react-hooks";
import { aiStream } from "@/app/streams";

export function StreamViewer({ accessToken, runId }: { accessToken: string; runId: string }) {
 // Pass the defined stream directly - full type safety!
 const { parts, error } = useRealtimeStream(aiStream, runId, {
 accessToken,
 timeoutInSeconds: 600,
 });

 if (error) return Error: {error.message}
;
 if (!parts) return 
Loading...
;

 return (

 {parts.map((part, i) => (
 {part}
 ))}

 );
}

```

## 
[​
](#direct-stream-methods-without-defining)Direct Stream Methods (Without Defining)

We strongly recommend using `streams.define()` instead of direct methods. Defined streams provide
better organization, full type safety, and make it easier to maintain your codebase as it grows.

If you have a specific reason to avoid defined streams, you can use stream methods directly by specifying the stream key each time.

### 
[​
](#direct-piping)Direct Piping

Copy

Ask AI

```
import { streams, task } from "@trigger.dev/sdk";

export const directStreamTask = task({
 id: "direct-stream",
 run: async (payload: { prompt: string }) => {
 const stream = await getAIStream(payload.prompt);

 // Specify the stream key directly
 const { stream: readableStream, waitUntilComplete } = streams.pipe("ai-output", stream);

 await waitUntilComplete();
 },
});

```

### 
[​
](#direct-reading)Direct Reading

Copy

Ask AI

```
import { streams } from "@trigger.dev/sdk";

// Specify the stream key when reading
const stream = await streams.read(runId, "ai-output");

for await (const chunk of stream) {
 console.log(chunk);
}

```

### 
[​
](#direct-appending)Direct Appending

Copy

Ask AI

```
import { streams, task } from "@trigger.dev/sdk";

export const directAppendTask = task({
 id: "direct-append",
 run: async (payload) => {
 // Specify the stream key each time
 await streams.append("logs", "Processing started");
 await streams.append("progress", "50%");
 await streams.append("logs", "Complete");
 },
});

```

### 
[​
](#direct-writing)Direct Writing

Copy

Ask AI

```
import { streams, task } from "@trigger.dev/sdk";

export const directWriterTask = task({
 id: "direct-writer",
 run: async (payload) => {
 const { waitUntilComplete } = streams.writer("output", {
 execute: ({ write, merge }) => {
 write("Chunk 1");
 write("Chunk 2");
 },
 });

 await waitUntilComplete();
 },
});

```

## 
[​
](#default-stream)Default Stream

Every run has a “default” stream, allowing you to skip the stream key entirely. This is useful for simple cases where you only need one stream per run.
Using direct methods:

Copy

Ask AI

```
import { streams, task } from "@trigger.dev/sdk";

export const defaultStreamTask = task({
 id: "default-stream",
 run: async (payload) => {
 const stream = getDataStream();

 // No stream key needed - uses "default"
 const { waitUntilComplete } = streams.pipe(stream);

 await waitUntilComplete();
 },
});

// Reading from the default stream
const readStream = await streams.read(runId);

```

## 
[​
](#targeting-different-runs)Targeting Different Runs

You can pipe streams to parent, root, or any other run using the `target` option. This works with both defined streams and direct methods.

### 
[​
](#with-defined-streams)With Defined Streams

Copy

Ask AI

```
import { task } from "@trigger.dev/sdk";
import { logStream } from "./streams";

export const childTask = task({
 id: "child-task",
 run: async (payload, { ctx }) => {
 const stream = getDataStream();

 // Pipe to parent run
 logStream.pipe(stream, { target: "parent" });

 // Pipe to root run
 logStream.pipe(stream, { target: "root" });

 // Pipe to self (default behavior)
 logStream.pipe(stream, { target: "self" });

 // Pipe to a specific run ID
 logStream.pipe(stream, { target: payload.otherRunId });
 },
});

```

### 
[​
](#with-direct-methods)With Direct Methods

Copy

Ask AI

```
import { streams, task } from "@trigger.dev/sdk";

export const childTask = task({
 id: "child-task",
 run: async (payload, { ctx }) => {
 const stream = getDataStream();

 // Pipe to parent run
 streams.pipe("output", stream, { target: "parent" });

 // Pipe to root run
 streams.pipe("output", stream, { target: "root" });

 // Pipe to a specific run ID
 streams.pipe("output", stream, { target: payload.otherRunId });
 },
});

```

## 
[​
](#streaming-from-outside-a-task)Streaming from Outside a Task

If you specify a `target` run ID, you can pipe streams from anywhere (like a Next.js API route):

Copy

Ask AI

```
import { streams } from "@trigger.dev/sdk";
import { openai } from "@ai-sdk/openai";
import { streamText } from "ai";

export async function POST(req: Request) {
 const { messages, runId } = await req.json();

 const result = streamText({
 model: openai("gpt-4o"),
 messages,
 });

 // Pipe AI stream to a Trigger.dev run
 const { stream } = streams.pipe("ai-stream", result.toUIMessageStream(), {
 target: runId,
 });

 return new Response(stream as any, {
 headers: { "Content-Type": "text/event-stream" },
 });
}

```

## 
[​
](#react-hook)React Hook

Use the `useRealtimeStream` hook to subscribe to streams in your React components.

### 
[​
](#with-defined-streams-recommended)With Defined Streams (Recommended)

Copy

Ask AI

```
"use client";

import { useRealtimeStream } from "@trigger.dev/react-hooks";
import { aiStream } from "@/app/streams";

export function StreamViewer({ accessToken, runId }: { accessToken: string; runId: string }) {
 // Pass the defined stream directly for full type safety
 const { parts, error } = useRealtimeStream(aiStream, runId, {
 accessToken,
 timeoutInSeconds: 600,
 onData: (chunk) => {
 console.log("New chunk:", chunk); // chunk is typed!
 },
 });

 if (error) return Error: {error.message}
;
 if (!parts) return 
Loading...
;

 return (

 {parts.map((part, i) => (
 {part}
 ))}

 );
}

```

### 
[​
](#with-direct-stream-keys)With Direct Stream Keys

If you prefer not to use defined streams, you can specify the stream key directly:

Copy

Ask AI

```
"use client";

import { useRealtimeStream } from "@trigger.dev/react-hooks";

export function StreamViewer({ accessToken, runId }: { accessToken: string; runId: string }) {
 const { parts, error } = useRealtimeStream(runId, "ai-output", {
 accessToken,
 timeoutInSeconds: 600,
 });

 if (error) return Error: {error.message}
;
 if (!parts) return 
Loading...
;

 return (

 {parts.map((part, i) => (
 {part}
 ))}

 );
}

```

### 
[​
](#using-default-stream)Using Default Stream

Copy

Ask AI

```
// Omit stream key to use the default stream
const { parts, error } = useRealtimeStream(runId, {
 accessToken,
});

```

### 
[​
](#hook-options)Hook Options

Copy

Ask AI

```
const { parts, error } = useRealtimeStream(streamDef, runId, {
 accessToken: "pk_...", // Required: Public access token
 baseURL: "https://api.trigger.dev", // Optional: Custom API URL
 timeoutInSeconds: 60, // Optional: Timeout (default: 60)
 startIndex: 0, // Optional: Start from specific chunk
 throttleInMs: 16, // Optional: Throttle updates (default: 16ms)
 onData: (chunk) => {}, // Optional: Callback for each chunk
});

```

## 
[​
](#complete-example:-ai-streaming)Complete Example: AI Streaming

### 
[​
](#define-the-stream)Define the stream

Copy

Ask AI

```
// app/streams.ts
import { streams, InferStreamType } from "@trigger.dev/sdk";
import { UIMessageChunk } from "ai";

export const aiStream = streams.define({
 id: "ai",
});

export type AIStreamPart = InferStreamType;

```

### 
[​
](#create-the-task)Create the task

Copy

Ask AI

```
// trigger/ai-task.ts
import { task } from "@trigger.dev/sdk";
import { openai } from "@ai-sdk/openai";
import { streamText } from "ai";
import { aiStream } from "@/app/streams";

export const generateAI = task({
 id: "generate-ai",
 run: async (payload: { prompt: string }) => {
 const result = streamText({
 model: openai("gpt-4o"),
 prompt: payload.prompt,
 });

 const { waitUntilComplete } = aiStream.pipe(result.toUIMessageStream());

 await waitUntilComplete();

 return { success: true };
 },
});

```

### 
[​
](#frontend-component)Frontend component

Copy

Ask AI

```
// components/ai-stream.tsx
"use client";

import { useRealtimeStream } from "@trigger.dev/react-hooks";
import { aiStream } from "@/app/streams";

export function AIStream({ accessToken, runId }: { accessToken: string; runId: string }) {
 const { parts, error } = useRealtimeStream(aiStream, runId, {
 accessToken,
 timeoutInSeconds: 300,
 });

 if (error) return Error: {error.message}
;
 if (!parts) return 
Loading...
;

 return (

 {parts.map((part, i) => (
 {part}
 ))}

 );
}

```

## 
[​
](#migration-from-v1)Migration from v1

If you’re using the old `metadata.stream()` API, here’s how to migrate to the recommended v2 approach:

### 
[​
](#step-1:-define-your-streams)Step 1: Define Your Streams

Create a shared streams definition file:

Copy

Ask AI

```
// app/streams.ts or trigger/streams.ts
import { streams, InferStreamType } from "@trigger.dev/sdk";

export const myStream = streams.define({
 id: "my-stream",
});

export type MyStreamPart = InferStreamType;

```

### 
[​
](#step-2:-update-your-tasks)Step 2: Update Your Tasks

Replace `metadata.stream()` with the defined stream’s `pipe()` method:

Copy

Ask AI

```
// Before (v1)
import { metadata, task } from "@trigger.dev/sdk";

export const myTask = task({
 id: "my-task",
 run: async (payload) => {
 const stream = getDataStream();
 await metadata.stream("my-stream", stream);
 },
});

```