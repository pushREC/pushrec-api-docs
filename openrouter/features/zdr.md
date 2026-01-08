---
source: https://openrouter.ai/docs/guides/features/zdr
scraped: 2026-01-08
---

# Zero Data Retention (ZDR)

Zero Data Retention (ZDR) means that a provider will not store your data for any period of time. OpenRouter provides settings to route exclusively to ZDR-compliant endpoints.

## Key Distinctions

OpenRouter distinguishes between data retention and training practices:

- Some providers may retain data without training on it (for abuse detection or legal compliance)
- Others do neither
- The platform gives users control over both policies independently

## Policy Management Approach

OpenRouter works with providers to document their specific data policies at the endpoint level, recognizing that a provider's general policy may differ from the specific policy for a given endpoint.

When policies cannot be clearly established, the platform adopts a conservative approach and assumes data is both retained and used for training.

## Per-Request Enforcement

Users can implement ZDR on individual API calls using the `zdr` parameter in provider preferences:

```json
{
  "model": "openai/gpt-4",
  "messages": [...],
  "provider": {
    "zdr": true
  }
}
```

This operates as an "OR" with account-wide settings—enabling ZDR at either level activates enforcement.

## Account-Wide Settings

Configure ZDR for all requests in your account settings:

1. Navigate to OpenRouter settings
2. Enable "Zero Data Retention" toggle
3. All requests will now route only to ZDR-compliant endpoints

## Caching Exception

OpenRouter permits in-memory prompt caching on ZDR endpoints, treating it as distinct from data retention since cached data remains temporary and local to the provider's infrastructure.

## OpenRouter's Own Policy

OpenRouter itself has a ZDR policy: your prompts are not retained unless you specifically opt in to prompt logging.
