---
source: https://developers.google.com/youtube/analytics/errors
scraped: 2026-01-07
api_provider: Google
discovery_tier: 3
verified: false
title: YouTube Analytics API - Errors Reference
---
 YouTube Analytics API - Errors Reference

## Overview

This document describes common error responses returned by the YouTube Analytics API and how to handle them.

## HTTP Status Codes

### 400 Bad Request

Indicates an invalid request. Common causes:

| Error | Description | Resolution |
|-------|-------------|------------|
| `invalidParameter` | A parameter value is invalid | Check parameter format and allowed values |
| `badRequest` | Request syntax is malformed | Verify request structure |
| `invalidFilters` | Filter syntax or value is invalid | Use correct filter format: `dimension==value` |
| `invalidDimensions` | Invalid dimension combination | Check valid dimension combinations in documentation |
| `invalidMetrics` | Requested metrics not available | Verify metric availability for report type |
| `invalidDateRange` | Start/end dates are invalid | Use YYYY-MM-DD format, ensure start <= end |

### 401 Unauthorized

Authentication failed or token expired.

| Error | Description | Resolution |
|-------|-------------|------------|
| `unauthorized` | Invalid access token | Refresh or obtain new OAuth token |
| `authError` | Authentication failed | Verify OAuth credentials and scopes |

### 403 Forbidden

Access denied to the requested resource.

| Error | Description | Resolution |
|-------|-------------|------------|
| `forbidden` | Insufficient permissions | Request appropriate OAuth scopes |
| `accessNotConfigured` | API not enabled | Enable YouTube Analytics API in Google Cloud Console |
| `rateLimitExceeded` | Too many requests | Implement exponential backoff |
| `quotaExceeded` | Daily quota exhausted | Wait for quota reset or request increase |
| `insufficientPermissions` | Missing required scope | Add required OAuth scope to authorization |

### 404 Not Found

Requested resource does not exist.

| Error | Description | Resolution |
|-------|-------------|------------|
| `notFound` | Channel/video/group not found | Verify resource ID exists |
| `groupNotFound` | Group ID does not exist | Check group ID with groups.list |

### 409 Conflict

Request conflicts with current state.

| Error | Description | Resolution |
|-------|-------------|------------|
| `conflict` | Resource already exists | Use update instead of insert |

### 429 Too Many Requests

Rate limit exceeded.

| Error | Description | Resolution |
|-------|-------------|------------|
| `rateLimitExceeded` | Request rate too high | Implement backoff; reduce request frequency |

### 500 Internal Server Error

Server-side error.

| Error | Description | Resolution |
|-------|-------------|------------|
| `internalError` | YouTube server error | Retry with exponential backoff |
| `backendError` | Backend service unavailable | Wait and retry |

### 503 Service Unavailable

Service temporarily unavailable.

| Error | Description | Resolution |
|-------|-------------|------------|
| `serviceUnavailable` | Temporary outage | Retry with exponential backoff |

## Common Validation Errors

### Parameter Errors

```json
{
  "error": {
    "code": 400,
    "message": "Invalid value for parameter 'startDate': '2024-13-01'",
    "errors": [
      {
        "domain": "youtubeAnalytics",
        "reason": "invalidParameter",
        "message": "Invalid value for parameter 'startDate': '2024-13-01'"
      }
    ]
  }
}
```

### Missing Required Parameter

```json
{
  "error": {
    "code": 400,
    "message": "Required parameter 'ids' is missing",
    "errors": [
      {
        "domain": "youtubeAnalytics",
        "reason": "required",
        "message": "Required parameter 'ids' is missing"
      }
    ]
  }
}
```

### Invalid Filter

```json
{
  "error": {
    "code": 400,
    "message": "Invalid filter: country=US",
    "errors": [
      {
        "domain": "youtubeAnalytics",
        "reason": "invalidFilters",
        "message": "Invalid filter: country=US. Use '==' for equality."
      }
    ]
  }
}
```

## Report-Specific Errors

### Traffic Source Constraint Error

Returned when the product of queried videos times date range days exceeds 50,000:

```json
{
  "error": {
    "code": 400,
    "message": "The product of the number of queried videos and date range days cannot exceed 50,000",
    "errors": [
      {
        "domain": "youtubeAnalytics",
        "reason": "invalidRequest",
        "message": "Query exceeds traffic source report limits"
      }
    ]
  }
}
```

### Audience Retention Single Video Error

```json
{
  "error": {
    "code": 400,
    "message": "Audience retention reports only support a single video filter",
    "errors": [
      {
        "domain": "youtubeAnalytics",
        "reason": "invalidFilters",
        "message": "Cannot use comma-separated video IDs for audience retention"
      }
    ]
  }
}
```

## Error Handling Best Practices

1. **Implement exponential backoff** for 429, 500, and 503 errors
2. **Log error details** including error code, reason, and message
3. **Validate parameters client-side** before making requests
4. **Check OAuth token validity** before each session
5. **Monitor quota usage** to avoid exhaustion

## Retry Strategy

```
Initial delay: 1 second
Maximum retries: 5
Backoff multiplier: 2
Maximum delay: 32 seconds

Retry 1: Wait 1s
Retry 2: Wait 2s
Retry 3: Wait 4s
Retry 4: Wait 8s
Retry 5: Wait 16s
```

## OAuth Scopes for Error Prevention

Ensure appropriate scopes are requested:

| Scope | Required For |
|-------|--------------|
| `yt-analytics.readonly` | Basic analytics reports |
| `yt-analytics-monetary.readonly` | Revenue and ad metrics |
| `youtube` | Managing groups and group items |
| `youtubepartner` | Content owner reports |
