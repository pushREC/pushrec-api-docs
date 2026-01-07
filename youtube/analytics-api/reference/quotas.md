---
title: YouTube Analytics API - Quotas
source: https://developers.google.com/youtube/analytics/quotas
api: youtube-analytics
scraped: 2026-01-07
---

# YouTube Analytics API - Quotas

## Overview

The YouTube Analytics API uses a quota system to ensure fair usage and prevent abuse. Understanding quota allocation and management is essential for building reliable applications.

## Quota Basics

### YouTube Analytics API
- Server evaluates each query's quota cost
- Usage varies by query complexity
- Per-query evaluation against daily limit

### YouTube Reporting API
- No per-query quota concerns
- Data retrieved once, then analyzed internally
- Better for bulk data operations

## Default Quota Allocation

| Resource | Default Quota |
|----------|---------------|
| Queries per day | 10,000 units |
| Queries per 100 seconds per user | 100 units |

**Note**: Actual quotas may vary. Check your Google Cloud Console for current allocation.

## Quota Costs

Each API operation consumes quota units:

| Operation | Approximate Cost |
|-----------|------------------|
| reports.query | 1 unit |
| groups.list | 1 unit |
| groups.insert | 50 units |
| groups.update | 50 units |
| groups.delete | 50 units |
| groupItems.list | 1 unit |
| groupItems.insert | 50 units |
| groupItems.delete | 50 units |

## Viewing Quota Usage

1. Go to [Google Cloud Console](https://console.cloud.google.com)
2. Select your project
3. Navigate to **APIs & Services** > **Dashboard**
4. Click on **YouTube Analytics API**
5. View the **Quotas** tab

## Quota Management Strategies

### Optimize Query Efficiency

**Batch requests when possible:**
```
# Instead of multiple single-video queries
metrics=views,estimatedMinutesWatched
filters=video==VIDEO_ID1

# Use comma-separated video IDs
filters=video==VIDEO_ID1,VIDEO_ID2,VIDEO_ID3
```

**Request only needed data:**
```
# Avoid: requesting all metrics
metrics=views,likes,dislikes,comments,shares,subscribersGained,...

# Better: request only what you need
metrics=views,estimatedMinutesWatched
```

### Implement Caching

- Cache responses for reasonable periods
- Daily data doesn't change frequently
- Historical data is stable

```python
# Example caching strategy
cache_duration = {
    'today': 3600,        # 1 hour for today's data
    'yesterday': 86400,   # 24 hours for yesterday
    'older': 604800       # 7 days for older data
}
```

### Use Reporting API for Bulk Data

For large-scale data needs:
1. Schedule reporting jobs via Reporting API
2. Download bulk reports daily
3. Process data locally
4. No per-query quota consumption

## Rate Limiting

### Per-User Rate Limits

- 100 requests per 100 seconds per user
- Applies to authenticated user's queries

### Handling Rate Limit Errors

```python
import time
from random import uniform

def make_request_with_backoff(request_func, max_retries=5):
    for attempt in range(max_retries):
        try:
            return request_func()
        except RateLimitError:
            if attempt < max_retries - 1:
                sleep_time = (2 ** attempt) + uniform(0, 1)
                time.sleep(sleep_time)
            else:
                raise
```

## Quota Exceeded Errors

### Error Response

```json
{
  "error": {
    "code": 403,
    "message": "The request cannot be completed because you have exceeded your quota.",
    "errors": [
      {
        "domain": "usageLimits",
        "reason": "quotaExceeded",
        "message": "Quota exceeded for quota metric 'Queries' and limit 'Queries per day'"
      }
    ]
  }
}
```

### Recovery Options

1. **Wait for reset**: Daily quota resets at midnight Pacific Time
2. **Reduce usage**: Implement caching and batch requests
3. **Request increase**: Apply for higher quota through Google Cloud Console

## Requesting Quota Increase

1. Go to Google Cloud Console
2. Navigate to **IAM & Admin** > **Quotas**
3. Find YouTube Analytics API quotas
4. Click **Edit Quotas**
5. Fill out the request form with:
   - Requested quota increase
   - Justification for increase
   - Expected usage patterns

## Best Practices

### Do's

- Monitor quota usage regularly
- Implement exponential backoff for errors
- Cache responses appropriately
- Use Reporting API for bulk operations
- Request only necessary dimensions and metrics
- Batch video IDs in single requests

### Don'ts

- Don't make unnecessary repeated requests
- Don't ignore quota warnings
- Don't poll for real-time updates too frequently
- Don't request all metrics when only a few are needed

## Quota Optimization Checklist

- [ ] Implement response caching
- [ ] Use comma-separated video filters
- [ ] Request only needed metrics
- [ ] Set up quota monitoring alerts
- [ ] Consider Reporting API for bulk data
- [ ] Implement exponential backoff
- [ ] Review and remove unused queries

## Monitoring Quota Usage

### Set Up Alerts

In Google Cloud Console:
1. Go to **Monitoring** > **Alerting**
2. Create alert policy for quota usage
3. Set threshold (e.g., 80% of daily quota)
4. Configure notification channels

### Track Usage Programmatically

```python
from google.cloud import monitoring_v3

def check_quota_usage(project_id):
    client = monitoring_v3.MetricServiceClient()
    project_name = f"projects/{project_id}"

    # Query quota metrics
    # Implement based on your monitoring setup
```

## Summary

| Strategy | Impact |
|----------|--------|
| Caching | High - reduces repeated requests |
| Batching | Medium - fewer total requests |
| Reporting API | High - eliminates query quotas for bulk data |
| Efficient queries | Medium - lower per-query cost |
| Monitoring | Essential - prevents unexpected failures |
