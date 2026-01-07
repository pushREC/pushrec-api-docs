---
source: https://developers.google.com/youtube/v3/docs/videos
scraped: 2026-01-07
api_provider: Google
discovery_tier: 3
verified: false
method: webfetch
---
 YouTube Data API v3 - Videos Resource Documentation

## Overview

The Videos resource represents a YouTube video and provides methods to manage videos including retrieval, insertion, updates, and deletion. Important note: unverified API projects uploading videos post-July 28, 2020 must undergo audit for public video status.

## Available Methods

| Method | Description |
|--------|-------------|
| `list` | Returns videos matching API request parameters |
| `insert` | Uploads video to YouTube with optional metadata |
| `update` | Updates video metadata |
| `delete` | Deletes a YouTube video |
| `rate` | Adds/removes like or dislike rating |
| `getRating` | Retrieves ratings authorized user gave to videos |
| `reportAbuse` | Reports video for abusive content |

## Resource Structure

### Core Properties

```json
{
  "kind": "youtube#video",
  "etag": "string",
  "id": "string"
}
```

### Snippet Object
Contains basic video details:
- **publishedAt** (datetime): Publication date/time
- **channelId** (string): Uploading channel ID
- **title** (string): Video title (max 100 characters)
- **description** (string): Video description (max 5000 bytes)
- **thumbnails** (object): Map of thumbnail images with variants:
  - `default` (120x90px)
  - `medium` (320x180px)
  - `high` (480x360px)
  - `standard` (640x480px)
  - `maxres` (1280x720px)
- **channelTitle** (string): Channel name
- **tags[]** (list): Keyword tags (max 500 characters total)
- **categoryId** (string): YouTube video category
- **liveBroadcastContent** (string): Values: `live`, `none`, `upcoming`
- **defaultLanguage** (string): Metadata language
- **defaultAudioLanguage** (string): Spoken language in audio

### Content Details Object
Video content information:
- **duration** (string): Video length in ISO 8601 format
- **dimension** (string): 2D or 3D availability
- **definition** (string): `hd` or `sd`
- **caption** (string): Caption availability indicator
- **licensedContent** (boolean): Licensed content indicator
- **regionRestriction** (object):
  - `allowed[]`: Countries where viewable
  - `blocked[]`: Countries where blocked
- **projection** (string): `360` or `rectangular`
- **hasCustomThumbnail** (boolean): Custom thumbnail indicator

### Content Rating Object
Comprehensive international rating classifications including:
- Australian (ACB/ACMA)
- Brazilian (DJCTQ)
- British (BBFC)
- Canadian (CATV, CATVFR, CHVRS)
- European systems (FSK, CSA, etc.)
- Asian systems (Eirin, KMRB, etc.)
- Multiple other regional rating bodies

### Status Object
Upload and privacy information:
- **uploadStatus** (string): Values: `deleted`, `failed`, `processed`, `rejected`, `uploaded`
- **failureReason** (string): Upload failure explanation
- **rejectionReason** (string): Content rejection reason
- **privacyStatus** (string): Values: `private`, `public`, `unlisted`
- **publishAt** (datetime): Scheduled publication time
- **license** (string): Values: `creativeCommon`, `youtube`
- **embeddable** (boolean): Embedding permission
- **publicStatsViewable** (boolean): Stats visibility
- **madeForKids** (boolean): Child-directed designation
- **selfDeclaredMadeForKids** (boolean): Owner's child-directed declaration
- **containsSyntheticMedia** (boolean): Altered/synthetic content disclosure

### Statistics Object
- **viewCount** (unsigned long): View count
- **likeCount** (unsigned long): Like count
- **dislikeCount** (unsigned long): *Private as of December 13, 2021*
- **commentCount** (unsigned long): Comment count
- **favoriteCount** (unsigned long): *Deprecated; always 0*

### Processing Details Object
Tracks video processing progress:
- **processingStatus** (string): Values: `failed`, `processing`, `succeeded`, `terminated`
- **processingProgress** (object):
  - `partsTotal`: Estimated total parts
  - `partsProcessed`: Completed parts
  - `timeLeftMs`: Estimated remaining time
- **fileDetailsAvailability** (string): File details status
- **processingIssuesAvailability** (string): Issues availability
- **tagSuggestionsAvailability** (string): Tag suggestions status
- **thumbnailsAvailability** (string): Thumbnail generation status

### File Details Object
Uploaded file specifications (owner-only):
- **fileName** (string): Original filename
- **fileSize** (unsigned long): Size in bytes
- **fileType** (string): Type detection
- **container** (string): Container format
- **videoStreams[]** (list): Video stream metadata
- **audioStreams[]** (list): Audio stream metadata
- **durationMs** (unsigned long): Duration in milliseconds
- **bitrateBps** (unsigned long): Combined bitrate

### Live Streaming Details Object
Broadcast metadata:
- **actualStartTime** (datetime): Actual broadcast start
- **actualEndTime** (datetime): Actual broadcast end
- **scheduledStartTime** (datetime): Planned start time
- **concurrentViewers** (unsigned long): Current viewers
- **activeLiveChatId** (string): Active chat identifier

### Additional Objects

**Player**: Embed code and dimensions
- `embedHtml`: iframe tag for player
- `embedHeight`, `embedWidth`: Dimensions

**Topic Details**: Topic associations
- `topicIds[]`: *Deprecated*
- `relevantTopicIds[]`: *Deprecated as of November 2017*
- `topicCategories[]`: Wikipedia URLs describing content

**Suggestions**: Processing recommendations
- `processingErrors[]`: Fatal issues
- `processingWarnings[]`: Transcoding concerns
- `tagSuggestions[]`: Keyword recommendations
- `editorSuggestions[]`: Quality improvements

**Localizations**: Translated metadata
- Keyed by BCP-47 language code
- Contains localized title and description

## Key Restrictions & Requirements

- Unverified projects' uploaded videos default to private status
- Video titles: max 100 characters; no `<` or `>` characters
- Descriptions: max 5000 bytes; no `<` or `>` characters
- Tag character limits apply including spaces and commas
- `categoryId` required for `videos.update` when modifying snippet
- `privacyStatus` required for scheduling via `publishAt`

## Notable Property Changes

- **dislikeCount**: Private since December 13, 2021 (owner-only)
- **favoriteCount**: Deprecated; always returns 0
- **Topic IDs**: Deprecated November 2016; limited curated set now returned
- **Recording Details**: Location properties deprecated June 1, 2017
- **fmocRating**: Deprecated November 2, 2015; use `cncRating` instead
