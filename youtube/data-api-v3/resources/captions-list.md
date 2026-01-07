---
source: https://developers.google.com/youtube/v3/docs/captions/list
scraped: 2026-01-07
api_provider: Google
discovery_tier: 3
verified: false
method: webfetch
---
 Captions: list

Retrieves caption tracks associated with a YouTube video. Note that the API response does not contain the actual captions - you must use the `download` method to access caption content.

## HTTP Request

```
GET https://www.googleapis.com/youtube/v3/captions
```

## Quota Cost

**50 units** per call

## Authorization

Required scopes (choose one):
- `https://www.googleapis.com/auth/youtube.force-ssl`
- `https://www.googleapis.com/auth/youtubepartner`

## Parameters

### Required Parameters

| Parameter | Type | Description |
|-----------|------|-------------|
| `part` | string | Specifies caption resource parts in response. Acceptable values: `id`, `snippet` |
| `videoId` | string | The YouTube video ID for which caption tracks should be retrieved |

### Optional Parameters

| Parameter | Type | Description |
|-----------|------|-------------|
| `id` | string | Comma-separated list of specific caption IDs to retrieve (must be associated with specified videoId) |
| `onBehalfOfContentOwner` | string | For YouTube content partners managing multiple channels; allows single authentication for all channel data |

## Request Body

No request body required.

## Response

### Response Structure

```json
{
  "kind": "youtube#captionListResponse",
  "etag": "string",
  "items": [
    // caption resources
  ]
}
```

### Response Properties

| Property | Type | Description |
|----------|------|-------------|
| `kind` | string | Always `youtube#captionListResponse` |
| `etag` | string | Resource version identifier |
| `items[]` | array | List of matching caption resources |

## Error Codes

| HTTP Status | Error Code | Description |
|-------------|------------|-------------|
| 403 | `forbidden` | Insufficient permissions to retrieve caption tracks |
| 404 | `captionNotFound` | Specified caption IDs don't exist or belong to different videos |
| 404 | `videoNotFound` | Referenced video doesn't exist |

## Example Request

```
GET https://www.googleapis.com/youtube/v3/captions?part=snippet&videoId=VIDEO_ID
```

## Notes

- This method returns metadata about caption tracks only
- To retrieve actual caption text, use the `captions.download` method
- The user must have permission to edit the video to retrieve caption track information
