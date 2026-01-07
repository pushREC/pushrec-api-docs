---
source: https://developers.google.com/youtube/v3/docs/channels/list
scraped: 2026-01-07
api_provider: Google
discovery_tier: 3
verified: false
method: webfetch
---
 YouTube Data API v3 - Channels.list Documentation

## Overview

The channels.list endpoint retrieves a collection of zero or more channel resources matching specified criteria.

## HTTP Request Format

```
GET https://www.googleapis.com/youtube/v3/channels
```

## Quota Impact

A call to this method has a quota cost of **1 unit**.

## Authorization

**Required scope for auditDetails:**
`https://www.googleapis.com/auth/youtubepartner-channel-audit`

Note: Tokens using this scope must be revoked when the MCN accepts/rejects a channel or within two weeks of issuance.

## Parameters

### Required Parameter

| Name | Type | Description |
|------|------|-------------|
| `part` | string | Comma-separated list of channel resource properties to include in response (auditDetails, brandingSettings, contentDetails, contentOwnerDetails, id, localizations, snippet, statistics, status, topicDetails). Child properties automatically included. |

### Filter Parameters (specify exactly one)

| Name | Type | Description |
|------|------|-------------|
| `forHandle` | string | YouTube handle (with or without @ prefix) to retrieve associated channel. Example: `GoogleDevelopers` or `@GoogleDevelopers` |
| `forUsername` | string | YouTube username to retrieve associated channel |
| `id` | string | Comma-separated list of YouTube channel IDs |
| `mine` | boolean | Requires authorization. Set to `true` to return only channels owned by authenticated user |
| `managedByMe` | boolean | Requires authorization; YouTube partners only. Set to `true` with `onBehalfOfContentOwner` to return channels managed by specified content owner |
| `categoryId` | string | *DEPRECATED* - Previously specified YouTube guide category |

### Optional Parameters

| Name | Type | Description |
|------|------|-------------|
| `hl` | string | Language code for localized metadata retrieval (uses i18nLanguages.list for valid codes) |
| `maxResults` | unsigned integer | Maximum items in result set (0-50, default: 5) |
| `onBehalfOfContentOwner` | string | Requires authorization; YouTube partners only. Indicates CMS user acting on behalf of specified content owner |
| `pageToken` | string | Identifies specific result set page to return |

## Request Body

No request body required for this method.

## Response Structure

```json
{
  "kind": "youtube#channelListResponse",
  "etag": "etag_value",
  "nextPageToken": "string",
  "prevPageToken": "string",
  "pageInfo": {
    "totalResults": "integer",
    "resultsPerPage": "integer"
  },
  "items": [
    {
      "channel_resource": "..."
    }
  ]
}
```

### Response Properties

| Property | Type | Description |
|----------|------|-------------|
| `kind` | string | Always `youtube#channelListResponse` |
| `etag` | etag | Resource Etag value |
| `nextPageToken` | string | Token for retrieving next result page |
| `prevPageToken` | string | Token for retrieving previous page (omitted if `managedByMe=true`) |
| `pageInfo.totalResults` | integer | Total results in set |
| `pageInfo.resultsPerPage` | integer | Results in API response |
| `items[]` | list | Channels matching request criteria |

## Error Codes

| HTTP Status | Error Type | Description |
|-------------|-----------|-------------|
| 400 | `invalidCriteria` | Multiple exclusive filters specified; use only one |
| 403 | `channelForbidden` | Channel doesn't support request or improper authorization |
| 404 | `categoryNotFound` | Invalid categoryId; use guideCategories.list for valid values |
| 404 | `channelNotFound` | Channel in id parameter not found |

## Notable Notes

- Subscriber count display updated per YouTube policy changes
- Content owner authentication via `onBehalfOfContentOwner` restricts filter options to `id` or `managedByMe` only
- Use API Explorer tool for interactive testing
