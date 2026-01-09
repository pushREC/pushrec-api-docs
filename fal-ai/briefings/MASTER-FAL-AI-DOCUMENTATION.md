---
source: '[unknown - MASTER-FAL-AI-DOCUMENTATION.md]'
scraped: 2025-12-31
api_provider: FAL.ai
discovery_tier: 3
verified: false
---
ey = 3aa00e2b-b18a-4345-b394-f61f68f0bfc4:247663577672cdf5fcc2a06dd9632621


# FAL.ai Platform Documentation - Master Reference

> **Research Project:** FAL.ai Deep Research - Complete Synthesis
> **Created:** 2025-12-29
> **Documents Synthesized:** 14 Agent Reports (~75,000+ total words)
> **Purpose:** Exhaustive reference for building SaaS platforms on FAL.ai

---

## Executive Summary

FAL.ai is a **$4B+ valued** generative AI infrastructure company serving 500,000+ developers with 50+ million daily AI creations. The platform provides unified access to **600+ model endpoints** across image, video, audio, 3D, and LLM workloads through a sophisticated serverless architecture.

### Platform Capabilities at a Glance

| Domain | Models | Key Endpoints | Price Range |
|--------|--------|---------------|-------------|
| **Image Generation** | 45+ | FLUX, Seedream, SDXL, Imagen | $0.003-$0.08/image |
| **Video Generation** | 17+ | Veo 3, Kling, WAN, Luma | $0.05-$0.50/second |
| **Audio/TTS** | 30+ | ElevenLabs, Kokoro, MiniMax | $0.011-$0.40/1K chars |
| **3D Generation** | 15+ | TripoSR, Trellis, Meshy | $0.04-$0.20/model |
| **Training/LoRA** | 13 trainers | FLUX LoRA, Portrait, Video | $0.0024-$0.15/step |
| **Custom Deployment** | Serverless | fal.App, Docker, ComfyUI | $0.0003-$0.0006/sec |

### Core Infrastructure

- **GPU Fleet:** H100, H200, A100, B200 (thousands globally)
- **Execution Modes:** Sync, Queue, WebSocket, Webhooks
- **Regions:** US-East, US-West, US-Central, EU-West, EU-North
- **SLA:** 99.99% uptime (enterprise)
- **Compliance:** SOC 2 Type II, ISO 27001, GDPR, HIPAA, FedRAMP

---

## Quick Navigation Index

### By Topic

| Topic | Document | Key Content |
|-------|----------|-------------|
| **Getting Started** | [[agent-01-core-api]] | Authentication, Base URLs, API Keys |
| **JavaScript SDK** | [[agent-02-javascript-sdk]] | npm install, fal.run(), fal.subscribe() |
| **Python SDK** | [[agent-03-python-sdk]] | pip install, fal.run(), async patterns |
| **Image Models** | [[agent-04-image-models]] | FLUX, Seedream, SDXL, Imagen 3 |
| **Video Models** | [[agent-05-video-models]] | Veo 3, Kling, WAN, Luma Dream Machine |
| **Streaming/Queues** | [[agent-06-streaming-queues]] | Queue API, WebSocket, Status polling |
| **Fine-Tuning** | [[agent-07-finetuning-training]] | LoRA training, Portrait trainer, Pricing |
| **Billing/Usage** | [[agent-08-billing-usage]] | Credits, Usage API, Pricing tiers |
| **Advanced Features** | [[agent-09-advanced-features]] | Multi-LoRA, Prompt expansion, Masks |
| **Audio/TTS** | [[agent-10-audio-models]] | ElevenLabs, Kokoro, Whisper, Music |
| **3D Models** | [[agent-11-3d-models]] | TripoSR, Trellis, Meshy, SAM 3D |
| **Serverless Deploy** | [[agent-12-serverless]] | fal.App, Custom models, GPU config |
| **Error Handling** | [[agent-13-errors]] | HTTP codes, Retry logic, Debugging |
| **Enterprise** | [[agent-14-enterprise]] | SOC2, SSO, Dedicated infra, SLA |

### By Use Case

| I want to... | Start Here | Key Endpoint |
|--------------|------------|--------------|
| Generate images from text | [[agent-04-image-models]] | `fal-ai/flux/schnell` |
| Generate videos | [[agent-05-video-models]] | `fal-ai/veo3` |
| Convert speech to text | [[agent-10-audio-models]] | `fal-ai/whisper` |
| Generate voice from text | [[agent-10-audio-models]] | `fal-ai/elevenlabs` |
| Create 3D models | [[agent-11-3d-models]] | `fal-ai/triposr` |
| Train custom LoRA | [[agent-07-finetuning-training]] | `fal-ai/flux-lora-fast-training` |
| Deploy custom model | [[agent-12-serverless]] | `fal deploy` |
| Handle errors properly | [[agent-13-errors]] | Error types reference |
| Set up enterprise account | [[agent-14-enterprise]] | Enterprise sales |

