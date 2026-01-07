---
source: https://developers.google.com/youtube/v3/docs/channels
scraped: 2026-01-07
method: webfetch
api: youtube-data-v3
resource: channels
---

# YouTube Data API v3 - Channels Resource Documentation

## Overview

The Channels resource provides comprehensive information about YouTube channels, encompassing metadata, content details, statistics, and branding configurations. Channels and videos can be designated as "made for kids" through specific properties.

## Available Methods

### 1. **list**
Returns zero or more channel resources matching request criteria.

### 2. **update**
Modifies channel metadata. Currently supports updates to `brandingSettings` and `invideoPromotion` objects and their child properties.

## Resource Schema

### Root-Level Properties

| Property | Type | Description |
|----------|------|-------------|
| `kind` | string | API resource type; value is `youtube#channel` |
| `etag` | etag | Resource identifier for caching |
| `id` | string | YouTube's unique channel identifier |

## Snippet Object

Contains basic channel details including title, description, and thumbnails.

| Property | Type | Max Length | Description |
|----------|------|-----------|-------------|
| `snippet.title` | string | - | Channel title |
| `snippet.description` | string | 1000 chars | Channel description |
| `snippet.customUrl` | string | - | Custom channel URL (requires eligibility) |
| `snippet.publishedAt` | datetime | - | Channel creation date (ISO 8601 format) |
| `snippet.defaultLanguage` | string | - | Metadata language |
| `snippet.country` | string | - | Associated country |

### Thumbnail Structure

Thumbnails are available in three resolutions:

- **default**: 88px x 88px (channel) / 120px x 90px (video-related)
- **medium**: 240px x 240px (channel) / 320px x 180px (video-related)
- **high**: 800px x 800px (channel) / 480px x 360px (video-related)

Each thumbnail contains:
- `url` (string): HTTPS image URL
- `width` (unsigned integer): Pixel width
- `height` (unsigned integer): Pixel height

### Localization

`snippet.localized` object provides translated or default-language metadata:
- `title` (string): Localized channel title
- `description` (string): Localized channel description

## Content Details Object

Encapsulates channel content information.

### Related Playlists

`contentDetails.relatedPlaylists` identifies associated playlists:

| Property | Type | Description |
|----------|------|-------------|
| `likes` | string | Liked videos playlist ID |
| `favorites` | string | **Deprecated** - Favorite videos playlist (historical purposes only) |
| `uploads` | string | Uploaded videos playlist ID |

## Statistics Object

Channel performance metrics:

| Property | Type | Description |
|----------|------|-------------|
| `viewCount` | unsigned long | Total video view count; updated for Shorts starting March 31, 2025 |
| `subscriberCount` | unsigned long | Subscriber count (rounded to three significant figures) |
| `hiddenSubscriberCount` | boolean | Public visibility of subscriber count |
| `videoCount` | unsigned long | Public uploaded videos count |
| `commentCount` | unsigned long | **Deprecated** - Comment count |

## Topic Details Object

Categorizes channels by topic associations.

### Topic IDs

A curated list of supported topic IDs includes:

**Music**: /m/04rlf (parent), /m/02mscn (Christian), /m/0ggq0m (Classical), /m/01lyv (Country), /m/02lkt (Electronic), /m/0glt670 (Hip hop), /m/05rwpb (Independent), /m/03_d0 (Jazz), /m/028sqc (Asian), /m/0g293 (Latin), /m/064t9 (Pop), /m/06cqb (Reggae), /m/06j6l (R&B), /m/06by7 (Rock), /m/0gywn (Soul)

**Gaming**: /m/0bzvm2 (parent), /m/025zzc (Action), /m/02ntfj (Action-adventure), /m/0b1vjn (Casual), /m/02hygl (Music video), /m/04q1x3q (Puzzle), /m/01sjng (Racing), /m/0403l3g (Role-playing), /m/021bp2 (Simulation), /m/022dc6 (Sports), /m/03hf_rm (Strategy)

**Sports**: /m/06ntj (parent), /m/0jm_ (American football), /m/018jz (Baseball), /m/018w8 (Basketball), /m/01cgz (Boxing), /m/09xp_ (Cricket), /m/02vx4 (Football), /m/037hz (Golf), /m/03tmr (Ice hockey), /m/01h7lh (MMA), /m/0410tth (Motorsport), /m/07bs0 (Tennis), /m/07_53 (Volleyball)

**Entertainment**: /m/02jjt (parent), /m/09kqc (Humor), /m/02vxn (Movies), /m/05qjc (Performing arts), /m/066wd (Wrestling), /m/0f2f9 (TV shows)

