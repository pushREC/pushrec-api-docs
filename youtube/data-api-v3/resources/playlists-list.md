---
source: https://developers.google.com/youtube/v3/docs/playlists/list
scraped: 2026-01-07
method: webfetch
api: youtube-data-v3
resource: playlists
method_name: list
---

# YouTube Data API v3 - Playlists.list Documentation

## HTTP Request Format

```
GET https://www.googleapis.com/youtube/v3/playlists
```

## Quota Cost

A call to this method has a quota cost of **1 unit**.

## Required Parameters

### `part`
- **Type:** string
- **Description:** Specifies a comma-separated list of playlist resource properties to include in the API response. Child properties are automatically included when their parent property is specified. For instance, including `snippet` returns author, title, description, and creation timestamp.
- **Allowed values:**
  - `contentDetails`
  - `id`
  - `localizations`
  - `player`
  - `snippet`
  - `status`

## Filter Parameters (Specify Exactly One)

### `channelId`
- **Type:** string
- **Description:** Restricts results to playlists belonging to the specified channel.

### `id`
- **Type:** string
- **Description:** Comma-separated list of YouTube playlist IDs for targeted retrieval.

### `mine`
- **Type:** boolean
- **Description:** Requires proper authorization. Set to `true` to retrieve only playlists owned by the authenticated user.

## Optional Parameters

### `hl`
- **Type:** string
- **Description:** Instructs the API to retrieve localized metadata for a specific language supported by YouTube. The value must match a language code from the `i18nLanguages.list` method results.

### `maxResults`
- **Type:** unsigned integer
- **Range:** 0-50
- **Default:** 5
- **Description:** Specifies the maximum items to return in the result set.

### `onBehalfOfContentOwner`
- **Type:** string
- **Authorization:** YouTube content partners only
- **Description:** Indicates the request credentials identify a CMS user acting on behalf of the specified content owner, enabling single authentication for multiple channels.

### `onBehalfOfContentOwnerChannel`
- **Type:** string
- **Authorization:** YouTube content partners only
- **Description:** Specifies the YouTube channel ID when making requests with `onBehalfOfContentOwner`. Required when that parameter is present.

### `pageToken`
- **Type:** string
- **Description:** Identifies a specific result set page. Use `nextPageToken` and `prevPageToken` from responses to navigate.

## Request Body

No request body should be provided.

## Response Body Structure

```json
{
  "kind": "youtube#playlistListResponse",
  "etag": "etag_value",
  "nextPageToken": "string",
  "prevPageToken": "string",
  "pageInfo": {
    "totalResults": "integer",
    "resultsPerPage": "integer"
  },
  "items": [
    "playlist_resource"
  ]
}
```

## Response Properties

| Property | Type | Description |
|----------|------|-------------|
| `kind` | string | Always `youtube#playlistListResponse` |
| `etag` | etag | Resource entity tag |
| `nextPageToken` | string | Token for retrieving the next page |
| `prevPageToken` | string | Token for retrieving the previous page |
| `pageInfo.totalResults` | integer | Total results in the complete set |
| `pageInfo.resultsPerPage` | integer | Items included in this response |
| `items[]` | list | Playlists matching request criteria |

## Error Responses

| HTTP Status | Error Code | Description |
|------------|-----------|-------------|
| 403 | `channelClosed` | The specified channel has been closed |
| 403 | `channelSuspended` | The specified channel has been suspended |
| 403 | `playlistForbidden` | Playlist doesn't support the request or authorization is invalid |
| 404 | `channelNotFound` | The specified channel cannot be found |
| 404 | `playlistNotFound` | The specified playlist cannot be found |
| 400 | `playlistOperationUnsupported` | The API cannot list this playlist (e.g., watch later playlists) |

## Key Notes

- Authorization is required for `mine` and `onBehalfOfContentOwner` parameters
- The documentation references an interactive "APIs Explorer" tool for testing requests
