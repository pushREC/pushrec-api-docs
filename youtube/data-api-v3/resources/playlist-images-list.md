---
source: https://developers.google.com/youtube/v3/docs/playlistImages/list
scraped: 2026-01-07
api_provider: Google
discovery_tier: 3
verified: false
method: list
---
 YouTube Data API: PlaylistImages list

## Method Overview

The PlaylistImages: list endpoint retrieves playlist images matching specified criteria. Users can obtain images for particular playlists or fetch images by their unique identifiers. This method enables developers to access visual assets associated with YouTube playlists.

**Quota Cost:** 1 unit per request

## HTTP Request

```
GET https://www.googleapis.com/youtube/v3/playlistImages
```

## Authorization

Requests require authorization using one of these scopes:

- `https://www.googleapis.com/auth/youtubepartner`
- `https://www.googleapis.com/auth/youtube`
- `https://www.googleapis.com/auth/youtube.force-ssl`

## Request Parameters

### Required Parameters

| Parameter | Type | Description |
|-----------|------|-------------|
| `part` | string | Specifies comma-separated playlist image resource properties to include. Child properties are automatically incorporated when applicable. |

### Filter Parameters (Select One)

| Parameter | Type | Description |
|-----------|------|-------------|
| `id` | string | Comma-separated list of unique playlist image IDs to retrieve. |
| `playlistId` | string | Unique identifier of the playlist for which to retrieve images. Either this or `id` must be provided. |

### Optional Parameters

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `maxResults` | unsigned integer | 5 | Maximum images in result set (0-50 inclusive). |
| `pageToken` | string | - | Identifies specific result page to return. |
| `onBehalfOfContentOwner` | string | - | YouTube CMS user acting for specified content owner (partners only). |
| `onBehalfOfContentOwnerChannel` | string | - | Target YouTube channel ID when using `onBehalfOfContentOwner` (partners only). |

## Request Body

No request body required for this endpoint.

## Response Schema

```json
{
  "kind": "youtube#playlistImageListResponse",
  "nextPageToken": "string",
  "prevPageToken": "string",
  "pageInfo": {
    "totalResults": "integer",
    "resultsPerPage": "integer"
  },
  "items": [
    // playlistImages Resource objects
  ]
}
```

### Response Properties

| Property | Type | Description |
|----------|------|-------------|
| `kind` | string | Always `youtube#playlistImageListResponse` |
| `nextPageToken` | string | Token for retrieving the subsequent results page |
| `prevPageToken` | string | Token for retrieving the previous results page |
| `pageInfo.totalResults` | integer | Complete count of available results |
| `pageInfo.resultsPerPage` | integer | Quantity of results in current response |
| `items[]` | list | Array of playlist images matching request parameters |

## Key Implementation Notes

- Either `id` or `playlistId` parameter is mandatory for all requests
- Pagination supported via `pageToken`, `nextPageToken`, and `prevPageToken`
- Response includes paging information for handling large datasets
- Partner-specific parameters available for content owner management
