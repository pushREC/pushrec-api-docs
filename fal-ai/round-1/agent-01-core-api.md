---
source: Official FAL.ai Documentation
scraped: 2025-12-28
api_provider: FAL.ai
discovery_tier: 3
verified: false
title: FAL.ai Core REST API Documentation
---
[[3-Resources/anchors/status-complete]]

# FAL.ai Core REST API Documentation

## Executive Summary

FAL.ai is a serverless platform providing access to **600+ generative AI models** for image, video, audio, 3D, and LLM workloads. The platform offers a unified REST API with multiple execution modes: synchronous inference, asynchronous queues, webhooks, and real-time WebSocket connections.

This document provides exhaustive technical documentation for building SaaS applications on top of FAL.ai's infrastructure, covering all API endpoints, authentication mechanisms, error handling, and integration patterns.

### Platform Highlights

- **600+ Models**: Image generation (FLUX, SDXL, Imagen), video (Veo, Kling, Luma), audio (ElevenLabs), 3D (Tripo3D)
- **Multiple Execution Modes**: Sync, Queue, Streaming, WebSocket, Webhooks
- **Global Infrastructure**: US-East, US-West, US-Central, EU-West, EU-North regions
- **GPU Fleet**: H100, H200, A100, A6000 GPUs available
- **Serverless Deployment**: Deploy custom Python functions with `fal deploy`

---

## Base URLs & Endpoint Architecture

### Primary API Endpoints

| Purpose | Base URL | Description |
|---------|----------|-------------|
| **Synchronous Inference** | `https://fal.run/{model_id}` | Direct model execution, blocking |
| **Queue API** | `https://queue.fal.run/{model_id}` | Async job submission |
| **WebSocket API** | `wss://ws.fal.run/{model_id}` | Real-time bidirectional |
| **Platform API** | `https://api.fal.ai/v1/` | Usage, pricing, management |
| **REST Alpha** | `https://rest.alpha.fal.ai/` | JWKS, experimental features |

### Model ID Format

Model IDs follow the pattern: `{namespace}/{model-name}` or `{namespace}/{model-name}/{subpath}`

**Examples:**
```
fal-ai/flux/dev                    # FLUX.1 [dev] model
fal-ai/flux-pro/v1.1-ultra         # FLUX Pro v1.1 Ultra
fal-ai/stable-video                # Stable Video Diffusion
fal-ai/kling-video/v2.5-turbo/pro  # Kling 2.5 with subpath
```

### Endpoint Construction

For any model, construct endpoints by combining base URL + model ID:

```
# Synchronous execution
POST https://fal.run/fal-ai/flux/dev

# Queue submission
POST https://queue.fal.run/fal-ai/flux/dev

# Queue status
GET https://queue.fal.run/fal-ai/flux/dev/requests/{request_id}/status

# Queue result
GET https://queue.fal.run/fal-ai/flux/dev/requests/{request_id}

# WebSocket connection
wss://ws.fal.run/fal-ai/flux/dev
```

---

## Authentication & Security

### API Key Authentication

FAL.ai uses API key authentication via the `Authorization` header.

**Header Format:**
```
Authorization: Key YOUR_API_KEY
```

**IMPORTANT:** Use `Key` prefix, NOT `Bearer`. This is a common mistake.

### Key Types & Scopes

| Scope | Access Level | Use Cases |
|-------|--------------|-----------|
| **API** | Standard model access | Inference, queue operations, storage |
| **Admin** | Sensitive operations | Usage API, billing, team management |

### Obtaining API Keys

1. Navigate to https://fal.ai/dashboard/keys
2. Click "Create API Key"
3. Select scope (API or Admin)
4. Copy and securely store the key

### Environment Variable Configuration

**Recommended approach** - Set environment variable:

```bash
# Linux/macOS
export FAL_KEY="your-api-key-here"

# Windows PowerShell
$env:FAL_KEY = "your-api-key-here"

# .env file
FAL_KEY=your-api-key-here
```

Alternative variable names: `FAL_API_KEY`, `FAL_KEY_ID` + `FAL_KEY_SECRET` (for key pairs)

