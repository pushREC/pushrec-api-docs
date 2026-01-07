---
source: https://developers.google.com/youtube/v3/docs/i18nRegions
scraped: 2026-01-07
api_provider: Google
discovery_tier: 3
verified: false
method: webfetch
---
 i18nRegions Resource Documentation

## Resource Overview

An `i18nRegion` resource identifies a geographic area that YouTube users can select as their preferred content region. The region code can be used with API methods like `search.list`, `videos.list`, `activities.list`, and `videoCategories.list`.

## Resource JSON Representation

```json
{
  "kind": "youtube#i18nRegion",
  "etag": "etag",
  "id": "string",
  "snippet": {
    "gl": "string",
    "name": "string"
  }
}
```

## Properties Table

| Property | Type | Description |
|----------|------|-------------|
| `kind` | string | Identifies the API resource's type; value is `youtube#i18nRegion` |
| `etag` | etag | The Etag of this resource |
| `id` | string | The ID that YouTube uses to uniquely identify the i18n region |
| `snippet` | object | Contains basic details about the i18n region |
| `snippet.gl` | string | The two-letter ISO country code identifying the region |
| `snippet.name` | string | The name of the region |

## Available Methods

| Method | Description |
|--------|-------------|
| **list** | Returns a list of content regions that the YouTube website supports |

## Key Notes

- Content region can also be referred to as "content locale"
- Region codes are used as the `regionCode` parameter value in applicable API calls
- The resource includes both a machine-readable code (`gl`) and human-readable name
