---
source: '[unknown - QUICK-REFERENCE.md]'
scraped: 2025-12-29
api_provider: FAL.ai
discovery_tier: 3
verified: false
---
 FAL.ai Quick Reference Cheatsheet

> **Developer quick-lookup for common FAL.ai operations**
> **Created:** 2025-12-29

---

## Authentication

```bash
# Header format (NOT Bearer!)
Authorization: Key YOUR_API_KEY

# Environment variable
export FAL_KEY="your-api-key"
```

---

## Base URLs

| Purpose | URL |
|---------|-----|
| Sync | `https://fal.run/{model_id}` |
| Queue | `https://queue.fal.run/{model_id}` |
| WebSocket | `wss://ws.fal.run/{model_id}` |
| Platform | `https://api.fal.ai/v1/` |

---

## JavaScript Quick Start

```bash
npm install @fal-ai/client
```

```javascript
import { fal } from "@fal-ai/client";
fal.config({ credentials: process.env.FAL_KEY });

// Sync (fast models)
const result = await fal.run("fal-ai/flux/schnell", {
  input: { prompt: "A cat" }
});

// Queue with updates (long jobs)
const result = await fal.subscribe("fal-ai/flux/dev", {
  input: { prompt: "A cat" },
  onQueueUpdate: (u) => console.log(u.status)
});

// Streaming
const stream = await fal.stream("fal-ai/flux/dev", {
  input: { prompt: "A cat" }
});
for await (const event of stream) console.log(event);
```

---

## Python Quick Start

```bash
pip install fal-client
```

```python
import fal_client

# Sync
result = fal_client.run("fal-ai/flux/schnell",
    arguments={"prompt": "A cat"})

# Queue with updates
result = fal_client.subscribe("fal-ai/flux/dev",
    arguments={"prompt": "A cat"},
    on_queue_update=lambda u: print(u.status))

# Async
result = await fal_client.subscribe_async("fal-ai/flux/dev",
    arguments={"prompt": "A cat"})
```

---

## cURL Quick Start

```bash
# Sync
curl -X POST "https://fal.run/fal-ai/flux/schnell" \
  -H "Authorization: Key $FAL_KEY" \
  -H "Content-Type: application/json" \
  -d '{"prompt": "A cat"}'

# Queue submit
curl -X POST "https://queue.fal.run/fal-ai/flux/dev" \
  -H "Authorization: Key $FAL_KEY" \
  -H "Content-Type: application/json" \
  -d '{"prompt": "A cat"}'

# Check status
curl "https://queue.fal.run/fal-ai/flux/dev/requests/{id}/status" \
  -H "Authorization: Key $FAL_KEY"

# Get result
curl "https://queue.fal.run/fal-ai/flux/dev/requests/{id}" \
  -H "Authorization: Key $FAL_KEY"
```

---

## Top Image Models

| Model | Endpoint | Price | Speed | Best For |
|-------|----------|-------|-------|----------|
| FLUX.1 schnell | `fal-ai/flux/schnell` | $0.003/MP | 1-4s | Real-time |
| FLUX.1 dev | `fal-ai/flux/dev` | $0.025/MP | 5-10s | Quality |
| FLUX Pro Ultra | `fal-ai/flux-pro/v1.1-ultra` | $0.06/MP | 15s | Premium |
| Seedream V4 | `fal-ai/seedream-3/v4` | $0.03/img | 5s | Photorealism |
| FLUX Kontext | `fal-ai/flux-pro/kontext` | $0.04/img | 8s | Text in images |

---

## Top Video Models

| Model | Endpoint | Price | Duration | Best For |
|-------|----------|-------|----------|----------|
| Veo 3 | `fal-ai/veo3` | $0.20-0.40/s | 4-8s | Highest quality |
| Kling 2.5 Pro | `fal-ai/kling-video/v2.5-turbo/pro` | $0.07/s | 5-10s | Long videos |
| WAN 2.5 | `fal-ai/wan/v2.5/text-to-video` | $0.05/s | 3-5s | Fast/cheap |
| Luma | `fal-ai/luma-dream-machine` | $0.033/s | 5s | Image animation |

---

## Top Audio Models