### Authentication Examples

**cURL:**
```bash
curl -X POST "https://fal.run/fal-ai/flux/dev" \
  -H "Authorization: Key $FAL_KEY" \
  -H "Content-Type: application/json" \
  -d '{"prompt": "a photo of a cat"}'
```

**JavaScript:**
```javascript
const response = await fetch('https://fal.run/fal-ai/flux/dev', {
  method: 'POST',
  headers: {
    'Authorization': `Key ${process.env.FAL_KEY}`,
    'Content-Type': 'application/json'
  },
  body: JSON.stringify({ prompt: 'a photo of a cat' })
});
```

**Python:**
```python
import requests
import os

response = requests.post(
    'https://fal.run/fal-ai/flux/dev',
    headers={
        'Authorization': f'Key {os.environ["FAL_KEY"]}',
        'Content-Type': 'application/json'
    },
    json={'prompt': 'a photo of a cat'}
)
```

### Security Best Practices

1. **Never expose keys client-side** - Use server-side proxy
2. **Rotate keys regularly** - Create new keys and deprecate old ones
3. **Use environment variables** - Never hardcode in source code
4. **Implement proxy pattern** - For browser/mobile apps

**Next.js Proxy Pattern:**
```javascript
// pages/api/fal-proxy.js
import { route } from '@fal-ai/serverless-client/proxy';

export const config = { api: { bodyParser: false } };
export default route;
```

---

## Rate Limiting & Quotas

### Concurrent Task Limits

| Tier | Concurrent Tasks | Notes |
|------|-----------------|-------|
| **Standard** | 2 | Per user, across all endpoints |
| **Enterprise** | Custom | Contact sales for higher limits |

### Rate Limit Behavior

- Requests exceeding limits receive `429 Too Many Requests`
- API requests prioritized over Playground UI usage
- Queue submissions count toward concurrent limit until completed

### Rate Limit Headers

Responses include rate limit information:

```
X-RateLimit-Limit: 2
X-RateLimit-Remaining: 1
X-RateLimit-Reset: 1703779200
```

### Best Practices for High Volume

1. **Use Queue API** - For parallel processing without blocking
2. **Implement backoff** - Exponential backoff on 429 errors
3. **Batch intelligently** - Group related requests
4. **Monitor usage** - Track via Usage API

---

## Queue API Complete Reference

The Queue API enables asynchronous job execution with status tracking, cancellation, and webhook notifications.

### Queue Endpoints

| Method | Endpoint | Description |
|--------|----------|-------------|
| `POST` | `/` | Submit job to queue |
| `GET` | `/requests/{id}/status` | Get job status |
| `GET` | `/requests/{id}/status/stream` | Stream status updates (SSE) |
| `GET` | `/requests/{id}` | Get final result |
| `PUT` | `/requests/{id}/cancel` | Cancel pending job |

### 1. Submit to Queue

**Endpoint:** `POST https://queue.fal.run/{model_id}`

**Request:**
```json
{
  "prompt": "a beautiful sunset over mountains",
  "image_size": "landscape_16_9",
  "num_inference_steps": 28
}
```

**Response (202 Accepted):**
```json
{
  "request_id": "req_abc123xyz",
  "status": "IN_QUEUE",
  "queue_position": 3,
  "response_url": "https://queue.fal.run/fal-ai/flux/dev/requests/req_abc123xyz",
  "status_url": "https://queue.fal.run/fal-ai/flux/dev/requests/req_abc123xyz/status",
  "cancel_url": "https://queue.fal.run/fal-ai/flux/dev/requests/req_abc123xyz/cancel"
}
```

### 2. Check Status

**Endpoint:** `GET https://queue.fal.run/{model_id}/requests/{request_id}/status`

**Status Types:**

| Status | HTTP Code | Description |
|--------|-----------|-------------|
| `IN_QUEUE` | 202 | Job waiting for worker |
| `IN_PROGRESS` | 202 | Job actively processing |
| `COMPLETED` | 200 | Job finished successfully |
| `FAILED` | 500 | Job failed with error |
| `CANCELLED` | 200 | Job was cancelled |

