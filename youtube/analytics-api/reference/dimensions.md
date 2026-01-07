---
title: YouTube Analytics API - Dimensions Reference
source: https://developers.google.com/youtube/analytics/dimensions
api: youtube-analytics
scraped: 2026-01-07
---

# YouTube Analytics API Dimensions Documentation

## Overview

The YouTube Analytics API provides dimensions for categorizing and aggregating data in custom reports. "Dimensions are common criteria that are used to aggregate data, such as the date on which user activity occurred or the country where users were located."

---

## Core Dimensions

Core dimensions are subject to Google's Deprecation Policy:
- `ageGroup`
- `channel`
- `country`
- `day`
- `gender`
- `month`
- `sharingService`
- `uploaderType`
- `video`

---

## Resource Dimensions

**video** (core) - YouTube video IDs from the Data API

**playlist** - YouTube playlist IDs

**channel** (core) - YouTube channel IDs; frequently used in content owner reports

**group** (filter only) - YouTube Analytics group IDs retrieved via `groups.list` method

---

## Geographic Dimensions

**country** (core) - Two-letter ISO-3166-1 country codes (e.g., US, CN, FR); ZZ indicates unidentified countries

**province** - ISO 3166-2 codes for U.S. states/territories (e.g., US-MI, US-TX)

**dma** - Nielsen's 3-digit Designated Market Area identifiers

**city** - Estimated city data (available from January 1, 2022)

**continent** (filter only) - UN statistical region codes:
- 002 (Africa)
- 019 (Americas)
- 142 (Asia)
- 150 (Europe)
- 009 (Oceania)

**subContinent** (filter only) - UN statistical sub-region codes with 15 defined sub-regions

---

## Time Period Dimensions

**day** (core) - Daily data aggregation

**month** (core) - Calendar month aggregation (YYYY-MM format)

---

## Playback Location Dimensions

**insightPlaybackLocationType** - Classifies where playback occurred:
- BROWSE - YouTube browse features
- CHANNEL - Channel pages
- EMBEDDED - Embedded players on external sites
- EXTERNAL_APP - External applications
- MOBILE - Mobile direct views
- SEARCH - YouTube search results
- WATCH - Watch pages
- YT_OTHER - Other YouTube pages

**insightPlaybackLocationDetail** - Identifies specific embedded player URLs/applications

---

## Playback Details Dimensions

**creatorContentType** (available January 1, 2019):
- LIVE_STREAM - Live streaming content
- SHORTS - YouTube Shorts
- STORY - YouTube Stories
- VIDEO_ON_DEMAND - Standard uploaded videos
- UNSPECIFIED - Unclassified content type

**liveOrOnDemand** (available April 1, 2014):
- LIVE - Live broadcast views
- ON_DEMAND - On-demand/archived views

**subscribedStatus** - SUBSCRIBED or UNSUBSCRIBED viewer status

**youtubeProduct** (available July 18, 2015):
- CORE - Main YouTube platform
- GAMING - YouTube Gaming
- KIDS - YouTube Kids
- MUSIC - YouTube Music
- UNKNOWN - Unidentified product

---

## Traffic Source Dimensions

**insightTrafficSourceType** - Referrer classification including:
- ADVERTISING - Paid advertising
- ANNOTATION - Video annotations
- CAMPAIGN_CARD - Campaign cards
- END_SCREEN - End screen elements
- EXT_URL - External URLs
- HASHTAGS - Hashtag pages
- LIVE_REDIRECT - Live stream redirects
- NO_LINK_EMBEDDED - Embedded without referrer
- NO_LINK_OTHER - Other without referrer
- NOTIFICATION - YouTube notifications
- PLAYLIST - Playlist playback
- PRODUCT_PAGE - Product pages
- PROMOTED - Promoted content
- RELATED_VIDEO - Related/suggested videos
- SHORTS - YouTube Shorts feed
- SOUND_PAGE - Sound/audio pages
- SUBSCRIBER - Subscription feed
- YT_CHANNEL - Channel pages
- YT_OTHER_PAGE - Other YouTube pages
- YT_SEARCH - YouTube search
- VIDEO_REMIXES - Video remixes

**insightTrafficSourceDetail** - Specific referrer information by traffic source type

---

## Device Dimensions

**deviceType** - Physical device categories:
- DESKTOP - Desktop/laptop computers
- GAME_CONSOLE - Gaming consoles
- MOBILE - Mobile phones
- TABLET - Tablet devices
- TV - Smart TVs and connected TV devices
- AUTOMOTIVE - Car/vehicle displays
- WEARABLE - Wearable devices
- UNKNOWN_PLATFORM - Unidentified devices

**operatingSystem** - 27+ OS options including:
- ANDROID
- IOS
- WINDOWS
- MACINTOSH
- LINUX
- CHROMECAST
- PLAYSTATION
- XBOX
- FIRE_TV
- ROKU
- TIZEN
- WEBOS
- KAIOS
- And more specialized systems

---

## Demographic Dimensions

**ageGroup** (core) - Seven age ranges:
- age13-17
- age18-24
- age25-34
- age35-44
- age45-54
- age55-64
- age65-

**gender** (core):
- female
- male
- user_specified

---

## Engagement Dimensions

**sharingService** (core) - 60+ sharing platforms including:
- FACEBOOK
- TWITTER
- WHATSAPP
- YOUTUBE_MUSIC
- REDDIT
- COPY_LINK
- EMAIL
- EMBED
- TUMBLR
- PINTEREST
- LINKEDIN
- And many more

---

## Audience Retention Dimensions

**elapsedVideoTimeRatio** - Ratio of elapsed video portion (0.01 to 1.0 across 100 data points)

**audienceType** (filter only, available September 25, 2013):
- ORGANIC - Organic/natural views
- AD_INSTREAM - In-stream ad views
- AD_INDISPLAY - Display ad views

---

## Specialized Dimensions

**livestreamPosition** - Specific minute during live video streams

**membershipsCancellationSurveyReason** - Eight cancellation reason categories:
- TECHNICAL_ISSUES
- TOO_EXPENSIVE
- CONTENT_NOT_INTERESTING
- NOT_USING_ENOUGH
- FOUND_BETTER_ALTERNATIVE
- TEMPORARY_PAUSE
- OTHER
- NO_RESPONSE

**adType** - 13+ advertising formats:
- auctionBumperInstream
- auctionDisplay
- auctionInstream
- auctionTrueviewInslate
- auctionTrueviewInstream
- auctionUnknown
- reservedBumperInstream
- reservedClickToPlay
- reservedDisplay
- reservedInstream
- reservedMasthead
- reservedUnknown
- unknown

---

## Content Owner Dimensions

**claimedStatus** (content owner reports only) - Value: "claimed" only

**uploaderType** (core, content owner reports only):
- self - Content uploaded by the content owner
- thirdParty - Content uploaded by third parties

Supported filter combinations determine data scope for claimed/unclaimed content.

---

## Filters

"Filters identify dimension values that must be present in the retrieved dataset" to limit API responses to specific criteria. Content owner reports require filtering by reporting entity dimensions or supported combinations of claimedStatus and uploaderType.

### Filter Syntax

- Single value: `dimension==value`
- Multiple values: `dimension==value1,value2,value3`
- Multiple dimensions: `dimension1==value;dimension2==value`

### Filter Examples

```
country==US
video==VIDEO_ID1,VIDEO_ID2
country==US;video==VIDEO_ID
uploaderType==self;claimedStatus==claimed
```
