---
source: https://developers.google.com/youtube/v3/docs/channelSections/insert
scraped: 2026-01-07
api_provider: Google
discovery_tier: 3
verified: false
method: insert
---
 YouTube Data API: ChannelSections insert

## Method Overview

The ChannelSections: insert endpoint enables authenticated users to add channel sections (shelves) to their YouTube channel. A maximum of 10 shelves can be created per channel.

**Quota Cost:** 50 units per request

## HTTP Request

```
POST https://www.googleapis.com/youtube/v3/channelSections
```

## Authorization

This operation requires authentication with one of these scopes:

- `https://www.googleapis.com/auth/youtubepartner`
- `https://www.googleapis.com/auth/youtube`
- `https://www.googleapis.com/auth/youtube.force-ssl`

## Query Parameters

### Required Parameters

| Parameter | Type | Description |
|-----------|------|-------------|
| `part` | string | Identifies properties the write operation will set and the API response will include. Valid values: `contentDetails`, `id`, `snippet` |

### Optional Parameters

| Parameter | Type | Description |
|-----------|------|-------------|
| `onBehalfOfContentOwner` | string | For YouTube content partners only. Indicates CMS user acting on behalf of specified content owner. |
| `onBehalfOfContentOwnerChannel` | string | Specifies YouTube channel ID when `onBehalfOfContentOwner` is provided. Required when that parameter is used. |

## Request Body Schema

The request requires a channelSection resource with:

### Required Properties

| Property | Description |
|----------|-------------|
| `snippet.type` | The section type (must be specified) |

### Optional Properties

| Property | Description |
|----------|-------------|
| `snippet.title` | Display title for the section |
| `snippet.position` | Section placement order |
| `contentDetails.playlists[]` | Array of playlist identifiers |
| `contentDetails.channels[]` | Array of channel identifiers |

## Response

Successful requests return a channelSection resource in the response body.

## Error Responses

| Error Code | HTTP Status | Description |
|------------|-------------|-------------|
| `notEditable` | 400 | Section cannot be created |
| `typeRequired` | 400 | The `channelSection` resource must specify a value for the type field |
| `channelSectionForbidden` | 403 | Request lacks proper authentication or unsupported for channel |
| `maxChannelSectionExceeded` | 400 | Channel already has maximum sections |
| `playlistsNeeded` | 400 | Required playlists not provided for section type |
| `channelsNeeded` | 400 | Required channels not provided for section type |
| `channelNotFound` | 404 | Specified channel cannot be located |
| `playlistNotFound` | 404 | Specified playlist cannot be located |

## Additional Error Conditions

Validation errors include:
- Duplicate channels/playlists
- Private playlists
- Title length violations
- Invalid positions
- Exceeding content limits