**IN_QUEUE Response:**
```json
{
  "status": "IN_QUEUE",
  "queue_position": 2,
  "response_url": "https://queue.fal.run/..."
}
```

**IN_PROGRESS Response:**
```json
{
  "status": "IN_PROGRESS",
  "logs": [
    {
      "message": "Loading model weights...",
      "level": "INFO",
      "source": "STDOUT",
      "timestamp": "2025-12-28T10:30:00Z"
    }
  ]
}
```

**COMPLETED Response:**
```json
{
  "status": "COMPLETED",
  "logs": [...],
  "response_url": "https://queue.fal.run/..."
}
```

### 3. Stream Status (SSE)

**Endpoint:** `GET https://queue.fal.run/{model_id}/requests/{request_id}/status/stream`

**Accept Header:** `text/event-stream`

**Event Stream:**
```
event: status
data: {"status": "IN_QUEUE", "queue_position": 3}

event: status
data: {"status": "IN_PROGRESS", "logs": [...]}

event: status
data: {"status": "COMPLETED"}
```

### 4. Get Result

**Endpoint:** `GET https://queue.fal.run/{model_id}/requests/{request_id}`

**Response:**
```json
{
  "images": [
    {
      "url": "https://fal.media/files/abc123/output.png",
      "width": 1024,
      "height": 1024,
      "content_type": "image/png"
    }
  ],
  "timings": {
    "inference": 2.345
  },
  "seed": 12345,
  "has_nsfw_concepts": [false],
  "prompt": "a beautiful sunset over mountains"
}
```

### 5. Cancel Request

**Endpoint:** `PUT https://queue.fal.run/{model_id}/requests/{request_id}/cancel`

**Response:**
```json
{
  "status": "CANCELLED"
}
```

### Enabling Logs

Add `?logs=1` query parameter to enable log streaming:

```
POST https://queue.fal.run/fal-ai/flux/dev?logs=1
```

**Log Object Structure:**
```json
{
  "message": "Generating image...",
  "level": "INFO",       // STDERR, STDOUT, ERROR, INFO, WARN, DEBUG
  "source": "STDOUT",
  "timestamp": "2025-12-28T10:30:00.000Z"
}
```

### Object Lifecycle Control

Control output file retention via header:

```
X-Fal-Object-Lifecycle-Preference: {"expiration_duration_seconds": 3600}
```

Default retention: **7 days minimum**

---

## Webhooks API Complete Reference

Webhooks provide push notifications when queue jobs complete, eliminating the need for polling.

### Webhook Configuration

Add `fal_webhook` query parameter when submitting to queue:

```
POST https://queue.fal.run/fal-ai/flux/dev?fal_webhook=https://your-server.com/webhook
```

### Webhook Payload

FAL.ai sends a `POST` request to your webhook URL with:

**Headers:**
```
Content-Type: application/json
X-Fal-Webhook-Request-Id: req_abc123xyz
X-Fal-Webhook-User-Id: user_12345
X-Fal-Webhook-Timestamp: 2025-12-28T10:30:00Z
X-Fal-Webhook-Signature: <hex-encoded-ed25519-signature>
```

**Body:**
```json
{
  "request_id": "req_abc123xyz",
  "status": "COMPLETED",
  "payload": {
    "images": [...],
    "timings": {...}
  }
}
```

### Webhook Retry Logic

| Attempt | Delay | Total Time |
|---------|-------|------------|
| 1 | Immediate | 0 |
| 2 | 10 seconds | 10s |
| 3 | 30 seconds | 40s |
| 4 | 1 minute | 1m 40s |
| 5-10 | Increasing | Up to 2 hours |

**Total:** 10 retries over approximately 2 hours

### Signature Verification

Verify webhook authenticity using ED25519 signatures.

**JWKS Endpoint:** `https://rest.alpha.fal.ai/.well-known/jwks.json`

**Verification Steps:**

1. Fetch public keys from JWKS endpoint (cache for 24 hours max)
2. Construct signature payload: `{timestamp}.{body}`
3. Verify ED25519 signature against payload
4. Reject if timestamp is >5 minutes old