| Model | Endpoint | Price | Best For |
|-------|----------|-------|----------|
| ElevenLabs | `fal-ai/elevenlabs` | $0.40/1K chars | Premium TTS |
| MiniMax T2A | `fal-ai/minimax/text-to-audio` | $0.011/1K chars | Fast TTS |
| Kokoro | `fal-ai/kokoro/american-english` | $0.011/1K chars | Natural TTS |
| Whisper V3 | `fal-ai/whisper` | $0.00003/s | Speech-to-text |

---

## Top 3D Models

| Model | Endpoint | Price | Speed | Best For |
|-------|----------|-------|-------|----------|
| TripoSR | `fal-ai/triposr` | $0.04 | 0.5s | Fastest |
| Trellis 2 | `fal-ai/trellis-2` | $0.035 | 15s | Quality meshes |
| Meshy 6 | `fal-ai/meshy/text-to-3d` | $0.20 | 2min | Text-to-3D |
| Hyper3D Rodin | `fal-ai/hyper3d/rodin` | $0.04 | 15s | Detailed |

---

## Training Endpoints

| Trainer | Endpoint | Price | Best For |
|---------|----------|-------|----------|
| FLUX Fast | `fal-ai/flux-lora-fast-training` | $2/run | Quick training |
| FLUX.2 | `fal-ai/flux-2-lora-trainer` | $0.008/step | High quality |
| Portrait | `fal-ai/flux-lora-portrait-trainer` | $0.0024/step | Faces |
| Kontext | `fal-ai/kontext-trainer` | $2.50/1K steps | Text/logos |

---

## Using LoRAs

```javascript
// Single LoRA
const result = await fal.run("fal-ai/flux-lora", {
  input: {
    prompt: "A portrait of LORA_TRIGGER",
    loras: [{ path: "https://url/my-lora.safetensors", scale: 0.8 }]
  }
});

// Multi-LoRA stacking
const result = await fal.run("fal-ai/flux-lora", {
  input: {
    prompt: "A portrait in watercolor style",
    loras: [
      { path: "https://url/portrait.safetensors", scale: 0.8 },
      { path: "https://url/watercolor.safetensors", scale: 0.6 }
    ]
  }
});
```

---

## Webhooks

```javascript
// Submit with webhook
const { request_id } = await fal.queue("fal-ai/flux/dev", {
  input: { prompt: "A cat" },
  fal_webhook: "https://your-server.com/webhook"
});

// Verify signature (Node.js)
const crypto = require('crypto');
function verifySignature(payload, signature, publicKey) {
  return crypto.verify(null, Buffer.from(payload),
    { key: publicKey, format: 'jwk' },
    Buffer.from(signature, 'base64'));
}
```

---

## Common Image Sizes

| Preset | Dimensions |
|--------|------------|
| `square_hd` | 1024×1024 |
| `square` | 512×512 |
| `portrait_4_3` | 768×1024 |
| `portrait_16_9` | 576×1024 |
| `landscape_4_3` | 1024×768 |
| `landscape_16_9` | 1024×576 |

```json
// Custom size
{ "width": 1280, "height": 720 }
```

---

## HTTP Status Codes

| Code | Billable | Retryable | Meaning |
|------|----------|-----------|---------|
| 200 | Yes | N/A | Success |
| 400 | No | No | Bad request |
| 401 | No | No | Invalid API key |
| 422 | **Yes** | No | Validation error |
| 429 | No | Yes | Rate limited |
| 500 | No | Yes | Server error |
| 502 | No | Yes | Bad gateway |
| 503 | No | Yes | Service unavailable |

---

## Error Handling

```javascript
try {
  const result = await fal.run("fal-ai/flux/dev", { input });
} catch (error) {
  if (error.status === 429) {
    // Rate limited - wait and retry
    await sleep(error.retryAfter || 5000);
  } else if (error.status === 422) {
    // Validation error - fix input (still billed!)
    console.error(error.body.detail);
  } else if (error.status >= 500) {
    // Server error - retry with backoff
    if (error.headers?.['x-fal-retryable']) {
      await retryWithBackoff(() => fal.run(...));
    }
  }
}
```

---

## Retry Pattern

```javascript
async function withRetry(fn, maxRetries = 3) {
  for (let i = 0; i < maxRetries; i++) {
    try {
      return await fn();
    } catch (error) {
      const isRetryable = error.headers?.['x-fal-retryable'] === 'true';
      const isServerError = error.status >= 500;
      if (!isRetryable && !isServerError) throw error;
      if (i === maxRetries - 1) throw error;
      await new Promise(r => setTimeout(r, Math.pow(2, i) * 1000));
    }
  }
}
```

