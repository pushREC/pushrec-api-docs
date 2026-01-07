---
source: https://developers.google.com/youtube/v3/docs/channelSections
scraped: 2026-01-07
api_provider: Google
discovery_tier: 3
verified: false
---
 YouTube Data API - ChannelSections Resource Documentation

## Resource Overview

A `channelSection` resource contains information about a curated set of videos that a channel has chosen to feature. Examples include latest uploads, popular uploads, or videos from specific playlists. Channels can manage up to **10 sections maximum** through the API.

## Resource Description

A `channelSection` resource contains information about a set of videos that a channel has chosen to feature. These sections allow channels to organize and highlight content like recent uploads, trending videos, or playlist collections.

## Complete JSON Schema

```json
{
  "kind": "youtube#channelSection",
  "etag": "string",
  "id": "string",
  "snippet": {
    "type": "string",
    "channelId": "string",
    "title": "string",
    "position": "integer"
  },
  "contentDetails": {
    "playlists": ["string"],
    "channels": ["string"]
  }
}
```

## Property Reference

### Root Properties

| Property | Type | Description |
|----------|------|-------------|
| `kind` | string | Always `youtube#channelSection` |
| `etag` | etag | Etag identifier for the resource |
| `id` | string | Unique channel section identifier |
| `snippet` | object | Contains basic section metadata |
| `contentDetails` | object | Describes section's featured content |

### Snippet Object

| Property | Type | Description |
|----------|------|-------------|
| `snippet.type` | string | Section category (see valid values below) |
| `snippet.channelId` | string | Channel identifier that published the section |
| `snippet.title` | string | Section title (max 100 chars, no `<` or `>`); required for `multiplePlaylists` or `multipleChannels` types only |
| `snippet.position` | integer | Zero-based position on channel page |

### Valid Section Types

- `allPlaylists`
- `completedEvents`
- `liveEvents`
- `multipleChannels`
- `multiplePlaylists`
- `popularUploads`
- `recentUploads`
- `singlePlaylist`
- `subscriptions`
- `upcomingEvents`

### ContentDetails Object

| Property | Type | Description |
|----------|------|-------------|
| `contentDetails.playlists[]` | array | Playlist IDs; required for `singlePlaylist` or `multiplePlaylists` types; must contain exactly one ID for `singlePlaylist` |
| `contentDetails.channels[]` | array | Channel IDs; required for `multipleChannels` type; cannot include the channel's own ID |

## API Methods

| Method | Description |
|--------|-------------|
| list | Returns matching `channelSection` resources according to request criteria |
| insert | Adds a channel section to the authenticated user's channel. Maximum of 10 sections allowed |
| update | Modifies an existing channel section |
| delete | Removes a channel section |

## Key Constraints

- Maximum 10 sections per channel
- Title is mandatory only for `multiplePlaylists` and `multipleChannels` types
- Title length limited to 100 characters
- `singlePlaylist` type requires exactly one playlist ID
- User cannot include their own channel in `multipleChannels` sections