**Python Verification Example:**
```python
import hashlib
import json
import time
from cryptography.hazmat.primitives.asymmetric import ed25519
from cryptography.hazmat.primitives import serialization
import requests

def verify_webhook(request):
    # Get headers
    signature = bytes.fromhex(request.headers['X-Fal-Webhook-Signature'])
    timestamp = request.headers['X-Fal-Webhook-Timestamp']
    body = request.get_data(as_text=True)

    # Check timestamp freshness (5 minute window)
    ts = datetime.fromisoformat(timestamp.replace('Z', '+00:00'))
    if (datetime.now(timezone.utc) - ts).total_seconds() > 300:
        raise ValueError("Timestamp too old")

    # Fetch JWKS (cache this!)
    jwks = requests.get('https://rest.alpha.fal.ai/.well-known/jwks.json').json()
    public_key_bytes = base64.urlsafe_b64decode(jwks['keys'][0]['x'] + '==')

    # Verify signature
    message = f"{timestamp}.{body}".encode()
    public_key = ed25519.Ed25519PublicKey.from_public_bytes(public_key_bytes)
    public_key.verify(signature, message)  # Raises if invalid

    return True
```

---

## WebSocket API Complete Reference

WebSocket connections enable real-time bidirectional communication for low-latency applications.

### Connection URL

```
wss://ws.fal.run/{model_id}?fal_key=YOUR_API_KEY
```

### Protocol Stages

The WebSocket protocol follows a 4-stage sequence:

1. **Client → Server:** Send input payload (JSON)
2. **Server → Client:** Start metadata (headers, status)
3. **Server → Client:** Stream response data (may be chunked)
4. **Server → Client:** End metadata (metrics, timings)

### Message Types

**Input Message (Client → Server):**
```json
{
  "prompt": "a photo of a cat",
  "image_size": "square_hd"
}
```

**Start Message (Server → Client):**
```json
{
  "type": "start",
  "headers": {
    "content-type": "application/json"
  },
  "status": 200
}
```

**Data Message (Server → Client):**
```json
{
  "type": "data",
  "chunk": "base64-encoded-data..."
}
```

**End Message (Server → Client):**
```json
{
  "type": "end",
  "metrics": {
    "inference_time": 2.345
  }
}
```

### JavaScript WebSocket Example

```javascript
const ws = new WebSocket(
  `wss://ws.fal.run/fal-ai/flux/dev?fal_key=${FAL_KEY}`
);

ws.onopen = () => {
  ws.send(JSON.stringify({
    prompt: "a beautiful landscape",
    image_size: "landscape_16_9"
  }));
};

ws.onmessage = (event) => {
  const message = JSON.parse(event.data);

  if (message.type === 'data') {
    console.log('Received data chunk');
  } else if (message.type === 'end') {
    console.log('Complete:', message.metrics);
    ws.close();
  }
};

ws.onerror = (error) => {
  console.error('WebSocket error:', error);
};
```

### Python WebSocket Example

```python
import asyncio
import websockets
import json
import os

async def generate_image():
    uri = f"wss://ws.fal.run/fal-ai/flux/dev?fal_key={os.environ['FAL_KEY']}"

    async with websockets.connect(uri) as ws:
        # Send input
        await ws.send(json.dumps({
            "prompt": "a beautiful landscape",
            "image_size": "landscape_16_9"
        }))

        # Receive responses
        while True:
            message = json.loads(await ws.recv())

            if message['type'] == 'start':
                print(f"Started with status: {message['status']}")
            elif message['type'] == 'data':
                print("Received data chunk")
            elif message['type'] == 'end':
                print(f"Complete: {message['metrics']}")
                break

