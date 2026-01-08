---
source: https://openrouter.ai/docs/guides/guides/user-tracking
scraped: 2026-01-08
---

# User Tracking

## Overview

OpenRouter's user tracking feature lets you include a `user` parameter in API requests to identify your end-users, enabling better caching and analytics.

## Key Features

**Improved Caching**: A given user of your application (assuming you are using caching) will always get routed to the same provider and the cache will stay warm, while distributing other users across providers for load-balancing.

**Analytics Access**: User identifiers appear in the activity dashboard, data exports, and the generations API, providing breakdown of requests by user ID.

## Implementation

Include the `user` parameter with any stable string identifier in your API requests:

```json
{
  "model": "openai/gpt-4o",
  "messages": [{"role": "user", "content": "Hello, how are you?"}],
  "user": "user_12345"
}
```

The documentation provides code examples for TypeScript (OpenRouter SDK), Python (OpenAI SDK), and TypeScript (OpenAI SDK).

## Best Practices

- **Use stable identifiers** that remain consistent across requests
- **Prioritize privacy** by using internal IDs rather than personal information
- **Maintain consistent formatting** throughout your application (e.g., `app_{internal_user_id}`)
