---
source: https://developers.google.com/youtube/v3/docs
scraped: 2026-01-07
api_provider: Google
discovery_tier: 3
verified: false
category: overview
method: bright_data
---
 YouTube Data API v3 - API Reference

## Overview

The YouTube Data API enables developers to incorporate YouTube functionality into external applications. Resources are represented as JSON objects, including videos, playlists, channels, and subscriptions. The API supports standard HTTP methods (LIST, POST, DELETE, PUT) for managing these resources.

## Authentication Requirements

Every API request must include either:
- An API key (via the `key` parameter), or
- An OAuth 2.0 token

Authorization tokens are mandatory for:
- Insert, update, and delete operations
- Requests accessing authenticated user's private data
- Some retrieval methods with authorization-dependent parameters

OAuth 2.0 tokens can be provided via:
- Query parameter: `?access_token=oauth2-token`
- HTTP header: `Authorization: Bearer oauth2-token`

## Resource Types and Methods

### Activities
Contains information about channel or user actions (ratings, shares, uploads, etc.)

| Method | HTTP Request | Purpose |
|--------|--------------|---------|
| list | GET /activities | Returns activity events matching request criteria |

### Captions
Represents caption tracks associated with videos.

| Method | HTTP Request | Purpose |
|--------|--------------|---------|
| list | GET /captions | Lists caption tracks for specified video |
| insert | POST /captions | Uploads caption track |
| update | PUT /captions | Updates caption track or draft status |
| download | GET /captions/id | Downloads caption in original format/language |
| delete | DELETE /captions | Deletes specified caption track |

### ChannelBanners
Contains URL for newly uploaded banner images.

| Method | HTTP Request | Purpose |
|--------|--------------|---------|
| insert | POST /channelBanners/insert | Uploads channel banner (16:9 ratio, minimum 2048x1152px) |

### Channels
Contains information about YouTube channels.

| Method | HTTP Request | Purpose |
|--------|--------------|---------|
| list | GET /channels | Returns channel resources matching criteria |
| update | PUT /channels | Updates channel branding settings and video promotion objects |

### ChannelSections
Represents featured video collections (e.g., uploads, popular, playlists).

| Method | HTTP Request | Purpose |
|--------|--------------|---------|
| list | GET /channelSections | Returns sections matching criteria |
| insert | POST /channelSections | Adds section (max 10 per channel) |
| update | PUT /channelSections | Updates channel section |
| delete | DELETE /channelSections | Deletes channel section |

### Comments
Contains information about individual YouTube comments.

| Method | HTTP Request | Purpose |
|--------|--------------|---------|
| list | GET /comments | Returns comments matching parameters |
| insert | POST /comments | Creates reply to existing comment |
| update | PUT /comments | Modifies comment |
| setModerationStatus | POST /comments/setModerationStatus | Sets moderation status (owner authorization required) |
| delete | DELETE /comments | Deletes comment |

### CommentThreads
Contains top-level comments and associated replies.

| Method | HTTP Request | Purpose |
|--------|--------------|---------|
| list | GET /commentThreads | Returns comment threads matching criteria |
| insert | POST /commentThreads | Creates new top-level comment |

### I18nLanguages
Identifies application languages supported by YouTube.

| Method | HTTP Request | Purpose |
|--------|--------------|---------|
| list | GET /i18nLanguages | Returns supported UI languages |

### I18nRegions
Identifies geographic content regions supported by YouTube.

| Method | HTTP Request | Purpose |
|--------|--------------|---------|
| list | GET /i18nRegions | Returns supported content regions |

### Members
Represents channel members providing recurring monetary support.

| Method | HTTP Request | Purpose |
|--------|--------------|---------|
| list | GET /members | Lists channel members (owner authorization required) |

### MembershipsLevels
Identifies pricing levels for channel memberships.

| Method | HTTP Request | Purpose |
|--------|--------------|---------|
| list | GET /membershipsLevels | Returns membership pricing levels owned by authorized creator |

### PlaylistItems
Identifies resources included in playlists with playlist-specific details.

| Method | HTTP Request | Purpose |
|--------|--------------|---------|
| list | GET /playlistItems | Returns items matching parameters |
| insert | POST /playlistItems | Adds resource to playlist |
| update | PUT /playlistItems | Modifies item (e.g., position) |
| delete | DELETE /playlistItems | Deletes playlist item |

### Playlists
Represents YouTube playlists (viewable sequentially, publicly or privately).

| Method | HTTP Request | Purpose |
|--------|--------------|---------|
| list | GET /playlists | Returns playlists matching criteria |
| insert | POST /playlists | Creates playlist |
| update | PUT /playlists | Modifies title, description, or privacy status |
| delete | DELETE /playlists | Deletes playlist |

### Search
Contains information about videos, channels, or playlists matching search parameters.

| Method | HTTP Request | Purpose |
|--------|--------------|---------|
| list | GET /search | Returns search results (videos, channels, playlists by default) |

### Subscriptions
Contains information about user subscriptions to channels or actions.

| Method | HTTP Request | Purpose |
|--------|--------------|---------|
| list | GET /subscriptions | Returns subscriptions matching criteria |
| insert | POST /subscriptions | Adds subscription for authenticated user |
| delete | DELETE /subscriptions | Deletes subscription |

### Thumbnails
Identifies available thumbnail image sizes for resources.

| Method | HTTP Request | Purpose |
|--------|--------------|---------|
| set | POST /thumbnails/set | Uploads custom video thumbnail |

**Characteristics:**
- Resource `snippet.thumbnails` property contains available sizes
- Different resource types support different sizes
- Sizes named: default, medium, high, standard, maxres
- Resized without cropping if dimensions don't match (may include black bars)

### VideoAbuseReportReasons
Contains reasons for flagging videos as abusive.

| Method | HTTP Request | Purpose |
|--------|--------------|---------|
| list | GET /videoAbuseReportReasons | Retrieves reportable abuse reasons |

### VideoCategories
Identifies categories for uploaded videos.

| Method | HTTP Request | Purpose |
|--------|--------------|---------|
| list | GET /videoCategories | Returns available video categories |

### Videos
Represents YouTube videos.

| Method | HTTP Request | Purpose |
|--------|--------------|---------|
| list | GET /videos | Returns videos matching parameters |
| insert | POST /videos | Uploads video and optionally sets metadata |
| update | PUT /videos | Updates video metadata |
| delete | DELETE /videos | Deletes video |
| rate | POST /videos/rate | Adds or removes like/dislike rating |
| getRating | GET /videos/getRating | Retrieves authorized user's ratings for specified videos |
| reportAbuse | POST /videos/reportAbuse | Reports video for abusive content |

### Watermarks
Identifies images displayed during channel video playbacks.

| Method | HTTP Request | Purpose |
|--------|--------------|---------|
| set | POST /watermarks/set | Uploads watermark image and sets for channel |
| unset | POST /watermarks/unset | Deletes channel watermark image |

## Standard Query Parameters

The API supports standard query parameters documented in the Google Cloud APIs system parameters documentation.

## Error Handling

The API provides error responses through:
- Global Domain Errors
- YouTube Data API-specific error documentation

---

**License Note:** This content is licensed under Creative Commons Attribution 4.0 License; code samples under Apache 2.0 License.
