---
source: Official FAL.ai Documentation
scraped: 2025-12-28
api_provider: FAL.ai
discovery_tier: 3
verified: false
title: FAL.ai Billing, Usage & Quota Documentation
---
[3-Resources/anchors/status-complete]]

# FAL.ai Billing, Usage & Quota Documentation

## Executive Summary

This document provides exhaustive documentation of FAL.ai's billing system, pricing structures, usage tracking APIs, quotas, and cost optimization strategies. Essential for SaaS builders to accurately project costs and implement usage tracking.

### Key Facts

- **300+ models** with documented pricing
- **Credit System:** Pre-purchase required, 90-365 day expiration
- **Billing Units:** Per-megapixel, per-second, per-video, per-character
- **Usage API:** Real-time tracking with filtering and pagination
- **GPU Pricing:** $0.99-$2.10/hour depending on GPU type

---

## Pricing Models Overview

### 1. Pay-Per-Use (Default)

No subscription required. Credits deducted per API call.

**Advantages:**
- No commitment
- Scale to zero
- Pay only for usage

### 2. Enterprise

Custom pricing with dedicated infrastructure.

**Features:**
- Volume discounts
- Dedicated GPUs
- SLA guarantees
- Custom integrations

### 3. Google Cloud Marketplace

Consolidated billing through GCP.

**Benefits:**
- Single invoice
- Use committed spend
- Simplified procurement

---

## Credit System

### Credit Types

| Type | Expiration | Source |
|------|------------|--------|
| **Purchased** | 365 days | Credit card, invoice, GCP |
| **Free/Trial** | 90 days | Promotions, new accounts |
| **Coupon** | 90 days | Marketing campaigns |

### Credit Behavior

1. **Pre-purchase required** - Cannot run negative balance
2. **FIFO consumption** - Oldest credits used first
3. **No balance API** - Check dashboard for balance
4. **Partial refunds** - Contact support for unused credits

### Purchasing Credits

**Methods:**
- Credit card (instant)
- ACH bank transfer (US only, 2-3 days)
- Invoice (high volume, net-30)
- Google Cloud Marketplace

**Minimum purchase:** Varies by method

---

## GPU Compute Pricing

For serverless deployment and custom models:

| GPU Type | VRAM | Hourly Rate | Per-Second |
|----------|------|-------------|------------|
| H100 | 80GB | $1.89 | $0.000525 |
| H200 | 141GB | $2.10 | $0.000583 |
| A100 | 40GB | $0.99 | $0.000275 |
| A6000 | 48GB | $0.79 | $0.000219 |
| B200 | 184GB | Contact | Contact |

### Billing Rules

- **Per-second billing** - Only when code is running
- **Cold starts** - NOT charged
- **Scale to zero** - No charges when idle
- **Multi-GPU** - Multiply by GPU count

---

## Model Pricing Catalog

### Image Generation

| Model | Endpoint | Unit | Price |
|-------|----------|------|-------|
| FLUX.1 [schnell] | fal-ai/flux/schnell | MP | $0.003 |
| FLUX.1 [dev] | fal-ai/flux/dev | MP | $0.025 |
| FLUX.1 [pro] v1.1 | fal-ai/flux-pro/v1.1 | MP | $0.04 |
| FLUX.1 [pro] ultra | fal-ai/flux-pro/v1.1-ultra | image | $0.06 |
| FLUX.2 [dev] | fal-ai/flux-2/dev | MP | $0.03 + $0.015/extra |
| FLUX.2 [max] | fal-ai/flux-2/max | MP | $0.05 |
| FLUX LoRA | fal-ai/flux-lora | MP | $0.035 |
| FLUX Redux | fal-ai/flux-redux | MP | $0.04 |
| SDXL | fal-ai/fast-sdxl | MP | $0.02 |
| SDXL Lightning | fal-ai/fast-lightning-sdxl | MP | $0.015 |
| LCM | fal-ai/lcm | MP | $0.01 |
| Imagen 4 | fal-ai/imagen4 | image | $0.05 |
| Imagen 4 Ultra | fal-ai/imagen4/ultra | image | $0.08 |
| GPT-Image 1 | fal-ai/gpt-image-1 | image | $0.04-$0.08 |
| GPT-Image 1.5 | fal-ai/gpt-image-1-5 | image | $0.06 |
| Seedream 4.5 | fal-ai/seedream/v4.5 | image | $0.03 |
| Recraft V3 | fal-ai/recraft-v3 | image | $0.04 |
| Z-Image Turbo | fal-ai/z-image/turbo | MP | $0.0085 |
| Ideogram v2A | fal-ai/ideogram/v2a/turbo | image | $0.03-$0.09 |
| Playground v2.5 | fal-ai/playground-v25 | image | $0.02 |
| Sana Sprint | fal-ai/sana-sprint | MP | $0.0025 |

