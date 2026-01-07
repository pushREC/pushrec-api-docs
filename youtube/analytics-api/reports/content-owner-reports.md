---
source: https://developers.google.com/youtube/analytics/content_owner_reports
scraped: 2026-01-07
api_provider: Google
discovery_tier: 3
verified: false
title: YouTube Analytics API - Content Owner Reports
---
 YouTube Analytics API: Content Owner Reports - Complete Documentation

## Overview

Content Owner Reports provide YouTube content partners with detailed metrics on channels linked to their content owner accounts, covering user activity, ad performance, and estimated revenue.

**Key Requirements:**
- OAuth 2.0 authorization required
- Data must be filtered by dimensions like `video`, `channel`, or specific combinations of `claimedStatus` and `uploaderType`
- Access limited to YouTube Partner Program participants

## Authorization Scopes

| Scope | Purpose |
|-------|---------|
| `yt-analytics.readonly` | View YouTube Analytics reports (user activity metrics) |
| `yt-analytics-monetary.readonly` | View monetary reports including revenue and ad performance |
| `youtube` | Manage YouTube account and Analytics groups |
| `youtubepartner` | Manage YouTube assets and content |

*Note: Metrics marked with asterisk (*) require the monetary scope.*

## Retrieving Reports

Call the `reports.query` method with the `ids` parameter set to `contentOwner==OWNER_NAME`.

## Video Reports

### Basic Statistics

Provides user action metrics across all content owner channels with optional video or country filtering.

**Dimensions:** None required

**Metrics (use 1 or more):** engagedViews, views, redViews, comments, likes, dislikes, videosAddedToPlaylists, videosRemovedFromPlaylists, shares, estimatedMinutesWatched, averageViewDuration, averageViewPercentage, annotation metrics, card metrics, subscribersGained, subscribersLost, revenue/ad metrics*

**Filters (use exactly 1):** video | channel | group | uploaderType+claimedStatus combinations
**Optional filters:** country, continent, subContinent

### Time-Based Reports

Aggregates user activity by day or month with optional geographic filtering.

**Dimensions:**
- Use exactly 1: day or month
- Optional: creatorContentType

**Metrics:** Same as basic statistics plus `uniques`

**Filters:** Same as basic statistics

### Geographic Reports

#### By Country
**Dimensions:** country (required), creatorContentType (optional)
**Filters (exactly 1):** video | channel | group | uploaderType+claimedStatus
**Optional filters:** continent, subContinent

#### By Province (US/DC only)
**Dimensions:** province (required)
**Filters:** country==US (required), plus exactly 1 of video/channel/group/uploader combinations
**Metrics:** Subset excluding revenue metrics

#### By City (<=250 results)
Requires `maxResults` <=250 and `sort` parameter specification.

**Dimensions:** city (required), creatorContentType, country, province, subscribedStatus (optional)
**Sorting options:** -engagedViews, -views, -estimatedMinutesWatched

### Playback Details

Reports analyzing views by subscription status, live vs. on-demand, and YouTube product type.

**Note:** The `liveOrOnDemand` dimension cannot be used with `averageViewPercentage` metric.

#### By Subscribed Status
**Dimensions:** subscribedStatus, creatorContentType, day/month (0 or 1)
**Metrics:** All basic stats metrics except revenue/ad metrics

#### By YouTube Product
**Dimensions:** youtubeProduct, creatorContentType, day/month (0 or 1)
**Metrics:** engagedViews, views, redViews, estimatedMinutesWatched, averageViewDuration

### Playback Locations

#### Video Playback Location Report
**Dimensions:** insightPlaybackLocationType (required), creatorContentType, day, liveOrOnDemand, subscribedStatus
**Metrics:** engagedViews, views, estimatedMinutesWatched

#### Playback Location Detail (<=25 results)
Identifies embedded players generating most views.

**Dimensions:** insightPlaybackLocationDetail (required)
**Filters:** insightPlaybackLocationType==EMBEDDED (required)
**Sorting:** -engagedViews, -views, -estimatedMinutesWatched

### Traffic Sources

#### Traffic Source Report
Measures views by source type (search, related videos, etc.).

