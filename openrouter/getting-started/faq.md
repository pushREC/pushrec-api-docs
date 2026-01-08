---
source: https://openrouter.ai/docs/faq
scraped: 2026-01-08
---

# OpenRouter FAQ

## Overview

OpenRouter provides a unified API for accessing major LLM models with aggregated billing, pass-through pricing from underlying providers, and automatic fallback capabilities for improved uptime.

## Getting Started

### Account Creation

Users establish an account and add credits via the Credits page.

### Support Channels

- Technical support available through Discord #help forum
- Billing inquiries directed to support@openrouter.ai

## Pricing Structure

### Credit Purchases

Stripe charges a platform fee; cryptocurrency payments incur a separate fee.

### Zero Markup on Inference

OpenRouter passes through provider pricing without additional inference costs.

### BYOK Option

Bring Your Own Key users receive free monthly requests, then pay a percentage-based fee on subsequent usage.

## Model Variants

### Static Variants

| Variant | Description |
|---------|-------------|
| `:free` | Complimentary access with rate limiting |
| `:extended` | Expanded context windows |
| `:exacto` | High-quality curated endpoints |
| `:thinking` | Reasoning capabilities |

### Dynamic Variants

| Variant | Description |
|---------|-------------|
| `:online` | Web search integration |
| `:nitro` | Throughput optimization |
| `:floor` | Cost prioritization |

## API Specifications

### Authentication

- Cookie-based (web)
- Bearer tokens (API)
- Provisioning API keys

### Format Support

- Text
- Images
- PDFs

### Streaming

Server-sent events enabled via `stream: true`

### SDK Compatibility

Works as OpenAI replacement across supported SDKs.

## Data Privacy

### Default Logging

Only basic metadata (timestamps, token counts); prompts/completions not logged by default.

### Opt-In Discount

Users may enable prompt/completion logging for 1% usage reduction.

### Device Storage

Chatroom conversations stored locally without cross-device sync.

## Billing & Refunds

### Refund Window

24 hours post-transaction for unused credits.

### Free Tier

New users receive small allowance; free models have low rate limits.

### Credit Expiration

Unused credits may expire after one year per terms.

## Account Management

### Deletion

Accessible via Settings > Manage Account > Security tab.

### Organization Access

Documented in separate organization management resources.

### Activity Dashboard

Real-time usage metrics available for monitoring.