**Lifestyle**: /m/019_rr (parent), /m/032tl (Fashion), /m/027x7n (Fitness), /m/02wbm (Food), /m/03glg (Hobby), /m/068hy (Pets), /m/041xxh (Beauty), /m/07c1v (Technology), /m/07bxq (Tourism), /m/07yv9 (Vehicles)

**Society**: /m/098wr (parent), /m/09s1f (Business), /m/0kt51 (Health), /m/01h6rj (Military), /m/05qt0 (Politics), /m/06bvp (Religion)

**Other**: /m/01k8wb (Knowledge)

**Note**: Topic IDs deprecated November 10, 2016; supported until November 10, 2017. Freebase API deprecation changed functionality February 27, 2017.

### Topic Categories

`topicDetails.topicCategories[]` - Array of Wikipedia URLs describing channel content.

## Status Object

Channel privacy and eligibility information.

| Property | Type | Valid Values | Description |
|----------|------|--------------|-------------|
| `privacyStatus` | string | `private`, `public`, `unlisted` | Channel visibility setting |
| `isLinked` | boolean | - | User linked to YouTube username or Google+ account |
| `longUploadsStatus` | string | `allowed`, `disallowed`, `eligible` | Eligibility for videos exceeding 15 minutes |
| `madeForKids` | boolean | - | Child-directed designation status |
| `selfDeclaredMadeForKids` | boolean | - | Channel owner's child-directed declaration (settable via update) |

### Long Uploads Status Details

- **allowed**: Channel can upload videos exceeding 15 minutes
- **disallowed**: Channel ineligible; must resolve Community Guidelines issues or Content ID blocks
- **eligible**: Channel eligible but requires phone verification to enable uploads

## Branding Settings Object

Contains channel branding configuration.

### Channel Branding

`brandingSettings.channel` properties:

| Property | Type | Max Length | Description |
|----------|------|-----------|-------------|
| `title` | string | 30 chars | Channel page title |
| `description` | string | 1000 chars | Channel information box text |
| `keywords` | string | 500 chars | Space-separated keywords |
| `trackingAnalyticsAccountId` | string | - | Google Analytics account ID |
| `unsubscribedTrailer` | string | - | YouTube video ID for featured module (public/unlisted only) |
| `defaultLanguage` | string | - | Metadata language |
| `country` | string | - | Associated country (updates `snippet.country`) |

### Watch Page Branding

**Note**: `brandingSettings.watch` object and all child properties are deprecated.

| Property | Type | Description |
|----------|------|-------------|
| `textColor` | string | **Deprecated** - Video watch page text color |
| `backgroundColor` | string | **Deprecated** - Video watch page background color |
| `featuredPlaylistId` | string | **Deprecated** - Returns error if attempted to set |

### Image Properties

**Note**: All image-related properties under `brandingSettings.image` are deprecated, including:
- Banner images (various resolutions for desktop, mobile, tablet, TV)
- Watch icon image
- Tracking pixel URL
- Banner external URL

`brandingSettings.hints[]` - **Deprecated** array of additional branding properties.

## Audit Details Object

Multichannel network (MCN) evaluation data (requires `https://www.googleapis.com/auth/youtubepartner-channel-audit` scope).

| Property | Type | Description |
|----------|------|-------------|
| `overallGoodStanding` | boolean | Logical AND of community guidelines, copyright, and content ID standing |
| `communityGuidelinesGoodStanding` | boolean | Compliance with YouTube community guidelines |
| `copyrightStrikesGoodStanding` | boolean | Absence of copyright strikes |
| `contentIdClaimsGoodStanding` | boolean | Absence of unresolved claims |

**Important**: Tokens using the audit scope must be revoked upon MCN decision or within two weeks of issuance.

## Content Owner Details Object

Visible only to YouTube Partners with linked Content Manager.

| Property | Type | Description |
|----------|------|-------------|
| `contentOwner` | string | Content owner ID linked to channel |
| `timeLinked` | datetime | Channel linkage date/time (ISO 8601 format) |

## Localizations Object

Translations of channel metadata organized by BCP-47 language codes.

`localizations.(key)` structure:
- `title` (string): Localized channel title
- `description` (string): Localized channel description

---

## Key Implementation Notes

1. **Thumbnail URLs**: Always use returned HTTPS URLs exactly; avoid http domain substitution to prevent broken images. New channels may have empty thumbnails; full population takes up to one day.

2. **Subscriber Count**: Values rounded to three significant figures for public visibility.

3. **"Made for Kids" Designation**: Settable via `selfDeclaredMadeForKids` in update requests; observable via `madeForKids` status property.

4. **Long Video Uploads**: Phone verification required for `eligible` status channels.

5. **Deprecated Features**: Favorite video functionality deprecated August 28, 2015; related properties retained for historical data only.

6. **Localization**: Returned via `hl` parameter in list requests when available; defaults to channel's default language.
