---
source: https://openrouter.ai/docs/guides/overview/auth/byok
scraped: 2026-01-08
---

# BYOK (Bring Your Own Key)

## Overview

OpenRouter enables users to integrate their own API provider keys while accessing unified routing and features. This approach grants direct cost and rate limit control through individual provider accounts.

## Key Management

Keys are "securely encrypted and used for all requests routed through the specified provider." Management occurs via account settings integrations dashboard.

## Cost Structure

Using custom provider keys incurs a percentage-based fee deducted from OpenRouter credits, though "the first [threshold] BYOK requests per-month" waive this charge.

## Routing Behavior

The platform prioritizes user-provided keys by default. When configured with "Always use this key," OpenRouter restricts requests solely to that key, preventing fallback to shared capacity. Combined with provider ordering, BYOK keys are attempted first, followed by OpenRouter's shared infrastructure in specified sequence.

## Provider-Specific Setup

### Azure

Requires JSON configuration with model slug, endpoint URL, API key, and model ID. Multiple deployments supported via array format.

### AWS Bedrock

Accepts either Bedrock API keys (region-locked) or traditional AWS credentials (JSON format with accessKeyId, secretAccessKey, region). Requires IAM permissions for `bedrock:InvokeModel` and `bedrock:InvokeModelWithResponseStream`.

### Google Vertex

Demands Google Cloud service account JSON with optional region specification. Service accounts need `aiplatform.endpoints.predict` and `aiplatform.endpoints.streamingPredict` permissions.
