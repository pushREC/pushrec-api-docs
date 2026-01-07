---
source: https://developers.google.com/youtube/v3/docs/videos/list
scraped: 2026-01-07
api_provider: Google
discovery_tier: 3
verified: false
method: webfetch
---
 YouTube Data API v3: Videos.list Documentation

## HTTP Request Format

```
GET https://www.googleapis.com/youtube/v3/videos
```

## Quota Impact

A call to this method has a quota cost of **1 unit**.

## Required Parameters

### `part`
- **Type:** string
- **Status:** Required
- **Description:** Comma-separated list of video resource properties to include in the API response. Child properties are automatically included. Available options include: `contentDetails`, `fileDetails`, `id`, `liveStreamingDetails`, `localizations`, `paidProductPlacementDetails`, `player`, `processingDetails`, `recordingDetails`, `snippet`, `statistics`, `status`, `suggestions`, `topicDetails`

## Filter Parameters (Specify Exactly One)

### `chart`
- **Type:** string
- **Status:** Filter option
- **Description:** Identifies the chart to retrieve
- **Acceptable Values:** `mostPopular` - returns most popular videos for specified content region and video category

### `id`
- **Type:** string
- **Status:** Filter option
- **Description:** Comma-separated list of YouTube video IDs for resources being retrieved

### `myRating`
- **Type:** string
- **Status:** Filter option (requires authorization)
- **Description:** Filters videos by authenticated user's rating preferences
- **Acceptable Values:** `like`, `dislike`

## Optional Parameters

| Parameter | Type | Description |
|-----------|------|-------------|
| `hl` | string | Retrieves localized metadata for specified application language |
| `maxHeight` | unsigned integer | Maximum height of embedded player (72-8192 pixels) |
| `maxResults` | unsigned integer | Maximum items in result set (1-50, default: 5); not supported with `id` parameter |
| `maxWidth` | unsigned integer | Maximum width of embedded player (72-8192 pixels) |
| `onBehalfOfContentOwner` | string | For authorized YouTube content partners managing multiple channels |
| `pageToken` | string | Identifies specific result page; not supported with `id` parameter |
| `regionCode` | string | ISO 3166-1 alpha-2 country code for chart availability |
| `videoCategoryId` | string | Video category identifier for chart retrieval (default: 0) |

## Request Body

No request body required for this method.

## Response Structure

```json
{
  "kind": "youtube#videoListResponse",
  "etag": "etag_value",
  "nextPageToken": "string",
  "prevPageToken": "string",
  "pageInfo": {
    "totalResults": "integer",
    "resultsPerPage": "integer"
  },
  "items": [
    "video Resource"
  ]
}
```

### Response Properties

- **kind:** Always returns `youtube#videoListResponse`
- **etag:** Resource entity tag
- **nextPageToken:** Token for retrieving next results page
- **prevPageToken:** Token for retrieving previous results page
- **pageInfo.totalResults:** Total number of results available
- **pageInfo.resultsPerPage:** Number of results in current response
- **items[]:** Array of matching video resources

## Error Codes

| HTTP Status | Error Type | Description |
|------------|-----------|-------------|
| 400 | videoChartNotFound | Requested video chart unsupported or unavailable |
| 403 | forbidden | Request lacks proper authorization for video file/processing info; `fileDetails`, `processingDetails`, `suggestions` restricted to video owner |
| 403 | forbidden | Cannot access user rating information; `myRating` parameter authorization failed |
| 404 | videoNotFound | Specified video cannot be found; verify `id` parameter value |

## Key Functional Notes

- The `maxResults` parameter is supported with `myRating` but not with `id`
- The `pageToken` parameter is supported with `myRating` but not with `id`
- Localized resource details appear in `snippet.localized` when available in requested language
- Embed code dimensions adjust proportionally when both `maxHeight` and `maxWidth` are provided
