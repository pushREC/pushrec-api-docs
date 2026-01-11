---
source: 'FAL.ai official documentation (synthesized from https://fal.ai/docs)'
scraped: 2025-12-28
api_provider: FAL.ai
discovery_tier: 3
verified: false
title: "FAL.ai Streaming, Queue & Real-Time API Documentation"
---
[[3-Resources/anchors/status-complete]]

# FAL.ai Streaming, Queue & Real-Time API Documentation

## Executive Summary

This comprehensive reference documents FAL.ai's asynchronous processing capabilities, including the queue system, streaming responses, real-time WebSocket connections, and webhook integrations. This documentation is designed for SaaS developers building production-grade applications that require reliable, scalable handling of long-running AI inference operations.

**Key Capabilities:**
- **Queue System**: Asynchronous request handling with status tracking and position monitoring
- **Server-Sent Events (SSE)**: Real-time status streaming for queue requests
- **WebSocket API**: Bidirectional real-time connections for interactive applications
- **Webhooks**: Callback-based notifications for completed requests
- **Event Streaming**: Progressive results from distributed inference workers
- **Multi-language Support**: Python, JavaScript/TypeScript, PHP, Dart, and more

---

## Table of Contents

1. [Queue System Architecture](#queue-system-architecture)
2. [Queue Lifecycle](#queue-lifecycle)
3. [Queue Status States](#queue-status-states)
4. [REST API Endpoints](#rest-api-endpoints)
5. [Streaming Status Updates (SSE)](#streaming-status-updates-sse)
6. [Webhooks System](#webhooks-system)
7. [Real-Time WebSocket API](#real-time-websocket-api)
8. [Event Streaming from Workers](#event-streaming-from-workers)
9. [Python Client Library](#python-client-library)
10. [JavaScript/TypeScript Client](#javascripttypescript-client)
11. [Authentication & Security](#authentication--security)
12. [Error Handling & Retry Logic](#error-handling--retry-logic)
13. [Performance Optimization](#performance-optimization)
14. [Object Lifecycle Management](#object-lifecycle-management)
15. [Code Examples & Patterns](#code-examples--patterns)

---

## 1. Queue System Architecture

### Overview

For requests that take longer than several seconds, as is usually the case with AI models, FAL.ai provides a queue system. The queue offers:

- **Granular traffic control**: Handle surges in traffic efficiently
- **Request cancellation**: Cancel pending requests before processing
- **Queue position monitoring**: Track your position in the queue
- **No long-running connections**: Submit and check later, avoiding timeout issues
- **Better reliability**: If connections fail, results can still be retrieved

### Why Use the Queue System?

**Synchronous API (`fal.run`) limitations:**
- Requires keeping connection open for entire inference duration
- Connection failures result in lost results
- Difficult to track progress for long-running tasks
- No ability to cancel once started

**Queue API (`queue.fal.run`) advantages:**
- Submit request and disconnect immediately
- Poll for status or use webhooks for notifications
- Track queue position and progress in real-time
- Cancel requests before they process
- Retrieve results even if initial connection dropped

### Queue Endpoints Structure

All queue functionality is exposed via standardized per-model paths under `https://queue.fal.run`:

```
https://queue.fal.run/{model_id}
https://queue.fal.run/{model_id}/{subpath}
```

**Examples:**
- `https://queue.fal.run/fal-ai/fast-sdxl`
- `https://queue.fal.run/fal-ai/flux-lora/stream`
- `https://queue.fal.run/fal-ai/video-understanding`

### Three Interaction Patterns

FAL.ai supports three primary interaction patterns:

1. **Synchronous calls** (`fal.run`): For quick generations where you can wait for the result
2. **Async queuing with webhooks** (`queue.fal.run`): For longer-running tasks like video generation
3. **Real-time websockets**: For streaming results or live feedback

---

## 2. Queue Lifecycle

### Complete Request Lifecycle

```
┌─────────────────┐
│  Submit Request │
│  (POST)         │
└────────┬────────┘
         │
         ▼
┌─────────────────────────────────┐
│  Receive request_id             │
│  + response_url                 │
│  + status_url                   │
│  + cancel_url                   │
└────────┬────────────────────────┘
         │
         ▼
┌─────────────────┐
│  IN_QUEUE       │◄─────┐
│  (HTTP 202)     │      │
│  position: N    │      │
└────────┬────────┘      │
         │               │
         ▼               │ Poll or Stream
┌─────────────────┐      │
│  IN_PROGRESS    │◄─────┤
│  (HTTP 202)     │      │
│  logs: [...]    │      │
└────────┬────────┘      │
         │               │
         ▼               │
┌─────────────────┐      │
│  COMPLETED      │◄─────┘
│  (HTTP 200)     │
│  response: {...}│
└─────────────────┘
```

### Step-by-Step Walkthrough

#### Step 1: Submit Request

**HTTP Request:**
```bash
POST https://queue.fal.run/fal-ai/fast-sdxl
Authorization: Key YOUR_API_KEY
Content-Type: application/json

{
  "prompt": "a cute cat, realistic, orange"
}
```

**Response Payload:**
```json
{
  "request_id": "80e732af-660e-45cd-bd63-580e4f2a94cc",
  "response_url": "https://queue.fal.run/fal-ai/fast-sdxl/requests/80e732af-660e-45cd-bd63-580e4f2a94cc",
  "status_url": "https://queue.fal.run/fal-ai/fast-sdxl/requests/80e732af-660e-45cd-bd63-580e4f2a94cc/status",
  "cancel_url": "https://queue.fal.run/fal-ai/fast-sdxl/requests/80e732af-660e-45cd-bd63-580e4f2a94cc/cancel"
}
```

**What you receive:**
- `request_id`: Unique identifier for tracking
- `response_url`: Endpoint to retrieve final results
- `status_url`: Endpoint to check progress
- `cancel_url`: Endpoint to cancel the request

#### Step 2: Check Status (Polling)

**HTTP Request:**
```bash
GET https://queue.fal.run/fal-ai/fast-sdxl/requests/80e732af-660e-45cd-bd63-580e4f2a94cc/status?logs=1
Authorization: Key YOUR_API_KEY
```

**Response (IN_QUEUE):**
```json
{
  "status": "IN_QUEUE",
  "queue_position": 3,
  "response_url": "https://queue.fal.run/fal-ai/fast-sdxl/requests/80e732af-660e-45cd-bd63-580e4f2a94cc"
}
```

**Response (IN_PROGRESS):**
```json
{
  "status": "IN_PROGRESS",
  "logs": [
    {
      "message": "Loading model weights...",
      "level": "INFO",
      "source": "worker",
      "timestamp": "2025-12-28T10:30:00.123Z"
    },
    {
      "message": "Generating image step 1/20",
      "level": "INFO",
      "source": "inference",
      "timestamp": "2025-12-28T10:30:01.456Z"
    }
  ],
  "response_url": "https://queue.fal.run/fal-ai/fast-sdxl/requests/80e732af-660e-45cd-bd63-580e4f2a94cc"
}
```

**Response (COMPLETED):**
```json
{
  "status": "COMPLETED",
  "response_url": "https://queue.fal.run/fal-ai/fast-sdxl/requests/80e732af-660e-45cd-bd63-580e4f2a94cc",
  "logs": [
    {
      "message": "Generation complete",
      "level": "INFO",
      "source": "worker",
      "timestamp": "2025-12-28T10:30:10.789Z"
    }
  ]
}
```

#### Step 3: Retrieve Result

**HTTP Request:**
```bash
GET https://queue.fal.run/fal-ai/fast-sdxl/requests/80e732af-660e-45cd-bd63-580e4f2a94cc
Authorization: Key YOUR_API_KEY
```

**Response (Success - HTTP 200):**
```json
{
  "images": [
    {
      "url": "https://storage.googleapis.com/falserverless/...",
      "width": 1024,
      "height": 1024,
      "content_type": "image/jpeg"
    }
  ],
  "seed": 12345,
  "inference_time": 2.34
}
```

**Response (Error - HTTP 4xx/5xx):**
```json
{
  "error": "Invalid prompt format",
  "status_code": 422,
  "detail": "Prompt must be a non-empty string"
}
```

#### Step 4 (Optional): Cancel Request

**HTTP Request:**
```bash
PUT https://queue.fal.run/fal-ai/fast-sdxl/requests/80e732af-660e-45cd-bd63-580e4f2a94cc/cancel
Authorization: Key YOUR_API_KEY
```

**Success Response (HTTP 202):**
```json
{
  "status": "CANCELLATION_REQUESTED",
  "request_id": "80e732af-660e-45cd-bd63-580e4f2a94cc"
}
```

**Failure Response (HTTP 400):**
```json
{
  "error": "Cannot cancel request",
  "detail": "Request is already in progress or completed"
}
```

---

## 3. Queue Status States

### Status Values

FAL.ai uses the following status states for tracking requests:

| Status | HTTP Code | Description | Contains |
|--------|-----------|-------------|----------|
| **IN_QUEUE** | 202 | Request is queued, waiting to be processed | `queue_position`, `response_url` |
| **IN_PROGRESS** | 202 | Currently executing | `logs` (if enabled), `response_url` |
| **COMPLETED** | 200 | Processing finished successfully | Final result in response |
| **ERROR** | 4xx/5xx | Processing failed | Error details |

### Status Transitions

Valid state transitions:

```
IN_QUEUE → IN_PROGRESS → COMPLETED
IN_QUEUE → ERROR
IN_PROGRESS → ERROR
IN_QUEUE → CANCELLATION_REQUESTED (if cancelled before processing)
```

### Queue Position Tracking

When a request is `IN_QUEUE`, the status response includes a `queue_position` field:

```json
{
  "status": "IN_QUEUE",
  "queue_position": 3
}
```

**Position interpretation:**
- `queue_position: 0` - Next to be processed
- `queue_position: 1` - One request ahead
- `queue_position: N` - N requests ahead

**Note:** Queue position is 0-indexed.

---

## 4. REST API Endpoints

### Complete Endpoint Reference

#### 4.1 Submit Request to Queue

**Endpoint:**
```
POST https://queue.fal.run/{model_id}
POST https://queue.fal.run/{model_id}/{subpath}
```

**Headers:**
```
Authorization: Key YOUR_API_KEY
Content-Type: application/json
X-Fal-Object-Lifecycle-Preference: {"expiration_duration_seconds": 3600}  (optional)
```

**Request Body:**
```json
{
  "prompt": "your prompt here",
  "image_size": "landscape_4_3",
  "num_inference_steps": 20,
  ...model-specific parameters
}
```

**Response:**
```json
{
  "request_id": "string",
  "response_url": "string",
  "status_url": "string",
  "cancel_url": "string"
}
```

---

#### 4.2 Get Request Status

**Endpoint:**
```
GET https://queue.fal.run/{model_id}/requests/{request_id}/status
```

**Query Parameters:**
- `logs=1` - Include execution logs in response

**Response (IN_QUEUE):**
```json
{
  "status": "IN_QUEUE",
  "queue_position": 3,
  "response_url": "string"
}
```

**Response (IN_PROGRESS):**
```json
{
  "status": "IN_PROGRESS",
  "logs": [
    {
      "message": "string",
      "level": "INFO|WARN|ERROR|DEBUG|STDOUT|STDERR",
      "source": "string",
      "timestamp": "ISO8601 string"
    }
  ],
  "response_url": "string"
}
```

**Response (COMPLETED):**
```json
{
  "status": "COMPLETED",
  "logs": [...],
  "response_url": "string"
}
```

---

#### 4.3 Stream Request Status (SSE)

**Endpoint:**
```
GET https://queue.fal.run/{model_id}/requests/{request_id}/status/stream
```

**Query Parameters:**
- `logs=1` - Include logs in streamed events

**Response Type:**
```
Content-Type: text/event-stream
```

**Event Format:**
```
data: {"status":"IN_QUEUE","queue_position":3}

data: {"status":"IN_PROGRESS","logs":[...]}

data: {"status":"COMPLETED","logs":[...]}
```

Connection remains open until status becomes `COMPLETED`.

---

#### 4.4 Get Completed Response

**Endpoint:**
```
GET https://queue.fal.run/{model_id}/requests/{request_id}
```

**Response (Success - HTTP 200):**
```json
{
  ...model-specific output (images, videos, etc.)
}
```

**Response (Error - HTTP 4xx/5xx):**
```json
{
  "error": "string",
  "status_code": 422,
  "detail": "string"
}
```

---

#### 4.5 Cancel Request

**Endpoint:**
```
PUT https://queue.fal.run/{model_id}/requests/{request_id}/cancel
```

**Success Response (HTTP 202):**
```json
{
  "status": "CANCELLATION_REQUESTED",
  "request_id": "string"
}
```

**Failure Response (HTTP 400):**
```json
{
  "error": "Cannot cancel request",
  "detail": "Request is already in progress or completed"
}
```

**Note:** Cancellation only succeeds if request is still `IN_QUEUE`. Once processing starts (`IN_PROGRESS`), cancellation is not guaranteed.

---

## 5. Streaming Status Updates (SSE)

### What is Server-Sent Events (SSE)?

Server-Sent Events (SSE) is an efficient, real-time communication protocol designed to send continuous updates from the server to the client. Unlike WebSockets, which facilitate two-way communication, SSE allows for one-way streaming, making it ideal for scenarios where the server needs to push data continuously.

### Why SSE for Queue Status?

**Benefits:**
- **Real-time updates**: No need to poll repeatedly
- **Efficient**: Single long-lived connection
- **Automatic reconnection**: Built into browser EventSource API
- **Simple protocol**: Text-based, easy to debug
- **Industry standard**: Used by OpenAI, Anthropic, and most LLM APIs

### Using the Streaming Endpoint

**cURL Example:**
```bash
curl -N -H "Authorization: Key $FAL_KEY" \
  "https://queue.fal.run/fal-ai/fast-sdxl/requests/80e732af-660e-45cd-bd63-580e4f2a94cc/status/stream?logs=1"
```

**Response Stream:**
```
data: {"status":"IN_QUEUE","queue_position":5}

data: {"status":"IN_QUEUE","queue_position":3}

data: {"status":"IN_QUEUE","queue_position":1}

data: {"status":"IN_PROGRESS","logs":[{"message":"Loading model","level":"INFO","timestamp":"2025-12-28T10:30:00Z"}]}

data: {"status":"IN_PROGRESS","logs":[{"message":"Step 1/20","level":"INFO","timestamp":"2025-12-28T10:30:01Z"}]}

data: {"status":"COMPLETED","logs":[{"message":"Done","level":"INFO","timestamp":"2025-12-28T10:30:10Z"}]}
```

**Connection closes** after `COMPLETED` status is sent.

### Browser JavaScript Implementation

```javascript
const eventSource = new EventSource(
  `https://queue.fal.run/fal-ai/fast-sdxl/requests/${requestId}/status/stream?logs=1`,
  {
    headers: {
      'Authorization': `Key ${FAL_API_KEY}`
    }
  }
);

eventSource.onmessage = (event) => {
  const data = JSON.parse(event.data);

  if (data.status === 'IN_QUEUE') {
    console.log(`Queue position: ${data.queue_position}`);
  } else if (data.status === 'IN_PROGRESS') {
    data.logs?.forEach(log => console.log(log.message));
  } else if (data.status === 'COMPLETED') {
    console.log('Generation complete!');
    eventSource.close();

    // Fetch final result
    fetchResult(data.response_url);
  }
};

eventSource.onerror = (error) => {
  console.error('SSE Error:', error);
  eventSource.close();
};
```

### Node.js Implementation

```javascript
import fetch from 'node-fetch';

async function streamStatus(requestId) {
  const response = await fetch(
    `https://queue.fal.run/fal-ai/fast-sdxl/requests/${requestId}/status/stream?logs=1`,
    {
      headers: {
        'Authorization': `Key ${process.env.FAL_KEY}`
      }
    }
  );

  const reader = response.body;
  let buffer = '';

  reader.on('data', (chunk) => {
    buffer += chunk.toString();
    const lines = buffer.split('\n');
    buffer = lines.pop(); // Keep incomplete line in buffer

    for (const line of lines) {
      if (line.startsWith('data: ')) {
        const data = JSON.parse(line.slice(6));
        handleStatusUpdate(data);
      }
    }
  });

  reader.on('end', () => {
    console.log('Stream ended');
  });
}

function handleStatusUpdate(data) {
  console.log(`Status: ${data.status}`);
  if (data.queue_position !== undefined) {
    console.log(`Position: ${data.queue_position}`);
  }
  if (data.logs) {
    data.logs.forEach(log => console.log(log.message));
  }
}
```

---

## 6. Webhooks System

### Overview

Webhooks provide a callback-based notification system for completed requests. Instead of polling for status updates, FAL.ai will send a POST request to your server when processing completes.

**Key benefits:**
- **No polling required**: FAL.ai notifies you when done
- **Ideal for long-running tasks**: Training jobs, video generation, etc.
- **Reliable delivery**: 10 retry attempts over 2 hours
- **Secure**: Cryptographic signature verification

### Configuring Webhooks

To use webhooks, pass the `fal_webhook` query parameter when submitting to the queue:

```bash
POST https://queue.fal.run/fal-ai/fast-sdxl?fal_webhook=https://your-app.com/webhooks/fal
Authorization: Key YOUR_API_KEY
Content-Type: application/json

{
  "prompt": "a cat"
}
```

**Important:** Webhooks ONLY work with `queue.fal.run` endpoints, not `fal.run`.

### Webhook Payload Structure

#### Success Payload

```json
{
  "request_id": "80e732af-660e-45cd-bd63-580e4f2a94cc",
  "gateway_request_id": "80e732af-660e-45cd-bd63-580e4f2a94cc",
  "status": "OK",
  "data": {
    "images": [
      {
        "url": "https://storage.googleapis.com/falserverless/...",
        "width": 1024,
        "height": 1024,
        "content_type": "image/jpeg"
      }
    ],
    "seed": 12345,
    "inference_time": 2.34
  }
}
```

#### Error Payload

```json
{
  "request_id": "80e732af-660e-45cd-bd63-580e4f2a94cc",
  "status": "ERROR",
  "error": "Invalid status code: 422",
  "payload": {
    "detail": "Prompt must be non-empty"
  }
}
```

### Webhook Security & Verification

FAL.ai uses **ED25519 cryptographic signatures** to verify webhook authenticity.

#### Headers Sent with Webhook

```
X-Fal-Webhook-Request-Id: 80e732af-660e-45cd-bd63-580e4f2a94cc
X-Fal-Webhook-User-Id: your-user-id
X-Fal-Webhook-Timestamp: 1703769600
X-Fal-Webhook-Signature: a1b2c3d4e5f6... (hex-encoded)
```

#### Verification Process

**Step 1: Fetch Public Keys (JWKS)**

```bash
GET https://rest.alpha.fal.ai/.well-known/jwks.json
```

**Response:**
```json
{
  "keys": [
    {
      "kty": "OKP",
      "crv": "Ed25519",
      "x": "base64url-encoded-public-key",
      "kid": "key-id-1"
    },
    {
      "kty": "OKP",
      "crv": "Ed25519",
      "x": "another-base64url-encoded-key",
      "kid": "key-id-2"
    }
  ]
}
```

**Caching:** Cache JWKS for up to 24 hours to reduce network requests.

**Step 2: Construct Verification Message**

The message format is:
```
{request_id}\n{user_id}\n{timestamp}\n{sha256_hex_of_body}
```

**Python Example:**
```python
import hashlib

def construct_message(request_id, user_id, timestamp, body):
    body_hash = hashlib.sha256(body.encode()).hexdigest()
    return f"{request_id}\n{user_id}\n{timestamp}\n{body_hash}"
```

**Step 3: Verify Signature**

**Python Implementation (using PyNaCl):**
```python
from nacl.signing import VerifyKey
from nacl.encoding import HexEncoder, Base64Encoder
import base64
import hashlib
import time
import requests

def verify_webhook(request_headers, request_body):
    # Extract headers
    request_id = request_headers['X-Fal-Webhook-Request-Id']
    user_id = request_headers['X-Fal-Webhook-User-Id']
    timestamp = request_headers['X-Fal-Webhook-Timestamp']
    signature_hex = request_headers['X-Fal-Webhook-Signature']

    # Validate timestamp (within ±5 minutes)
    current_time = int(time.time())
    if abs(current_time - int(timestamp)) > 300:
        raise ValueError("Timestamp outside allowed window")

    # Fetch JWKS (implement caching in production)
    jwks_response = requests.get('https://rest.alpha.fal.ai/.well-known/jwks.json')
    jwks = jwks_response.json()

    # Construct message
    body_hash = hashlib.sha256(request_body.encode()).hexdigest()
    message = f"{request_id}\n{user_id}\n{timestamp}\n{body_hash}"

    # Try each public key
    signature_bytes = bytes.fromhex(signature_hex)

    for key_data in jwks['keys']:
        try:
            # Decode base64url public key
            public_key_bytes = base64.urlsafe_b64decode(key_data['x'] + '==')
            verify_key = VerifyKey(public_key_bytes)

            # Verify signature
            verify_key.verify(message.encode(), signature_bytes)
            return True  # Signature valid
        except Exception:
            continue  # Try next key

    raise ValueError("Signature verification failed")
```

**JavaScript/Node.js Implementation:**
```javascript
const sodium = require('libsodium-wrappers');
const crypto = require('crypto');
const axios = require('axios');

async function verifyWebhook(headers, body) {
  await sodium.ready;

  const requestId = headers['x-fal-webhook-request-id'];
  const userId = headers['x-fal-webhook-user-id'];
  const timestamp = headers['x-fal-webhook-timestamp'];
  const signatureHex = headers['x-fal-webhook-signature'];

  // Validate timestamp
  const currentTime = Math.floor(Date.now() / 1000);
  if (Math.abs(currentTime - parseInt(timestamp)) > 300) {
    throw new Error('Timestamp outside allowed window');
  }

  // Fetch JWKS
  const jwksResponse = await axios.get('https://rest.alpha.fal.ai/.well-known/jwks.json');
  const jwks = jwksResponse.data;

  // Construct message
  const bodyHash = crypto.createHash('sha256').update(body).digest('hex');
  const message = `${requestId}\n${userId}\n${timestamp}\n${bodyHash}`;

  // Try each public key
  const signatureBytes = Buffer.from(signatureHex, 'hex');

  for (const keyData of jwks.keys) {
    try {
      const publicKeyBytes = sodium.from_base64(keyData.x, sodium.base64_variants.URLSAFE_NO_PADDING);

      const isValid = sodium.crypto_sign_verify_detached(
        signatureBytes,
        Buffer.from(message),
        publicKeyBytes
      );

      if (isValid) {
        return true;
      }
    } catch (e) {
      continue; // Try next key
    }
  }

  throw new Error('Signature verification failed');
}
```

### Webhook Retry Behavior

**Retry Policy:**
- **Number of retries**: 10 attempts
- **Duration**: Over 2 hours
- **Backoff**: Exponential backoff between retries
- **Success criteria**: Webhook endpoint returns 2xx status code

**Expected Endpoint Behavior:**
- Return **200 OK** or **202 Accepted** for successful receipt
- Process webhook payload asynchronously if needed
- Respond quickly (< 5 seconds recommended)

### Webhook Endpoint Example

**Express.js:**
```javascript
app.post('/webhooks/fal', express.raw({ type: 'application/json' }), async (req, res) => {
  try {
    // Verify signature
    await verifyWebhook(req.headers, req.body.toString());

    // Parse payload
    const payload = JSON.parse(req.body.toString());

    // Respond immediately
    res.status(200).send('OK');

    // Process asynchronously
    processWebhook(payload).catch(console.error);

  } catch (error) {
    console.error('Webhook verification failed:', error);
    res.status(400).send('Invalid signature');
  }
});

async function processWebhook(payload) {
  if (payload.status === 'OK') {
    console.log('Generation completed:', payload.request_id);
    // Save result to database, notify user, etc.
  } else {
    console.error('Generation failed:', payload.error);
    // Handle error
  }
}
```

---

## 7. Real-Time WebSocket API

### Overview

FAL.ai offers real-time WebSocket connections for **bidirectional, persistent connections**. These are ideal for interactive applications requiring back-to-back requests with minimal latency.

**Key characteristics:**
- **Bidirectional**: Send multiple requests over a single connection
- **Low latency**: ~150-250ms per inference (optimized models)
- **Persistent**: Connection stays open for multiple requests
- **Interactive**: Ideal for live demos, real-time editors

### When to Use WebSockets vs Queue vs Streaming

| Pattern | Use Case | Latency | Connection |
|---------|----------|---------|------------|
| **WebSocket (realtime)** | Interactive apps with multiple sequential requests | ~150-250ms | Persistent, bidirectional |
| **Queue (async)** | Long-running tasks, background processing | Seconds to minutes | Stateless, submit & retrieve |
| **Streaming (SSE)** | Progressive output from single request | Real-time updates | One-way, server to client |

**Example use cases:**
- **WebSocket**: Real-time image editor with live preview (e.g., `fal-ai/fast-lcm-diffusion`)
- **Queue**: Video generation, model training, batch processing
- **Streaming**: Live status updates, progressive image generation

### Supported Models

Not all models support real-time WebSocket endpoints. Only models with an explicit `/realtime` endpoint can be used.

**Examples of realtime-enabled models:**
- `fal-ai/fast-lcm-diffusion`
- `fal-ai/fast-sdxl` (certain configurations)

Check model documentation to confirm realtime support.

### JavaScript/TypeScript WebSocket Example

```javascript
import { fal } from '@fal-ai/client';

// Configure credentials
fal.config({
  credentials: process.env.FAL_KEY
});

// Connect to realtime endpoint
const connection = fal.realtime.connect('fal-ai/fast-lcm-diffusion', {
  onResult: (result) => {
    console.log('Received result:', result);
    displayImage(result.images[0].url);
  },
  onError: (error) => {
    console.error('Generation error:', error);
  },
  onConnect: () => {
    console.log('WebSocket connected');
  },
  onDisconnect: () => {
    console.log('WebSocket disconnected');
  }
});

// Send generation requests
connection.send({
  prompt: 'a futuristic city at sunset',
  sync_mode: true,
  num_inference_steps: 4
});

// Send another request on the same connection
setTimeout(() => {
  connection.send({
    prompt: 'a serene mountain landscape',
    sync_mode: true,
    num_inference_steps: 4
  });
}, 1000);

// Close connection when done
setTimeout(() => {
  connection.close();
}, 5000);
```

### Python WebSocket Example

```python
import fal_client

# Synchronous realtime connection
connection = fal_client.realtime("fal-ai/fast-lcm-diffusion")

# Send request
result = connection.send({
    "prompt": "a futuristic city at sunset",
    "sync_mode": True,
    "num_inference_steps": 4
})

print(result["images"][0]["url"])

# Send another request
result2 = connection.send({
    "prompt": "a serene mountain landscape",
    "sync_mode": True,
    "num_inference_steps": 4
})

print(result2["images"][0]["url"])

# Close connection
connection.close()
```

### Async Python WebSocket Example

```python
import asyncio
import fal_client

async def generate_images():
    # Async realtime connection
    connection = await fal_client.realtime_async("fal-ai/fast-lcm-diffusion")

    try:
        # Send first request
        result1 = await connection.send({
            "prompt": "a futuristic city at sunset",
            "sync_mode": True,
            "num_inference_steps": 4
        })
        print(f"Image 1: {result1['images'][0]['url']}")

        # Send second request
        result2 = await connection.send({
            "prompt": "a serene mountain landscape",
            "sync_mode": True,
            "num_inference_steps": 4
        })
        print(f"Image 2: {result2['images'][0]['url']}")

    finally:
        await connection.close()

asyncio.run(generate_images())
```

### WebSocket Connection Lifecycle

```
┌──────────────────┐
│  Initialize      │
│  Connection      │
└────────┬─────────┘
         │
         ▼
┌──────────────────┐
│  Connect to      │
│  /realtime       │
│  endpoint        │
└────────┬─────────┘
         │
         ▼
┌──────────────────────┐
│  Connection Open     │◄────┐
│  (onConnect)         │     │
└────────┬─────────────┘     │
         │                   │
         ▼                   │
┌──────────────────┐         │
│  Send request    │─────────┤
│  (send)          │         │
└────────┬─────────┘         │
         │                   │
         ▼                   │
┌──────────────────┐         │
│  Receive result  │         │
│  (onResult)      │─────────┘
└────────┬─────────┘
         │
         ▼
┌──────────────────┐
│  Close connection│
│  (close)         │
└──────────────────┘
```

### Performance Optimizations

FAL.ai has made several optimizations for realtime WebSocket connections:

1. **Connection reuse**: WebSocket connections are reused across requests
2. **Model preloading**: Models stay loaded in memory
3. **GPU allocation**: Dedicated GPU resources for active connections
4. **Request batching**: Multiple requests can be batched internally

**Typical latency:** ~150-250ms per inference (model-dependent)

---

## 8. Event Streaming from Workers

### Overview

Event streaming allows distributed workers to send **progressive, intermediate results** back to clients in real-time during long-running operations. This is particularly useful for:

- **Image generation**: Show step-by-step progress
- **Video creation**: Stream frame generation updates
- **Model training**: Display loss metrics per epoch
- **Batch processing**: Report completion of individual items

### How It Works

Workers use the `add_streaming_result()` method to transmit intermediate data during execution. Results are formatted as Server-Sent Events (SSE) for efficient streaming.

### Worker-Side Implementation

**Python Worker Example:**
```python
import fal
from fal.distributed import DistributedWorker

class MyStreamingWorker(DistributedWorker):
    def __init__(self):
        super().__init__()

    def process(self, request):
        steps = request.get("steps", 20)

        for step in range(steps):
            # Perform computation
            image = self.generate_step(step)

            # Stream intermediate result (only from rank 0)
            if self.rank == 0:
                self.add_streaming_result({
                    "step": step,
                    "progress": (step + 1) / steps,
                    "message": f"Processing step {step + 1}/{steps}",
                    "preview": self.encode_image_base64(image)
                }, as_text_event=True)

            # Synchronize workers
            if self.world_size > 1:
                import torch.distributed as dist
                dist.barrier()

        # Return final result
        return {
            "images": [self.final_image_url],
            "steps_completed": steps
        }
```

**Key implementation points:**
- **`add_streaming_result(data, as_text_event=True)`**: Sends data to client as SSE
- **`if self.rank == 0`**: Only rank 0 worker should stream (avoid duplicates)
- **`dist.barrier()`**: Synchronize workers after streaming
- **Throttling**: Stream every N steps, not every iteration

### Endpoint Creation

```python
from fastapi.responses import StreamingResponse

@fal.endpoint("/stream")
async def stream_endpoint(self, request: MyRequest) -> StreamingResponse:
    return StreamingResponse(
        self.runner.stream(request.dict(), as_text_events=True),
        media_type="text/event-stream",
    )
```

### Client-Side Consumption

**JavaScript/TypeScript:**
```javascript
import { fal } from '@fal-ai/client';

const stream = await fal.stream('username/app-name', {
  arguments: {
    prompt: 'a sunset',
    steps: 20
  }
});

for await (const event of stream) {
  console.log(`Step ${event.step}: ${event.progress * 100}% complete`);
  if (event.preview) {
    displayPreviewImage(event.preview);
  }
}

// Get final result
const result = await stream.done();
console.log('Final result:', result);
```

**Python:**
```python
import fal_client

for event in fal_client.stream(
    "username/app-name",
    arguments={
        "prompt": "a sunset",
        "steps": 20
    }
):
    print(f"Step {event['step']}: {event['progress'] * 100}% complete")
    if 'preview' in event:
        display_preview(event['preview'])
```

### Streaming Image Previews

For streaming image data, convert PIL images to base64 data URIs:

```python
import base64
from io import BytesIO
from PIL import Image

def encode_image_base64(image: Image.Image) -> str:
    """Encode PIL image as base64 data URI"""
    buffer = BytesIO()
    image.save(buffer, format='JPEG', quality=85)
    image_bytes = buffer.getvalue()
    base64_str = base64.b64encode(image_bytes).decode('utf-8')
    return f"data:image/jpeg;base64,{base64_str}"
```

**Client-side rendering:**
```javascript
function displayPreviewImage(dataUri) {
  const img = document.createElement('img');
  img.src = dataUri;
  document.getElementById('preview').appendChild(img);
}
```

### Best Practices

1. **Rate limiting**: Stream every 5-10 steps, not every iteration
2. **Rank filtering**: Only rank 0 should stream
3. **Synchronization**: Use `dist.barrier()` after streaming
4. **Payload size**: Keep streaming data minimal (compress images, reduce resolution)
5. **Error handling**: Wrap streaming calls in try/except
6. **Throttling**: Implement client-side throttling to avoid UI jank

---

## 9. Python Client Library

### Installation

```bash
pip install fal-client
```

Latest version: **0.10.0** (as of December 2025)

### Authentication

Set environment variable:
```bash
export FAL_KEY="your-api-key"
```

Or configure in code:
```python
import fal_client
fal_client.configure(key="your-api-key")
```

### Execution Patterns

#### 9.1 Synchronous `run()` - Simplest Pattern

**Use case:** Quick scripts, simple testing, short-running tasks

```python
import fal_client

# Blocking call - waits for completion
result = fal_client.run(
    "fal-ai/fast-sdxl",
    arguments={
        "prompt": "a cute cat, realistic, orange",
        "image_size": "square_hd"
    }
)

print(result["images"][0]["url"])
```

**Characteristics:**
- Blocking operation
- Returns result directly
- No status tracking
- Simplest API

---

#### 9.2 Async `run_async()` - Non-blocking Direct Execution

**Use case:** Async applications, concurrent processing

```python
import asyncio
import fal_client

async def generate_image():
    result = await fal_client.run_async(
        "fal-ai/fast-sdxl",
        arguments={
            "prompt": "a cute cat, realistic, orange"
        }
    )
    return result["images"][0]["url"]

# Run async function
url = asyncio.run(generate_image())
print(url)
```

---

#### 9.3 `subscribe()` - Queue with Callbacks (Sync)

**Use case:** Synchronous code needing progress updates

```python
import fal_client

def on_queue_update(update):
    if isinstance(update, fal_client.Queued):
        print(f"Queued at position: {update.position}")
    elif isinstance(update, fal_client.InProgress):
        if update.logs:
            for log in update.logs:
                print(f"[{log['level']}] {log['message']}")

# Submit and wait with callbacks
result = fal_client.subscribe(
    "fal-ai/fast-sdxl",
    arguments={"prompt": "a cute cat"},
    with_logs=True,
    on_queue_update=on_queue_update
)

print(result["images"][0]["url"])
```

---

#### 9.4 `submit_async()` - Full Queue Control (Async)

**Use case:** Long-running tasks, full status tracking, log monitoring

```python
import asyncio
import fal_client

async def generate_with_tracking():
    # Submit to queue
    handle = await fal_client.submit_async(
        "fal-ai/fast-sdxl",
        arguments={
            "prompt": "a cute cat, realistic, orange"
        }
    )

    print(f"Request ID: {handle.request_id}")

    # Track progress with event iteration
    logs_index = 0
    async for event in handle.iter_events(with_logs=True):
        if isinstance(event, fal_client.Queued):
            print(f"Queued at position: {event.position}")

        elif isinstance(event, fal_client.InProgress):
            # Print new logs
            new_logs = event.logs[logs_index:]
            for log in new_logs:
                print(f"[{log['level']}] {log['message']}")
            logs_index = len(event.logs)

        elif isinstance(event, fal_client.Completed):
            print("Generation completed!")
            # Print final logs
            new_logs = event.logs[logs_index:]
            for log in new_logs:
                print(f"[{log['level']}] {log['message']}")

    # Get final result
    result = await handle.get()
    return result["images"][0]["url"]

url = asyncio.run(generate_with_tracking())
print(f"Image URL: {url}")
```

### Event Types

#### Queued Event

```python
class Queued:
    position: int  # Queue position (0-indexed)
```

**Example:**
```python
if isinstance(event, fal_client.Queued):
    print(f"Position in queue: {event.position}")
```

---

#### InProgress Event

```python
class InProgress:
    logs: list[dict]  # Execution logs (if with_logs=True)
```

**Log structure:**
```python
{
    "message": "Loading model weights...",
    "level": "INFO",  # INFO|WARN|ERROR|DEBUG|STDOUT|STDERR
    "source": "worker",
    "timestamp": "2025-12-28T10:30:00.123Z"
}
```

**Example:**
```python
if isinstance(event, fal_client.InProgress):
    for log in event.logs:
        print(f"[{log['level']}] {log['message']}")
```

---

#### Completed Event

```python
class Completed:
    logs: list[dict]  # Final logs (if with_logs=True)
    metrics: dict     # Inference metadata (optional)
```

**Example:**
```python
if isinstance(event, fal_client.Completed):
    print("Generation completed!")
    if event.metrics:
        print(f"Inference time: {event.metrics.get('inference_time')}s")
```

### Request Handle Methods

When using `submit_async()`, you receive a request handle with these methods:

```python
class AsyncRequestHandle:
    request_id: str       # Unique request identifier
    response_url: str     # URL to fetch result
    status_url: str       # URL to check status
    cancel_url: str       # URL to cancel request

    async def get() -> dict:
        """Wait for completion and return result"""
        pass

    async def iter_events(with_logs: bool = False):
        """Async generator yielding Queued, InProgress, Completed events"""
        pass

    async def status(with_logs: bool = False) -> Union[Queued, InProgress, Completed]:
        """Get current status"""
        pass

    async def cancel() -> bool:
        """Cancel request (only if IN_QUEUE)"""
        pass
```

**Usage examples:**

```python
# Get result directly (blocks until complete)
result = await handle.get()

# Check status once
status = await handle.status(with_logs=True)
if isinstance(status, fal_client.InProgress):
    print("Still processing...")

# Cancel request
if await handle.cancel():
    print("Request cancelled successfully")
else:
    print("Cannot cancel (already processing or completed)")
```

### Saving Request ID for Later Retrieval

```python
import asyncio
import fal_client

async def submit_and_save():
    # Submit request
    handle = await fal_client.submit_async(
        "fal-ai/fast-sdxl",
        arguments={"prompt": "a cat"}
    )

    # Save request_id to database
    request_id = handle.request_id
    save_to_database(request_id)

    print(f"Request ID: {request_id}")
    return request_id

async def retrieve_later(request_id):
    # Reconstruct handle from saved request_id
    # Note: This requires knowing the model endpoint
    handle = fal_client.AsyncRequestHandle(
        request_id=request_id,
        response_url=f"https://queue.fal.run/fal-ai/fast-sdxl/requests/{request_id}",
        status_url=f"https://queue.fal.run/fal-ai/fast-sdxl/requests/{request_id}/status",
        cancel_url=f"https://queue.fal.run/fal-ai/fast-sdxl/requests/{request_id}/cancel",
        client=fal_client.get_client()
    )

    # Get result
    result = await handle.get()
    return result

# Submit
request_id = asyncio.run(submit_and_save())

# Retrieve later (even in different process)
result = asyncio.run(retrieve_later(request_id))
```

### Realtime (WebSocket) Methods

```python
# Synchronous realtime
connection = fal_client.realtime("fal-ai/fast-lcm-diffusion")
result = connection.send({"prompt": "a cat"})
connection.close()

# Asynchronous realtime
async def use_realtime():
    connection = await fal_client.realtime_async("fal-ai/fast-lcm-diffusion")
    result = await connection.send({"prompt": "a cat"})
    await connection.close()
```

### Streaming Methods

```python
# Synchronous streaming
for event in fal_client.stream("username/app", arguments={"prompt": "a cat"}):
    print(event)

# Asynchronous streaming
async def use_stream():
    async for event in fal_client.stream_async("username/app", arguments={"prompt": "a cat"}):
        print(event)
```

---

## 10. JavaScript/TypeScript Client

### Installation

```bash
npm install @fal-ai/client
```

**Note:** `@fal-ai/serverless-client` is deprecated. Use `@fal-ai/client` (1.0.0+).

### Authentication

```javascript
import { fal } from '@fal-ai/client';

fal.config({
  credentials: process.env.FAL_KEY
});
```

**Environment variable:**
```bash
export FAL_KEY="your-api-key"
```

### Execution Patterns

#### 10.1 `fal.run()` - Simple Execution

```javascript
import { fal } from '@fal-ai/client';

const result = await fal.run('fal-ai/fast-sdxl', {
  input: {
    prompt: 'a cute cat, realistic, orange',
    image_size: 'square_hd'
  }
});

console.log(result.images[0].url);
```

---

#### 10.2 `fal.subscribe()` - Queue with Callbacks

```javascript
import { fal } from '@fal-ai/client';

const result = await fal.subscribe('fal-ai/fast-sdxl', {
  input: {
    prompt: 'a cute cat, realistic, orange'
  },
  logs: true,
  onQueueUpdate: (update) => {
    if (update.status === 'IN_QUEUE') {
      console.log(`Queue position: ${update.position}`);
    } else if (update.status === 'IN_PROGRESS') {
      update.logs?.forEach(log => {
        console.log(`[${log.level}] ${log.message}`);
      });
    }
  }
});

console.log(result.images[0].url);
```

---

#### 10.3 Manual Queue Management

```javascript
import { fal } from '@fal-ai/client';

// Submit to queue
const { request_id, response_url, status_url, cancel_url } = await fal.queue.submit('fal-ai/fast-sdxl', {
  input: {
    prompt: 'a cute cat'
  }
});

console.log(`Request ID: ${request_id}`);

// Poll for status
let status = await fal.queue.status('fal-ai/fast-sdxl', {
  requestId: request_id,
  logs: true
});

while (status.status === 'IN_QUEUE' || status.status === 'IN_PROGRESS') {
  console.log(`Status: ${status.status}`);

  if (status.status === 'IN_QUEUE') {
    console.log(`Position: ${status.queue_position}`);
  }

  if (status.logs) {
    status.logs.forEach(log => console.log(log.message));
  }

  // Wait before next poll
  await new Promise(resolve => setTimeout(resolve, 1000));

  // Poll again
  status = await fal.queue.status('fal-ai/fast-sdxl', {
    requestId: request_id,
    logs: true
  });
}

// Get result
const result = await fal.queue.result('fal-ai/fast-sdxl', {
  requestId: request_id
});

console.log(result.images[0].url);
```

---

#### 10.4 Stream Status Updates (SSE)

```javascript
// Using EventSource for streaming status
const eventSource = new EventSource(
  `${status_url}/stream?logs=1`,
  {
    headers: {
      'Authorization': `Key ${process.env.FAL_KEY}`
    }
  }
);

eventSource.onmessage = (event) => {
  const data = JSON.parse(event.data);

  console.log(`Status: ${data.status}`);

  if (data.status === 'COMPLETED') {
    eventSource.close();
    fetchResult(response_url);
  }
};

eventSource.onerror = (error) => {
  console.error('SSE Error:', error);
  eventSource.close();
};
```

---

#### 10.5 Cancel Request

```javascript
const cancelled = await fal.queue.cancel('fal-ai/fast-sdxl', {
  requestId: request_id
});

if (cancelled) {
  console.log('Request cancelled successfully');
} else {
  console.log('Cannot cancel (already processing or completed)');
}
```

### Realtime (WebSocket) API

```javascript
import { fal } from '@fal-ai/client';

const connection = fal.realtime.connect('fal-ai/fast-lcm-diffusion', {
  onResult: (result) => {
    console.log('Result:', result);
    displayImage(result.images[0].url);
  },
  onError: (error) => {
    console.error('Error:', error);
  },
  onConnect: () => {
    console.log('Connected');
  },
  onDisconnect: () => {
    console.log('Disconnected');
  }
});

// Send requests
connection.send({
  prompt: 'a futuristic city',
  sync_mode: true,
  num_inference_steps: 4
});

// Close connection
setTimeout(() => connection.close(), 5000);
```

### Streaming API

```javascript
import { fal } from '@fal-ai/client';

const stream = await fal.stream('username/app-name', {
  arguments: {
    prompt: 'a sunset',
    steps: 20
  }
});

for await (const event of stream) {
  console.log(`Progress: ${event.progress * 100}%`);
  if (event.preview) {
    displayPreview(event.preview);
  }
}

const result = await stream.done();
console.log('Final result:', result);
```

### TypeScript Types

```typescript
import { fal } from '@fal-ai/client';

interface FastSDXLInput {
  prompt: string;
  image_size?: 'square_hd' | 'square' | 'portrait_4_3' | 'landscape_4_3';
  num_inference_steps?: number;
  guidance_scale?: number;
  num_images?: number;
  seed?: number;
}

interface FastSDXLOutput {
  images: Array<{
    url: string;
    width: number;
    height: number;
    content_type: string;
  }>;
  seed: number;
  inference_time: number;
}

const result = await fal.run<FastSDXLInput, FastSDXLOutput>('fal-ai/fast-sdxl', {
  input: {
    prompt: 'a cat',
    image_size: 'square_hd'
  }
});

// TypeScript knows result.images exists and has correct structure
console.log(result.images[0].url);
```

---

## 11. Authentication & Security

### Authentication Methods

FAL.ai uses a custom **Key-based authentication** format (not Bearer):

```
Authorization: Key YOUR_API_KEY
```

**NOT:**
```
Authorization: Bearer YOUR_API_KEY  ❌
```

### Getting API Keys

1. Visit https://fal.ai
2. Log in / Sign up
3. Navigate to API Keys section
4. Generate new key

### Environment Variables

**Best practice:** Store credentials in environment variables

```bash
export FAL_KEY="your-api-key-here"
```

**Python:**
```python
import os
fal_client.configure(key=os.environ.get("FAL_KEY"))
```

**JavaScript:**
```javascript
fal.config({
  credentials: process.env.FAL_KEY
});
```

### Client-Side Security (JavaScript)

**CRITICAL:** Do NOT expose API keys in client-side code (browser, mobile apps).

**Recommended approach:** Use a server-side proxy.

#### Setting Up a Proxy (Next.js Example)

**Install proxy package:**
```bash
npm install @fal-ai/server-proxy
```

**Create API route:** `pages/api/fal/proxy.js`
```javascript
import { route } from '@fal-ai/server-proxy/nextjs';

export default route;
```

**Set environment variable:**
```bash
# .env.local
FAL_KEY=your-api-key-here
```

**Configure client to use proxy:**
```javascript
import { fal } from '@fal-ai/client';

fal.config({
  proxyUrl: '/api/fal/proxy'
});

// Now all requests route through your server
const result = await fal.run('fal-ai/fast-sdxl', {
  input: { prompt: 'a cat' }
});
```

**How it works:**
1. Client calls your Next.js API route (`/api/fal/proxy`)
2. Proxy adds `Authorization: Key FAL_KEY` header
3. Proxy forwards request to FAL.ai
4. Response returned to client

**Result:** API key never exposed to client.

#### Express.js Proxy

```javascript
import express from 'express';
import { createProxyHandler } from '@fal-ai/server-proxy';

const app = express();

app.all('/api/fal/*', createProxyHandler({
  credentials: process.env.FAL_KEY
}));

app.listen(3000);
```

### JWT Tokens for Real-Time Models

For real-time WebSocket connections, FAL.ai recommends using **short-lived JWT tokens** instead of API keys.

**Server-side (generate token):**
```javascript
import jwt from 'jsonwebtoken';

app.post('/api/generate-fal-token', (req, res) => {
  const token = jwt.sign(
    { sub: req.user.id },
    process.env.FAL_SECRET,
    { expiresIn: '5m' }
  );

  res.json({ token });
});
```

**Client-side (use token):**
```javascript
// Fetch short-lived token from your server
const { token } = await fetch('/api/generate-fal-token').then(r => r.json());

// Use token for realtime connection
const connection = fal.realtime.connect('fal-ai/fast-lcm-diffusion', {
  credentials: token,
  onResult: (result) => console.log(result)
});
```

### Secrets Management for Serverless Functions

If deploying FAL.ai functions, use the `fal secrets` CLI:

```bash
# Set secret
fal secrets set API_KEY your-api-key-value

# List secrets
fal secrets list

# Delete secret
fal secrets delete API_KEY
```

**Access in function:**
```python
import os
api_key = os.environ.get("API_KEY")
```

---

## 12. Error Handling & Retry Logic

### HTTP Status Codes

| Status Code | Meaning | Action |
|-------------|---------|--------|
| **200** | Success | Process result |
| **202** | Queued/In Progress | Continue polling or streaming |
| **400** | Bad Request | Fix input parameters |
| **401** | Unauthorized | Check API key |
| **422** | Unprocessable Entity | Validate input schema |
| **429** | Rate Limited | Implement backoff, retry |
| **500** | Server Error | Retry with exponential backoff |
| **503** | Service Unavailable | Retry with exponential backoff |

### Error Response Format

```json
{
  "error": "Invalid prompt format",
  "status_code": 422,
  "detail": "Prompt must be a non-empty string"
}
```

### Retry Logic Implementation

#### Exponential Backoff Pattern

```python
import time
import random

def exponential_backoff_retry(func, max_retries=5):
    """Retry with exponential backoff"""
    for attempt in range(max_retries):
        try:
            return func()
        except Exception as e:
            if attempt == max_retries - 1:
                raise  # Final attempt failed

            # Calculate wait time: min(2^attempt, 64) with jitter
            wait_time = min(2 ** attempt, 64) + random.uniform(0, 1)

            print(f"Attempt {attempt + 1} failed: {e}")
            print(f"Retrying in {wait_time:.2f} seconds...")

            time.sleep(wait_time)
```

**Usage:**
```python
import fal_client

def submit_request():
    return fal_client.run("fal-ai/fast-sdxl", arguments={"prompt": "a cat"})

result = exponential_backoff_retry(submit_request, max_retries=5)
```

#### JavaScript Exponential Backoff

```javascript
async function exponentialBackoffRetry(fn, maxRetries = 5) {
  for (let attempt = 0; attempt < maxRetries; attempt++) {
    try {
      return await fn();
    } catch (error) {
      if (attempt === maxRetries - 1) {
        throw error; // Final attempt failed
      }

      // Calculate wait time: min(2^attempt, 64000) with jitter
      const waitTime = Math.min(Math.pow(2, attempt) * 1000, 64000) + Math.random() * 1000;

      console.log(`Attempt ${attempt + 1} failed:`, error.message);
      console.log(`Retrying in ${waitTime / 1000} seconds...`);

      await new Promise(resolve => setTimeout(resolve, waitTime));
    }
  }
}

// Usage
const result = await exponentialBackoffRetry(
  () => fal.run('fal-ai/fast-sdxl', { input: { prompt: 'a cat' } }),
  5
);
```

### Rate Limiting

#### Concurrent Request Limits

Some models have concurrent request limits:
- **Veo3**: Maximum 2 concurrent requests
- **Other models**: Varies by model and subscription tier

**Error when exceeded:**
```json
{
  "error": "Rate limit exceeded - Maximum 2 concurrent requests"
}
```

**Handling strategy:**
```python
import asyncio
from asyncio import Semaphore

# Limit to 2 concurrent requests
semaphore = Semaphore(2)

async def generate_with_limit(prompt):
    async with semaphore:
        return await fal_client.run_async("fal-ai/veo3", arguments={"prompt": prompt})

# Submit many requests
tasks = [generate_with_limit(f"prompt {i}") for i in range(10)]
results = await asyncio.gather(*tasks)
```

#### Retry After Rate Limit

**Important:** Do NOT retry immediately when rate limited.

**Recommended approach:**
```python
import time

def handle_rate_limit(func):
    while True:
        try:
            return func()
        except RateLimitError as e:
            # Extract retry-after header if available
            retry_after = e.retry_after or 60
            print(f"Rate limited. Waiting {retry_after} seconds...")
            time.sleep(retry_after)
```

### Network/Timeout Errors

#### Configure Timeouts

**Python:**
```python
import fal_client
from fal_client import AsyncRequestHandle

# Custom timeout for status checks (default 120s)
async def get_result_with_timeout(handle: AsyncRequestHandle, timeout=300):
    import asyncio

    try:
        result = await asyncio.wait_for(handle.get(), timeout=timeout)
        return result
    except asyncio.TimeoutError:
        print(f"Request timed out after {timeout} seconds")
        # Optionally cancel request
        await handle.cancel()
        raise
```

**JavaScript:**
```javascript
async function getResultWithTimeout(requestId, timeoutMs = 300000) {
  const timeoutPromise = new Promise((_, reject) =>
    setTimeout(() => reject(new Error('Timeout')), timeoutMs)
  );

  const resultPromise = fal.queue.result('fal-ai/fast-sdxl', {
    requestId: requestId
  });

  try {
    return await Promise.race([resultPromise, timeoutPromise]);
  } catch (error) {
    // Cancel request on timeout
    await fal.queue.cancel('fal-ai/fast-sdxl', { requestId });
    throw error;
  }
}
```

### Webhook Failures

Webhook retry behavior (automatic):
- **Retries**: 10 attempts
- **Duration**: Over 2 hours
- **Backoff**: Exponential

**Ensure endpoint:**
- Returns 2xx status code quickly (< 5 seconds)
- Processes payload asynchronously
- Handles duplicate deliveries (idempotency)

**Idempotent webhook handler:**
```javascript
const processedRequests = new Set();

app.post('/webhooks/fal', async (req, res) => {
  const requestId = req.body.request_id;

  // Check if already processed
  if (processedRequests.has(requestId)) {
    console.log('Duplicate webhook, skipping');
    return res.status(200).send('OK');
  }

  // Mark as processed
  processedRequests.add(requestId);

  // Respond immediately
  res.status(200).send('OK');

  // Process asynchronously
  processWebhook(req.body).catch(console.error);
});
```

---

## 13. Performance Optimization

### Batching & Priority Queues

#### Smart Batching

Batch processing can improve throughput by **10x or more**. Key strategies:

1. **Batch similar requests** to reuse cached embeddings
2. **Group by model** to avoid model switching overhead
3. **Priority queuing** for urgent vs background tasks

**Example: Priority queue pattern**
```python
from enum import Enum
import asyncio

class Priority(Enum):
    HIGH = 1
    MEDIUM = 2
    LOW = 3

async def submit_with_priority(prompt, priority: Priority):
    # High priority: use synchronous endpoint for immediate processing
    if priority == Priority.HIGH:
        return await fal_client.run_async("fal-ai/fast-sdxl", arguments={"prompt": prompt})

    # Medium/Low: use queue
    handle = await fal_client.submit_async("fal-ai/fast-sdxl", arguments={"prompt": prompt})

    # Medium: poll frequently
    if priority == Priority.MEDIUM:
        return await handle.get()

    # Low: save for batch retrieval later
    save_request_id(handle.request_id)
    return handle.request_id

# Usage
high_priority = await submit_with_priority("urgent user request", Priority.HIGH)
medium_priority = await submit_with_priority("normal request", Priority.MEDIUM)
low_priority = await submit_with_priority("background task", Priority.LOW)
```

#### Batch Result Retrieval

```python
import asyncio

async def batch_retrieve_results(request_ids):
    """Retrieve multiple queue results concurrently"""
    async def get_result(request_id):
        handle = fal_client.AsyncRequestHandle(
            request_id=request_id,
            response_url=f"https://queue.fal.run/fal-ai/fast-sdxl/requests/{request_id}",
            status_url=f"https://queue.fal.run/fal-ai/fast-sdxl/requests/{request_id}/status",
            cancel_url=f"https://queue.fal.run/fal-ai/fast-sdxl/requests/{request_id}/cancel",
            client=fal_client.get_client()
        )
        return await handle.get()

    # Fetch all results concurrently
    tasks = [get_result(rid) for rid in request_ids]
    results = await asyncio.gather(*tasks, return_exceptions=True)

    return results
```

### Caching Strategies

#### Prompt Embedding Cache

For frequently used prompts, cache embeddings to save compute:

```python
import hashlib
import json

cache = {}

def cached_generation(prompt, **kwargs):
    # Generate cache key
    cache_key = hashlib.sha256(f"{prompt}:{json.dumps(kwargs)}".encode()).hexdigest()

    # Check cache
    if cache_key in cache:
        print("Cache hit!")
        return cache[cache_key]

    # Generate
    result = fal_client.run("fal-ai/fast-sdxl", arguments={"prompt": prompt, **kwargs})

    # Store in cache
    cache[cache_key] = result
    return result
```

### Performance Benchmarks

**From FAL.ai documentation:**
- **Batch processing with mixed precision**: 73% latency reduction
- **Real-time models (LCM)**: ~150ms per inference
- **Standard SDXL**: ~2-4 seconds per image
- **FLUX Schnell**: 4 inference steps, sub-second generation

### Object Lifecycle Optimization

Control how long generated assets remain available:

```bash
curl -X POST https://queue.fal.run/fal-ai/fast-sdxl \
  -H "Authorization: Key $FAL_KEY" \
  -H 'X-Fal-Object-Lifecycle-Preference: {"expiration_duration_seconds": 3600}' \
  -d '{"prompt": "a cat"}'
```

**Recommendations:**
- **Short-lived previews**: 1 hour (3600s)
- **User-facing results**: 24 hours (86400s)
- **Long-term storage**: Download and store externally

---

## 14. Object Lifecycle Management

### Overview

By default, generated objects (images, videos, files) are stored temporarily on FAL.ai's CDN. You can control expiration duration using the `X-Fal-Object-Lifecycle-Preference` header.

### Header Format

```
X-Fal-Object-Lifecycle-Preference: {"expiration_duration_seconds": 3600}
```

**Duration in seconds:**
- `3600` = 1 hour
- `86400` = 24 hours
- `604800` = 7 days

### cURL Example

```bash
curl -X POST https://queue.fal.run/fal-ai/fast-sdxl \
  -H "Authorization: Key $FAL_KEY" \
  -H "Content-Type: application/json" \
  -H 'X-Fal-Object-Lifecycle-Preference: {"expiration_duration_seconds": 7200}' \
  -d '{
    "prompt": "a cat"
  }'
```

### Python Example

```python
import requests

headers = {
    "Authorization": f"Key {FAL_KEY}",
    "Content-Type": "application/json",
    "X-Fal-Object-Lifecycle-Preference": '{"expiration_duration_seconds": 7200}'
}

response = requests.post(
    "https://queue.fal.run/fal-ai/fast-sdxl",
    headers=headers,
    json={"prompt": "a cat"}
)
```

### JavaScript Example

```javascript
const response = await fetch('https://queue.fal.run/fal-ai/fast-sdxl', {
  method: 'POST',
  headers: {
    'Authorization': `Key ${process.env.FAL_KEY}`,
    'Content-Type': 'application/json',
    'X-Fal-Object-Lifecycle-Preference': '{"expiration_duration_seconds": 7200}'
  },
  body: JSON.stringify({ prompt: 'a cat' })
});
```

### Best Practices

1. **Download important assets**: Don't rely on FAL.ai for long-term storage
2. **Set appropriate expiration**: Balance storage costs and availability
3. **Monitor expiration**: Track when assets will expire
4. **Implement fallback**: Handle expired URLs gracefully

```python
import requests
from datetime import datetime, timedelta

def download_and_store(image_url, expiration_seconds):
    """Download image before expiration"""
    # Calculate expiration time
    expiration = datetime.now() + timedelta(seconds=expiration_seconds)

    # Download image
    response = requests.get(image_url)

    # Store to your own storage (S3, etc.)
    upload_to_s3(response.content, expiration)
```

---

## 15. Code Examples & Patterns

### Pattern 1: Queue with Webhook (Production Recommended)

**Use case:** Long-running tasks, background processing, asynchronous workflows

```python
import asyncio
import fal_client
from fastapi import FastAPI, Request

app = FastAPI()

# Submit to queue with webhook
async def submit_generation(prompt: str, user_id: str):
    # Note: Webhook URL must be publicly accessible
    webhook_url = f"https://your-app.com/webhooks/fal?user_id={user_id}"

    # Submit to queue with webhook
    response = await fal_client.submit_async(
        "fal-ai/fast-sdxl",
        arguments={"prompt": prompt}
    )

    # Save request_id for tracking
    save_to_database(response.request_id, user_id)

    return {"request_id": response.request_id}

# Webhook endpoint
@app.post("/webhooks/fal")
async def handle_webhook(request: Request):
    # Verify signature (see Webhooks section)
    await verify_webhook(request.headers, await request.body())

    # Parse payload
    payload = await request.json()

    # Respond immediately
    response = Response(status_code=200)

    # Process asynchronously
    asyncio.create_task(process_result(payload))

    return response

async def process_result(payload):
    if payload["status"] == "OK":
        user_id = get_user_from_request_id(payload["request_id"])
        notify_user(user_id, payload["data"]["images"][0]["url"])
    else:
        handle_error(payload["error"])
```

### Pattern 2: Queue with SSE Status Streaming

**Use case:** Real-time UI updates, progress bars, live feedback

```javascript
import { fal } from '@fal-ai/client';

async function generateWithProgress(prompt, onProgress) {
  // Submit to queue
  const { request_id, status_url } = await fal.queue.submit('fal-ai/fast-sdxl', {
    input: { prompt }
  });

  // Stream status updates via SSE
  const eventSource = new EventSource(`${status_url}/stream?logs=1`);

  return new Promise((resolve, reject) => {
    eventSource.onmessage = async (event) => {
      const data = JSON.parse(event.data);

      if (data.status === 'IN_QUEUE') {
        onProgress({
          stage: 'queued',
          position: data.queue_position,
          message: `Queue position: ${data.queue_position}`
        });
      } else if (data.status === 'IN_PROGRESS') {
        onProgress({
          stage: 'processing',
          logs: data.logs,
          message: 'Generating image...'
        });
      } else if (data.status === 'COMPLETED') {
        eventSource.close();

        // Fetch result
        const result = await fal.queue.result('fal-ai/fast-sdxl', {
          requestId: request_id
        });

        resolve(result);
      }
    };

    eventSource.onerror = (error) => {
      eventSource.close();
      reject(error);
    };
  });
}

// Usage in React
function ImageGenerator() {
  const [progress, setProgress] = useState(null);

  const generate = async () => {
    const result = await generateWithProgress(
      'a cat',
      (progressData) => setProgress(progressData)
    );

    displayImage(result.images[0].url);
  };

  return (
    <div>
      <button onClick={generate}>Generate</button>
      {progress && (
        <div>
          <p>{progress.message}</p>
          {progress.stage === 'queued' && <p>Position: {progress.position}</p>}
          {progress.logs && progress.logs.map(log => <p key={log.timestamp}>{log.message}</p>)}
        </div>
      )}
    </div>
  );
}
```

### Pattern 3: Realtime Interactive Editor

**Use case:** Live image editing, instant feedback, interactive demos

```javascript
import { fal } from '@fal-ai/client';

class RealtimeImageEditor {
  constructor() {
    this.connection = null;
    this.resultCallback = null;
  }

  async connect(onResult) {
    this.resultCallback = onResult;

    this.connection = fal.realtime.connect('fal-ai/fast-lcm-diffusion', {
      onResult: (result) => {
        this.resultCallback(result.images[0].url);
      },
      onError: (error) => {
        console.error('Generation error:', error);
      },
      onConnect: () => {
        console.log('Realtime connection established');
      }
    });
  }

  generate(prompt, options = {}) {
    if (!this.connection) {
      throw new Error('Not connected. Call connect() first.');
    }

    this.connection.send({
      prompt,
      sync_mode: true,
      num_inference_steps: 4,
      ...options
    });
  }

  disconnect() {
    if (this.connection) {
      this.connection.close();
      this.connection = null;
    }
  }
}

// Usage
const editor = new RealtimeImageEditor();
await editor.connect((imageUrl) => {
  document.getElementById('preview').src = imageUrl;
});

// User types in input
document.getElementById('prompt').addEventListener('input', (e) => {
  // Debounce to avoid spamming
  clearTimeout(window.debounceTimer);
  window.debounceTimer = setTimeout(() => {
    editor.generate(e.target.value);
  }, 500);
});

// Cleanup
window.addEventListener('beforeunload', () => {
  editor.disconnect();
});
```

### Pattern 4: Batch Processing with Concurrency Control

**Use case:** Processing large datasets, bulk operations

```python
import asyncio
from asyncio import Semaphore
import fal_client

async def batch_process(prompts, max_concurrent=5):
    """Process multiple prompts with concurrency limit"""
    semaphore = Semaphore(max_concurrent)

    async def process_single(prompt):
        async with semaphore:
            try:
                result = await fal_client.run_async(
                    "fal-ai/fast-sdxl",
                    arguments={"prompt": prompt}
                )
                return {"success": True, "prompt": prompt, "result": result}
            except Exception as e:
                return {"success": False, "prompt": prompt, "error": str(e)}

    # Process all prompts concurrently (with limit)
    tasks = [process_single(prompt) for prompt in prompts]
    results = await asyncio.gather(*tasks)

    # Separate successes and failures
    successes = [r for r in results if r["success"]]
    failures = [r for r in results if not r["success"]]

    print(f"Processed: {len(successes)} succeeded, {len(failures)} failed")

    return {"successes": successes, "failures": failures}

# Usage
prompts = [f"image {i}" for i in range(100)]
results = asyncio.run(batch_process(prompts, max_concurrent=10))
```

### Pattern 5: Queue with Fallback to Cache

**Use case:** Reduce redundant generations, improve response time

```python
import hashlib
import fal_client

class CachedGenerator:
    def __init__(self):
        self.cache = {}

    def get_cache_key(self, prompt, **kwargs):
        """Generate deterministic cache key"""
        params = f"{prompt}:{sorted(kwargs.items())}"
        return hashlib.sha256(params.encode()).hexdigest()

    async def generate(self, prompt, **kwargs):
        """Generate with cache fallback"""
        cache_key = self.get_cache_key(prompt, **kwargs)

        # Check cache
        if cache_key in self.cache:
            print(f"Cache hit for: {prompt[:50]}")
            return self.cache[cache_key]

        # Generate
        print(f"Cache miss, generating: {prompt[:50]}")
        result = await fal_client.run_async(
            "fal-ai/fast-sdxl",
            arguments={"prompt": prompt, **kwargs}
        )

        # Store in cache
        self.cache[cache_key] = result

        return result

# Usage
generator = CachedGenerator()

# First call: generates
result1 = await generator.generate("a cat", image_size="square_hd")

# Second call: cached
result2 = await generator.generate("a cat", image_size="square_hd")  # Instant!

# Different params: generates
result3 = await generator.generate("a cat", image_size="landscape_4_3")
```

### Pattern 6: Retry with Exponential Backoff

**Use case:** Handle transient failures, rate limits

```python
import asyncio
import random

async def retry_with_backoff(func, max_retries=5):
    """Retry with exponential backoff and jitter"""
    for attempt in range(max_retries):
        try:
            return await func()
        except Exception as e:
            if attempt == max_retries - 1:
                raise  # Final attempt failed

            # Calculate backoff: min(2^attempt, 64) + jitter
            base_wait = min(2 ** attempt, 64)
            jitter = random.uniform(0, 1)
            wait_time = base_wait + jitter

            print(f"Attempt {attempt + 1} failed: {e}")
            print(f"Retrying in {wait_time:.2f} seconds...")

            await asyncio.sleep(wait_time)

# Usage
result = await retry_with_backoff(
    lambda: fal_client.run_async("fal-ai/fast-sdxl", arguments={"prompt": "a cat"}),
    max_retries=5
)
```

---

## Conclusion

This documentation provides a comprehensive reference for FAL.ai's streaming, queue, and real-time API capabilities. Key takeaways:

### When to Use Each Pattern

| Pattern | Latency | Complexity | Best For |
|---------|---------|------------|----------|
| **Synchronous (`fal.run`)** | Seconds | Low | Quick scripts, testing |
| **Queue (`queue.fal.run`)** | Seconds-Minutes | Medium | Long-running tasks, background processing |
| **Queue + Webhooks** | Async | High | Production apps, serverless workflows |
| **Queue + SSE** | Real-time updates | Medium | Real-time UI, progress tracking |
| **WebSocket (`realtime`)** | 150-250ms | Medium | Interactive apps, live editing |
| **Streaming Events** | Real-time | High | Progressive results, distributed workers |

### Production Recommendations

1. **Use queue system for reliability**: Handles connection failures gracefully
2. **Implement webhooks for async workflows**: Avoids polling overhead
3. **Use SSE for real-time UI updates**: Better than polling
4. **Proxy API keys on server-side**: Never expose credentials in client code
5. **Implement retry logic with exponential backoff**: Handle transient failures
6. **Control object lifecycle**: Set appropriate expiration times
7. **Monitor concurrent request limits**: Respect rate limits per model
8. **Cache frequent requests**: Reduce redundant generations

---

## Sources & References

### Official Documentation
- [Queue API - fal.ai Reference](https://docs.fal.ai/model-apis/model-endpoints/queue)
- [Webhooks API - fal.ai Reference](https://docs.fal.ai/model-apis/model-endpoints/webhooks)
- [Event Streaming - fal.ai](https://docs.fal.ai/serverless/distributed/streaming)
- [Client Libraries - fal.ai](https://docs.fal.ai/model-apis/client)
- [Authentication - fal.ai](https://docs.fal.ai/platform-apis/authentication)
- [Keeping fal API Secrets Safe](https://docs.fal.ai/model-apis/real-time/secrets)

### Client Libraries
- [fal.ai Python client (PyPI)](https://pypi.org/project/fal-client/)
- [fal_client package documentation](https://fal-ai.github.io/fal/client/fal_client.html)
- [GitHub - fal-ai/fal-js](https://github.com/fal-ai/fal-js)
- [@fal-ai/client (npm)](https://www.npmjs.com/package/@fal-ai/client)
- [@fal-ai/client Reference](https://fal-ai.github.io/fal-js/reference/)

### Guides & Tutorials
- [Building Applications with Real-Time Stable Diffusion APIs](https://blog.fal.ai/building-applications-with-real-time-stable-diffusion-apis/)
- [Generative Media Performance Optimization](https://fal.ai/learn/devs/gen-ai-performance-optimization)
- [Veo3 Developer Guide](https://fal.ai/learn/devs/veo3-developer-guide-building-production-ready-video-generation-applications)
- [fal.ai Webhooks Guide (Hooklistener)](https://www.hooklistener.com/learn/fal-ai-webhooks-guide)

### Community Resources
- [GitHub - hosmelq/falai-php](https://github.com/hosmelq/falai-php)
- [GitHub - fal-ai-community/fal-demos](https://github.com/fal-ai-community/fal-demos)
- [fal.ai API Documentation (Postman)](https://www.postman.com/ai-engineer/generative-ai-apis/documentation/wwefudz/fal-ai-api)

### Integration Resources
- [Fal AI · Cloudflare AI Gateway docs](https://developers.cloudflare.com/ai-gateway/usage/providers/fal/)
- [fal - Vercel Integration](https://blog.fal.ai/fal-vercel/)
- [Image generation with Fal.ai and Trigger.dev Realtime](https://trigger.dev/docs/guides/example-projects/realtime-fal-ai)

### Additional References
- [Fal.ai: The OpenRouter of Media - Adam Holter](https://adam.holter.com/fal-ai-the-openrouter-of-media-one-api-600-generative-models-focused-on-performance/)
- [How fal.ai offers the fastest generative ai in the world (Tigris)](https://www.tigrisdata.com/blog/case-study-falai/)
- [Top 5 Fal.ai alternatives (Northflank)](https://northflank.com/blog/top-5-fal-ai-alternatives-for-inference-and-ai-infrastructure)

---

**Document Version:** 1.0
**Last Updated:** 2025-12-28
**Word Count:** ~10,500 words
**Status:** Complete
