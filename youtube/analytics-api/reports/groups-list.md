---
source: https://developers.google.com/youtube/analytics/v2/reference/groups/list
scraped: 2026-01-07
api_provider: Google
discovery_tier: 3
verified: false
title: YouTube Analytics API - Groups List Method
---
 YouTube Analytics API: Groups List Method

## Overview

Retrieves a list of groups that match the API request parameters.

## HTTP Request

```
GET https://youtubeanalytics.googleapis.com/v2/groups
```

## Parameters

### Optional Parameters

| Parameter | Type | Description |
|-----------|------|-------------|
| `id` | string | Comma-separated list of group IDs to retrieve. |
| `mine` | boolean | Set to `true` to retrieve all groups owned by the authenticated user. Cannot be used with `id` parameter. |
| `onBehalfOfContentOwner` | string | Content owner ID for acting on behalf of a content owner. |
| `pageToken` | string | Token that identifies a specific page in the result set. |

**Note:** You must specify either `id` or `mine=true`.

## Authorization

Requires OAuth 2.0 authorization with one of the following scopes:

- `https://www.googleapis.com/auth/youtube`
- `https://www.googleapis.com/auth/youtube.readonly`
- `https://www.googleapis.com/auth/youtubepartner`
- `https://www.googleapis.com/auth/yt-analytics.readonly`
- `https://www.googleapis.com/auth/yt-analytics-monetary.readonly`

## Response

```json
{
  "kind": "youtube#groupListResponse",
  "etag": string,
  "items": [
    {
      "kind": "youtube#group",
      "etag": string,
      "id": string,
      "snippet": {
        "publishedAt": datetime,
        "title": string
      },
      "contentDetails": {
        "itemCount": unsigned long,
        "itemType": string
      }
    }
  ],
  "nextPageToken": string
}
```

### Response Properties

| Property | Description |
|----------|-------------|
| `kind` | Resource type: `youtube#groupListResponse` |
| `etag` | ETag for the response |
| `items` | Array of group resources |
| `nextPageToken` | Token for retrieving the next page of results |

## Example Request

```http
GET https://youtubeanalytics.googleapis.com/v2/groups?mine=true
Authorization: Bearer ACCESS_TOKEN
```

## Example Response

```json
{
  "kind": "youtube#groupListResponse",
  "etag": "xyz123",
  "items": [
    {
      "kind": "youtube#group",
      "etag": "abc456",
      "id": "GROUP_ID_1",
      "snippet": {
        "publishedAt": "2024-01-15T10:30:00Z",
        "title": "Top Performing Videos"
      },
      "contentDetails": {
        "itemCount": 25,
        "itemType": "youtube#video"
      }
    },
    {
      "kind": "youtube#group",
      "etag": "def789",
      "id": "GROUP_ID_2",
      "snippet": {
        "publishedAt": "2024-02-20T14:45:00Z",
        "title": "Partner Channels"
      },
      "contentDetails": {
        "itemCount": 10,
        "itemType": "youtube#channel"
      }
    }
  ]
}
```

## Error Responses

| Error Code | Description |
|------------|-------------|
| 400 | Invalid request (e.g., both `id` and `mine` specified) |
| 401 | Invalid or expired access token |
| 403 | Insufficient permissions |
| 404 | Group not found (when using `id` parameter) |

## Pagination

If the response includes a `nextPageToken`, use it in subsequent requests to retrieve additional results:

```http
GET https://youtubeanalytics.googleapis.com/v2/groups?mine=true&pageToken=NEXT_PAGE_TOKEN
```
