---
source: https://developers.google.com/youtube/v3/docs/comments/delete
scraped: 2026-01-07
method: webfetch
api: youtube-data-v3
resource: comments
method_name: delete
---

# Comments: delete

Removes a comment from YouTube.

## HTTP Request

```
DELETE https://www.googleapis.com/youtube/v3/comments
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
| `id` | string | The comment ID for the resource that is being deleted |

## Request Body

No request body required.

## Response

Successful deletion returns: **HTTP 204 (No Content)**

No response body is returned.

## Error Codes

| HTTP Status | Error Code | Description |
|-------------|------------|-------------|
| 400 | `processingFailure` | The API server failed to successfully process the request. While this can be a transient error, it usually indicates that the request's input is invalid. |
| 403 | `forbidden` | The comment could not be deleted because of insufficient permissions. The request might not be properly authorized. |
| 404 | `commentNotFound` | The specified comment could not be found. Check the value of the request's `id` parameter to ensure that it is correct. |

## Example Request

```
DELETE https://www.googleapis.com/youtube/v3/comments?id=COMMENT_ID
```

## Notes

- Only the comment author or channel/video owner can delete a comment
- Deleting a top-level comment also deletes all its replies
- Deletion is permanent and cannot be undone
- The `processingFailure` error may indicate a transient issue; retry the request if necessary
