---
source: https://openrouter.ai/docs/guides/privacy/logging
scraped: 2026-01-08
---

# Logging

OpenRouter allows users to manage how their data is handled by different AI providers.

## Provider Data Handling

Each AI provider on OpenRouter has its own data handling policies for logging and retention.

## Training Controls

Users can configure account settings to restrict routing to providers that train on user data. If you opt out of training in your account settings, OpenRouter will not route to providers that train.

## Data Retention Policies

While OpenRouter itself doesn't use retention policies for routing decisions, the platform displays each provider's specific retention requirements so users can make informed choices.

## Request-Level Filtering

Users can restrict individual requests to only use providers with a certain data policy through:
- The API
- Account-wide privacy settings

## EU Enterprise Option

For enterprise customers, OpenRouter offers EU in-region routing using the endpoint:

```
https://eu.openrouter.ai
```

This ensures data remains within European borders.

## Important Note

Filtering settings has no bearing on OpenRouter's own policies and what we do with your prompts. User controls only affect provider selection, not OpenRouter's internal practices.