---

## Architecture Overview

### API Endpoint Structure

```
https://fal.run/{model_id}              → Synchronous execution
https://queue.fal.run/{model_id}        → Async queue submission
wss://ws.fal.run/{model_id}             → WebSocket real-time
https://api.fal.ai/v1/                  → Platform management
```

### Model ID Format

```
{namespace}/{model-name}                → fal-ai/flux/dev
{namespace}/{model-name}/{variant}      → fal-ai/kling-video/v2.5-turbo/pro
```

### Authentication

```
Authorization: Key YOUR_API_KEY
```

**Key Types:**
- **API Scope:** Standard model access, inference, storage
- **Admin Scope:** Usage API, billing, team management

### Execution Flow Decision Tree

```
Request Type?
├── Real-time (<5s) → Synchronous (fal.run)
│   └── Need status updates? → WebSocket (wss://ws.fal.run)
│
├── Long-running (>5s) → Queue API (queue.fal.run)
│   ├── Need notification? → Webhooks (fal_webhook)
│   └── Need polling? → Status endpoint (/requests/{id}/status)
│
└── Streaming output? → WebSocket with realtime endpoint
```

---

## Model Selection Guide

### Image Generation Decision Tree

```
What's your priority?
│
├── Speed (real-time) → FLUX.1 [schnell] ($0.003/MP, 1-4s)
│
├── Quality (best) → FLUX.1 [dev] or FLUX Pro ($0.025-$0.055/MP)
│
├── Custom style → Train LoRA → FLUX + LoRA
│
├── Text in images → FLUX Kontext Pro ($0.04/image)
│
├── Photorealism → Seedream V4 ($0.03/image)
│
└── Enterprise (Google/OpenAI) → Imagen 3 / GPT-Image-1
```

### Video Generation Decision Tree

```
What do you need?
│
├── Highest quality → Google Veo 3 ($0.20-0.40/sec, 8s max)
│
├── Long duration → Kling 2.5 ($0.07/sec, 10s max)
│
├── Fast generation → WAN 2.5 Turbo ($0.05/sec, 5s)
│
├── Image animation → Luma Dream Machine ($0.033/sec)
│
├── Budget option → WAN 2.1 ($0.033/sec)
│
└── Lip sync → Hailuo MiniMax ($2.50/video)
```

### Audio/TTS Decision Tree

```
What audio type?
│
├── Premium TTS → ElevenLabs ($0.40/1K chars, 32 voices)
│
├── Fast TTS → MiniMax T2A ($0.011/1K chars)
│
├── Emotional TTS → Dia ($0.011/1K chars, dialogue)
│
├── Voice cloning → Chatterbox ($0.035/1K chars)
│
├── Music generation → ACE-Step ($0.02/sec)
│
└── Speech-to-text → Whisper Large V3 ($0.00003/sec)
```

### 3D Generation Decision Tree

```
Input type?
│
├── Single image → TripoSR (0.5s, $0.04) or Hyper3D (15s, $0.04)
│
├── Text prompt → Meshy 6 ($0.20, highest quality)
│
├── Multi-view → Trellis 2 ($0.035) or CAT3D ($0.05)
│
├── Scene reconstruction → SAM 3D ($0.20)
│
└── 4D animation → Hunyuan3D 2.5 Turbo ($0.20)
```

---

## Training & Fine-Tuning Matrix

### Available Trainers

| Trainer | Base Model | Best For | Price | Speed |
|---------|-----------|----------|-------|-------|
| FLUX LoRA Fast | FLUX.1 [dev] | Quick subject/style | $2/run flat | ~10 min |
| FLUX.2 Trainer | FLUX.2 [dev] | High quality | $0.008/step | Variable |
| Portrait Trainer | FLUX.1 | Faces, people | $0.0024/step | ~5 min |
| Kontext Trainer | FLUX Kontext | Text/logo control | $2.50/1K steps | Variable |
| Z-Image Trainer | Z-Image | Cost-effective | $2.26/1K steps | Variable |
| Hunyuan Video | Hunyuan Video | Video LoRA | $0.15/step | 30+ min |
| WAN Trainer | WAN 2.5 | Video subjects | $0.024/step | Variable |
| LTX Video | LTX Video | Video motion | $0.006/step | ~20 min |