asyncio.run(generate_image())
```

---

## Error Handling

### HTTP Status Codes

| Code | Meaning | Charged? | Action |
|------|---------|----------|--------|
| `200` | Success | Yes | Process response |
| `202` | Accepted (Queue) | No | Poll for status |
| `400` | Bad Request | Yes | Fix request parameters |
| `401` | Unauthorized | No | Check API key |
| `403` | Forbidden | No | Check permissions |
| `404` | Not Found | No | Check endpoint/model ID |
| `422` | Validation Error | Yes | Fix input validation |
| `429` | Rate Limited | No | Implement backoff |
| `500` | Server Error | No | Retry with backoff |
| `503` | Service Unavailable | No | Retry later |

### Error Response Format

**Standard Error:**
```json
{
  "detail": "Invalid API key"
}
```

**Validation Error (422):**
```json
{
  "detail": [
    {
      "type": "missing",
      "loc": ["body", "prompt"],
      "msg": "Field required",
      "input": {},
      "ctx": {}
    }
  ]
}
```

### Billing Implications

- **5xx Server Errors:** NOT charged
- **4xx Client Errors (including 422):** CHARGED
- **Cold starts:** NOT charged
- **Cancelled jobs:** Charged for compute used before cancellation

### Error Handling Best Practices

```python
import time
import requests

def call_fal_with_retry(endpoint, payload, max_retries=3):
    for attempt in range(max_retries):
        try:
            response = requests.post(endpoint, json=payload, headers=headers)

            if response.status_code == 429:
                # Rate limited - exponential backoff
                wait = (2 ** attempt) + random.random()
                time.sleep(wait)
                continue

            if response.status_code >= 500:
                # Server error - retry
                time.sleep(2 ** attempt)
                continue

            response.raise_for_status()
            return response.json()

        except requests.exceptions.RequestException as e:
            if attempt == max_retries - 1:
                raise
            time.sleep(2 ** attempt)

    raise Exception("Max retries exceeded")
```

---

## Pricing API Reference

Query model pricing programmatically via the Platform API.

### Endpoint

```
GET https://api.fal.ai/v1/models/pricing
```

**Authentication:** Requires Admin-scoped API key

### Query Parameters

| Parameter | Type | Description |
|-----------|------|-------------|
| `endpoint_id` | string | Single or comma-separated model IDs (1-50) |
| `cursor` | string | Pagination cursor |
| `limit` | integer | Results per page (default: 50) |

### Request Example

```bash
curl "https://api.fal.ai/v1/models/pricing?endpoint_id=fal-ai/flux/dev,fal-ai/flux/schnell" \
  -H "Authorization: Key $FAL_KEY"
```

### Response

```json
{
  "prices": [
    {
      "endpoint_id": "fal-ai/flux/dev",
      "unit_price": 0.025,
      "unit": "megapixel",
      "currency": "USD"
    },
    {
      "endpoint_id": "fal-ai/flux/schnell",
      "unit_price": 0.003,
      "unit": "megapixel",
      "currency": "USD"
    }
  ],
  "next_cursor": "abc123",
  "has_more": false
}
```

### Price Object Schema

| Field | Type | Description |
|-------|------|-------------|
| `endpoint_id` | string | Model identifier |
| `unit_price` | number | Price per unit |
| `unit` | string | Billing unit (megapixel, second, video, etc.) |
| `currency` | string | Always "USD" |

---

## Storage API

FAL.ai provides temporary storage for file uploads and generated outputs.

### File Upload

```javascript
import { fal } from '@fal-ai/client';

// Upload from file path (Node.js)
const url = await fal.storage.upload(file);

