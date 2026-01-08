---
source: https://openrouter.ai/docs/sdks/python/analytics
scraped: 2026-01-08
---

# Analytics - Python SDK

## Overview

The Analytics endpoint provides usage data visualization. It returns user activity data grouped by endpoint for the last 30 (completed) UTC days.

## Available Operations

### get_user_activity

Retrieves user activity organized by endpoint.

## Implementation Example

```python
from openrouter import OpenRouter
import os

with OpenRouter(
    api_key=os.getenv("OPENROUTER_API_KEY", ""),
) as open_router:

    res = open_router.analytics.get_user_activity(date_="2025-08-24")
    print(res)
```

## Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `date_` | Optional[str] | No | Filters results to a single UTC date within the previous 30 days using YYYY-MM-DD format |
| `retries` | Optional[utils.RetryConfig] | No | Overrides default client retry configuration |

## Response Format

Returns `operations.GetUserActivityResponse`

## Possible Errors

| Error | Status Code | Format |
|-------|-------------|--------|
| Bad Request | 400 | application/json |
| Unauthorized | 401 | application/json |
| Forbidden | 403 | application/json |
| Server Error | 500 | application/json |
| General OpenRouter Error | 4XX, 5XX | */* |

**Note:** The Python SDK and associated documentation are currently in beta with ongoing development.