### Training Data Requirements

| Training Type | Min Images | Recommended | Resolution | Format |
|---------------|-----------|-------------|------------|--------|
| Subject | 4 | 10-20 | 512-1024px | JPEG/PNG/WEBP |
| Style | 15 | 50-100 | Any | JPEG/PNG/WEBP |
| Portrait | 8 | 15-25 | Face close-ups | JPEG/PNG |
| Product | 10 | 20-30 | White background | PNG |
| Logo | 5 | 10-15 | Vector-like | PNG (transparent) |

### LoRA Configuration Reference

| Parameter | Default | Range | Notes |
|-----------|---------|-------|-------|
| `rank` | 16 | 4-128 | Higher = more capacity, more VRAM |
| `learning_rate` | 4e-4 | 1e-5 to 1e-3 | Lower for faces, higher for styles |
| `steps` | 1000 | 100-10000 | 1000-2000 typical |
| `batch_size` | 1 | 1-4 | Limited by VRAM |
| `lora_alpha` | rank | rank/2 to rank*2 | Scaling factor |

---

## Error Handling Reference

### HTTP Status Codes

| Code | Meaning | Billable | Retryable | Action |
|------|---------|----------|-----------|--------|
| 200 | Success | Yes | N/A | Process result |
| 400 | Bad Request | No | No | Fix input |
| 401 | Unauthorized | No | No | Check API key |
| 403 | Forbidden | No | No | Check permissions |
| 404 | Not Found | No | No | Verify endpoint |
| 422 | Validation Error | **Yes** | No | Fix parameters |
| 429 | Rate Limited | No | Yes | Backoff & retry |
| 500 | Server Error | No | Yes | Retry with backoff |
| 502 | Bad Gateway | No | Yes | Retry immediately |
| 503 | Unavailable | No | Yes | Wait & retry |
| 504 | Timeout | No | Yes | Use queue API |

### Error Types

| Error Type | Cause | Solution |
|------------|-------|----------|
| `validation_error` | Invalid parameters | Check schema |
| `content_policy_violation` | NSFW/prohibited | Modify prompt |
| `image_load_error` | Bad image URL | Verify URL accessible |
| `rate_limit_exceeded` | Too many requests | Implement backoff |
| `generation_timeout` | Model timeout | Use queue API |
| `insufficient_credits` | No balance | Add credits |

### Retry Strategy

```javascript
async function withRetry(fn, maxRetries = 3) {
  for (let i = 0; i < maxRetries; i++) {
    try {
      return await fn();
    } catch (error) {
      if (!error.headers?.['x-fal-retryable']) throw error;
      await sleep(Math.pow(2, i) * 1000); // Exponential backoff
    }
  }
  throw new Error('Max retries exceeded');
}
```

---

## Pricing Summary

### Compute Pricing (GPU)

| GPU Type | VRAM | Per Hour | Per Second |
|----------|------|----------|------------|
| H100-SXM | 80GB | $1.89 | $0.0005 |
| H200-SXM | 141GB | $2.10 | $0.0006 |
| A100 | 40GB | $0.99 | $0.0003 |
| B200 | 184GB | Contact Sales | Custom |

### Model Pricing (Popular)

| Model | Unit | Price | Output per $1 |
|-------|------|-------|---------------|
| FLUX.1 [schnell] | per MP | $0.003 | 333 images |
| FLUX.1 [dev] | per MP | $0.025 | 40 images |
| Seedream V4 | per image | $0.03 | 33 images |
| Veo 3 (audio) | per second | $0.40 | 2.5 seconds |
| Kling 2.5 Pro | per second | $0.07 | 14 seconds |
| ElevenLabs | per 1K chars | $0.40 | 2,500 chars |
| TripoSR | per model | $0.04 | 25 models |
| FLUX LoRA Fast | per run | $2.00 | 0.5 runs |

### Credit Rules

- **Purchased credits:** Expire in 365 days
- **Promotional credits:** Expire in 90 days
- **422 errors:** Billable (user error)
- **5xx errors:** Not billable (server error)
- **Cold starts:** Not charged

---

## Serverless Deployment

### fal.App Structure

```python
import fal

class MyApp(fal.App, keep_alive=60):
    machine_type = "GPU-H100"
    min_concurrency = 1
    max_concurrency = 50
    requirements = ["torch", "diffusers", "transformers"]

    def setup(self):
        """Run once on cold start"""
        self.model = load_model()

    @fal.endpoint("/")
    def generate(self, input: InputSchema) -> OutputSchema:
        """Process requests"""
        return self.model(input)
```

