---
source: https://developers.google.com/youtube/v3/docs/channelSections/list
scraped: 2026-01-07
api: YouTube Data API v3
resource: ChannelSections
method: list
---

# YouTube Data API: ChannelSections list

## Method Overview

The ChannelSections list endpoint retrieves YouTube channel section resources matching specified API criteria. This method enables developers to fetch organized collections of channel content.

**Quota Cost:** 1 unit per request

## HTTP Request Format

```
GET https://www.googleapis.com/youtube/v3/channelSections
```

## Parameters

### Required Parameters

| Parameter | Type | Description |
|-----------|------|-------------|
| `part` | string | Specifies comma-separated resource properties to include in the response (e.g., `contentDetails`, `id`, `snippet`). Includes nested child properties automatically. |

### Filter Parameters (select exactly one)

| Parameter | Type | Description |
|-----------|------|-------------|
| `channelId` | string | YouTube channel ID to retrieve only that channel's sections. |
| `id` | string | Comma-separated list of specific channel section IDs to retrieve. |
| `mine` | boolean | Authorization required. Set to `true` to retrieve sections from the authenticated user's channel. |

### Optional Parameters

| Parameter | Type | Description |
|-----------|------|-------------|
| `hl` | string | Deprecated. Previously supported localized metadata retrieval. |
| `onBehalfOfContentOwner` | string | Authorization required. For YouTube CMS users acting on behalf of content owners. Limited to YouTube content partners. |

## Request Body

No request body required for this method.

## Response Body Schema

```json
{
  "kind": "youtube#channelSectionListResponse",
  "etag": "string",
  "items": [
    {
      "kind": "youtube#channelSection",
      "etag": "string",
      "id": "string",
      "snippet": {
        "type": "string",
        "channelId": "string",
        "title": "string",
        "position": "integer"
      },
      "contentDetails": {
        "playlists": ["string"]
      }
    }
  ]
}
```

### Response Properties

| Property | Description |
|----------|-------------|
| `kind` | Resource type identifier ("youtube#channelSectionListResponse") |
| `etag` | Resource entity tag |
| `items[]` | Array of matching channel section resources |

## Common Error Responses

| HTTP Status | Error Code | Description |
|-------------|-----------|-------------|
| 403 | `channelSectionForbidden` | Insufficient permissions to access requested sections |
| 400 | `idInvalid` | Request specifies invalid section ID format |
| 400 | `invalidCriteria` | Filter criteria cannot be processed |
| 404 | `channelNotFound` | Specified channel does not exist |
| 404 | `channelSectionNotFound` | Requested channel section not found |
