---
source: https://developers.google.com/youtube/v3/docs/playlists/update
scraped: 2026-01-07
method: webfetch
api: youtube-data-v3
resource: playlists
method_name: update
---

# YouTube Data API v3 - Playlists: Update Documentation

## Overview

The Playlists: update method enables modification of playlist properties such as title, description, and privacy settings.

## HTTP Request

```
PUT https://www.googleapis.com/youtube/v3/playlists
```

## Quota Impact

A call to this method has a quota cost of **50 units**.

## Authorization

This endpoint requires one of the following OAuth 2.0 scopes:

- `https://www.googleapis.com/auth/youtubepartner`
- `https://www.googleapis.com/auth/youtube`
- `https://www.googleapis.com/auth/youtube.force-ssl`

## Parameters

### Required Parameters

**`part`** (string)
- The part parameter serves two purposes in this operation. It identifies the properties that the write operation will set as well as the properties that the API response will include.
- Valid values: `contentDetails`, `id`, `localizations`, `player`, `snippet`, `status`
- Note: Including `snippet` in the request body requires specifying a value for `snippet.description`, or existing descriptions will be deleted.

### Optional Parameters

**`onBehalfOfContentOwner`** (string)
- For YouTube content partners only
- Indicates CMS user authorization on behalf of specified content owner
- Allows single authentication for multiple channels

## Request Body

Must provide a playlist resource with:

**Required Properties:**
- `id` - Playlist identifier
- `snippet.title` - Playlist title

**Modifiable Properties:**
- `snippet.title`
- `snippet.description`
- `status.privacyStatus`
- `status.podcastStatus`
- `snippet.defaultLanguage`
- `localizations.(key).title`
- `localizations.(key).description`

**Important:** Properties omitted from update requests will have existing values deleted.

## Response

Upon success, returns a playlist resource matching the specified `part` parameter values.

## Error Codes

| Error Type | Error Detail | Description |
|---|---|---|
| 400 | `defaultLanguageNotSetError` | `defaultLanguage` required for localization updates |
| 400 | `localizationValidationError` | Invalid localization values provided |
| 403 | `playlistForbidden` | Operation denied or improper authorization |
| 400 | `invalidPlaylistSnippet` | Invalid playlist snippet provided |
| 404 | `playlistNotFound` | Specified playlist ID not found |
| 400 | `playlistTitleRequired` | Title is mandatory |
| 400 | `playlistOperationUnsupported` | Cannot update certain playlist types (e.g., uploads playlist) |