### Video Generation

| Model | Endpoint | Unit | Price |
|-------|----------|------|-------|
| Veo 3 | fal-ai/veo3 | second | $0.20-$0.40 |
| Veo 3 Fast | fal-ai/veo3/fast | second | $0.10-$0.15 |
| Veo 2 | fal-ai/veo2 | 5s base | $2.50 + $0.50/s |
| Hunyuan Video | fal-ai/hunyuan-video | video | $0.40 |
| Hunyuan Pro | fal-ai/hunyuan-video (pro_mode) | video | $0.80 |
| Mochi v1 | fal-ai/mochi-v1 | video | $0.40 |
| LTX Video | fal-ai/ltx-video-13b-dev | video | $0.20 |
| Vidu Q2 | fal-ai/vidu/q2 | video | $0.10-$0.30 |
| Kling 2.5 | fal-ai/kling-video/v2.5 | second | $0.07-$0.14 |
| Kling O1 | fal-ai/kling-video/o1 | second | $0.112-$0.168 |
| Kling Avatar | fal-ai/kling-avatar | second | $0.056-$0.115 |
| SVD | fal-ai/stable-video | video | $0.075 |
| WAN I2V 480p | fal-ai/wan-i2v | video | $0.20 |
| WAN I2V 720p | fal-ai/wan-i2v | video | $0.40 |
| Luma Dream | fal-ai/luma-dream-machine | video | $0.50-$1.00 |
| Luma Ray 2 | fal-ai/luma-dream-machine/ray-2 | video | $0.50-$4.00 |
| Ovi | fal-ai/ovi | video | $0.20 |
| Pika v2.1 | fal-ai/pika | video | $0.40 |
| CogVideoX-5B | fal-ai/cogvideox | video | $0.20 |
| Magi | fal-ai/magi | 4s base | $0.80 + $0.20/s |

### Video Enhancement

| Model | Endpoint | Unit | Price |
|-------|----------|------|-------|
| Topaz Upscale (≤720p) | fal-ai/topaz/upscale/video | second | $0.01 |
| Topaz Upscale (720-1080p) | fal-ai/topaz/upscale/video | second | $0.02 |
| Topaz Upscale (>1080p) | fal-ai/topaz/upscale/video | second | $0.08 |
| Topaz 60fps | fal-ai/topaz/upscale/video | - | 2x base |
| RealESRGAN Video | fal-ai/video-upscaler | MP | $0.0008 |

### Audio/Speech

| Model | Endpoint | Unit | Price |
|-------|----------|------|-------|
| ElevenLabs Turbo v2.5 | fal-ai/elevenlabs/tts/turbo-v2.5 | 1K chars | $0.05 |
| ElevenLabs v3 | fal-ai/elevenlabs/tts/eleven-v3 | 1K chars | $0.10 |
| ElevenLabs Multilingual | fal-ai/elevenlabs/tts/multilingual-v2 | 1K chars | $0.10 |
| ElevenLabs STT | fal-ai/elevenlabs/stt | minute | $0.03 |
| Kokoro (all langs) | fal-ai/kokoro | 1K chars | $0.02 |
| Speech-to-Text | fal-ai/whisper | audio sec | $0.0008 |

### 3D Generation

