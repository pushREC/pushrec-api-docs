---
source: https://developers.google.com/youtube/v3/docs/videoCategories/list
scraped: 2026-01-07
api_provider: Google
discovery_tier: 3
verified: false
method: list
---
 YouTube Data API: VideoCategories list

## Method Overview

The `videoCategories.list` endpoint returns a list of categories that can be associated with YouTube videos.

**Quota Cost:** 1 unit per request

## HTTP Request

```
GET https://www.googleapis.com/youtube/v3/videoCategories
```

## Parameters

### Required Parameters

| Parameter | Type | Description |
|-----------|------|-------------|
| `part` | string | Specifies which videoCategory resource properties to include. Must be set to `snippet`. |

### Filter Parameters (specify exactly one)

| Parameter | Type | Description |
|-----------|------|-------------|
| `id` | string | Comma-separated list of video category IDs to retrieve |
| `regionCode` | string | ISO 3166-1 alpha-2 country code for available categories in that region |

### Optional Parameters

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `hl` | string | `en_US` | Language for text values in response |

## Request Body

No request body required for this method.

## Response Schema

```json
{
  "kind": "youtube#videoCategoryListResponse",
  "etag": "etag_value",
  "nextPageToken": "string",
  "prevPageToken": "string",
  "pageInfo": {
    "totalResults": "integer",
    "resultsPerPage": "integer"
  },
  "items": [
    {
      "videoCategory": "resource"
    }
  ]
}
```

### Response Properties

| Property | Type | Description |
|----------|------|-------------|
| `kind` | string | Always `youtube#videoCategoryListResponse` |
| `etag` | etag | Resource identifier |
| `nextPageToken` | string | Token for retrieving next page |
| `prevPageToken` | string | Token for retrieving previous page |
| `pageInfo.totalResults` | integer | Total results available |
| `pageInfo.resultsPerPage` | integer | Results in current response |
| `items[]` | array | List of video category resources |

## Error Responses

| Error Type | Error Detail | Description |
|-----------|--------------|-------------|
| `notFound (404)` | `videoCategoryNotFound` | Requested category ID cannot be found |