---

## Serverless Deployment

```python
import fal

class MyApp(fal.App, keep_alive=60):
    machine_type = "GPU-H100"  # GPU-A100, GPU-L40S, GPU-T4, CPU
    min_concurrency = 1
    max_concurrency = 50
    requirements = ["torch", "diffusers"]

    def setup(self):
        self.model = load_model()

    @fal.endpoint("/")
    def generate(self, input: InputSchema) -> OutputSchema:
        return self.model(input)
```

```bash
# Deploy
fal deploy my_app.py::MyApp

# Set secrets
fal secrets set HF_TOKEN=hf_xxx
```

---

## GPU Pricing

| GPU | VRAM | Per Hour | Per Second |
|-----|------|----------|------------|
| H100-SXM | 80GB | $1.89 | $0.0005 |
| H200-SXM | 141GB | $2.10 | $0.0006 |
| A100 | 40GB | $0.99 | $0.0003 |

---

## Rate Limits

| Tier | Concurrent Tasks |
|------|------------------|
| Free | 2 |
| Pay-Per-Use | 2 |
| Enterprise | Custom |

---

## Credit Rules

- Purchased credits: 365 days expiry
- Promotional credits: 90 days expiry
- 422 errors: **Billed** (user error)
- 5xx errors: Not billed
- Cold starts: Not charged

---

## Usage API

```bash
# Get usage
curl "https://api.fal.ai/v1/models/usage?start=2024-01-01&end=2024-12-31" \
  -H "Authorization: Key $FAL_KEY"

# Get pricing
curl "https://api.fal.ai/v1/models/pricing?endpoint_id=fal-ai/flux/dev" \
  -H "Authorization: Key $FAL_KEY"
```

---

## Common Patterns

### Image-to-Video Pipeline

```javascript
// Generate image
const image = await fal.run("fal-ai/flux/dev", {
  input: { prompt: "A forest scene" }
});

// Animate it
const video = await fal.run("fal-ai/luma-dream-machine", {
  input: {
    prompt: "Camera panning through forest",
    image_url: image.images[0].url
  }
});
```

### Upscale Workflow

```javascript
// Generate low-res fast
const draft = await fal.run("fal-ai/flux/schnell", {
  input: { prompt: "A cat", image_size: { width: 512, height: 512 } }
});

// Upscale 4x
const upscaled = await fal.run("fal-ai/esrgan", {
  input: { image_url: draft.images[0].url, scale: 4 }
});
```

### Train and Use LoRA

```javascript
// Train
const training = await fal.subscribe("fal-ai/flux-lora-fast-training", {
  input: {
    images_data_url: "https://url/training-images.zip",
    trigger_word: "MYTRIGGER",
    steps: 1000
  }
});

// Use trained LoRA
const result = await fal.run("fal-ai/flux-lora", {
  input: {
    prompt: "A photo of MYTRIGGER in a garden",
    loras: [{ path: training.diffusers_lora_file.url, scale: 1.0 }]
  }
});
```

---

## Key Endpoints Reference

| Task | Endpoint |
|------|----------|
| Fast image | `fal-ai/flux/schnell` |
| Quality image | `fal-ai/flux/dev` |
| Premium image | `fal-ai/flux-pro/v1.1-ultra` |
| Text in image | `fal-ai/flux-pro/kontext` |
| Quality video | `fal-ai/veo3` |
| Fast video | `fal-ai/wan/v2.5/text-to-video` |
| Animate image | `fal-ai/luma-dream-machine` |
| Premium TTS | `fal-ai/elevenlabs` |
| Fast TTS | `fal-ai/minimax/text-to-audio` |
| STT | `fal-ai/whisper` |
| Fast 3D | `fal-ai/triposr` |
| Quality 3D | `fal-ai/meshy/text-to-3d` |
| Train LoRA | `fal-ai/flux-lora-fast-training` |
| Use LoRA | `fal-ai/flux-lora` |
| Upscale | `fal-ai/esrgan` |
| Remove BG | `fal-ai/birefnet` |

---

## Links

| Resource | URL |
|----------|-----|
| Docs | https://docs.fal.ai |
| Models | https://fal.ai/models |
| Pricing | https://fal.ai/pricing |
| Dashboard | https://fal.ai/dashboard |
| API Keys | https://fal.ai/dashboard/keys |

---

*Last Updated: 2025-12-29*