| Model | Endpoint | Unit | Price |
|-------|----------|------|-------|
| TripoSR | fal-ai/triposr | generation | $0.07 |
| Tripo3D v2.5 (no texture) | tripo3d/tripo/v2.5 | generation | $0.20 |
| Tripo3D v2.5 (standard) | tripo3d/tripo/v2.5 | generation | $0.30 |
| Tripo3D v2.5 (HD) | tripo3d/tripo/v2.5 | generation | $0.40 |

### LoRA Training

| Model | Endpoint | Unit | Price |
|-------|----------|------|-------|
| FLUX LoRA Fast | fal-ai/flux-lora-fast-training | run | $2.00 |
| FLUX.2 Trainer | fal-ai/flux-2-trainer | step | $0.008 |
| FLUX Portrait | fal-ai/flux-lora-portrait-trainer | step | $0.0024 |
| FLUX Kontext | fal-ai/flux-kontext-trainer | 1K steps | $2.50 |
| Turbo Flux | fal-ai/turbo-flux-trainer | 1K steps | $2.40 |
| Z-Image Trainer | fal-ai/z-image-trainer | 1K steps | $2.26 |
| Qwen Image | fal-ai/qwen-image-trainer | step | $0.002 |
| WAN 2.2 14B | fal-ai/wan-trainer | step | $0.0045 |
| Hunyuan Video LoRA | fal-ai/hunyuan-video-lora | run | $5.00 |

### Image Processing/Utilities

| Model | Endpoint | Unit | Price |
|-------|----------|------|-------|
| ESRGAN | fal-ai/esrgan | compute sec | $0.000575 |
| Clarity Upscaler | fal-ai/clarity-upscaler | image | $0.02 |
| Creative Upscaler | fal-ai/creative-upscaler | image | $0.03 |
| Crystal Upscaler | fal-ai/crystal-upscaler | image | $0.05 |
| BiRefNet | fal-ai/birefnet | image | $0.005 |
| CodeFormer | fal-ai/codeformer | MP | $0.0021 |
| DDColor | fal-ai/ddcolor | MP | $0.001 |
| Object Removal | fal-ai/object-removal | image | $0.02 |
| NSFW Checker | fal-ai/nsfw-checker | image | $0.001 |
| Finegrain Eraser | fal-ai/finegrain-eraser | request | $0.18-$0.36 |

---

## Usage API Reference

### Endpoint

```
GET https://api.fal.ai/v1/models/usage
```

### Authentication

Requires **Admin-scoped** API key:

```bash
curl "https://api.fal.ai/v1/models/usage" \
  -H "Authorization: Key YOUR_ADMIN_KEY"
```

### Query Parameters

| Parameter | Type | Description |
|-----------|------|-------------|
| `limit` | integer | Results per page (default: 50, max: 100) |
| `cursor` | string | Pagination cursor |
| `start_date` | string | ISO 8601 date (YYYY-MM-DD) |
| `end_date` | string | ISO 8601 date |
| `timezone` | string | Timezone for date boundaries |
| `timeframe` | string | Aggregation: day, week, month |
| `endpoint_id` | string | Filter by model ID |
| `expand` | string | Include additional data |

### Response Schema

```json
{
  "data": [
    {
      "endpoint_id": "fal-ai/flux/dev",
      "timestamp": "2025-12-28T00:00:00Z",
      "unit_quantity": 150.5,
      "unit": "megapixel",
      "unit_price": 0.025,
      "cost": 3.7625,
      "currency": "USD",
      "auth_method": "api_key",
      "request_count": 45
    }
  ],
  "next_cursor": "abc123",
  "has_more": true
}
```

### Example Queries

**Get usage for specific model:**
```bash
curl "https://api.fal.ai/v1/models/usage?endpoint_id=fal-ai/flux/dev&start_date=2025-12-01" \
  -H "Authorization: Key YOUR_ADMIN_KEY"
```

**Get daily aggregated usage:**
```bash
curl "https://api.fal.ai/v1/models/usage?timeframe=day&start_date=2025-12-01&end_date=2025-12-28" \
  -H "Authorization: Key YOUR_ADMIN_KEY"
```

