---
source: https://openrouter.ai/docs/guides/routing/provider-selection
scraped: 2026-01-08
---

# Provider Selection

## Overview

OpenRouter intelligently routes AI model requests across multiple providers, optimizing for cost, performance, and reliability. The system uses a `provider` object in request bodies to customize routing behavior.

## Key Routing Strategies

### Default Load Balancing

By default, OpenRouter employs price-weighted load balancing while monitoring uptime. The system prioritizes stable providers and weights selection inversely by the square of pricing. As the documentation explains, "Provider A is 9x more likely to be first routed to Provider A than Provider C because $(1 / 3^2 = 1/9)$" when comparing costs.

### Provider Sorting

Three explicit sorting options override default load balancing:

- **Price sorting**: Routes to lowest-cost providers
- **Throughput sorting**: Routes to highest token/second providers
- **Latency sorting**: Routes to lowest-response-time providers

#### Shortcut Syntax

- `:nitro` suffix = throughput sorting
- `:floor` suffix = price sorting

## Advanced Configuration Options

### Performance Thresholds

Users can set `preferred_min_throughput` and `preferred_max_latency` using percentile cutoffs (p50, p75, p90, p99). These "deprioritize rather than exclude" endpoints failing to meet thresholds, ensuring requests still execute while preferring better-performing options.

### Provider Filtering

- **`order`**: Specify providers to try in sequence
- **`only`**: Restrict to specific providers
- **`ignore`**: Exclude particular providers
- **`allow_fallbacks`**: Toggle backup provider availability

### Data & Policy Controls

- **`data_collection`**: Choose "allow" or "deny" for data-storing providers
- **`zdr`**: Enforce Zero Data Retention endpoints
- **`enforce_distillable_text`**: Limit to distillation-permitted models
- **`require_parameters`**: Route only to providers supporting all request parameters

### Cost Management

The `max_price` field specifies maximum acceptable pricing (e.g., `{"prompt": 1, "completion": 2}`) to filter providers by cost thresholds.

### Model Selection

The `quantizations` field filters by precision levels (int4, int8, fp8, fp16, bf16, fp32, etc.), though "quantized models may exhibit degraded performance" depending on methodology.

## Anthropic Beta Features

OpenRouter supports passing through Anthropic beta headers:

- `fine-grained-tool-streaming-2025-05-14`: Real-time tool argument streaming
- `interleaved-thinking-2025-05-14`: Interleaved reasoning output
- `structured-outputs-2025-11-13`: Strict tool use validation

Multiple features combine via comma-separated header values.

## Enterprise Features

EU in-region routing ensures prompts and completions process entirely within EU infrastructure for enterprise customers. Contact the enterprise team for deployment options.
