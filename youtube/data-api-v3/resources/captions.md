---
source: https://developers.google.com/youtube/v3/docs/captions
scraped: 2026-01-07
api_provider: Google
discovery_tier: 3
verified: false
method: webfetch
---
 Captions Resource

## Overview

The `caption` resource represents a YouTube caption track associated with a single video. The API provides methods for managing caption tracks including listing, uploading, updating, downloading, and deleting.

**Deprecation Notice:** YouTube deprecated the `sync` parameter for the `captions.insert` and `captions.update` API endpoints on March 13, 2024, though auto-syncing remains available in YouTube Creator Studio.

## Available Methods

| Method | Purpose |
|--------|---------|
| `list` | Retrieves caption tracks for a specified video (metadata only, not actual captions) |
| `insert` | Uploads a new caption track |
| `update` | Modifies existing tracks - change draft status, upload new files, or both |
| `download` | Retrieves caption tracks in original or specified format/language |
| `delete` | Removes a caption track |

## Resource Representation

```json
{
  "kind": "youtube#caption",
  "etag": "string",
  "id": "string",
  "snippet": {
    "videoId": "string",
    "lastUpdated": "datetime",
    "trackKind": "string",
    "language": "string",
    "name": "string",
    "audioTrackType": "string",
    "isCC": "boolean",
    "isLarge": "boolean",
    "isEasyReader": "boolean",
    "isDraft": "boolean",
    "isAutoSynced": "boolean",
    "status": "string",
    "failureReason": "string"
  }
}
```

## Properties

### Core Fields

| Property | Type | Description |
|----------|------|-------------|
| `kind` | string | Always `youtube#caption` |
| `etag` | string | Resource version identifier |
| `id` | string | Unique caption track identifier |

### Snippet Properties

| Property | Type | Description |
|----------|------|-------------|
| `snippet.videoId` | string | Associated YouTube video identifier |
| `snippet.lastUpdated` | datetime | Last modification timestamp (ISO 8601) |
| `snippet.trackKind` | string | Type: `ASR`, `forced`, or `standard` |
| `snippet.language` | string | BCP-47 language tag |
| `snippet.name` | string | Display name (max 150 characters) |
| `snippet.audioTrackType` | string | `primary`, `commentary`, `descriptive`, or `unknown` |
| `snippet.isCC` | boolean | Indicates closed captions for deaf/hard of hearing |
| `snippet.isLarge` | boolean | Large text for vision-impaired users |
| `snippet.isEasyReader` | boolean | Third-grade reading level formatting |
| `snippet.isDraft` | boolean | Draft status (false = publicly visible) |
| `snippet.isAutoSynced` | boolean | YouTube-synchronized to audio track |
| `snippet.status` | string | `serving`, `syncing`, or `failed` |
| `snippet.failureReason` | string | Reason for failure when status is `failed` |

### Track Kind Values

| Value | Description |
|-------|-------------|
| `ASR` | Automatic Speech Recognition (auto-generated) |
| `forced` | Forced captions (always displayed) |
| `standard` | Standard user-uploaded captions |

### Audio Track Type Values

| Value | Description |
|-------|-------------|
| `primary` | Primary audio track |
| `commentary` | Commentary audio track |
| `descriptive` | Descriptive audio for visually impaired |
| `unknown` | Unknown audio track type |

### Status Values

| Value | Description |
|-------|-------------|
| `serving` | Caption track is ready and being served |
| `syncing` | Caption track is being synchronized |
| `failed` | Caption track processing failed |

## Authorization Scopes

Operations on captions require one of:
- `https://www.googleapis.com/auth/youtube.force-ssl`
- `https://www.googleapis.com/auth/youtubepartner`