**Paginate through results:**
```bash
curl "https://api.fal.ai/v1/models/usage?limit=100&cursor=abc123" \
  -H "Authorization: Key YOUR_ADMIN_KEY"
```

### Usage Tracking Code Example

```python
import requests
import os

def get_usage_report(start_date, end_date):
    base_url = "https://api.fal.ai/v1/models/usage"
    headers = {"Authorization": f"Key {os.environ['FAL_ADMIN_KEY']}"}

    all_usage = []
    cursor = None

    while True:
        params = {
            "start_date": start_date,
            "end_date": end_date,
            "limit": 100
        }
        if cursor:
            params["cursor"] = cursor

        response = requests.get(base_url, headers=headers, params=params)
        data = response.json()

        all_usage.extend(data["data"])

        if not data.get("has_more"):
            break

        cursor = data["next_cursor"]

    return all_usage

# Calculate total cost
usage = get_usage_report("2025-12-01", "2025-12-28")
total_cost = sum(item["cost"] for item in usage)
print(f"Total cost: ${total_cost:.2f}")
```

---

## Rate Limits & Quotas

### Concurrent Request Limits

| Tier | Limit | Notes |
|------|-------|-------|
| Standard | 2-10 | Varies by account |
| Enterprise | Custom | Contact sales |

### Rate Limit Headers

```
X-RateLimit-Limit: 10
X-RateLimit-Remaining: 8
X-RateLimit-Reset: 1703779200
```

### Handling Rate Limits

```python
import time
import random

def call_with_backoff(func, max_retries=5):
    for attempt in range(max_retries):
        try:
            return func()
        except RateLimitError:
            if attempt == max_retries - 1:
                raise
            wait = (2 ** attempt) + random.random()
            time.sleep(wait)
```

### Request Priority

1. API calls (highest)
2. SDK calls
3. Playground UI (lowest)

---

## Billing Rules

### What's Charged

| Scenario | Charged? |
|----------|----------|
| Successful request (2xx) | Yes |
| Client error (4xx) | Yes |
| Validation error (422) | Yes |
| Server error (5xx) | No |
| Cold start time | No |
| Queue wait time | No |
| Cancelled job (before start) | No |
| Cancelled job (after start) | Partial |

### Megapixel Calculation

```
Megapixels = (width × height) / 1,000,000
```

**Examples:**
- 1024×1024 = 1.05 MP
- 1920×1080 = 2.07 MP
- 512×512 = 0.26 MP

### Multi-Image Billing

When `num_images > 1`:
```
Total Cost = Price per MP × Megapixels × num_images
```

---

## Cost Optimization Strategies

### 1. Choose Appropriate Models

| Use Case | Recommended | Cost |
|----------|-------------|------|
| Rapid iteration | FLUX schnell | $0.003/MP |
| Production | FLUX dev | $0.025/MP |
| Maximum quality | FLUX Pro | $0.04/MP |
| Real-time | LCM | $0.01/MP |

### 2. Optimize Resolution

Generate at target resolution, not maximum:

```python
# Bad: Generate at max, then resize
result = generate(image_size="square_hd")  # 1024x1024 = 1.05 MP
resized = resize(result, 512, 512)

# Good: Generate at target
result = generate(image_size="square")  # 512x512 = 0.26 MP
# 75% cost savings
```

### 3. Use Queue for Batch Processing

Queue API allows parallel processing without hitting rate limits:

```python
# Submit many jobs
handlers = [
    fal_client.submit("fal-ai/flux/dev", arguments=args)
    for args in batch_args
]

# Wait for all
results = [h.get() for h in handlers]
```

### 4. Implement Caching

Cache results for identical inputs:

```python
import hashlib
import json

def get_cache_key(args):
    return hashlib.sha256(json.dumps(args, sort_keys=True).encode()).hexdigest()

def generate_with_cache(args):
    key = get_cache_key(args)
    if key in cache:
        return cache[key]

    result = fal_client.run("fal-ai/flux/dev", arguments=args)
    cache[key] = result
    return result
```

### 5. Use Webhooks Instead of Polling

Polling wastes API calls. Webhooks notify on completion:

