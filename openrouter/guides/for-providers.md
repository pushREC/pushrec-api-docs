---
source: https://openrouter.ai/docs/guides/guides/for-providers
scraped: 2026-01-08
---

# Provider Integration

## Overview

This guide outlines OpenRouter's requirements for AI model providers seeking to integrate their inference services through a unified API.

## Eligibility Requirements

Providers must implement three core components:

### 1. List Models Endpoint

Providers need an endpoint returning available models in JSON format. Required fields include model ID, name, creation timestamp, modalities, context length, and pricing structure.

**Key specifications:**

- Pricing fields use string format (USD) to prevent floating-point errors
- Valid quantization: `int4`, `int8`, `fp4`, `fp6`, `fp8`, `fp16`, `bf16`, `fp32`
- Supported sampling parameters: `temperature`, `top_p`, `top_k`, `repetition_penalty`, `frequency_penalty`, `presence_penalty`, `stop`, `seed`
- Supported features: `tools`, `json_mode`, `structured_outputs`, `web_search`, `reasoning`

### 2. Payment Infrastructure

For OpenRouter to use the provider we must be able to pay for inference automatically. This can be done via auto top up or invoicing.

### 3. Uptime Monitoring

OpenRouter calculates uptime as successful requests divided by total requests, excluding user errors. Server errors (500+), authentication failures (401), and payment issues (402) negatively impact metrics, while user input errors (400, 413) do not.

**Traffic routing thresholds:**

| Uptime | Routing Status |
|--------|----------------|
| Below 80% | Fallback only |
| 80-94% | Degraded priority |
| 95%+ | Normal routing |

### 4. Performance Metrics

Throughput measurement includes fetch latency, time-to-first-token, and streaming duration. Providers should return early rate-limit responses under load rather than queueing requests, and send keep-alive signals for long-processing models.
