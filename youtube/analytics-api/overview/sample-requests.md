---
source: https://developers.google.com/youtube/analytics/sample-requests
scraped: 2026-01-07
api_provider: Google
discovery_tier: 3
verified: false
title: YouTube Analytics API Sample Requests
---
 YouTube Analytics API Sample Requests

## Overview

This documentation provides example queries for the YouTube Analytics API to retrieve channel and content owner performance data. All examples use a default date range from September 1, 2023, to March 31, 2024.

## Key Setup Information

Each example requires:
- Authentication via OAuth 2.0
- Channel ID (use `channel==MINE` for authenticated user) or Content Owner ID
- Testing through Google APIs Explorer
- Customizable parameters: dimensions, metrics, filters, and sort values

## Multi-Dimension Sorting

The API supports sorting by multiple dimensions or metrics simultaneously. Results are sorted sequentially—first by the primary sort parameter, then by secondary parameters within groups.

**Example structure:**
```
dimensions=day,insightTrafficSourceType
metrics=views,estimatedWatchTime
sort=day,-views
```

---

## Channel Reports

### Basic Statistics

#### Video Metrics
- **Total aggregated performance:** Views, comments, likes, dislikes, watch time
- **Country-specific data:** Filter by country code (e.g., `country==US`)
- **Top 10 most watched videos:** Sort by `estimatedMinutesWatched` descending
- **Annotation metrics:** Click-through rates, close rates, impressions

#### Playlist Metrics
- **Playlist overview:** Starts, watch time, views, views per start
- **Specific playlist:** Filter using `playlist==PLAYLIST_ID`
- **Top 10 playlists:** Sort by playlist views descending

### Time-Based Reports

Retrieve daily metrics with chronological sorting:
- Watch time, view counts, subscription gains
- Annotation performance by day
- Playlist engagement metrics

### Geographic Analysis

- **Country-specific metrics:** Views and watch time by nation
- **U.S. state data:** Province-level breakdown (filter by `country==US`)
- **City analysis:** Top 10 U.S. cities by views or watch time
- **Continental reports:** Filter by continent code

### Playback Location

- **Location types:** Aggregates by YouTube, embedded, external websites
- **Embedded video sources:** Top 10 external sites driving views

### Traffic Source Analysis

- **Traffic type aggregation:** YouTube search, external URLs, suggested videos
- **Search terms:** Top 10 YouTube search queries generating views
- **External referrers:** Top 10 external websites by watch time

### Device and Operating System

- **Android metrics:** Daily device type breakdown
- **Mobile OS:** Operating system performance on mobile devices
- **Combined analysis:** Daily OS and device type cross-tabulation

### Demographic Insights

Retrieve viewer age groups and gender distribution by region (e.g., California).

### Social Metrics

Sharing aggregated by service (Twitter, Facebook, etc.).

### Audience Retention

"Measures a video's ability to retain its audience" for single videos only. Supports organic view filtering.

### Revenue and Advertising

- **Channel revenue:** Estimated revenue, ad revenue, CPM, impressions
- **Daily performance:** Time-series revenue metrics
- **Country comparison:** Revenue by nation
- **Top revenue videos:** Highest-earning content
- **Ad type analysis:** Revenue and CPM by ad format

---

## Content Owner Reports

### Basic Statistics

Similar to channel reports but for claimed content or multi-channel portfolios:
- **Claimed content:** Videos the content owner claimed but didn't upload
- **Self-uploaded:** Original content only
- **Combined:** Both claimed and self-uploaded

#### Specialized Filters
```
uploaderType==self
claimedStatus==claimed
uploaderType==thirdParty
```

### Time-Based Metrics

- **Daily watch time:** Self-uploaded content performance
- **Annotation trends:** Claimed content over time
- **Playlist engagement:** Daily playlist metrics

### Geographic Reports

- **Country analysis:** Views and revenue by nation
- **U.S. geographic breakdown:** States and cities
- **Continental filtering:** Europe and other regions

### Playback Details

- **Likes/dislikes:** Aggregated by content type
- **Playback locations:** Embedded vs. YouTube native
- **Daily location trends:** Time-series by playback venue

### Traffic Sources

- **Traffic type aggregation:** YouTube search, external URLs
- **Search term tracking:** Top 10 search queries
- **Referrer analysis:** External websites driving traffic

### Device Metrics

- **Device type by OS:** Android and mobile platforms
- **Operating system trends:** Daily OS performance
- **Claimed video devices:** OS breakdowns for claimed content

### Demographics

Viewer age and gender by geography, customizable by region.

### Social Sharing

Shares aggregated by platform for self-uploaded content.

### Audience Retention

Single-video audience retention metrics with optional organic-only filtering.

### Revenue Analysis

- **Claimed content revenue:** Total metrics
- **Daily revenue:** Time-series performance
- **Country revenue:** Geographic revenue distribution
- **Top earners:** 10 highest-revenue videos
- **Ad type comparison:** Revenue and CPM by ad format

---

## Required Parameters Reference

| Parameter | Purpose | Example |
|-----------|---------|---------|
| `dimensions` | Grouping criteria | `day`, `country`, `video` |
| `metrics` | Performance indicators | `views`, `estimatedMinutesWatched` |
| `filters` | Data constraints | `country==US;claimedStatus==claimed` |
| `sort` | Result ordering | `-views` (descending) |
| `maxResults` | Result limit | `10` |
| `ids` | Channel/owner identifier | `channel==MINE` |

---

## Important Notes

- Audience retention reports support single videos only; multiple video filtering is unsupported
- Certain traffic sources (video remixes, notifications, end screens) don't support detailed reports
- All examples link to Google APIs Explorer for interactive testing
- OAuth 2.0 authentication required for all requests
