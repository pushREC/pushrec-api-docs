---
source: https://developers.google.com/youtube/v3/docs/commentThreads/insert
scraped: 2026-01-07
method: webfetch
api: youtube-data-v3
resource: commentThreads
method_name: insert
---

# CommentThreads: insert

Creates new top-level comments on videos. To reply to existing comments, use the `comments.insert` method instead.

## HTTP Request

```
POST https://www.googleapis.com/youtube/v3/commentThreads
```

## Quota Cost

**50 units** per call (with `snippet` part carrying 2 units)

## Authorization

Required scope:
- `https://www.googleapis.com/auth/youtube.force-ssl`

## Parameters

### Required Parameters

| Parameter | Type | Description |
|-----------|------|-------------|
| `part` | string | Identifies response properties. Set to `snippet`. Supported values: `id`, `replies`, `snippet` |

## Request Body

The `commentThread` resource must include:

### Required Properties

| Property | Type | Description |
|----------|------|-------------|
| `snippet.channelId` | string | YouTube channel ID that owns the video |
| `snippet.videoId` | string | YouTube video ID to comment on |
| `snippet.topLevelComment.snippet.textOriginal` | string | The text content of the comment |

## Response

Returns a `commentThread` resource containing the newly created comment on successful completion.

## Error Codes

| HTTP Status | Error Code | Description |
|-------------|------------|-------------|
| 400 | `channelOrVideoIdMissing` | Missing required channel or video ID |
| 400 | `commentTextRequired` | Comment text cannot be empty |
| 400 | `commentTextTooLong` | Text exceeds character limit |
| 403 | `forbidden` | Insufficient permissions for creation |
| 403 | `ineligibleAccount` | YouTube account requires Google Account merge |
| 404 | `channelNotFound` | Specified channel doesn't exist |
| 404 | `videoNotFound` | Specified video doesn't exist |

## Example Request

```
POST https://www.googleapis.com/youtube/v3/commentThreads?part=snippet
Content-Type: application/json

{
  "snippet": {
    "channelId": "CHANNEL_ID",
    "videoId": "VIDEO_ID",
    "topLevelComment": {
      "snippet": {
        "textOriginal": "This is my comment on the video!"
      }
    }
  }
}
```

## Response Example

```json
{
  "kind": "youtube#commentThread",
  "etag": "...",
  "id": "NEW_THREAD_ID",
  "snippet": {
    "channelId": "CHANNEL_ID",
    "videoId": "VIDEO_ID",
    "topLevelComment": {
      "kind": "youtube#comment",
      "etag": "...",
      "id": "COMMENT_ID",
      "snippet": {
        "videoId": "VIDEO_ID",
        "textDisplay": "This is my comment on the video!",
        "textOriginal": "This is my comment on the video!",
        "authorDisplayName": "User Name",
        "authorProfileImageUrl": "https://...",
        "authorChannelUrl": "https://...",
        "authorChannelId": {
          "value": "AUTHOR_CHANNEL_ID"
        },
        "canRate": true,
        "viewerRating": "none",
        "likeCount": 0,
        "publishedAt": "2026-01-07T...",
        "updatedAt": "2026-01-07T..."
      }
    },
    "canReply": true,
    "totalReplyCount": 0,
    "isPublic": true
  }
}
```

## Notes

- This method creates **top-level comments only**, not replies
- To reply to a comment, use `comments.insert` with `snippet.parentId`
- The authenticated user's channel will be the author of the comment
- Comments may be subject to spam filtering and moderation
- Some videos may have comments disabled
