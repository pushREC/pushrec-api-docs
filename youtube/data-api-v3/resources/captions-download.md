---
source: https://developers.google.com/youtube/v3/docs/captions/download
scraped: 2026-01-07
api_provider: Google
discovery_tier: 3
verified: false
method: webfetch
---
 Captions: download

Retrieves caption tracks from YouTube videos. The track returns in its original format unless the request specifies a format conversion via the `tfmt` parameter, or language translation through the `tlang` parameter.

## HTTP Request

```
GET https://www.googleapis.com/youtube/v3/captions/{id}
```

## Quota Cost

**200 units** per API call

## Authorization

Requires one of these OAuth 2.0 scopes:
- `https://www.googleapis.com/auth/youtube.force-ssl`
- `https://www.googleapis.com/auth/youtubepartner`

## Parameters

### Required Parameters

| Parameter | Type | Description |
|-----------|------|-------------|
| `id` | string | Caption track ID from the caption resource |

### Optional Parameters

| Parameter | Type | Description |
|-----------|------|-------------|
| `onBehalfOfContentOwner` | string | YouTube CMS user acting for specified content owner (partners only) |
| `tfmt` | string | Output format for the caption track |
| `tlang` | string | ISO 639-1 language code for machine-translated output |

### Supported Output Formats (`tfmt`)

| Value | Format | Description |
|-------|--------|-------------|
| `sbv` | SubViewer | Simple subtitle format |
| `scc` | Scenarist | Closed caption format |
| `srt` | SubRip | Most common subtitle format |
| `ttml` | TTML | Timed Text Markup Language |
| `vtt` | WebVTT | Web Video Text Tracks |

## Request Body

No request body required.

## Response

Returns binary file data with:
- `Content-Type: application/octet-stream`

The caption content is returned in the specified format (or original format if `tfmt` not specified).

## Error Codes

| HTTP Status | Error Code | Description |
|-------------|------------|-------------|
| 400 | `invalidValue` | Conversion failed; verify `tfmt`/`tlang` parameters or check caption status |
| 403 | `forbidden` | Insufficient permissions to download track |
| 404 | `captionNotFound` | Caption track ID not found |

## Permissions

The user must have permission to edit the associated video to download caption tracks.

## Example Requests

### Download in Original Format

```
GET https://www.googleapis.com/youtube/v3/captions/CAPTION_ID
```

### Download as SRT

```
GET https://www.googleapis.com/youtube/v3/captions/CAPTION_ID?tfmt=srt
```

### Download with Translation

```
GET https://www.googleapis.com/youtube/v3/captions/CAPTION_ID?tlang=es
```

### Download as VTT with Translation

```
GET https://www.googleapis.com/youtube/v3/captions/CAPTION_ID?tfmt=vtt&tlang=fr
```

## Notes

- Machine translation quality varies by language pair
- Some formats may not support all caption features
- The caption track must have `status: serving` for download to succeed
