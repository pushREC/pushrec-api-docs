---
source: https://openrouter.ai/docs/app-attribution
scraped: 2026-01-08
---

# App Attribution

## Overview

OpenRouter's app attribution feature enables developers to associate API usage with their applications, gaining visibility in public rankings and analytics dashboards.

## Key Features

The system provides developers with access to:

- **Public leaderboards** showing daily, weekly, and monthly rankings by token usage
- **Model-specific tabs** displaying which applications utilize each model most frequently
- **Comprehensive analytics** tracking model usage patterns and token consumption over time
- **Community visibility** within the OpenRouter developer ecosystem

## Attribution Implementation

Two optional HTTP headers enable attribution functionality:

1. **HTTP-Referer**: Identifies the app's URL and serves as the primary ranking identifier
2. **X-Title**: Sets the application's display name in rankings and analytics

Apps using localhost URLs must include a title to be tracked.

## Code Examples Provided

The guide includes implementation samples across multiple languages:

- TypeScript SDK (@openrouter/sdk)
- Python SDK (OpenRouter)
- Direct API calls via Python requests and fetch
- cURL commands

## Analytics Access

Attributed apps appear at three locations:

- Main rankings page (openrouter.ai/rankings)
- Individual model pages under "Apps" tabs
- Dedicated analytics dashboards (openrouter.ai/apps?url=<your-app-url>)

## Recommended Practices

Developers should use primary domains rather than subdomains, employ descriptive titles reflecting actual app names, and recognize that only public applications sending attribution headers appear in rankings.
