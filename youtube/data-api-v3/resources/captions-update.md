---
source: https://developers.google.com/youtube/v3/docs/captions/update
scraped: 2026-01-07
api_provider: Google
discovery_tier: 3
verified: false
method: webfetch
---
 Captions: update

Modifies an existing caption track, allowing updates to draft status and/or caption file uploads.

## HTTP Request

```
PUT https://www.googleapis.com/upload/youtube/v3/captions
```

## Quota Cost

**450 units** per request

## Authorization

Required scopes (choose one):
- `https://www.googleapis.com/auth/youtube.force-ssl`
- `https://www.googleapis.com/auth/youtubepartner`

## Parameters

### Required Parameters

| Parameter | Type | Description |
|-----------|------|-------------|
| `part` | string | Identifies properties for write operations and API response. Use `snippet` when updating draft status; otherwise use `id`. Acceptable values: `id`, `snippet` |

### Optional Parameters

| Parameter | Type | Description |
|-----------|------|-------------|
| `onBehalfOfContentOwner` | string | For YouTube content partners only. Identifies a CMS user acting on behalf of the specified content owner. |
| `sync` | boolean | **Deprecated.** Indicates whether YouTube should automatically synchronize the caption file with video audio (when caption file is updated). |

## Request Body

Provide a caption resource with:

### Required Properties

| Property | Type | Description |
|----------|------|-------------|
| `id` | string | The caption track ID being updated |

### Optional Properties

| Property | Type | Description |
|----------|------|-------------|
| `snippet.isDraft` | boolean | Update draft status (true = draft, false = published) |

**Important:** Properties not specified in updates will be deleted.

## Media Upload

### Constraints

| Constraint | Value |
|------------|-------|
| Maximum file size | 100 MB |
| Accepted MIME types | `text/xml`, `application/octet-stream`, `*/*` |

## Response

Returns a caption resource upon success.

## Error Codes

| HTTP Status | Error Code | Description |
|-------------|------------|-------------|
| 400 | `contentRequired` | Missing updated caption file when required |
| 400 | `invalidMetadata` | Request contains invalid metadata |
| 403 | `forbidden` | Insufficient permissions for update operation |
| 404 | `captionNotFound` | Specified caption track doesn't exist |

## Example Request

### Update Draft Status Only

```
PUT https://www.googleapis.com/youtube/v3/captions?part=snippet
Content-Type: application/json

{
  "id": "CAPTION_TRACK_ID",
  "snippet": {
    "isDraft": false
  }
}
```

### Update Caption File

```
PUT https://www.googleapis.com/upload/youtube/v3/captions?part=id
Content-Type: multipart/related

{
  "id": "CAPTION_TRACK_ID"
}
[Caption file content]
```

## Notes

- Use `part=snippet` when updating the `isDraft` property
- Use `part=id` when only uploading a new caption file
- The `sync` parameter was deprecated on March 13, 2024
- Properties not included in the request body may be cleared