**Dimensions:** insightTrafficSourceType (required), creatorContentType, day, liveOrOnDemand, subscribedStatus

**Note:** Returns error if (queried videos x date range days) exceeds 50,000.

#### Traffic Source Detail (<=25 results)
Identifies referrers generating most views.

**Dimensions:** insightTrafficSourceDetail (required)
**Filters:** insightTrafficSourceType (required)
**Unsupported sources:** VIDEO_REMIXES, NOTIFICATION, END_SCREEN, CAMPAIGN_CARD, NO_LINK_EMBEDDED

### Device and Operating System

**Device Type Report**
- Dimensions: deviceType (required)
- Includes OS as optional filter

**Operating System Report**
- Dimensions: operatingSystem (required)
- Includes deviceType as optional filter

**Combined Report**
- Dimensions: Both operatingSystem and deviceType required

### Viewer Demographics

Aggregates viewing by age group and gender.

**Dimensions:** ageGroup and/or gender (use 1 or more)
**Metrics:** viewerPercentage (required)

**Important:** viewerPercentage values are not normalized across subscribedStatus. Reports show 100% for each status value independently.

### Engagement and Content Sharing

**Dimensions:** sharingService (required)
**Metrics:** shares

### Audience Retention

Measures video's ability to retain audience across viewing duration.

**Dimensions:** elapsedVideoTimeRatio (required)
**Metrics:** audienceWatchRatio, relativeRetentionPerformance

**Filters:** video (required, single ID only)

### Top Videos Reports

Requires `maxResults` <=200 and `sort` parameter. Before 2013-01-01, data limited to top 10 videos.

**Variants:**
- Overall/by country/continent/subcontinent
- By US state (fewer metrics)
- By subscribed status
- By YouTube Product
- With playback detail filters

**Sorting options:** -engagedViews, -views, -redViews, -estimatedRevenue, -estimatedMinutesWatched, -subscribersGained/Lost

## Playlist Reports

Two metric categories:
- **Aggregated video metrics:** Only for videos owned by playlist owner
- **In-playlist metrics:** Views in playlist context regardless of owner

### Supported Playlist Metrics

**Aggregated:** engagedViews, views, estimatedMinutesWatched, averageViewDuration

**In-playlist:** playlistViews, playlistEstimatedMinutesWatched, playlistAverageViewDuration, playlistSaves, playlistStarts, viewsPerPlaylistStart, averageTimeInPlaylist

### Playlist Basic Stats
**Dimensions:** None required
**Filters:** Use 0 or 1 of playlist/group (required if using views/estimatedMinutesWatched/averageViewDuration metrics)

### Playlist Time-Based
**Dimensions:** day or month (exactly 1)

### Playlist Geography
**By Country:** country (required)
**By Province:** province (required), country==US (required)

### Playlist Playback Locations
**Playback Location Detail (<=25 results):** Requires insightPlaybackLocationType==EMBEDDED, maxResults<=25, sort parameter

**Sorting options:** -playlistViews, -playlistEstimatedMinutesWatched, -playlistStarts

### Playlist Traffic Sources
Similar structure to video reports with playlist-specific metrics.

### Playlist Device and Operating System
Reports by device type and OS with playlist metrics.

### Playlist Demographics
**Dimensions:** ageGroup and/or gender (use 1 or more)
**Metrics:** viewerPercentage (required)

**Note:** Values not normalized across playback detail dimensions.

### Top Playlists (<=200 results)
Requires maxResults<=200 and sort parameter.

**Dimensions:** playlist (required)
**Sorting options:** -playlistViews, -playlistEstimatedMinutesWatched, -playlistStarts

## Ad Performance Reports

**Authorization:** Requires `yt-analytics-monetary.readonly` scope

### Impression-Based Metrics
- grossRevenue
- adImpressions
- cpm

### Ad Performance by Ad Type

**Dimensions:** adType (required), day (optional)
**Filters (exactly 1):** video | group | uploaderType+claimedStatus combinations
**Optional filters:** country, continent, subContinent

---

**Last Updated:** 2025-08-28 UTC
