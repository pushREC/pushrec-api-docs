---
source: https://developers.google.com/youtube/v3/docs/comments/update
scraped: 2026-01-07
method: webfetch
api: youtube-data-v3
resource: comments
method_name: update
---

# Comments: update

Modifies an existing comment through a PUT request to the YouTube Data API.

## HTTP Request

```
PUT https://www.googleapis.com/youtube/v3/comments
```

## Quota Cost

**50 units** per call

## Authorization

Required scope:
- `https://www.googleapis.com/auth/youtube.force-ssl`

## Parameters

### Required Parameters

| Parameter | Type | Description |
|-----------|------|-------------|
| `part` | string | Identifies response properties. Must include `snippet` since it contains updatable fields. Allowed values: `id`, `snippet` |

## Request Body

Provide a comment resource with:

### Required Properties

| Property | Type | Description |
|----------|------|-------------|
| `id` | string | The ID of the comment to update |

### Updatable Properties

| Property | Type | Description |
|----------|------|-------------|
| `snippet.textOriginal` | string | The updated comment text |

## Response

Returns a comment resource upon successful completion.

## Error Codes

| HTTP Status | Error Code | Description |
|-------------|------------|-------------|
| 400 | `commentTextTooLong` | Comment exceeds character limit |
| 400 | `invalidCommentMetadata` | Request metadata is invalid |
| 400 | `operationNotSupported` | Only Google+ based comments can be updated |
| 400 | `processingFailure` | Server processing error; typically indicates invalid input structure |
| 403 | `forbidden` | Insufficient permissions to update comment |
| 403 | `ineligibleAccount` | YouTube account must be merged with Google account |
| 404 | `commentNotFound` | Specified comment doesn't exist; verify the ID value |

## Example Request

```
PUT https://www.googleapis.com/youtube/v3/comments?part=snippet
Content-Type: application/json

{
  "id": "COMMENT_ID",
  "snippet": {
    "textOriginal": "This is my updated comment text."
  }
}
```

## Notes

- Only the comment author can update their own comment
- The `snippet.textOriginal` property contains the text to update
- Comments may be subject to spam filtering after update
- The `updatedAt` timestamp will be updated automatically