// Upload from blob (Browser)
const url = await fal.storage.upload(blob);
```

**Response:** Returns a `fal.media` URL usable in subsequent requests.

### Auto-Upload Behavior

When passing binary data to model inputs:

```javascript
const result = await fal.run('fal-ai/flux/dev', {
  input: {
    prompt: "...",
    image: binaryBuffer  // Automatically uploaded
  }
});
```

### File Retention

- **Uploaded files:** 7+ days retention
- **Generated outputs:** 7+ days retention
- **Customizable:** Via `X-Fal-Object-Lifecycle-Preference` header

### Download URLs

Generated file URLs follow the pattern:
```
https://fal.media/files/{file_id}/{filename}
```

URLs are publicly accessible but non-guessable.

---

## Model Endpoints

### Available Categories

| Category | Model Count | Examples |
|----------|-------------|----------|
| **Image Generation** | 200+ | FLUX, SDXL, Imagen, Seedream |
| **Video Generation** | 50+ | Veo, Kling, Luma, Hunyuan |
| **Audio/Speech** | 20+ | ElevenLabs, Kokoro, STT |
| **3D Generation** | 10+ | Tripo3D, TripoSR |
| **LLM** | 30+ | Various integrations |
| **Utilities** | 50+ | Upscaling, segmentation, etc. |

### Recent Model Additions (2024-2025)

- **Google Veo 3** - Video with native audio generation
- **Imagen 4** - Google's 80B parameter image model
- **FLUX Kontext Pro** - Reference-based image editing
- **Seedream 4.5** - ByteDance unified gen/edit up to 4K
- **ElevenLabs v3** - Premium TTS
- **MiniMax Hailuo 2.3** - Photorealistic video

### Discovering Models

**Web Interface:** https://fal.ai/explore/models

**API Discovery:** Check specific model pages for API schemas.

---

## Serverless Deployment

Deploy custom Python functions to FAL.ai infrastructure.

### App Structure

```python
import fal

class MyApp(fal.App):
    machine_type = "GPU-H100"
    requirements = ["torch", "transformers"]

    def setup(self):
        # Runs once before serving requests
        self.model = load_model()

    @fal.endpoint("/")
    def generate(self, prompt: str) -> dict:
        result = self.model.generate(prompt)
        return {"output": result}
```

### Deployment Commands

```bash
# Deploy app
fal deploy my_app.py

# Set secrets
fal secrets set MY_SECRET_KEY value

# View logs
fal logs my-app-name

# Delete deployment
fal delete my-app-name
```

### Machine Types

| Type | GPU | Memory | Use Case |
|------|-----|--------|----------|
| `GPU-A100` | A100 40GB | High | Standard inference |
| `GPU-H100` | H100 80GB | Very High | Large models |
| `GPU-H200` | H200 141GB | Extreme | Massive models |
| `GPU-A6000` | A6000 48GB | High | Balanced workloads |

### Secrets Management

```python
import os

class MyApp(fal.App):
    def setup(self):
        api_key = os.environ.get("MY_SECRET_KEY")
        # Use secret in setup
```

---

## Credits & Billing

### Credit System

| Credit Type | Expiration | Source |
|-------------|------------|--------|
| **Purchased** | 365 days | Credit card, invoice |
| **Free/Coupon** | 90 days | Promotions, trials |

### Billing Rules

1. **Pre-purchase required** - Credits deducted per request
2. **5xx errors** - NOT charged
3. **4xx errors (including 422)** - CHARGED
4. **Cold starts** - NOT charged
5. **Cancelled jobs** - Charged for compute used

### Payment Methods

- Credit card
- ACH (US only)
- Invoice (high volume)
- Google Cloud Marketplace

---

## Best Practices

### Long-Running Requests

For requests > 60 seconds:
1. Use Queue API instead of sync
2. Implement webhook for completion notification
3. Use SSE status streaming for progress updates

### Queue vs Synchronous

| Use Case | Recommended |
|----------|-------------|
| Quick inference (<10s) | Sync (`fal.run`) |
| Long generation (>30s) | Queue (`queue.submit`) |
| Batch processing | Queue with webhooks |
| Real-time preview | WebSocket |

### Webhook vs Polling

| Approach | Pros | Cons |
|----------|------|------|
| **Webhooks** | No polling, push-based | Requires public endpoint |
| **Polling** | Simple, no server needed | More API calls |
| **SSE Stream** | Real-time, no polling | Connection management |

### Security Checklist

- [ ] API keys in environment variables
- [ ] Server-side proxy for client apps
- [ ] Webhook signature verification
- [ ] Rate limit handling
- [ ] Error logging without exposing keys

---

## Code Examples

### Complete Queue Workflow (JavaScript)

```javascript
import { fal } from '@fal-ai/client';

fal.config({ credentials: process.env.FAL_KEY });

