---
source: https://developers.google.com/youtube/v3/docs/captions/delete
scraped: 2026-01-07
method: webfetch
api: youtube-data-v3
resource: captions
method_name: delete
---

# Captions: delete

Removes a designated caption track from a YouTube video.

## HTTP Request

```
DELETE https://www.googleapis.com/youtube/v3/captions
```

## Quota Cost

**50 units** per API call

## Authorization

Required scopes (at least one):
- `https://www.googleapis.com/auth/youtube.force-ssl`
- `https://www.googleapis.com/auth/youtubepartner`

## Parameters

### Required Parameters

| Parameter | Type | Description |
|-----------|------|-------------|
| `id` | string | Identifies the caption track being removed; uses the caption resource's ID property |

### Optional Parameters

| Parameter | Type | Description |
|-----------|------|-------------|
| `onBehalfOfContentOwner` | string | YouTube CMS user acting as content owner; reserved for YouTube content partners managing multiple channels |

## Request Body

No request body required.

## Response

Successful deletion returns: **HTTP 204 No Content**

No response body is returned.

## Error Codes

| HTTP Status | Error Code | Description |
|-------------|------------|-------------|
| 403 | `forbidden` | Insufficient permissions or improper authorization for deletion |
| 404 | `captionNotFound` | Caption track unavailable; verify the `id` parameter accuracy |

## Example Request

```
DELETE https://www.googleapis.com/youtube/v3/captions?id=CAPTION_TRACK_ID
```

## Notes

- This operation requires proper OAuth 2.0 authorization
- The `onBehalfOfContentOwner` parameter exclusively serves YouTube content partners
- Verify caption ID validity before attempting deletion
- Deletion is permanent and cannot be undone