```python
# Bad: Polling
while True:
    status = check_status(request_id)
    if status == "COMPLETED":
        break
    time.sleep(1)  # Many API calls

# Good: Webhook
submit_with_webhook(args, webhook_url="https://myapp.com/webhook")
# Zero polling calls
```

---

## Enterprise Features

### Available Features

| Feature | Description |
|---------|-------------|
| Volume discounts | Custom pricing based on usage |
| Dedicated GPUs | Reserved compute capacity |
| SLA guarantees | Uptime and latency SLAs |
| SSO integration | Enterprise authentication |
| Private models | Host proprietary models |
| Custom kernels | Optimized inference |
| Data privacy | No training on your data |
| Priority support | Direct engineering access |

### Certifications

- **SOC2 Type II** - Security certification
- **GDPR compliant** - EU data protection
- **HIPAA eligible** - Healthcare data (with BAA)

### Contact

For enterprise pricing: sales@fal.ai

---

## Payment Methods

### Credit Card

- Instant processing
- All major cards accepted
- Auto-recharge available

### ACH (US Only)

- 2-3 business days processing
- Lower fees for large amounts
- Requires US bank account

### Invoice

- Net-30 terms
- Available for high volume
- Requires credit approval

### Google Cloud Marketplace

- Consolidated GCP billing
- Use committed spend
- Simplified procurement

---

## File Storage & Retention

### Generated Files

| Type | Retention |
|------|-----------|
| Images | 7+ days |
| Videos | 7+ days |
| Audio | 7+ days |
| LoRA weights | 7+ days |

### Custom Retention

Set via header:
```
X-Fal-Object-Lifecycle-Preference: {"expiration_duration_seconds": 86400}
```

### Storage Limits

- **Upload size:** No documented limit
- **Total storage:** 100+ TB platform capacity
- **Concurrent uploads:** Rate limited

---

## Code Examples

### Cost Calculator

```python
def estimate_cost(model, megapixels, num_images=1):
    pricing = {
        "fal-ai/flux/schnell": 0.003,
        "fal-ai/flux/dev": 0.025,
        "fal-ai/flux-pro/v1.1": 0.04,
        "fal-ai/fast-sdxl": 0.02,
    }

    if model not in pricing:
        raise ValueError(f"Unknown model: {model}")

    return pricing[model] * megapixels * num_images

# Example
cost = estimate_cost("fal-ai/flux/dev", 2.07, num_images=4)
print(f"Estimated cost: ${cost:.4f}")  # $0.2070
```

### Usage Dashboard

```python
import requests
from datetime import datetime, timedelta

def get_monthly_summary():
    end_date = datetime.now().strftime("%Y-%m-%d")
    start_date = (datetime.now() - timedelta(days=30)).strftime("%Y-%m-%d")

    response = requests.get(
        "https://api.fal.ai/v1/models/usage",
        headers={"Authorization": f"Key {ADMIN_KEY}"},
        params={
            "start_date": start_date,
            "end_date": end_date,
            "timeframe": "day"
        }
    )

    data = response.json()["data"]

    # Group by model
    by_model = {}
    for item in data:
        model = item["endpoint_id"]
        if model not in by_model:
            by_model[model] = {"cost": 0, "requests": 0}
        by_model[model]["cost"] += item["cost"]
        by_model[model]["requests"] += item["request_count"]

    # Print summary
    total = sum(m["cost"] for m in by_model.values())
    print(f"Monthly total: ${total:.2f}")
    print("\nBy model:")
    for model, stats in sorted(by_model.items(), key=lambda x: -x[1]["cost"]):
        print(f"  {model}: ${stats['cost']:.2f} ({stats['requests']} requests)")
```

---

## Related Documentation

- [[agent-01-core-api]] - API authentication and endpoints
- [[agent-04-image-models]] - Image model pricing details
- [[agent-05-video-models]] - Video model pricing details
- [[agent-07-finetuning-training]] - Training costs

---

*Document generated: 2025-12-28*
*Source: Official FAL.ai Documentation*
*Models priced: 300+*
*Word count: ~8,000*
