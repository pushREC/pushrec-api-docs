---
source: https://developers.google.com/youtube/v3/docs/activities/list
scraped: 2026-01-07
method: webfetch
api: youtube-data-v3
resource: activities
method_name: list
---

# Activities: list

Returns a list of channel activity events that match the request criteria.

**Important Note:** YouTube deprecated the channel bulletin feature, so this method no longer returns bulletins.

## HTTP Request

```
GET https://www.googleapis.com/youtube/v3/activities
```

## Quota Cost

**1 unit** per call

## Parameters

### Required Parameters

| Parameter | Type | Description |
|-----------|------|-------------|
| `part` | string | Specifies which activity resource properties to include in the response. Options: `contentDetails`, `id`, `snippet` |

### Filter Parameters (exactly one required)

| Parameter | Type | Description |
|-----------|------|-------------|
| `channelId` | string | YouTube channel ID to retrieve that channel's activities |
| `home` | boolean | **Deprecated.** Returns items similar to YouTube home page (authorized requests only) |
| `mine` | boolean | Retrieves authenticated user's activities (authorized requests only) |

### Optional Parameters

| Parameter | Type | Description |
|-----------|------|-------------|
| `maxResults` | unsigned integer | Maximum items returned (0-50, default: 5) |
| `pageToken` | string | Identifies specific result page |
| `publishedAfter` | datetime | Earliest activity date (ISO 8601 format) |
| `publishedBefore` | datetime | Latest activity date (ISO 8601 format) |
| `regionCode` | string | ISO 3166-1 alpha-2 country code |

## Request Body

No request body required.

## Response

### Response Structure

```json
{
  "kind": "youtube#activityListResponse",
  "etag": "string",
  "nextPageToken": "string",
  "prevPageToken": "string",
  "pageInfo": {
    "totalResults": "integer",
    "resultsPerPage": "integer"
  },
  "items": [
    // activity resources
  ]
}
```

### Response Properties

| Property | Type | Description |
|----------|------|-------------|
| `kind` | string | Always `youtube#activityListResponse` |
| `etag` | string | Resource version identifier |
| `nextPageToken` | string | Token for next page of results |
| `prevPageToken` | string | Token for previous page of results |
| `pageInfo.totalResults` | integer | Total number of results |
| `pageInfo.resultsPerPage` | integer | Number of results per page |
| `items[]` | array | List of activity resources |

## Error Codes

| HTTP Status | Error Code | Description |
|-------------|------------|-------------|
| 401 | `authorizationRequired` | Home parameter requires authorization |
| 403 | `forbidden` | Request lacks proper authorization |
| 403 | `homeParameterDeprecated` | Home page activity unavailable |
| 404 | `channelNotFound` | Specified channel ID not found |
| 404 | `homeChannelNotFound` | No home feed for authenticated user |

## Authorization

This method may require authorization for certain filter parameters:
- `mine` parameter requires user authentication
- `home` parameter requires user authentication (deprecated)

## Example Request

```
GET https://www.googleapis.com/youtube/v3/activities?part=snippet,contentDetails&channelId=UC_x5XG1OV2P6uZZ5FSM9Ttw&maxResults=25
```
