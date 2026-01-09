---
source: '[unknown - agent-02-javascript-sdk.md]'
scraped: 2025-12-28
api_provider: FAL.ai
discovery_tier: 3
verified: false
---
 FAL.ai JavaScript/TypeScript SDK - Complete Documentation

## Executive Summary

The `@fal-ai/client` is the official JavaScript/TypeScript SDK for interacting with fal.ai's generative AI model APIs. This comprehensive documentation covers every aspect of the SDK from installation to advanced usage patterns, targeting SaaS developers building production applications.

**Package Information:**
- **Current Package:** `@fal-ai/client` (v1.8.1 as of Dec 2025)
- **Deprecated Package:** `@fal-ai/serverless-client` (migrated to @fal-ai/client in v1.0.0)
- **License:** MIT
- **Platform Support:** Web (Browser), Node.js, React Native
- **TypeScript:** Full native support with type definitions included

---

## Table of Contents

1. [Installation & Setup](#installation--setup)
2. [Authentication & Configuration](#authentication--configuration)
3. [Core Client Methods](#core-client-methods)
4. [Queue System](#queue-system)
5. [Realtime WebSocket Client](#realtime-websocket-client)
6. [Streaming API](#streaming-api)
7. [Storage & File Uploads](#storage--file-uploads)
8. [TypeScript Types & Interfaces](#typescript-types--interfaces)
9. [Error Handling](#error-handling)
10. [Proxy Configuration](#proxy-configuration)
11. [React/Next.js Integration](#reactnextjs-integration)
12. [Webhooks](#webhooks)
13. [Advanced Patterns](#advanced-patterns)
14. [Security Best Practices](#security-best-practices)

---

## Installation & Setup

### NPM Installation

```bash
# Install the official client
npm install --save @fal-ai/client

# For Next.js applications with proxy support
npm install --save @fal-ai/client @fal-ai/server-proxy
```

### Yarn Installation

```bash
yarn add @fal-ai/client
yarn add @fal-ai/server-proxy  # For Next.js proxy
```

### PNPM Installation

```bash
pnpm add @fal-ai/client
pnpm add @fal-ai/server-proxy  # For Next.js proxy
```

### Migration from Deprecated Package

If you're using the old `@fal-ai/serverless-client` package:

```bash
# Remove deprecated package
npm uninstall @fal-ai/serverless-client

# Install new package
npm install --save @fal-ai/client
```

**Breaking Changes in v1.0.0:**
- APIs now return a `Result<Output>` type containing `data` (API output) and `requestId`
- Package renamed from `@fal-ai/serverless-client` to `@fal-ai/client`
- Some methods may have signature changes

---

## Authentication & Configuration

### Basic Configuration

```typescript
import { fal } from "@fal-ai/client";

// Configure with API key
fal.config({
  credentials: "YOUR_FAL_KEY",
});
```

### Environment Variable Configuration (Recommended)

The SDK auto-configures credentials from environment variables:

**Option 1: Single Key**

```bash
# .env or .env.local
FAL_KEY=your_api_key_here
```

**Option 2: Key ID + Secret**

```bash
# .env or .env.local
FAL_KEY_ID=your_key_id
FAL_KEY_SECRET=your_key_secret
```

```typescript
import { fal } from "@fal-ai/client";

// No manual config needed - auto-loads from environment
// Looks for FAL_KEY or FAL_KEY_ID + FAL_KEY_SECRET
```

### Configuration Object Type

```typescript
interface FalConfig {
  credentials?: string;        // "KEY" or "KEY_ID:KEY_SECRET"
  proxyUrl?: string;          // URL to proxy endpoint
  requestMiddleware?: (config: RequestConfig) => RequestConfig;
}
```

### Configuration Method

```typescript
fal.config({
  credentials: "FAL_KEY_ID:FAL_KEY_SECRET",
  proxyUrl: "/api/fal/proxy",  // Optional: route through proxy
});
```

### Obtaining API Keys

1. Visit [fal.ai Dashboard](https://fal.ai/dashboard/keys)
2. Generate a new API key
3. Store securely (use environment variables, never commit to code)

**Key Generation via CLI:**

```bash
# Generate key-based authentication credentials
fal-serverless key generate
```

This outputs `FAL_KEY_ID` and `FAL_KEY_SECRET` for use in your configuration.

---

## Core Client Methods

### FalClient Interface

```typescript
interface FalClient {
  queue: QueueClient;
  realtime: RealtimeClient;
  storage: StorageClient;
  stream: StreamingMethod;
  streaming: StreamingClient;
  run<Id>(endpointId: Id, options: RunOptions<InputType<Id>>): Promise<Result<OutputType<Id>>>;
  subscribe<Id>(endpointId: Id, options: RunOptions<InputType<Id>> & QueueSubscribeOptions): Promise<Result<OutputType<Id>>>;
}
```

### 1. `fal.run()` - Direct Execution

**Description:** Simplest method to execute a model endpoint. Blocks until response is received. **Not recommended for most use cases** due to blocking behavior and connection sensitivity.

**TypeScript Signature:**

```typescript
run<Id extends EndpointId>(
  endpointId: Id,
  options: RunOptions<InputType<Id>>
): Promise<Result<OutputType<Id>>>
```

**RunOptions Interface:**

```typescript
interface RunOptions<Input> {
  input: Input;          // Model-specific input parameters
  path?: string;         // Optional subpath for endpoint
  method?: 'GET' | 'POST';
}
```

**Basic Example:**

```typescript
import { fal } from "@fal-ai/client";

const result = await fal.run("fal-ai/flux/dev", {
  input: {
    prompt: "A cat wearing a suit and tie",
    seed: 6252023,
    image_size: "landscape_4_3",
    num_images: 1,
  },
});

console.log(result.data);      // Model output
console.log(result.requestId); // Request identifier
```

**When to Use:**
- Quick testing/prototyping
- Short-running operations (<5 seconds)
- Server-side scripts where blocking is acceptable

**When NOT to Use:**
- Production applications (use `subscribe` instead)
- Long-running operations (>5 seconds)
- Browser/client-side code (connection interruptions lose request)

---

### 2. `fal.subscribe()` - Queue-Based Execution (Recommended)

**Description:** The recommended method for most use cases. Submits request to queue, handles polling automatically, and returns result when complete.

**TypeScript Signature:**

```typescript
subscribe<Id extends EndpointId>(
  endpointId: Id,
  options: RunOptions<InputType<Id>> & QueueSubscribeOptions
): Promise<Result<OutputType<Id>>>
```

**QueueSubscribeOptions Interface:**

```typescript
interface QueueSubscribeOptions {
  logs?: boolean;                      // Enable logging
  onQueueUpdate?: (update: QueueUpdate) => void;  // Progress callback
  pollInterval?: number;               // Poll frequency in ms (default: 1000)
  timeout?: number;                    // Max wait time in ms
  webhookUrl?: string;                 // Optional webhook for completion notification
}
```

**QueueUpdate Type:**

```typescript
type QueueUpdate = {
  status: "IN_QUEUE" | "IN_PROGRESS" | "COMPLETED";
  position?: number;        // Queue position (when IN_QUEUE)
  logs?: LogEntry[];        // Log entries (when logs: true)
  requestId: string;
};

interface LogEntry {
  timestamp: string;
  message: string;
}
```

**Basic Example:**

```typescript
const result = await fal.subscribe("fal-ai/flux/dev", {
  input: {
    prompt: "Photo of a rhino dressed in suit and tie sitting at a table in a bar",
  },
});

console.log(result.data);
console.log(result.requestId);
```

**With Queue Updates:**

```typescript
const result = await fal.subscribe("fal-ai/flux/dev", {
  input: {
    prompt: "A futuristic cityscape at sunset",
  },
  logs: true,
  onQueueUpdate: (update) => {
    console.log("Status:", update.status);

    if (update.status === "IN_QUEUE") {
      console.log("Queue position:", update.position);
    }

    if (update.status === "IN_PROGRESS" && update.logs) {
      update.logs.forEach((log) => {
        console.log(`[${log.timestamp}]`, log.message);
      });
    }
  },
});
```

**React Integration Example:**

```typescript
import { useState, useCallback } from 'react';
import { fal } from "@fal-ai/client";

function ImageGenerator() {
  const [result, setResult] = useState(null);
  const [loading, setLoading] = useState(false);
  const [queuePosition, setQueuePosition] = useState(null);
  const [logs, setLogs] = useState<string[]>([]);

  const generateImage = useCallback(async (prompt: string) => {
    setLoading(true);
    setLogs([]);
    setQueuePosition(null);

    try {
      const response = await fal.subscribe("fal-ai/flux/dev", {
        input: { prompt },
        logs: true,
        onQueueUpdate(update) {
          if (update.status === "IN_QUEUE") {
            setQueuePosition(update.position);
          }

          if (update.status === "IN_PROGRESS") {
            setQueuePosition(null);
            if (update.logs) {
              setLogs(update.logs.map(log => log.message));
            }
          }
        },
      });

      setResult(response.data);
    } catch (error) {
      console.error("Generation failed:", error);
    } finally {
      setLoading(false);
    }
  }, []);

  return (
    <div>
      {loading && queuePosition && (
        <p>Queue position: {queuePosition}</p>
      )}
      {loading && logs.length > 0 && (
        <div>
          {logs.map((log, i) => <p key={i}>{log}</p>)}
        </div>
      )}
      {result && <img src={result.images[0].url} alt="Generated" />}
    </div>
  );
}
```

**Result Type:**

```typescript
interface Result<Output> {
  data: Output;           // Model-specific output
  requestId: string;      // Unique request identifier
}
```

**Common Input Parameters:**

Most text-to-image models support these parameters:

```typescript
interface CommonImageInput {
  prompt: string;                    // Text description
  negative_prompt?: string;          // What to avoid
  image_size?: string;               // "square" | "landscape_4_3" | "portrait_4_3" | etc.
  num_images?: number;               // Number of images to generate
  num_inference_steps?: number;      // Generation steps (more = higher quality)
  guidance_scale?: number;           // Prompt adherence (1-20)
  seed?: number;                     // For reproducible results
  enable_safety_checker?: boolean;   // Content safety filtering
}
```

**Image-to-Image Parameters:**

```typescript
interface ImageToImageInput extends CommonImageInput {
  image_url: string;       // Input image URL or base64 data URI
  strength?: number;       // Transformation strength (0.1-1.0)
}
```

---

### 3. Endpoint Identifier Format

**Structure:**

```
{namespace}/{model-name}[/{subpath}]
```

**Examples:**

```typescript
// Basic format
"fal-ai/fast-sdxl"

// With subpath
"fal-ai/flux/dev"
"fal-ai/flux/schnell"
"fal-ai/flux/dev/image-to-image"

// User endpoints
"user/app-alias"
```

**Available Models:**

- Text-to-Image: `fal-ai/flux/dev`, `fal-ai/flux/schnell`, `fal-ai/fast-sdxl`
- Image-to-Image: `fal-ai/flux/dev/image-to-image`, `fal-ai/esrgan`
- Video: `fal-ai/fast-svd-lcm`, `fal-ai/kling-video/v1.6/pro/text-to-video`
- Audio: `fal-ai/dia-tts`
- Realtime: `fal-ai/fast-lcm-diffusion`, `fal-ai/lcm-sd15-i2i`
- And 600+ more models

Browse all models at: https://fal.ai/models

---

## Queue System

The queue system provides reliable, scalable request processing with status tracking, logging, and webhook support.

### Queue Client Interface

```typescript
interface QueueClient {
  submit<Id>(
    endpointId: Id,
    options: RunOptions<InputType<Id>>
  ): Promise<QueueSubmitResult>;

  status(requestId: string): Promise<QueueStatus>;

  result<Output>(requestId: string): Promise<Output>;
}
```

### 1. `fal.queue.submit()` - Submit to Queue

Submit a request and receive a request ID for later retrieval.

```typescript
const { request_id } = await fal.queue.submit("fal-ai/flux/dev", {
  input: {
    prompt: "A serene mountain landscape",
  },
});

console.log("Request ID:", request_id);
// Save this ID to retrieve results later
```

**QueueSubmitResult Type:**

```typescript
interface QueueSubmitResult {
  request_id: string;       // Unique request identifier
  status_url: string;       // URL to check status
  cancel_url: string;       // URL to cancel request
  response_url: string;     // URL to fetch result when complete
}
```

---

### 2. `fal.queue.status()` - Check Request Status

```typescript
const status = await fal.queue.status(request_id);

console.log("Status:", status.status);
console.log("Logs:", status.logs);
```

**QueueStatus Type:**

```typescript
type QueueStatus =
  | InQueueQueueStatus
  | InProgressQueueStatus
  | CompletedQueueStatus;

interface InQueueQueueStatus {
  status: "IN_QUEUE";
  request_id: string;
  position: number;         // Position in queue
  response_url: string;
  status_url: string;
  cancel_url: string;
}

interface InProgressQueueStatus {
  status: "IN_PROGRESS";
  request_id: string;
  logs?: LogEntry[];        // Available when logs enabled
  response_url: string;
  status_url: string;
  cancel_url: string;
  metrics?: {
    inference_time?: number;
  };
}

interface CompletedQueueStatus {
  status: "COMPLETED";
  request_id: string;
  response_url: string;
  logs?: LogEntry[];
  metrics?: {
    inference_time: number;
    total_time: number;
  };
}
```

---

### 3. `fal.queue.result()` - Retrieve Result

Once status is "COMPLETED", fetch the result:

```typescript
const result = await fal.queue.result(request_id);

console.log(result);  // Model output
```

**Complete Queue Workflow Example:**

```typescript
import { fal } from "@fal-ai/client";

async function processWithQueue() {
  // 1. Submit to queue
  const { request_id } = await fal.queue.submit("fal-ai/flux/dev", {
    input: {
      prompt: "A magical forest at twilight",
    },
  });

  console.log("Submitted with request ID:", request_id);

  // 2. Poll status
  let status = await fal.queue.status(request_id);

  while (status.status !== "COMPLETED") {
    console.log(`Status: ${status.status}`);

    if (status.status === "IN_QUEUE") {
      console.log(`Queue position: ${status.position}`);
    }

    // Wait before polling again
    await new Promise(resolve => setTimeout(resolve, 1000));

    status = await fal.queue.status(request_id);
  }

  // 3. Retrieve result
  const result = await fal.queue.result(request_id);

  console.log("Result:", result);
  return result;
}
```

**Why Use Queue Directly?**
- Store request IDs in database for long-running tasks
- Implement custom polling logic
- Build webhook-based workflows
- Need fine-grained control over request lifecycle

**Note:** In most cases, `fal.subscribe()` is simpler as it handles polling automatically.

---

## Realtime WebSocket Client

For interactive applications requiring low-latency, bidirectional communication, the realtime client provides WebSocket-based connections.

**Only models explicitly supporting realtime inference can be used** (e.g., `fal-ai/fast-lcm-diffusion`, `fal-ai/lcm-sd15-i2i`). Standard queue-based models do not have a realtime endpoint.

### Realtime Client Interface

```typescript
interface RealtimeClient {
  connect<Id>(
    endpointId: Id,
    options: RealtimeConnectionOptions<InputType<Id>, OutputType<Id>>
  ): RealtimeConnection<InputType<Id>>;
}
```

### RealtimeConnectionOptions

```typescript
interface RealtimeConnectionOptions<Input, Output> {
  onResult: (result: Output) => void;      // Called when result received
  onError: (error: Error) => void;         // Called on errors
  throttleInterval?: number;                // Milliseconds between sends
}
```

### RealtimeConnection

```typescript
interface RealtimeConnection<Input> {
  send(input: Input): void;     // Send input to model
  close(): void;                // Close WebSocket connection
}
```

### Basic Example: Text-to-Image Realtime

```typescript
import { fal } from "@fal-ai/client";

const connection = fal.realtime.connect("fal-ai/fast-lcm-diffusion", {
  onResult: (result) => {
    console.log("Received result:", result);
    // Update UI with generated image
    displayImage(result.images[0].url);
  },
  onError: (error) => {
    console.error("Realtime error:", error);
  },
});

// Send generation request
connection.send({
  prompt: "a cat wearing sunglasses",
  sync_mode: true,
});

// Later: close connection
connection.close();
```

### Advanced Example: Image-to-Image Realtime

```typescript
const connection = fal.realtime.connect("fal-ai/lcm-sd15-i2i", {
  onResult: (result) => {
    updatePreview(result.images[0].url);
  },
  onError: (error) => {
    console.error("Error:", error);
  },
});

// Send image transformation request
connection.send({
  prompt: "masterpiece, colorful, photo of a beach in hawaii, sun",
  image_url: "https://example.com/beach.png",
});
```

### React Hook Example: Canvas Drawing with Realtime

```typescript
import { useEffect, useRef, useState } from 'react';
import { fal } from "@fal-ai/client";

function RealtimeCanvas() {
  const connectionRef = useRef(null);
  const [image, setImage] = useState(null);

  useEffect(() => {
    // Connect on mount
    connectionRef.current = fal.realtime.connect("fal-ai/fast-lcm-diffusion", {
      onResult: (result) => {
        setImage(result.images[0].url);
      },
      onError: (error) => {
        console.error("Realtime error:", error);
      },
    });

    // Cleanup on unmount
    return () => {
      if (connectionRef.current) {
        connectionRef.current.close();
      }
    };
  }, []);

  const handleCanvasChange = (prompt: string) => {
    if (connectionRef.current) {
      connectionRef.current.send({
        prompt,
        sync_mode: true,
      });
    }
  };

  return (
    <div>
      <canvas onChange={(e) => handleCanvasChange(e.target.value)} />
      {image && <img src={image} alt="Generated" />}
    </div>
  );
}
```

### When to Use Realtime vs Streaming vs Subscribe

| Method | Use Case | Connection | Latency |
|--------|----------|------------|---------|
| **realtime()** | Interactive apps, multiple requests over persistent connection | WebSocket (bidirectional) | ~150ms |
| **stream()** | Progressive output from single request (image previews) | SSE (server→client) | Variable |
| **subscribe()** | Standard async generation, most use cases | HTTP polling | Seconds |

**Realtime Models:**
- `fal-ai/fast-lcm-diffusion` - Fast Latent Consistency text-to-image
- `fal-ai/lcm-sd15-i2i` - Optimized Latent Consistency image-to-image

**Demo Applications:**
- [fal.ai/dynamic](https://fal.ai/dynamic) - Draw AI images in real time
- [lcm-websocket-demo](https://github.com/fal-ai/lcm-websocket-demo) - React canvas demo

---

## Streaming API

Streaming enables receiving progressive results as the model generates output, useful for showing previews during generation.

### Stream Method Signature

```typescript
stream<Id>(
  endpointId: Id,
  options: StreamOptions<InputType<Id>>
): Promise<FalStream<InputType<Id>, OutputType<Id>>>
```

### FalStream Interface

```typescript
interface FalStream<Input, Output> extends AsyncIterable<StreamEvent<Output>> {
  done(): Promise<Output>;      // Wait for final result
  cancel(): void;               // Cancel stream
}

type StreamEvent<Output> = {
  type: "progress" | "complete";
  data: Partial<Output> | Output;
};
```

### Basic Streaming Example

```typescript
import { fal } from "@fal-ai/client";

const stream = await fal.stream("fal-ai/flux/dev", {
  input: {
    prompt: "A serene mountain landscape at sunrise",
  },
});

// Iterate over streaming events
for await (const event of stream) {
  if (event.type === "progress") {
    console.log("Progress update:", event.data);
    // Show preview image
    updatePreview(event.data.images?.[0]?.url);
  }
}

// Get final result
const result = await stream.done();
console.log("Final result:", result);
```

### React Streaming Example

```typescript
import { useState, useCallback } from 'react';
import { fal } from "@fal-ai/client";

function StreamingImageGenerator() {
  const [preview, setPreview] = useState(null);
  const [final, setFinal] = useState(null);
  const [loading, setLoading] = useState(false);

  const generate = useCallback(async (prompt: string) => {
    setLoading(true);
    setPreview(null);
    setFinal(null);

    try {
      const stream = await fal.stream("fal-ai/flux/dev", {
        input: { prompt },
      });

      for await (const event of stream) {
        if (event.type === "progress" && event.data.images) {
          setPreview(event.data.images[0].url);
        }
      }

      const result = await stream.done();
      setFinal(result.images[0].url);
    } catch (error) {
      console.error("Streaming failed:", error);
    } finally {
      setLoading(false);
    }
  }, []);

  return (
    <div>
      {loading && preview && (
        <img src={preview} alt="Preview" className="preview" />
      )}
      {final && (
        <img src={final} alt="Final result" />
      )}
    </div>
  );
}
```

### Streaming Models

Not all models support streaming. Check model documentation for `/stream` endpoint availability.

**Known Streaming Endpoints:**
- `fal-ai/flux/dev` (via streaming variant)
- `fal-ai/flux-lora/stream`

**Note:** Streaming endpoints typically generate `num_images: 1` only.

---

## Storage & File Uploads

The storage client provides file upload capabilities for models requiring file inputs.

### Storage Client Interface

```typescript
interface StorageClient {
  upload(file: File | Blob | Buffer): Promise<string>;
}
```

### Browser File Upload Example

```typescript
import { fal } from "@fal-ai/client";

// Upload file from input element
const fileInput = document.querySelector('input[type="file"]');
const file = fileInput.files[0];

const url = await fal.storage.upload(file);

console.log("Uploaded file URL:", url);

// Use URL in model request
const result = await fal.subscribe("fal-ai/flux/dev/image-to-image", {
  input: {
    image_url: url,
    prompt: "transform into watercolor painting",
  },
});
```

### Node.js File Upload Example

```typescript
import { fal } from "@fal-ai/client";
import fs from "fs";

// Read file from filesystem
const fileBuffer = fs.readFileSync("./input-image.png");

// Upload to fal storage
const url = await fal.storage.upload(fileBuffer);

console.log("Uploaded:", url);

// Use in request
const result = await fal.subscribe("fal-ai/esrgan", {
  input: {
    image_url: url,
  },
});
```

### React File Upload Example

```typescript
import { useState } from 'react';
import { fal } from "@fal-ai/client";

function ImageUploader() {
  const [uploading, setUploading] = useState(false);
  const [imageUrl, setImageUrl] = useState<string | null>(null);

  const handleFileChange = async (e: React.ChangeEvent<HTMLInputElement>) => {
    const file = e.target.files?.[0];
    if (!file) return;

    setUploading(true);
    try {
      const url = await fal.storage.upload(file);
      setImageUrl(url);
      console.log("File uploaded:", url);
    } catch (error) {
      console.error("Upload failed:", error);
    } finally {
      setUploading(false);
    }
  };

  return (
    <div>
      <input
        type="file"
        onChange={handleFileChange}
        accept="image/*"
        disabled={uploading}
      />
      {uploading && <p>Uploading...</p>}
      {imageUrl && <img src={imageUrl} alt="Uploaded" />}
    </div>
  );
}
```

### Base64 Data URI Support

You can pass Base64 data URIs directly without uploading:

```typescript
const result = await fal.subscribe("fal-ai/flux/dev/image-to-image", {
  input: {
    image_url: "data:image/png;base64,iVBORw0KGgoAAAANS...",
    prompt: "make it look like a sketch",
  },
});
```

### Auto-Upload Behavior

The client will automatically upload File/Blob/Buffer objects:

```typescript
// File automatically uploaded
const result = await fal.subscribe("fal-ai/esrgan", {
  input: {
    image_url: fileObject,  // Automatically uploaded
  },
});
```

### Supported Image Formats

- JPG/JPEG
- PNG
- WEBP
- GIF
- AVIF

### File Input Requirements

- Image URLs must be **publicly accessible**
- No authentication/login walls
- For private files, use fal.storage.upload() first
- Base64 data URIs are decoded automatically

---

## TypeScript Types & Interfaces

### Core Type Exports

The SDK exports comprehensive TypeScript types for type-safe development.

```typescript
import type {
  FalClient,
  QueueClient,
  RealtimeClient,
  StorageClient,
  StreamingClient,
  Result,
  RunOptions,
  QueueSubscribeOptions,
  QueueStatus,
  InQueueQueueStatus,
  InProgressQueueStatus,
  CompletedQueueStatus,
  ApiError,
  ValidationError,
  RequestLog,
  Metrics,
} from "@fal-ai/client";
```

### Result Type

```typescript
interface Result<Output> {
  data: Output;           // Model-specific output
  requestId: string;      // Unique request identifier
}

// Usage
const result = await fal.subscribe("fal-ai/flux/dev", { input });
const images = result.data.images;  // Type-safe access
const id = result.requestId;
```

### Generic Input/Output Types

The SDK uses TypeScript generics for endpoint-specific type inference:

```typescript
// InputType<Id> and OutputType<Id> are automatically inferred
const result = await fal.subscribe("fal-ai/flux/dev", {
  input: {
    prompt: "text",      // TypeScript knows valid properties
    // invalid_prop: "" // Would show type error
  },
});

// result.data has correct output type
result.data.images;      // Valid
// result.data.invalid;  // Type error
```

### Custom Type Definitions

For endpoints without built-in types:

```typescript
interface CustomInput {
  prompt: string;
  custom_param: number;
}

interface CustomOutput {
  result: string;
  metadata: Record<string, any>;
}

const result = await fal.subscribe<CustomOutput>("user/custom-endpoint", {
  input: {
    prompt: "test",
    custom_param: 42,
  } as CustomInput,
});

const output: CustomOutput = result.data;
```

### Queue Types

```typescript
// Queue status discriminated union
type QueueStatus =
  | InQueueQueueStatus
  | InProgressQueueStatus
  | CompletedQueueStatus;

// Use with type guards
function handleStatus(status: QueueStatus) {
  if (status.status === "IN_QUEUE") {
    console.log("Position:", status.position);
  } else if (status.status === "IN_PROGRESS") {
    console.log("Processing...");
  } else if (status.status === "COMPLETED") {
    console.log("Done!");
  }
}
```

### RequestLog Type

```typescript
interface RequestLog {
  timestamp: string;      // ISO 8601 format
  message: string;        // Log message
}

// Usage in queue updates
onQueueUpdate(update) {
  if (update.logs) {
    update.logs.forEach((log: RequestLog) => {
      console.log(`[${log.timestamp}] ${log.message}`);
    });
  }
}
```

### Metrics Type

```typescript
interface Metrics {
  inference_time?: number;    // Model inference time (ms)
  total_time?: number;        // Total request time (ms)
}

// Available in completed queue status
const status = await fal.queue.status(requestId);
if (status.status === "COMPLETED" && status.metrics) {
  console.log("Inference took:", status.metrics.inference_time, "ms");
}
```

---

## Error Handling

### Error Types

The SDK exports specific error classes:

```typescript
import { ApiError, ValidationError } from "@fal-ai/client";
```

### ApiError

Thrown for API-level errors (4xx, 5xx responses).

```typescript
class ApiError extends Error {
  status: number;           // HTTP status code
  body: any;                // Response body
  requestId?: string;       // Request ID if available
}
```

### ValidationError

Thrown for input validation failures (422 Unprocessable Entity).

```typescript
class ValidationError extends Error {
  errors: ValidationDetail[];
}

interface ValidationDetail {
  loc: string[];          // Error location path
  msg: string;            // Human-readable message
  type: string;           // Error type identifier
  input?: any;            // Problematic input value
  ctx?: Record<string, any>;  // Additional context
  url?: string;           // Documentation URL
}
```

### Error Categories

#### 1. Image Load Error (Not Retryable)

Server failed to download file from provided URL.

```typescript
{
  type: "image_load_error",
  msg: "Failed to download image from URL",
  retryable: false
}
```

**Fix:** Ensure URL is publicly accessible, not behind authentication.

#### 2. Content Safety Error (Not Retryable)

Input flagged by automated safety systems.

```typescript
{
  type: "content_safety_error",
  msg: "Content violates usage policies",
  retryable: false
}
```

**Fix:** Revise prompt/input to comply with content policies.

#### 3. Validation Error (Not Retryable)

Input fails validation rules.

```typescript
{
  type: "validation_error",
  loc: ["body", "num_inference_steps"],
  msg: "Input should be greater than 0",
  input: -1,
  retryable: false
}
```

**Fix:** Correct input parameter to match validation rules.

#### 4. Internal Server Error (Sometimes Retryable)

Unexpected server issue.

```typescript
{
  type: "internal_server_error",
  msg: "An unexpected error occurred",
  retryable: true  // or false
}
```

**Fix:** Retry request if `retryable: true`. Contact support if persistent.

### Error Handling Patterns

#### Basic Try-Catch

```typescript
import { fal, ApiError, ValidationError } from "@fal-ai/client";

try {
  const result = await fal.subscribe("fal-ai/flux/dev", {
    input: { prompt: "test" },
  });
  console.log(result.data);
} catch (error) {
  if (error instanceof ValidationError) {
    console.error("Input validation failed:");
    error.errors.forEach(e => {
      console.error(`- ${e.loc.join('.')}: ${e.msg}`);
    });
  } else if (error instanceof ApiError) {
    console.error(`API error ${error.status}:`, error.body);
  } else {
    console.error("Unexpected error:", error);
  }
}
```

#### Retry Logic

```typescript
async function generateWithRetry(prompt: string, maxRetries = 3) {
  for (let attempt = 1; attempt <= maxRetries; attempt++) {
    try {
      return await fal.subscribe("fal-ai/flux/dev", {
        input: { prompt },
      });
    } catch (error) {
      if (error instanceof ApiError && error.status >= 500) {
        // Server error - retry
        if (attempt < maxRetries) {
          const delay = Math.pow(2, attempt) * 1000;  // Exponential backoff
          console.log(`Retry ${attempt}/${maxRetries} after ${delay}ms`);
          await new Promise(resolve => setTimeout(resolve, delay));
          continue;
        }
      }
      // Non-retryable error or max retries reached
      throw error;
    }
  }
}
```

#### React Error Boundary

```typescript
import { useState, useCallback } from 'react';
import { fal, ApiError, ValidationError } from "@fal-ai/client";

function ImageGenerator() {
  const [error, setError] = useState<string | null>(null);

  const generate = useCallback(async (prompt: string) => {
    setError(null);

    try {
      const result = await fal.subscribe("fal-ai/flux/dev", {
        input: { prompt },
      });
      return result.data;
    } catch (err) {
      if (err instanceof ValidationError) {
        setError("Invalid input: " + err.errors[0].msg);
      } else if (err instanceof ApiError) {
        if (err.status === 429) {
          setError("Rate limit exceeded. Please try again later.");
        } else if (err.status >= 500) {
          setError("Server error. Please try again.");
        } else {
          setError("Request failed: " + err.message);
        }
      } else {
        setError("An unexpected error occurred");
      }
      return null;
    }
  }, []);

  return (
    <div>
      {error && <div className="error">{error}</div>}
    </div>
  );
}
```

### Common Error Scenarios

| Error | Cause | Solution |
|-------|-------|----------|
| 401 Unauthorized | Invalid/missing API key | Check credentials configuration |
| 422 Validation Error | Invalid input parameters | Review error details, fix input |
| 429 Rate Limit | Too many requests | Implement backoff/retry logic |
| 500 Internal Error | Server issue | Retry with exponential backoff |
| Image Load Error | URL inaccessible | Ensure URL is public, use fal.storage.upload() |
| Content Safety | Prompt violates policy | Revise prompt content |

---

## Proxy Configuration

**Critical for Production:** Never expose API keys in client-side code. Use server-side proxy.

### Why Use a Proxy?

- **Security:** Keeps API keys on server-side
- **Rate Limiting:** Implement custom rate limits
- **Analytics:** Track usage patterns
- **Middleware:** Add custom logic (auth, logging, headers)

### Next.js Proxy Setup

#### Step 1: Install Dependencies

```bash
npm install @fal-ai/client @fal-ai/server-proxy
```

#### Step 2: Set Environment Variable

```bash
# .env.local
FAL_KEY=your_api_key_here
```

#### Step 3: Create Proxy Endpoint

**App Router** (Next.js 13+):

```typescript
// app/api/fal/proxy/route.ts
import { route } from "@fal-ai/server-proxy/nextjs";

export const { GET, POST } = route;
```

**Page Router** (Next.js 12 and earlier):

```typescript
// pages/api/fal/proxy.ts
export { handler as default } from "@fal-ai/server-proxy/nextjs";
```

#### Step 4: Configure Client

```typescript
// app/layout.tsx or _app.tsx
import { fal } from "@fal-ai/client";

fal.config({
  proxyUrl: "/api/fal/proxy",
});
```

### Custom Middleware Example

Add rate limiting, analytics, or custom headers:

```typescript
// app/api/fal/proxy/route.ts
import { route } from "@fal-ai/server-proxy/nextjs";
import type { NextRequest } from "next/server";

const rateLimiter = new Map<string, number>();

function shouldRateLimit(req: NextRequest): boolean {
  const ip = req.ip || "unknown";
  const now = Date.now();
  const lastRequest = rateLimiter.get(ip) || 0;

  if (now - lastRequest < 1000) {  // 1 request per second
    return true;
  }

  rateLimiter.set(ip, now);
  return false;
}

async function POST(req: NextRequest) {
  // Rate limiting
  if (shouldRateLimit(req)) {
    return new Response("Rate limit exceeded", { status: 429 });
  }

  // Analytics
  const targetUrl = req.headers.get("x-fal-target-url");
  console.log("Request to:", targetUrl);

  // Call original handler
  return route.POST(req);
}

async function GET(req: NextRequest) {
  return route.GET(req);
}

export { GET, POST };
```

### Using withProxy Configuration

```typescript
import * as fal from '@fal-ai/client';

fal.config({
  requestMiddleware: fal.withProxy({
    targetUrl: '/api/fal/proxy',
  }),
});
```

### Express.js Proxy Example

```typescript
import express from 'express';
import { handler } from '@fal-ai/server-proxy/express';

const app = express();

app.use('/api/fal/proxy', handler);

app.listen(3000);
```

### Cloudflare Workers Proxy

```typescript
// worker.js
import { handler } from '@fal-ai/server-proxy/cloudflare';

export default {
  async fetch(request, env) {
    return handler(request, {
      credentials: env.FAL_KEY,
    });
  },
};
```

---

## React/Next.js Integration

### Next.js App Router Example

**Complete implementation:**

```typescript
// app/layout.tsx
import { fal } from "@fal-ai/client";

fal.config({
  proxyUrl: "/api/fal/proxy",
});

export default function RootLayout({ children }) {
  return (
    <html>
      <body>{children}</body>
    </html>
  );
}
```

```typescript
// app/api/fal/proxy/route.ts
import { route } from "@fal-ai/server-proxy/nextjs";

export const { GET, POST } = route;
```

```typescript
// app/components/ImageGenerator.tsx
"use client";

import { useState } from 'react';
import { fal } from "@fal-ai/client";

export default function ImageGenerator() {
  const [prompt, setPrompt] = useState("");
  const [image, setImage] = useState<string | null>(null);
  const [loading, setLoading] = useState(false);

  const generate = async () => {
    setLoading(true);
    try {
      const result = await fal.subscribe("fal-ai/flux/dev", {
        input: { prompt },
      });
      setImage(result.data.images[0].url);
    } catch (error) {
      console.error("Generation failed:", error);
    } finally {
      setLoading(false);
    }
  };

  return (
    <div>
      <input
        value={prompt}
        onChange={(e) => setPrompt(e.target.value)}
        placeholder="Enter prompt..."
      />
      <button onClick={generate} disabled={loading}>
        {loading ? "Generating..." : "Generate"}
      </button>
      {image && <img src={image} alt="Generated" />}
    </div>
  );
}
```

### Next.js Page Router Example

```typescript
// pages/_app.tsx
import { fal } from "@fal-ai/client";
import type { AppProps } from 'next/app';

fal.config({
  proxyUrl: "/api/fal/proxy",
});

export default function App({ Component, pageProps }: AppProps) {
  return <Component {...pageProps} />;
}
```

```typescript
// pages/api/fal/proxy.ts
export { handler as default } from "@fal-ai/server-proxy/nextjs";
```

### React Custom Hook

```typescript
// hooks/useFal.ts
import { useState, useCallback } from 'react';
import { fal } from "@fal-ai/client";

export function useFalSubscribe<Output>(endpointId: string) {
  const [data, setData] = useState<Output | null>(null);
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState<Error | null>(null);
  const [queuePosition, setQueuePosition] = useState<number | null>(null);

  const execute = useCallback(async (input: any) => {
    setLoading(true);
    setError(null);
    setQueuePosition(null);

    try {
      const result = await fal.subscribe(endpointId, {
        input,
        onQueueUpdate(update) {
          if (update.status === "IN_QUEUE") {
            setQueuePosition(update.position);
          } else {
            setQueuePosition(null);
          }
        },
      });
      setData(result.data as Output);
      return result.data;
    } catch (err) {
      setError(err as Error);
      throw err;
    } finally {
      setLoading(false);
    }
  }, [endpointId]);

  return { data, loading, error, queuePosition, execute };
}

// Usage
function MyComponent() {
  const { data, loading, execute } = useFalSubscribe("fal-ai/flux/dev");

  const handleGenerate = () => {
    execute({ prompt: "A beautiful sunset" });
  };

  return (
    <div>
      <button onClick={handleGenerate} disabled={loading}>
        Generate
      </button>
      {data && <img src={data.images[0].url} />}
    </div>
  );
}
```

### React Native Example

```typescript
import { useState } from 'react';
import { View, TextInput, Button, Image } from 'react-native';
import { fal } from "@fal-ai/client";

// Configure with your server proxy
fal.config({
  proxyUrl: "https://your-server.com/api/fal/proxy",
});

export default function ImageGenerator() {
  const [prompt, setPrompt] = useState("");
  const [image, setImage] = useState<string | null>(null);

  const generate = async () => {
    const result = await fal.subscribe("fal-ai/flux/dev", {
      input: { prompt },
    });
    setImage(result.data.images[0].url);
  };

  return (
    <View>
      <TextInput value={prompt} onChangeText={setPrompt} />
      <Button title="Generate" onPress={generate} />
      {image && <Image source={{ uri: image }} />}
    </View>
  );
}
```

---

## Webhooks

Webhooks enable asynchronous notifications when queued requests complete, eliminating the need for polling.

### How Webhooks Work

1. Submit request to `queue.fal.run` endpoint with `fal_webhook` query parameter
2. Request is processed asynchronously
3. When complete, fal.ai POSTs result to your webhook URL
4. Retries up to 10 times over 2 hours if delivery fails

### Submitting with Webhook

```bash
curl --request POST \
  --url 'https://queue.fal.run/fal-ai/flux/dev?fal_webhook=https://your-app.com/api/webhooks/fal' \
  --header "Authorization: Key $FAL_KEY" \
  --header 'Content-Type: application/json' \
  --data '{
    "prompt": "A majestic mountain landscape"
  }'
```

### Webhook Payload Structure

**Successful Request:**

```typescript
interface WebhookPayload {
  request_id: string;
  gateway_request_id: string;
  status: "OK";
  payload: {
    images: Array<{
      url: string;
      width: number;
      height: number;
    }>;
    // ... model-specific output
  };
}
```

**Failed Request:**

```typescript
interface WebhookErrorPayload {
  request_id: string;
  gateway_request_id: string;
  status: "ERROR";
  error: string;
  payload: null | any;
  payload_error?: string;  // If payload serialization failed
}
```

### Next.js Webhook Handler

```typescript
// app/api/webhooks/fal/route.ts
import { NextRequest, NextResponse } from 'next/server';
import crypto from 'crypto';

export async function POST(req: NextRequest) {
  const body = await req.json();
  const signature = req.headers.get('x-fal-webhook-signature');

  // Verify signature (see security section)
  if (!verifySignature(body, signature)) {
    return NextResponse.json({ error: 'Invalid signature' }, { status: 401 });
  }

  // Process webhook
  if (body.status === "OK") {
    console.log("Request completed:", body.request_id);
    console.log("Result:", body.payload);

    // Store result in database, notify user, etc.
    await saveResult(body.request_id, body.payload);
  } else {
    console.error("Request failed:", body.error);
  }

  return NextResponse.json({ received: true });
}
```

### Webhook Security

Verify requests using `X-Fal-Webhook-Signature` header:

```typescript
import crypto from 'crypto';

function verifySignature(
  payload: any,
  signature: string | null,
  secret: string
): boolean {
  if (!signature) return false;

  const hash = crypto
    .createHmac('sha256', secret)
    .update(JSON.stringify(payload))
    .digest('hex');

  return crypto.timingSafeEqual(
    Buffer.from(signature),
    Buffer.from(hash)
  );
}
```

### Express.js Webhook Handler

```typescript
import express from 'express';
import crypto from 'crypto';

const app = express();
app.use(express.json());

app.post('/api/webhooks/fal', (req, res) => {
  const signature = req.headers['x-fal-webhook-signature'];

  if (!verifySignature(req.body, signature, process.env.WEBHOOK_SECRET)) {
    return res.status(401).json({ error: 'Invalid signature' });
  }

  if (req.body.status === "OK") {
    console.log("Completed:", req.body.request_id);
    // Process result
  }

  res.json({ received: true });
});

app.listen(3000);
```

### Retry Behavior

- **Retry count:** Up to 10 attempts
- **Duration:** Over 2 hours
- **Backoff:** Exponential delay between retries
- **Failure:** After 10 failures, webhook delivery stops

### When to Use Webhooks

✅ **Use webhooks when:**
- Request processing takes minutes/hours (e.g., model training)
- You want to avoid polling overhead
- Building background job processing
- Need reliable delivery guarantees

❌ **Don't use webhooks when:**
- Need immediate response (use `subscribe` instead)
- Can't expose public webhook endpoint
- Building client-side only apps

---

## Advanced Patterns

### Request Cancellation

Cancel in-progress or queued requests:

```typescript
const { request_id, cancel_url } = await fal.queue.submit("fal-ai/flux/dev", {
  input: { prompt: "test" },
});

// Later: cancel the request
const response = await fetch(cancel_url, {
  method: 'PUT',
  headers: {
    'Authorization': `Key ${process.env.FAL_KEY}`,
  },
});

if (response.ok) {
  console.log("Request cancelled");
}
```

### Timeout Configuration

Implement custom timeout logic:

```typescript
async function generateWithTimeout(prompt: string, timeoutMs = 30000) {
  const controller = new AbortController();
  const timeout = setTimeout(() => controller.abort(), timeoutMs);

  try {
    // Note: fal SDK may not support AbortSignal directly
    // Implement timeout at application level
    const promise = fal.subscribe("fal-ai/flux/dev", {
      input: { prompt },
    });

    const result = await Promise.race([
      promise,
      new Promise((_, reject) =>
        setTimeout(() => reject(new Error('Timeout')), timeoutMs)
      ),
    ]);

    return result;
  } finally {
    clearTimeout(timeout);
  }
}
```

### Batch Processing

Process multiple prompts in parallel:

```typescript
async function batchGenerate(prompts: string[]) {
  const results = await Promise.all(
    prompts.map(prompt =>
      fal.subscribe("fal-ai/flux/dev", {
        input: { prompt },
      })
    )
  );

  return results.map(r => r.data);
}

// Usage
const images = await batchGenerate([
  "A cat",
  "A dog",
  "A bird",
]);
```

### Progress Tracking with Database

Store request IDs for long-running tasks:

```typescript
// Submit request and save ID
async function startGeneration(userId: string, prompt: string) {
  const { request_id } = await fal.queue.submit("fal-ai/flux/dev", {
    input: { prompt },
  });

  // Store in database
  await db.requests.create({
    id: request_id,
    userId,
    prompt,
    status: "IN_QUEUE",
    createdAt: new Date(),
  });

  return request_id;
}

// Check status periodically
async function checkPendingRequests() {
  const pending = await db.requests.findMany({
    where: { status: { in: ["IN_QUEUE", "IN_PROGRESS"] } },
  });

  for (const req of pending) {
    const status = await fal.queue.status(req.id);

    if (status.status === "COMPLETED") {
      const result = await fal.queue.result(req.id);

      await db.requests.update({
        where: { id: req.id },
        data: {
          status: "COMPLETED",
          result: JSON.stringify(result),
        },
      });

      // Notify user
      await notifyUser(req.userId, result);
    }
  }
}
```

### Image Variations

Generate variations of an image:

```typescript
async function generateVariations(imageUrl: string, variations: string[]) {
  return Promise.all(
    variations.map(prompt =>
      fal.subscribe("fal-ai/flux/dev/image-to-image", {
        input: {
          image_url: imageUrl,
          prompt,
          strength: 0.75,
        },
      })
    )
  );
}

// Usage
const results = await generateVariations(
  "https://example.com/base.png",
  [
    "make it look like a watercolor painting",
    "convert to sketch style",
    "add dramatic lighting",
  ]
);
```

### Seeded Generation for Consistency

Use seeds for reproducible results:

```typescript
async function generateConsistent(prompt: string, seed: number = 42) {
  const result = await fal.subscribe("fal-ai/flux/dev", {
    input: {
      prompt,
      seed,  // Same seed = same result
    },
  });

  return result.data;
}

// Generate same image multiple times
const img1 = await generateConsistent("a cat", 12345);
const img2 = await generateConsistent("a cat", 12345);
// img1 and img2 will be identical
```

### Custom Request Middleware

Add custom headers or modify requests:

```typescript
import { fal } from "@fal-ai/client";

fal.config({
  requestMiddleware: (config) => {
    // Add custom headers
    config.headers = {
      ...config.headers,
      'X-Custom-Header': 'value',
      'X-User-ID': getUserId(),
    };

    // Log requests
    console.log('Request to:', config.url);

    return config;
  },
});
```

---

## Security Best Practices

### 1. Never Expose API Keys Client-Side

❌ **Bad:**

```typescript
// client-side code
import { fal } from "@fal-ai/client";

fal.config({
  credentials: "sk_12345...",  // NEVER DO THIS
});
```

✅ **Good:**

```typescript
// server-side proxy
import { route } from "@fal-ai/server-proxy/nextjs";
export const { GET, POST } = route;

// client-side code
import { fal } from "@fal-ai/client";
fal.config({
  proxyUrl: "/api/fal/proxy",  // Use proxy
});
```

### 2. Environment Variables

```bash
# .env.local (DO NOT commit)
FAL_KEY=sk_your_secret_key

# .env.example (Safe to commit)
FAL_KEY=your_fal_api_key_here
```

```typescript
// Use environment variables
const apiKey = process.env.FAL_KEY;

if (!apiKey) {
  throw new Error('FAL_KEY not configured');
}
```

### 3. Rate Limiting

Implement server-side rate limiting:

```typescript
import { Ratelimit } from "@upstash/ratelimit";
import { Redis } from "@upstash/redis";

const ratelimit = new Ratelimit({
  redis: Redis.fromEnv(),
  limiter: Ratelimit.slidingWindow(10, "1 m"),  // 10 requests per minute
});

export async function POST(req: NextRequest) {
  const ip = req.ip || "unknown";
  const { success } = await ratelimit.limit(ip);

  if (!success) {
    return new Response("Rate limit exceeded", { status: 429 });
  }

  return route.POST(req);
}
```

### 4. Input Validation

Validate user inputs before sending to API:

```typescript
import { z } from "zod";

const InputSchema = z.object({
  prompt: z.string().min(1).max(1000),
  num_images: z.number().int().min(1).max(4).optional(),
  seed: z.number().int().optional(),
});

async function generateImage(input: unknown) {
  const validated = InputSchema.parse(input);

  return fal.subscribe("fal-ai/flux/dev", {
    input: validated,
  });
}
```

### 5. Content Filtering

Implement content moderation:

```typescript
async function generateWithModeration(prompt: string) {
  // Check prompt against blacklist
  const blockedWords = ['inappropriate', 'terms'];
  if (blockedWords.some(word => prompt.toLowerCase().includes(word))) {
    throw new Error('Inappropriate content detected');
  }

  // Enable safety checker
  return fal.subscribe("fal-ai/flux/dev", {
    input: {
      prompt,
      enable_safety_checker: true,
    },
  });
}
```

### 6. Webhook Signature Verification

Always verify webhook signatures:

```typescript
import crypto from 'crypto';

const WEBHOOK_SECRET = process.env.FAL_WEBHOOK_SECRET;

function verifyWebhook(body: any, signature: string | null): boolean {
  if (!signature || !WEBHOOK_SECRET) return false;

  const expectedSignature = crypto
    .createHmac('sha256', WEBHOOK_SECRET)
    .update(JSON.stringify(body))
    .digest('hex');

  return crypto.timingSafeEqual(
    Buffer.from(signature),
    Buffer.from(expectedSignature)
  );
}
```

### 7. CORS Configuration

Restrict API access to your domains:

```typescript
// app/api/fal/proxy/route.ts
import { NextRequest } from 'next/server';
import { route } from "@fal-ai/server-proxy/nextjs";

const ALLOWED_ORIGINS = [
  'https://your-app.com',
  'https://www.your-app.com',
];

export async function POST(req: NextRequest) {
  const origin = req.headers.get('origin');

  if (origin && !ALLOWED_ORIGINS.includes(origin)) {
    return new Response('Forbidden', { status: 403 });
  }

  return route.POST(req);
}
```

### 8. Request Logging & Monitoring

Log all requests for audit trails:

```typescript
export async function POST(req: NextRequest) {
  const start = Date.now();
  const targetUrl = req.headers.get('x-fal-target-url');

  try {
    const response = await route.POST(req);

    // Log successful request
    console.log({
      timestamp: new Date().toISOString(),
      endpoint: targetUrl,
      duration: Date.now() - start,
      status: response.status,
    });

    return response;
  } catch (error) {
    // Log error
    console.error({
      timestamp: new Date().toISOString(),
      endpoint: targetUrl,
      error: error.message,
    });

    throw error;
  }
}
```

---

## Complete Example Application

### Full-Stack Next.js App with All Features

```typescript
// app/api/fal/proxy/route.ts
import { NextRequest, NextResponse } from 'next/server';
import { route } from "@fal-ai/server-proxy/nextjs";
import { Redis } from "@upstash/redis";
import { Ratelimit } from "@upstash/ratelimit";

const ratelimit = new Ratelimit({
  redis: Redis.fromEnv(),
  limiter: Ratelimit.slidingWindow(10, "1 m"),
});

export async function POST(req: NextRequest) {
  // Rate limiting
  const ip = req.ip || "anonymous";
  const { success } = await ratelimit.limit(ip);

  if (!success) {
    return NextResponse.json(
      { error: "Rate limit exceeded" },
      { status: 429 }
    );
  }

  // Analytics
  const targetUrl = req.headers.get("x-fal-target-url");
  console.log(`[FAL] Request to ${targetUrl} from ${ip}`);

  // Execute proxy
  return route.POST(req);
}

export const { GET } = route;
```

```typescript
// app/layout.tsx
import { fal } from "@fal-ai/client";

fal.config({
  proxyUrl: "/api/fal/proxy",
});

export default function RootLayout({ children }) {
  return (
    <html lang="en">
      <body>{children}</body>
    </html>
  );
}
```

```typescript
// app/hooks/useFalImage.ts
import { useState, useCallback } from 'react';
import { fal } from "@fal-ai/client";

interface UseFalImageOptions {
  endpoint?: string;
  onProgress?: (position: number | null) => void;
}

export function useFalImage(options: UseFalImageOptions = {}) {
  const { endpoint = "fal-ai/flux/dev", onProgress } = options;

  const [image, setImage] = useState<string | null>(null);
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState<string | null>(null);
  const [queuePosition, setQueuePosition] = useState<number | null>(null);

  const generate = useCallback(async (prompt: string) => {
    setLoading(true);
    setError(null);
    setImage(null);
    setQueuePosition(null);

    try {
      const result = await fal.subscribe(endpoint, {
        input: { prompt },
        logs: true,
        onQueueUpdate(update) {
          if (update.status === "IN_QUEUE") {
            setQueuePosition(update.position);
            onProgress?.(update.position);
          } else {
            setQueuePosition(null);
            onProgress?.(null);
          }
        },
      });

      setImage(result.data.images[0].url);
      return result.data;
    } catch (err) {
      const message = err instanceof Error ? err.message : "Generation failed";
      setError(message);
      throw err;
    } finally {
      setLoading(false);
    }
  }, [endpoint, onProgress]);

  return { image, loading, error, queuePosition, generate };
}
```

```typescript
// app/components/ImageGenerator.tsx
"use client";

import { useState } from 'react';
import { useFalImage } from '../hooks/useFalImage';

export default function ImageGenerator() {
  const [prompt, setPrompt] = useState("");
  const { image, loading, error, queuePosition, generate } = useFalImage();

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    if (prompt.trim()) {
      await generate(prompt);
    }
  };

  return (
    <div className="max-w-2xl mx-auto p-6">
      <form onSubmit={handleSubmit} className="space-y-4">
        <div>
          <label className="block text-sm font-medium mb-2">
            Enter your prompt
          </label>
          <input
            type="text"
            value={prompt}
            onChange={(e) => setPrompt(e.target.value)}
            placeholder="A serene mountain landscape..."
            className="w-full px-4 py-2 border rounded-lg"
            disabled={loading}
          />
        </div>

        <button
          type="submit"
          disabled={loading || !prompt.trim()}
          className="w-full bg-blue-600 text-white py-2 rounded-lg disabled:opacity-50"
        >
          {loading ? "Generating..." : "Generate Image"}
        </button>
      </form>

      {queuePosition !== null && (
        <p className="mt-4 text-sm text-gray-600">
          Queue position: {queuePosition}
        </p>
      )}

      {error && (
        <div className="mt-4 p-4 bg-red-50 text-red-700 rounded-lg">
          {error}
        </div>
      )}

      {image && (
        <div className="mt-6">
          <img
            src={image}
            alt={prompt}
            className="w-full rounded-lg shadow-lg"
          />
        </div>
      )}
    </div>
  );
}
```

```typescript
// app/page.tsx
import ImageGenerator from './components/ImageGenerator';

export default function Home() {
  return (
    <main className="min-h-screen py-12">
      <h1 className="text-4xl font-bold text-center mb-8">
        AI Image Generator
      </h1>
      <ImageGenerator />
    </main>
  );
}
```

---

## Package Versions & Updates

### Latest Version Information

- **Current:** v1.8.1 (December 2025)
- **Major:** v1.0.0 (Package rename and Result type introduction)
- **Previous:** `@fal-ai/serverless-client` (deprecated)

### Recent Changes

**v1.7.0** (October 17, 2025)
- Updated endpoint types

**v1.2.1**
- Fixed queue client result generics

**v1.0.0** (Breaking Changes)
- Package renamed to `@fal-ai/client`
- APIs return `Result<Output>` type
- Improved TypeScript type inference

### Checking for Updates

```bash
npm outdated @fal-ai/client
npm update @fal-ai/client
```

---

## Resources & Links

### Official Documentation
- **Main Docs:** https://docs.fal.ai
- **API Reference:** https://fal-ai.github.io/fal-js/reference/
- **Model Playground:** https://fal.ai/models
- **Quickstart Guide:** https://docs.fal.ai/model-apis/quickstart

### GitHub & NPM
- **GitHub Repository:** https://github.com/fal-ai/fal-js
- **NPM Package:** https://www.npmjs.com/package/@fal-ai/client
- **Server Proxy:** https://www.npmjs.com/package/@fal-ai/server-proxy

### Integration Guides
- **Next.js Integration:** https://docs.fal.ai/model-apis/integrations/nextjs
- **Client Libraries:** https://docs.fal.ai/model-apis/client
- **Webhooks:** https://docs.fal.ai/model-apis/model-endpoints/webhooks
- **Queue API:** https://docs.fal.ai/model-apis/model-endpoints/queue

### Examples & Demos
- **Realtime Demo:** https://fal.ai/dynamic
- **WebSocket Demo:** https://github.com/fal-ai/lcm-websocket-demo
- **Video Generator Template:** https://vercel.com/templates/next.js/fal-video-generator

### Community & Support
- **Dashboard:** https://fal.ai/dashboard/keys
- **Blog:** https://blog.fal.ai
- **Vercel Integration:** https://blog.fal.ai/fal-vercel/

---

## Summary & Quick Reference

### Essential Methods

```typescript
// Basic generation (blocks until complete)
const result = await fal.run("fal-ai/flux/dev", { input: { prompt } });

// Queue-based (recommended)
const result = await fal.subscribe("fal-ai/flux/dev", { input: { prompt } });

// Queue management
const { request_id } = await fal.queue.submit("endpoint", { input });
const status = await fal.queue.status(request_id);
const result = await fal.queue.result(request_id);

// Streaming
const stream = await fal.stream("endpoint", { input });
for await (const event of stream) { /* ... */ }

// Realtime WebSocket
const conn = fal.realtime.connect("endpoint", { onResult, onError });
conn.send(input);

// File upload
const url = await fal.storage.upload(file);
```

### Configuration

```typescript
import { fal } from "@fal-ai/client";

fal.config({
  credentials: "FAL_KEY",          // Or use env vars
  proxyUrl: "/api/fal/proxy",      // For client-side security
});
```

### TypeScript Types

```typescript
import type {
  FalClient,
  Result,
  QueueStatus,
  ApiError,
  ValidationError,
} from "@fal-ai/client";
```

---

## Conclusion

This comprehensive documentation covers every aspect of the `@fal-ai/client` JavaScript/TypeScript SDK. The SDK provides a robust, type-safe interface for interacting with fal.ai's 600+ generative AI models, supporting multiple runtime environments (Browser, Node.js, React Native) and offering flexible patterns for queue management, realtime communication, streaming, and file handling.

**Key Takeaways:**
1. Always use server-side proxy in production to protect API keys
2. Prefer `fal.subscribe()` over `fal.run()` for reliability
3. Implement proper error handling with TypeScript types
4. Use webhooks for long-running tasks to avoid polling
5. Leverage realtime WebSocket for interactive applications
6. Upload files via `fal.storage.upload()` for file-based models

For the latest updates and complete API reference, visit the official documentation at https://docs.fal.ai.

---

**Document Version:** 1.0
**Last Updated:** 2025-12-28
**SDK Version Covered:** @fal-ai/client v1.8.1
**Word Count:** 12,500+

---

## Sources

- [GitHub - fal-ai/fal-js](https://github.com/fal-ai/fal-js)
- [@fal-ai/client - npm](https://www.npmjs.com/package/@fal-ai/client)
- [fal.ai Official Documentation](https://docs.fal.ai/)
- [Client Libraries - fal](https://docs.fal.ai/model-apis/client)
- [Quickstart - fal](https://docs.fal.ai/model-apis/quickstart)
- [Next.js Integration - fal](https://docs.fal.ai/model-apis/integrations/nextjs)
- [FalClient API Reference](https://fal-ai.github.io/fal-js/reference/interfaces/FalClient.html)
- [Error Reference - fal](https://docs.fal.ai/model-apis/errors)
- [Webhooks API - fal](https://docs.fal.ai/model-apis/model-endpoints/webhooks)
- [Queue API - fal](https://docs.fal.ai/model-apis/model-endpoints/queue)
- [Building Applications with Real-Time Stable Diffusion APIs](https://blog.fal.ai/building-applications-with-real-time-stable-diffusion-apis/)
- [@fal-ai/serverless-client - npm (deprecated)](https://www.npmjs.com/package/@fal-ai/serverless-client)
- [Vercel fal Integration](https://blog.fal.ai/fal-vercel/)
