---
source: https://developers.google.com/youtube/v3/docs/playlists
scraped: 2026-01-07
api_provider: Google
discovery_tier: 3
verified: false
method: webfetch
---
 YouTube Data API v3 - Playlists Resource Documentation

## Overview

A **playlist** represents a YouTube collection of videos that can be viewed sequentially and shared. Playlists are publicly visible by default but can be configured as public or private. YouTube also uses playlists for special collections like uploaded videos and liked content associated with channels.

## Resource Methods

The API supports four primary operations on playlist resources:

| Method | Purpose |
|--------|---------|
| **list** | Returns a collection of playlists that match the API request parameters |
| **insert** | Creates a playlist |
| **update** | Modifies a playlist, including title, description, or privacy settings |
| **delete** | Deletes a playlist |

## Resource Schema

```json
{
  "kind": "youtube#playlist",
  "etag": "etag",
  "id": "string",
  "snippet": {
    "publishedAt": "datetime",
    "channelId": "string",
    "title": "string",
    "description": "string",
    "thumbnails": {
      "(key)": {
        "url": "string",
        "width": "unsigned integer",
        "height": "unsigned integer"
      }
    },
    "channelTitle": "string",
    "defaultLanguage": "string",
    "localized": {
      "title": "string",
      "description": "string"
    }
  },
  "status": {
    "privacyStatus": "string",
    "podcastStatus": "enum"
  },
  "contentDetails": {
    "itemCount": "unsigned integer"
  },
  "player": {
    "embedHtml": "string"
  },
  "localizations": {
    "(key)": {
      "title": "string",
      "description": "string"
    }
  }
}
```

## Property Definitions

### Core Properties

**kind**: Identifies the API resource's type. The value will be `youtube#playlist`.

**etag**: The Etag identifier for this resource version.

**id**: The ID that YouTube uses to uniquely identify the playlist.

### Snippet Object

Contains basic playlist metadata:

- **publishedAt**: Creation timestamp in ISO 8601 format
- **channelId**: The ID that YouTube uses to uniquely identify the channel that published the playlist
- **title**: Playlist name
- **description**: Playlist details
- **thumbnails.(key)**: A map of thumbnail images associated with the playlist

**Thumbnail Key Values**:
- `default` - 120px x 90px (videos) or 88px x 88px (channels)
- `medium` - 320px x 180px (videos) or 240px x 240px (channels)
- `high` - 480px x 360px (videos) or 800px x 800px (channels)
- `standard` - 640px x 480px
- `maxres` - 1280px x 720px

- **channelTitle**: The channel title of the channel that the video belongs to
- **defaultLanguage**: The language of the text in the playlist resource's title and description
- **localized**: Contains localized title/description or defaults when localized versions unavailable

### Status Object

**privacyStatus** - Valid values: `private`, `public`, `unlisted`

**podcastStatus** - Valid values: `enabled`, `disabled`, `unspecified`. If value is `enabled`, the playlist is marked as a podcast show.

### Content Details

**itemCount**: The number of videos in the playlist

### Player Object

**embedHtml**: An `<iframe>` tag that embeds a player that will play the playlist

### Localizations Object

Contains translated metadata keyed by BCP-47 language code, with localized `title` and `description` properties.

## Related Resources

These lists are associated with a channel, which is a collection of a person, group, or company's videos, playlists, and other YouTube information. Use the `playlistItems.list` method to retrieve playlist contents and `playlistItems.insert`/`playlistItems.delete` to modify items.
