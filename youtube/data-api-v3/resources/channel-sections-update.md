---
source: https://developers.google.com/youtube/v3/docs/channelSections/update
scraped: 2026-01-07
api_provider: Google
discovery_tier: 3
verified: false
method: update
---
 YouTube Data API: ChannelSections update

## Overview

This endpoint allows you to modify an existing channel section on a YouTube channel.

**Quota Cost:** 50 units per request

## HTTP Request

```
PUT https://www.googleapis.com/youtube/v3/channelSections
```

## Authorization

The following authentication scopes are accepted:

- `https://www.googleapis.com/auth/youtubepartner`
- `https://www.googleapis.com/auth/youtube`
- `https://www.googleapis.com/auth/youtube.force-ssl`

## Parameters

### Required Parameters

| Parameter | Type | Description |
|-----------|------|-------------|
| `part` | string | Identifies properties to set and include in the response. Accepted values: `contentDetails`, `id`, `snippet` |

### Optional Parameters

| Parameter | Type | Description |
|-----------|------|-------------|
| `onBehalfOfContentOwner` | string | For YouTube content partners only. Allows authenticated CMS users to act on behalf of a specified content owner across multiple channels. The CMS account must be linked to the target YouTube content owner. |

## Request Body

Provide a `channelSection` resource with:

### Required Fields

| Field | Description |
|-------|-------------|
| `snippet.type` | The section type |

### Editable Fields

| Field | Description |
|-------|-------------|
| `snippet.type` | Section type identifier |
| `snippet.title` | Display title |
| `snippet.position` | Section order position |
| `contentDetails.playlists[]` | Array of playlist IDs |
| `contentDetails.channels[]` | Array of channel IDs |

**Important:** Properties not included in update requests will have their existing values deleted.

## Response

On success, the API returns a `channelSection` resource in the response body.

## Error Responses

| HTTP Status | Error Code | Meaning |
|-------------|-----------|---------|
| 400 | `notEditable` | The channel section cannot be modified |
| 400 | `typeRequired` | Missing required `snippet.type` field |
| 403 | `channelSectionForbidden` | Insufficient authentication or unsupported operation |
| 400 | `channelNotActive` | One or more specified channels inactive |
| 400 | `channelsDuplicated` | Duplicate channels provided |
| 400 | `channelsNeeded` | `multipleChannels` type requires channels array |
| 400 | `playlistsNeeded` | Playlist types require `contentDetails.playlists[]` |
| 400 | `titleRequired` | Multi-item types require a title |
| 404 | `channelSectionNotFound` | The target section doesn't exist |
| 404 | `playlistNotFound` | Specified playlist doesn't exist |

## Key Constraints

- Playlist content in sections cannot be private
- Maximum number limits apply to both channels and playlists per section
- Single-playlist sections require exactly one playlist
- Channel sections cannot include the authenticated user's own channel
- Titles exceeding length limits are rejected
