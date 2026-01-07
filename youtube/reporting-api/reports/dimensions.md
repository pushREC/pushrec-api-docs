---
source: https://developers.google.com/youtube/reporting/v1/reports/dimensions
scraped: 2026-01-07
api: youtube-reporting
type: dimensions
---

# YouTube Reporting API Dimensions Documentation

## Overview

The YouTube Reporting API uses dimensions to aggregate data in bulk reports. "Each row of data has a unique combination of dimension values" that functions as the primary key.

## Naming Convention

The Reporting API uses **lowercase with underscores** (e.g., `age_group`, `video_id`), unlike the Analytics API which uses camelCase.

## Core Dimensions

These eight dimensions are subject to YouTube's API Deprecation Policy:

| Dimension | Description | Values |
|-----------|-------------|--------|
| `age_group` | User age ranges | `AGE_13_17`, `AGE_18_24`, `AGE_25_34`, `AGE_35_44`, `AGE_45_54`, `AGE_55_64`, `AGE_65_` |
| `channel_id` | YouTube channel identifier | Channel ID string |
| `country_code` | Two-letter ISO-3166-1 country code | e.g., `US`, `CN`, `FR` |
| `date` | 24-hour Pacific time period | UTC-7 or UTC-8 |
| `gender` | Viewer gender | `FEMALE`, `MALE`, `GENDER_OTHER` |
| `sharing_service` | Platform used to share videos | Facebook, Twitter, Email, etc. |
| `uploader_type` | Content ownership | `self`, `thirdParty` (content owner reports only) |
| `video_id` | YouTube video identifier | Video ID string |

## Resource Dimensions

| Dimension | Description |
|-----------|-------------|
| `video_id` | Corresponds to video resource |
| `playlist_id` | YouTube playlist identifier |
| `channel_id` | YouTube channel identifier |
| `asset_id` | YouTube Content ID system asset (content owner reports only) |

## Geographic Dimensions

| Dimension | Description | Values |
|-----------|-------------|--------|
| `country_code` | Two-letter ISO country codes | e.g., `US`, `GB`, `DE` |
| `province_code` | US state/territory ISO 3166-2 codes | e.g., `US-MI`, `US-TX`, `US-CA` |

## Playback Location Dimensions

### `playback_location_type`

| Value | Description |
|-------|-------------|
| 0 | Unknown |
| 1 | YouTube watch page |
| 2 | Embedded player |
| 3 | Channel page |
| 4 | YouTube homepage |
| 5 | YouTube search results |
| 6 | Direct URL (e.g., via notifications) |
| 7 | External page |
| 8 | YouTube Shorts feed |
| 9 | YouTube Kids app |
| 10 | Other YouTube pages |

### `playback_location_detail`

URL or application where playback occurred (embedded players only).

## Playback Detail Dimensions

| Dimension | Values | Description |
|-----------|--------|-------------|
| `live_or_on_demand` | `live`, `onDemand` | Whether content was live or pre-recorded |
| `subscribed_status` | `subscribed`, `unsubscribed` | Viewer subscription status |

## Traffic Source Dimensions

### `traffic_source_type`

32 values identifying referrer type:

| Category | Examples |
|----------|----------|
| YouTube Internal | Browse features, Search, Related videos, Channel pages |
| External | Google Search, External websites, Social media |
| Advertising | YouTube advertising, Display ads |
| Notifications | Push notifications, Email |
| Other | Direct URL, Shorts feed, Playlists |

### `traffic_source_detail`

Contextual details corresponding to traffic source type (e.g., search query, referring video ID).

## Device Dimensions

### `device_type`

| Code | Device |
|------|--------|
| 100 | Unknown |
| 101 | Computer |
| 102 | TV |
| 103 | Game console |
| 104 | Mobile phone |
| 105 | Tablet |

### `operating_system`

Codes 1-32 identifying software systems:

| Code | OS |
|------|------|
| 1 | Android |
| 2 | iOS |
| 3 | Windows |
| 4 | macOS |
| 5 | Linux |
| 6 | Chrome OS |
| 7 | Fire OS |
| 8 | Roku |
| 9 | tvOS |
| 10 | Tizen |
| 11 | webOS |
| ... | Other platforms |

## Engagement Dimensions

### `sharing_service`

87+ platform codes for video sharing:

| Examples |
|----------|
| Facebook, Twitter, WhatsApp, Reddit, Email |
| LinkedIn, Pinterest, Tumblr, Blogger |
| Text message, Copy to clipboard, Embed |

### Annotation Dimensions

| Dimension | Values |
|-----------|--------|
| `annotation_type` | Codes 0-30 for annotation display styles |
| `annotation_id` | Unique annotation identifier |

### Card Dimensions

| Dimension | Description |
|-----------|-------------|
| `card_type` | Codes 0-69 for card types (Link, Video, Playlist, Merchandise, etc.) |
| `card_id` | Unique card identifier |

## End Screen Dimensions

### `end_screen_element_type`

| Code | Element Type |
|------|--------------|
| 501 | Video |
| 502 | Playlist |
| 503 | Channel |
| 504 | Subscribe |
| 505 | Link |
| 506 | Merchandise |
| 510 | Best for viewer |

### `end_screen_element_id`

Unique element identifier.

## Subtitle Dimensions

| Dimension | Description |
|-----------|-------------|
| `subtitle_language` | Closed caption language used longest during view |
| `subtitle_language_autotranslated` | Auto-translated caption language |

## Ad Performance Dimensions

### `ad_type`

| Code | Ad Format |
|------|-----------|
| 1 | Skippable video ads |
| 2 | Display ads |
| 3 | Non-skippable video ads |
| 4 | Overlay ads |
| 5 | Bumper ads |
| 6 | Sponsored cards |
| 7 | Masthead ads |
| 10 | Audio ads |
| 20 | Other ad formats |

## Content Owner-Specific Dimensions

| Dimension | Values | Description |
|-----------|--------|-------------|
| `claimed_status` | `claimed` | Only includes claimed content |
| `uploader_type` | `self`, `thirdParty` | Distinguishes own uploads from claimed third-party content |

## Privacy Anonymization

When metrics fall below privacy thresholds:
- Geographic values may show `ZZ`
- Other dimensions may show `NULL`
- This protects viewer anonymity
