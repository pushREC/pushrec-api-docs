---
source: https://developers.google.com/youtube/v3/docs/videos/update
scraped: 2026-01-07
method: webfetch
api: youtube-data-v3
resource: videos
method_name: update
---

# YouTube Data API v3 - Videos: Update Documentation

## Endpoint Overview
Updates a video's metadata through the YouTube Data API v3.

**HTTP Method:** PUT
**Endpoint URL:** `https://www.googleapis.com/youtube/v3/videos`

## Quota Impact

A call to this method has a quota cost of **50 units**.

## Authorization Requirements

The following OAuth 2.0 scopes are accepted:

- `https://www.googleapis.com/auth/youtubepartner`
- `https://www.googleapis.com/auth/youtube`
- `https://www.googleapis.com/auth/youtube.force-ssl`

## Required Parameters

### `part` Parameter
**Type:** String
**Status:** Required

The `part` parameter identifies both the mutable properties to modify and which properties the API response includes. The parameter value overrides existing values for all mutable properties specified.

**Important Note:** If the request body does not specify a value, the existing privacy setting will be removed and the video will revert to the default privacy setting.

**Supported part values:**
- `contentDetails`
- `fileDetails`
- `id`
- `liveStreamingDetails`
- `localizations`
- `paidProductPlacementDetails`
- `player`
- `processingDetails`
- `recordingDetails`
- `snippet`
- `statistics`
- `status`
- `suggestions`
- `topicDetails`

## Optional Parameters

### `onBehalfOfContentOwner`
**Type:** String
**Status:** Optional

This parameter can only be used in a properly authorized request and applies exclusively to YouTube content partners. It enables CMS users to act on behalf of content owners managing multiple channels without separate authentication per channel.

## Request Body Requirements

**Required Properties:**
- `id` - The video identifier
- `snippet.title` - Required only when updating the snippet
- `snippet.categoryId` - Required only when updating the snippet

**Mutable Properties (can be set):**
- `snippet.categoryId`
- `snippet.defaultLanguage`
- `snippet.description`
- `snippet.tags[]`
- `snippet.title`
- `status.embeddable`
- `status.license`
- `status.privacyStatus`
- `status.publicStatsViewable`
- `status.publishAt` - Restricted to private videos never published
- `status.selfDeclaredMadeForKids`
- `status.containsSyntheticMedia`
- `recordingDetails.recordingDate`
- `localizations.(key)` and localization title/description

**Critical Note:** If you are submitting an update request, and your request does not specify a value for a property that already has a value, the property's existing value will be deleted.

## Response

Successful responses return a complete video resource object in the response body.

## Error Codes

| HTTP Status | Error Code | Description |
|---|---|---|
| 400 | `defaultLanguageNotSet` | Localized details submitted without default language |
| 400 | `invalidCategoryId` | Category ID invalid; use videoCategories.list |
| 400 | `invalidDefaultBroadcastPrivacySetting` | Invalid default broadcast privacy setting |
| 400 | `invalidDescription` | Video description invalid |
| 400 | `invalidPublishAt` | Scheduled publishing time invalid |
| 400 | `invalidRecordingDetails` | Recording details object invalid |
| 400 | `invalidTags` | Video keywords/tags invalid |
| 400 | `invalidTitle` | Title missing or invalid |
| 400 | `invalidVideoMetadata` | Request metadata invalid |
| 403 | `forbidden` | General permission denied |
| 403 | `forbiddenEmbedSetting` | Invalid embed setting attempted |
| 403 | `forbiddenLicenseSetting` | Invalid license setting attempted |
| 403 | `forbiddenPrivacySetting` | Invalid privacy setting attempted |
| 404 | `videoNotFound` | Video ID not found; verify request body |

## Features

The API supports the ability to mark your channel or videos as 'made for kids.' Both channel and video resources contain properties identifying "made for kids" status.