### Machine Types

| Type | CPU | RAM | GPU VRAM | Use Case |
|------|-----|-----|----------|----------|
| GPU-H100 | 16 | 200GB | 80GB | Premium inference |
| GPU-H100-SXM | 16 | 200GB | 80GB | Max performance |
| GPU-A100 | 16 | 200GB | 40GB | Cost-effective |
| GPU-L40S | 8 | 96GB | 48GB | Balanced |
| GPU-T4 | 4 | 16GB | 16GB | Budget |
| CPU | 4 | 16GB | - | Non-GPU tasks |

### Deployment Commands

```bash
# Test locally
fal run my_app.py::MyApp --local

# Deploy to FAL
fal deploy my_app.py::MyApp

# Deploy with alias
fal deploy my_app.py::MyApp --alias my-production-app

# Set secrets
fal secrets set HF_TOKEN=hf_xxx
```

---

## Enterprise Features

### Compliance Certifications

| Certification | Status |
|---------------|--------|
| SOC 2 Type II | Compliant |
| ISO 27001 | Compliant |
| GDPR | Compliant |
| HIPAA | Compliant |
| PCI DSS | Compliant |
| FedRAMP | Compliant |
| CSA STAR Level 1 | Compliant |

### Enterprise Plan Features

- **Dedicated GPU infrastructure** (guaranteed availability)
- **Custom rate limits** (beyond 2 concurrent tasks)
- **SLA guarantees** (99.99% uptime)
- **24/7 priority support**
- **Dedicated account management**
- **Invoice-based billing**
- **Volume discounts**
- **SSO/SAML integration**

### Dedicated Infrastructure

| Instance | CPU | RAM | GPU VRAM | Storage |
|----------|-----|-----|----------|---------|
| 1xH100-SXM | 16 | 200GB | 80GB | 1TB SSD |
| 8xH100-SXM | 128 | 1600GB | 640GB | 8TB SSD |

---

## SDK Quick Reference

### JavaScript

```javascript
// Installation
npm install @fal-ai/client

// Configuration
import { fal } from "@fal-ai/client";
fal.config({ credentials: process.env.FAL_KEY });

// Synchronous
const result = await fal.run("fal-ai/flux/schnell", {
  input: { prompt: "A cat" }
});

// Queue with status updates
const result = await fal.subscribe("fal-ai/flux/dev", {
  input: { prompt: "A cat" },
  onQueueUpdate: (update) => console.log(update.status)
});

// WebSocket streaming
const stream = await fal.stream("fal-ai/flux/dev", {
  input: { prompt: "A cat" }
});
for await (const event of stream) {
  console.log(event);
}
```

### Python

```python
# Installation
pip install fal-client

# Configuration
import fal_client
fal_client.set_api_key("YOUR_KEY")

# Synchronous
result = fal_client.run("fal-ai/flux/schnell",
    arguments={"prompt": "A cat"})

# Queue with status updates
result = fal_client.subscribe("fal-ai/flux/dev",
    arguments={"prompt": "A cat"},
    on_queue_update=lambda u: print(u.status))

# Async
import asyncio
result = await fal_client.subscribe_async("fal-ai/flux/dev",
    arguments={"prompt": "A cat"})
```

### cURL

```bash
# Synchronous
curl -X POST "https://fal.run/fal-ai/flux/schnell" \
  -H "Authorization: Key $FAL_KEY" \
  -H "Content-Type: application/json" \
  -d '{"prompt": "A cat"}'

# Queue submission
curl -X POST "https://queue.fal.run/fal-ai/flux/dev" \
  -H "Authorization: Key $FAL_KEY" \
  -H "Content-Type: application/json" \
  -d '{"prompt": "A cat"}'

# Check status
curl "https://queue.fal.run/fal-ai/flux/dev/requests/{request_id}/status" \
  -H "Authorization: Key $FAL_KEY"

# Get result
curl "https://queue.fal.run/fal-ai/flux/dev/requests/{request_id}" \
  -H "Authorization: Key $FAL_KEY"
```

---

## Common Integration Patterns

### Webhook Integration

```javascript
// Submit with webhook
const { request_id } = await fal.queue("fal-ai/flux/dev", {
  input: { prompt: "A cat" },
  fal_webhook: "https://your-server.com/webhook"
});

// Webhook handler (Express.js)
app.post('/webhook', (req, res) => {
  const signature = req.headers['x-fal-signature'];
  if (!verifySignature(req.body, signature)) {
    return res.status(401).send('Invalid signature');
  }
  const { status, result, error } = req.body;
  // Process result...
  res.status(200).send('OK');
});
```

