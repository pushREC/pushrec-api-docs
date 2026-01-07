---
source: https://developers.google.com/youtube/v3/docs/comments/insert
scraped: 2026-01-07
method: webfetch
api: youtube-data-v3
resource: comments
method_name: insert
---

# Comments: insert

Creates a reply to an existing comment. Note that top-level comments require the `commentThreads.insert` method instead.

## HTTP Request

```
POST https://www.googleapis.com/youtube/v3/comments
```

## Quota Cost

**50 units** per API call

## Authorization

Required scope:
- `https://www.googleapis.com/auth/youtube.force-ssl`

## Parameters

### Required Parameters

| Parameter | Type | Description |
|-----------|------|-------------|
| `part` | string | Identifies response properties; set to `snippet`. Valid values: `id`, `snippet` |

## Request Body

The comment resource must include:

### Required Properties

| Property | Type | Description |
|----------|------|-------------|
| `snippet.textOriginal` | string | The text content of the reply |
| `snippet.parentId` | string | ID of the comment being replied to |

## Response

Returns a comment resource in the response body upon success.

## Error Codes

| HTTP Status | Error Code | Description |
|-------------|------------|-------------|
| 400 | `commentTextRequired` | Comments cannot be empty |
| 400 | `commentTextTooLong` | Text exceeds character limit |
| 400 | `parentIdMissing` | Parent comment reference absent |
| 403 | `forbidden` | Insufficient permissions |
| 403 | `ineligibleAccount` | Account merge required (YouTube account must be linked to Google account) |
| 404 | `parentCommentNotFound` | Invalid parent comment ID |

## Example Request

```
POST https://www.googleapis.com/youtube/v3/comments?part=snippet
Content-Type: application/json

{
  "snippet": {
    "parentId": "PARENT_COMMENT_ID",
    "textOriginal": "This is my reply to your comment!"
  }
}
```

## Notes

- This method only creates **reply comments**, not top-level comments
- To create a top-level comment on a video, use `commentThreads.insert`
- The authenticated user's channel will be the author of the reply
- YouTube currently only supports replies to top-level comments (no nested replies)
- Comments may be subject to spam filtering and moderation