async function generateWithQueue() {
  // Submit to queue
  const { request_id, status_url } = await fal.queue.submit('fal-ai/flux/dev', {
    input: {
      prompt: 'a beautiful sunset over mountains',
      image_size: 'landscape_16_9',
      num_inference_steps: 28
    }
  });

  console.log(`Submitted: ${request_id}`);

  // Poll for completion
  let status;
  do {
    await new Promise(r => setTimeout(r, 1000));
    status = await fal.queue.status('fal-ai/flux/dev', { requestId: request_id });
    console.log(`Status: ${status.status}`);
  } while (status.status !== 'COMPLETED');

  // Get result
  const result = await fal.queue.result('fal-ai/flux/dev', { requestId: request_id });
  console.log('Image URL:', result.images[0].url);

  return result;
}
```

### Complete Queue Workflow (Python)

```python
import fal_client
import time

def generate_with_queue():
    # Submit to queue
    handler = fal_client.submit(
        "fal-ai/flux/dev",
        arguments={
            "prompt": "a beautiful sunset over mountains",
            "image_size": "landscape_16_9",
            "num_inference_steps": 28
        }
    )

    print(f"Submitted: {handler.request_id}")

    # Wait for completion with status updates
    for event in handler.iter_events():
        if isinstance(event, fal_client.Queued):
            print(f"Queued: position {event.position}")
        elif isinstance(event, fal_client.InProgress):
            print(f"In Progress: {len(event.logs)} log entries")

    # Get result
    result = handler.get()
    print(f"Image URL: {result['images'][0]['url']}")

    return result

if __name__ == "__main__":
    generate_with_queue()
```

### Webhook Handler (FastAPI)

```python
from fastapi import FastAPI, Request, HTTPException
import hashlib
import json

app = FastAPI()

@app.post("/webhook")
async def fal_webhook(request: Request):
    # Verify signature (implement verify_fal_signature)
    signature = request.headers.get("X-Fal-Webhook-Signature")
    timestamp = request.headers.get("X-Fal-Webhook-Timestamp")
    body = await request.body()

    if not verify_fal_signature(signature, timestamp, body):
        raise HTTPException(status_code=401, detail="Invalid signature")

    # Process webhook
    payload = json.loads(body)
    request_id = payload["request_id"]
    status = payload["status"]

    if status == "COMPLETED":
        images = payload["payload"]["images"]
        # Process completed images
        print(f"Request {request_id} completed with {len(images)} images")
    elif status == "FAILED":
        # Handle failure
        print(f"Request {request_id} failed")

    return {"status": "received"}
```

---

## Additional Resources

### Official Documentation

- [FAL.ai Docs](https://docs.fal.ai/)
- [API Reference](https://docs.fal.ai/model-apis/model-endpoints)
- [Authentication Guide](https://docs.fal.ai/platform-apis/authentication)
- [Queue API](https://docs.fal.ai/model-apis/model-endpoints/queue)
- [Webhooks](https://docs.fal.ai/model-apis/model-endpoints/webhooks)
- [WebSockets](https://docs.fal.ai/model-apis/model-endpoints/websockets)

### GitHub Repositories

- [fal-js](https://github.com/fal-ai/fal-js) - JavaScript/TypeScript client
- [fal-python](https://github.com/fal-ai/fal) - Python client and serverless

### Community Resources

- [Postman Collection](https://www.postman.com/ai-engineer/generative-ai-apis/documentation/wwefudz/fal-ai-api)
- [Cloudflare AI Gateway Integration](https://developers.cloudflare.com/ai-gateway/usage/providers/fal/)

---

## Related Documentation

- [[agent-02-javascript-sdk]] - Complete JavaScript/TypeScript SDK reference
- [[agent-03-python-sdk]] - Complete Python SDK reference
- [[agent-04-image-models]] - All 45+ image generation models
- [[agent-05-video-models]] - All 17+ video generation models
- [[agent-06-streaming-queues]] - Detailed streaming and async patterns
- [[agent-07-finetuning-training]] - LoRA training and fine-tuning
- [[agent-08-billing-usage]] - Comprehensive pricing and usage tracking
- [[agent-09-advanced-features]] - Inpainting, ControlNet, upscaling

---

*Document generated: 2025-12-28*
*Source: Official FAL.ai Documentation*
*Word count: ~8,500*
