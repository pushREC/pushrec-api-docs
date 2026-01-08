---
source: https://openrouter.ai/docs/guides/features/zero-completion-insurance
scraped: 2026-01-08
---

# Zero Completion Insurance

OpenRouter's zero completion insurance is an automatic protective mechanism that shields users from charges when AI requests fail to generate meaningful output.

## Protection Conditions

The feature activates when either scenario occurs:

1. A response produces zero completion tokens with a blank finish reason
2. The response contains an error finish reason

You will not be charged for the request, even if the underlying provider charges for prompt processing.

## Automatic Coverage

This protection requires no setup from users. Zero completion insurance is automatically enabled for all accounts and requires no configuration, applying uniformly across all models and providers available through OpenRouter.

## Visibility and Transparency

Protected requests appear distinctly in your activity dashboard, displaying zero credits deducted. This transparency holds true regardless of whether OpenRouter itself incurs charges from the underlying AI provider for processing the prompt tokens.

## Key Benefits

- **No configuration required**: Automatic protection for all requests
- **Universal coverage**: Works across all models and providers
- **Cost absorption**: OpenRouter absorbs provider costs for failed completions
- **Clear visibility**: Dashboard shows protected requests with zero charges

This approach essentially absorbs provider costs when responses fail to deliver usable completions, shifting that financial burden away from end users.
