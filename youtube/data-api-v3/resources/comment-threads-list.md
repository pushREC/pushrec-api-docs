---
source: https://developers.google.com/youtube/v3/docs/commentThreads/list
scraped: 2026-01-07
api_provider: Google
discovery_tier: 3
verified: false
method: webfetch
---
 CommentThreads: list

Returns a list of comment threads that match the API request parameters.

## HTTP Request

```
GET https://www.googleapis.com/youtube/v3/commentThreads
```

## Quota Cost

**1 unit** per call

## Parameters

### Required Parameters

| Parameter | Type | Description |
|-----------|------|-------------|
| `part` | string | Specifies a comma-separated list of commentThread resource properties for the response. Acceptable values: `id`, `replies`, `snippet` |

### Filter Parameters (Select Exactly One)

| Parameter | Type | Description |
|-----------|------|-------------|
| `allThreadsRelatedToChannelId` | string | Returns all comment threads associated with a specified channel |
| `id` | string | Comma-separated list of comment thread IDs to retrieve |
| `videoId` | string | Returns comment threads associated with a specified video |

### Optional Parameters

| Parameter | Type | Description | Compatibility |
|-----------|------|-------------|---------------|
| `maxResults` | unsigned integer | Maximum items in result set. Range: 1-100. Default: 20 | Not compatible with `id` |
| `moderationStatus` | string | Filters by moderation state: `heldForReview`, `likelySpam`, or `published` (default) | Not compatible with `id` |
| `order` | string | Sort order: `time` (default) or `relevance` | Not compatible with `id` |
| `pageToken` | string | Identifies specific result page | Not compatible with `id` |
| `searchTerms` | string | Limits results to comments containing specified terms | Not compatible with `id` |
| `textFormat` | string | Response format: `html` (default) or `plainText` | All filters |

## Request Body

No request body required.

## Response

### Response Structure

```json
{
  "kind": "youtube#commentThreadListResponse",
  "etag": "string",
  "nextPageToken": "string",
  "pageInfo": {
    "totalResults": "integer",
    "resultsPerPage": "integer"
  },
  "items": [
    // commentThread resources
  ]
}
```

### Response Properties

| Property | Type | Description |
|----------|------|-------------|
| `kind` | string | Always `youtube#commentThreadListResponse` |
| `etag` | string | Resource version identifier |
| `nextPageToken` | string | Token for next page of results |
| `pageInfo.totalResults` | integer | Total number of results |
| `pageInfo.resultsPerPage` | integer | Number of results per page |
| `items[]` | array | List of commentThread resources |

## Error Codes

| HTTP Status | Error Code | Description |
|-------------|------------|-------------|
| 400 | `operationNotSupported` | `id` filter only works with Google+ comments |
| 400 | `processingFailure` | Server failed to process request; check resource validity |
| 403 | `commentsDisabled` | Specified video has disabled comments |
| 403 | `forbidden` | Insufficient permissions to retrieve threads |
| 404 | `channelNotFound` | Channel not found |
| 404 | `commentThreadNotFound` | Specified comment thread not found |
| 404 | `videoNotFound` | Video not found |

## Example Requests

### Get Comment Threads for a Video

```
GET https://www.googleapis.com/youtube/v3/commentThreads?part=snippet,replies&videoId=VIDEO_ID&maxResults=25
```

### Get Comment Threads by ID

```
GET https://www.googleapis.com/youtube/v3/commentThreads?part=snippet&id=THREAD_ID_1,THREAD_ID_2
```

### Get All Threads for a Channel

```
GET https://www.googleapis.com/youtube/v3/commentThreads?part=snippet&allThreadsRelatedToChannelId=CHANNEL_ID
```

### Search Comments on a Video

```
GET https://www.googleapis.com/youtube/v3/commentThreads?part=snippet&videoId=VIDEO_ID&searchTerms=awesome
```

### Get Comments Sorted by Relevance

```
GET https://www.googleapis.com/youtube/v3/commentThreads?part=snippet&videoId=VIDEO_ID&order=relevance
```

### Filter by Moderation Status

```
GET https://www.googleapis.com/youtube/v3/commentThreads?part=snippet&videoId=VIDEO_ID&moderationStatus=heldForReview
```

## Notes

- The `id` filter cannot be combined with pagination or filtering parameters
- The `replies` part may not contain all replies; use `comments.list` for complete reply lists
- The `moderationStatus` filter requires ownership of the video/channel