### Multi-LoRA Stacking

```javascript
const result = await fal.run("fal-ai/flux-lora", {
  input: {
    prompt: "A portrait in watercolor style",
    loras: [
      { path: "https://url/portrait-lora.safetensors", scale: 0.8 },
      { path: "https://url/watercolor-lora.safetensors", scale: 0.6 }
    ]
  }
});
```

### Image-to-Video Pipeline

```javascript
// Generate image
const image = await fal.run("fal-ai/flux/dev", {
  input: { prompt: "A serene forest scene" }
});

// Animate image
const video = await fal.run("fal-ai/luma-dream-machine", {
  input: {
    prompt: "Camera slowly panning through the forest",
    image_url: image.images[0].url
  }
});
```

---

## Rate Limits & Quotas

| Tier | Concurrent Tasks | Rate Limit |
|------|------------------|------------|
| Free | 2 | Standard |
| Pay-Per-Use | 2 | Standard |
| Enterprise | Custom | Custom |

**Handling Rate Limits:**

```javascript
const result = await fal.run("fal-ai/flux/dev", {
  input: { prompt: "A cat" }
}, {
  maxRetries: 3,
  onRetry: (error, attempt) => {
    console.log(`Retry ${attempt} after ${error.retryAfter}ms`);
  }
});
```

---

## Resources & Support

### Official Resources

| Resource | URL |
|----------|-----|
| Documentation | https://docs.fal.ai |
| API Reference | https://fal.ai/models |
| Pricing | https://fal.ai/pricing |
| Trust Center | https://trust.fal.ai |
| Enterprise | https://fal.ai/enterprise |

### SDK Repositories

| SDK | Repository |
|-----|------------|
| JavaScript | https://github.com/fal-ai/fal-js |
| Python | https://github.com/fal-ai/fal-python |
| PHP | https://github.com/fal-ai/fal-php |

### Contact

| Purpose | Contact |
|---------|---------|
| Sales | https://fal.ai/enterprise |
| Support | support@fal.ai |
| Legal | legal@fal.ai |

---

## Document Index

### Round 1 Documentation (Core Platform)

| # | Document | Focus | Words |
|---|----------|-------|-------|
| 01 | [[agent-01-core-api]] | REST API, Authentication, Webhooks | ~6,000 |
| 02 | [[agent-02-javascript-sdk]] | npm package, fal.run(), streaming | ~8,000 |
| 03 | [[agent-03-python-sdk]] | pip package, async patterns | ~9,000 |
| 04 | [[agent-04-image-models]] | FLUX, Seedream, SDXL, Imagen | ~6,000 |
| 05 | [[agent-05-video-models]] | Veo 3, Kling, WAN, Luma | ~5,000 |
| 06 | [[agent-06-streaming-queues]] | Queue API, WebSocket, Status | ~9,000 |
| 07 | [[agent-07-finetuning-training]] | LoRA training, 13 trainers | ~7,500 |
| 08 | [[agent-08-billing-usage]] | Credits, Usage API, Pricing | ~4,500 |
| 09 | [[agent-09-advanced-features]] | Multi-LoRA, Masks, Expansion | ~9,000 |

### Round 2 Documentation (Gap-Filling)

| # | Document | Focus | Words |
|---|----------|-------|-------|
| 10 | [[agent-10-audio-models]] | TTS, STT, Music, Voice Cloning | ~7,500 |
| 11 | [[agent-11-3d-models]] | TripoSR, Trellis, Meshy, SAM | ~7,000 |
| 12 | [[agent-12-serverless]] | fal.App, Deployment, Scaling | ~7,000 |
| 13 | [[agent-13-errors]] | HTTP Codes, Error Types, Retry | ~6,000 |
| 14 | [[agent-14-enterprise]] | SOC2, SSO, SLA, Dedicated | ~5,200 |

### Synthesis Documents

| Document | Purpose |
|----------|---------|
| [[MASTER-FAL-AI-DOCUMENTATION]] | This document - complete synthesis |
| [[KNOWLEDGE-MAP]] | Topic dependency graph |
| [[QUICK-REFERENCE]] | Developer cheatsheet |

---

## Version History

| Version | Date | Changes |
|---------|------|---------|
| 1.0.0 | 2025-12-29 | Initial synthesis from 14 agent reports |

---

*Total Research Output: ~75,000+ words across 14 specialized documents*
*Platform Coverage: 600+ model endpoints documented*
*Last Updated: 2025-12-29*
