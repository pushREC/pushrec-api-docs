---
source: https://openrouter.ai/docs/guides/features/broadcast/overview
scraped: 2026-01-08
---

# Broadcast Feature Overview

OpenRouter's Broadcast feature enables automatic trace transmission to observability platforms. Here are the key takeaways:

## Core Functionality

The platform automatically forwards traces from API requests to external analytics tools without requiring code modifications. Users can access this feature through their dashboard settings and configure multiple destinations simultaneously.

## Available Integrations

Currently supported platforms include:
- Braintrust
- Datadog
- Langfuse
- LangSmith
- Weave
- S3
- OTel Collector

Additional destinations are in development, with nearly 25 planned integrations ranging from Arize to WhyLabs.

## Trace Contents

Each transmission includes:
- The input messages and model output (with multimodal content stripped for efficiency)
- Token counts
- Cost data
- Latency metrics
- Model information

Users can optionally enrich traces by adding:
- User identifiers (128 characters max)
- Session IDs through request parameters or HTTP headers

## Control Mechanisms

Three filtering options exist:

1. **API Key Selection**: Restricts specific destinations to particular credentials
2. **Sampling Rates**: Controls data volume with deterministic session-level consistency
3. **Multiple Destinations**: Users can configure up to five destinations of the same type for environment-specific routing

## Security & Performance

- Credentials receive encryption before storage and decryption only during transmission
- The asynchronous design prevents latency impact on API responses
- Organization admins can establish shared configurations across team members
