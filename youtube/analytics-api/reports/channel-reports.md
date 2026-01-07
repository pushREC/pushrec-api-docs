---
source: https://developers.google.com/youtube/analytics/channel_reports
scraped: 2026-01-07
api_provider: Google
discovery_tier: 3
verified: false
title: YouTube Analytics API - Channel Reports
---
 YouTube Analytics API: Channel Reports - Complete Documentation

## Overview

The YouTube Analytics API provides channel reports measuring user activity metrics including video views, ratings, and subscriptions across various report types like video, playlist, and ad performance.

## Retrieving Reports

To access channel data, set the `ids` parameter to:
- `channel==MINE` for the authenticated user's channel
- `channel==CHANNEL_ID` for a specific channel (requires ownership)

Channel IDs begin with "UC" and can be found in YouTube account settings or via the YouTube Data API's channels.list method.

## Authorization Requirements

All requests require OAuth 2.0 authorization with appropriate scopes:

| Scope | Purpose |
|-------|---------|
| `yt-analytics.readonly` | View analytics reports for user activity metrics |
| `yt-analytics-monetary.readonly` | Access monetary and ad performance metrics |
| `youtube` | Manage YouTube Analytics groups and items |
| `youtubepartner` | Manage YouTube assets for content owners |

**Note:** Estimated revenue and ad performance metrics are not currently supported for channel reports.

## Report Structure Components

Reports utilize three core elements:

**Dimensions:** Data categories (e.g., day, country, video)
**Metrics:** Quantitative measurements (e.g., views, likes, watch time)
**Filters:** Data refinement options (e.g., country==US)

## Video Reports

### Basic Stats

Provides user action statistics. Can filter by video or country.
- **Dimensions:** None
- **Metrics:** Views, engagement, likes, dislikes, watch time, subscriber changes, and related metrics
- **Filters:** Country, continent, video, or group

### Time-Based Reports

Statistics aggregated by day or month.
- **Dimensions:** Day or month (required); creator content type (optional)
- **Metrics:** Same as basic stats
- **Filters:** Geographic and content filters

### User Geography Reports

- **By Country:** Country-level breakdowns
- **By Province:** U.S. states and D.C. (requires country==US filter)
- **By City:** Limited to 250 results; requires maxResults<=250 and sort parameter
- **By DMA:** Designated Market Areas (U.S. only)

### Playback Details

Statistics on viewing attributes: live vs. on-demand, subscriber status, YouTube product.

**Important constraint:** The `liveOrOnDemand` dimension cannot be used with the `averageViewPercentage` metric.

### Playback Locations

- **Video Playback Location:** Page or application where playback occurred
- **Playback Location Detail:** Limited to 25 results; requires maxResults<=25 and sort parameter; shows embedded player performance

### Traffic Sources

- **Traffic Source:** How viewers reached content
- **Traffic Source Detail:** Limited to 25 results; specific traffic sources may be unsupported

**Limitation:** Product of (queried videos x date range days) cannot exceed 50,000.

### Device and Operating System

- **Device Type:** Mobile, desktop, game console, etc.
- **Operating System:** Android, Windows, PlayStation, etc.
- **Combined:** Operating system x device type breakdown

### Viewer Demographics

Age group and gender distribution. Note: `viewerPercentage` values are not normalized across playback detail dimension combinations.

### Engagement and Content Sharing

Social platform sharing statistics. Required dimension: `sharingService`

### Audience Retention

- **Required dimension:** `elapsedVideoTimeRatio`
- **Metrics:** `audienceWatchRatio`, `relativeRetentionPerformance`, `startedWatching`, `stoppedWatching`, `totalSegmentImpressions`
- **Important:** Cannot use comma-separated video filter values; single video ID only

### Concurrent Viewers (Livestreams)

Concurrent viewer metrics at specified positions during live broadcasts.

### Top Videos

- Limited to 200 results (maxResults<=200)
- Requires sort parameter
- Data before January 1, 2013 available only for top 10
- Multiple variants supporting different filtering combinations

## Playlist Reports

### Metrics Categories

**Aggregated Video Metrics:** Views, engaged views, watch time, average duration (owned videos only)

**In-Playlist Metrics:** `playlistViews`, `playlistEstimatedMinutesWatched`, `playlistAverageViewDuration`, `playlistSaves`, `playlistStarts`, `viewsPerPlaylistStart`, `averageTimeInPlaylist`

### Report Types

- **Basic Stats:** Overall playlist performance
- **Time-Based:** Day or month aggregation
- **User Geography:** Country and province breakdowns
- **Playback Locations:** Page/application performance
- **Traffic Sources:** Referrer analysis
- **Device and OS:** Device-specific metrics
- **Viewer Demographics:** Age and gender distribution
- **Top Playlists:** Ranked playlists (maxResults<=200)

All playlist reports require filtering by `playlist` or `group`.

## Membership Reports

### Membership Cancellations

Statistics on why users canceled memberships.
- **Optional dimension:** `membershipsCancellationSurveyReason`
- **Required metric:** `membershipsCancellationSurveyResponses`

## Ad Performance Reports

Requires `yt-analytics-monetary.readonly` scope.

### Ad Performance by Ad Type

- **Required dimension:** `adType`
- **Optional dimension:** `day`
- **Metrics:** `grossRevenue`, `adImpressions`, `cpm`
- **Filters:** Video/group and geographic filters

**Note:** Impression-based metrics account for each ad impression; multiple impressions possible per playback.

## Key Constraints and Special Requirements

| Report Type | Special Requirements |
|-------------|---------------------|
| City Report | maxResults<=250; requires sort parameter |
| Playback Location Detail | maxResults<=25; requires sort parameter |
| Traffic Source Detail | maxResults<=25; requires sort parameter |
| Top Videos/Playlists | maxResults<=200; requires sort parameter |
| Audience Retention | Single video ID only (no comma-separated lists) |
| Traffic Source | Product constraint: videos x days <= 50,000 |

---

*Last updated: 2025-08-28 UTC*
