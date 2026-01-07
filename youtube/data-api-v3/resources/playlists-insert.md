---
source: https://developers.google.com/youtube/v3/docs/playlists/insert
scraped: 2026-01-07
method: webfetch
api: youtube-data-v3
resource: playlists
method_name: insert
---

# YouTube Data API v3 - Playlists: Insert Documentation

## Overview
This endpoint enables creation of new playlists through the YouTube Data API.

## HTTP Request

```
POST https://www.googleapis.com/youtube/v3/playlists
```

## Quota Impact

A call to this method has a quota cost of **50 units**.

## Authorization

The following OAuth 2.0 scopes authorize requests to this method:

- `https://www.googleapis.com/auth/youtubepartner`
- `https://www.googleapis.com/auth/youtube`
- `https://www.googleapis.com/auth/youtube.force-ssl`

## Required Parameters

### `part` (string)
This parameter serves dual purposes: it designates which resource properties the write operation will configure, and specifies which properties appear in the API response.

**Valid part values:**
- `contentDetails`
- `id`
- `localizations`
- `player`
- `snippet`
- `status`

## Optional Parameters

### `onBehalfOfContentOwner` (string)
Restricted to YouTube content partners. This parameter indicates authorization credentials identify a YouTube CMS user acting for the specified content owner, enabling single authentication to access multiple channels without per-channel credential provision.

### `onBehalfOfContentOwnerChannel` (string)
For YouTube content partners exclusively. Designates the YouTube channel ID where content is being added. Required when specifying `onBehalfOfContentOwner`. The channel must link to the identified content owner.

## Request Body

Supply a playlist resource with these specifications:

**Required properties:**
- `snippet.title`

**Configurable properties:**
- `snippet.title`
- `snippet.description`
- `status.privacyStatus`
- `snippet.defaultLanguage`
- `localizations.(key)`
- `localizations.(key).title`
- `localizations.(key).description`

## Response

Successful execution returns a playlist resource in the response body.

## Error Responses

| Error Type | Error Code | Description |
|---|---|---|
| `badRequest (400)` | `defaultLanguageNotSetError` | The defaultLanguage must be set to update localizations |
| `badRequest (400)` | `localizationValidationError` | Localization values failed validation; use `playlists.list` to retrieve valid entries |
| `badRequest (400)` | `maxPlaylistExceeded` | Channel reached maximum playlist limit |
| `forbidden (403)` | `playlistForbidden` | Operation not permitted or authorization insufficient |
| `invalidValue (400)` | `invalidPlaylistSnippet` | Playlist snippet provided is invalid |
| `required (400)` | `playlistTitleRequired` | Playlist title must be specified |
