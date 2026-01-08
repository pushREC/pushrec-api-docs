---
source: https://openrouter.ai/docs/guides/routing/model-variants/exacto
scraped: 2026-01-08
---

# Exacto Variant

## Overview

OpenRouter's Exacto endpoints prioritize tool-calling accuracy by routing requests exclusively through vetted providers. As stated in the documentation, these endpoints use "the same request payloads as any other variant, but filters endpoints so that only vetted providers for the chosen model are considered."

## Key Implementation

To activate this feature, append `:exacto` to your model slug (e.g., `moonshotai/kimi-k2-0905:exacto`). The filtering occurs before load balancing, requiring no additional configuration.

## Provider Selection Criteria

OpenRouter identifies optimal providers using three factors:

- Real-world tool-calling accuracy metrics from billions of requests
- User routing preferences when tools are involved
- Benchmark results from internal evaluations and public testing suites

Selected providers must rank highly in tool accuracy, maintain typical tool-invocation rates, and avoid frequent user blacklisting.

## Supported Models

Five models currently support Exacto:

- Kimi K2
- DeepSeek v3.1 Terminus
- GLM 4.6
- GPT-OSS 120B
- Qwen3 Coder

## Recommended Context

Exacto suits "quality-sensitive, agentic workflows where tool-calling accuracy and reliability are critical," making it ideal for production systems requiring dependable function-calling performance.
