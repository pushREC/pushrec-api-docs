---
source: https://developers.google.com/youtube/analytics/revenue_reports
scraped: 2026-01-07
api_provider: Google
discovery_tier: 3
verified: false
title: YouTube Analytics API - Revenue Reports
---
 YouTube Analytics API: Revenue Reports Documentation

## Overview

Revenue reports provide estimated earnings data for content owners and monetized channels. This documentation covers the revenue metrics, dimensions, and report types available through the YouTube Analytics API.

## Authorization Requirements

Revenue reports require the `yt-analytics-monetary.readonly` OAuth scope:

```
https://www.googleapis.com/auth/yt-analytics-monetary.readonly
```

## Key Differences Between APIs

### YouTube Analytics API
- Supports real-time, targeted queries with custom report generation
- Includes built-in filtering and sorting capabilities
- Retrieves weekly and monthly datasets
- Uses camelCase naming (e.g., `estimatedRevenue`)

### YouTube Reporting API
- Designed for bulk data retrieval of predefined datasets
- Requires applications to handle filtering and sorting internally
- Provides daily reports through scheduled jobs
- Uses lowercase_underscore naming (e.g., `estimated_revenue`)
- **Unique feature:** Provides system-managed reports with actual revenue data

## Revenue Metrics

### Estimated Revenue Metrics

**estimatedRevenue**: "The total estimated net revenue from all Google-sold advertising sources as well as from non-advertising sources for the selected date range and region."

**estimatedAdRevenue**: Net revenue from Google-sold advertising exclusively.

**estimatedRedPartnerRevenue**: Revenue from YouTube Premium subscriptions across music and non-music content.

### Gross Revenue Metrics

**grossRevenue**: Estimated gross revenue in USD from Google-sold or DoubleClick partner-sold ads. Excludes partner-served advertising.

### Performance Metrics

**cpm**: Estimated gross revenue per thousand ad impressions.

**playbackBasedCpm**: Gross revenue per thousand monetized playbacks.

**monetizedPlaybacks**: Number of playbacks that displayed at least one ad impression (+/- 2.0% expected error).

**adImpressions**: Verified count of served ad impressions.

## Metric Mapping Between APIs

| YouTube Analytics API | YouTube Reporting API |
|-----------------------|----------------------|
| `estimatedAdRevenue` | `estimated_partner_ad_revenue` |
| `estimatedRevenue` | `estimated_partner_revenue` |
| `cpm` | `estimated_cpm` |
| `monetizedPlaybacks` | `estimated_monetized_playbacks` |
| `playbackBasedCpm` | `estimated_playback_based_cpm` |

### Unique Reporting API Metrics
- `estimated_partner_adsense_revenue`
- `estimated_partner_doubleclick_revenue`
- `estimated_youtube_ad_revenue`

## Report Dimensions

### Time-Based Dimensions
- `day` - Daily aggregation
- `month` - Monthly aggregation

### Content Dimensions
- `video` - Individual video ID
- `playlist` - Playlist ID
- `channel` - Channel ID

### Content Owner Dimensions
- `asset` - Asset ID (content owners only)
- `claimedStatus` - Filter for claimed content
- `uploaderType` - Filter for self vs. third-party uploads

### Geographic Dimensions
- `country` - ISO 3166-1 two-letter country code
- `continent` - UN statistical region code
- `subContinent` - UN statistical sub-region code

### Ad Dimensions
- `adType` - Type of advertisement displayed

## Report Types

### Channel Revenue Reports

Basic revenue report for channel owners:

```http
GET https://youtubeanalytics.googleapis.com/v2/reports
  ?ids=channel==MINE
  &startDate=2024-01-01
  &endDate=2024-01-31
  &metrics=estimatedRevenue,estimatedAdRevenue,grossRevenue
```

### Daily Revenue Report

```http
GET https://youtubeanalytics.googleapis.com/v2/reports
  ?ids=channel==MINE
  &startDate=2024-01-01
  &endDate=2024-01-31
  &dimensions=day
  &metrics=estimatedRevenue,cpm,monetizedPlaybacks
  &sort=day
```

### Revenue by Country

```http
GET https://youtubeanalytics.googleapis.com/v2/reports
  ?ids=channel==MINE
  &startDate=2024-01-01
  &endDate=2024-01-31
  &dimensions=country
  &metrics=estimatedRevenue,views
  &sort=-estimatedRevenue
  &maxResults=10
```

### Revenue by Video

```http
GET https://youtubeanalytics.googleapis.com/v2/reports
  ?ids=channel==MINE
  &startDate=2024-01-01
  &endDate=2024-01-31
  &dimensions=video
  &metrics=estimatedRevenue,estimatedAdRevenue
  &sort=-estimatedRevenue
  &maxResults=10
```

### Revenue by Ad Type

```http
GET https://youtubeanalytics.googleapis.com/v2/reports
  ?ids=channel==MINE
  &startDate=2024-01-01
  &endDate=2024-01-31
  &dimensions=adType
  &metrics=grossRevenue,adImpressions,cpm
```

## Content Owner Revenue Reports

Content owners can access additional revenue data:

```http
GET https://youtubeanalytics.googleapis.com/v2/reports
  ?ids=contentOwner==OWNER_ID
  &startDate=2024-01-01
  &endDate=2024-01-31
  &metrics=estimatedRevenue,grossRevenue
  &filters=uploaderType==self
```

### Claimed Content Revenue

```http
GET https://youtubeanalytics.googleapis.com/v2/reports
  ?ids=contentOwner==OWNER_ID
  &startDate=2024-01-01
  &endDate=2024-01-31
  &metrics=estimatedRevenue
  &filters=claimedStatus==claimed
```

## System-Managed Reports

**Available through YouTube Reporting API only:**

Content owners with Creator Studio access can retrieve "actual revenue data earned by assets and videos" through system-managed reports. These contain:
- Actual revenue (not estimated)
- Asset-level earnings
- Video-level earnings
- Lists of claimed videos
- Asset match information

## Important Notes

### Revenue Data Characteristics

1. **Currency**: All revenue reported in USD by default. Use `currency` parameter for conversion.

2. **Estimation**: Revenue figures are estimates and subject to month-end adjustment.

3. **Excluded Revenue**:
   - Partner-sold advertising
   - Partner-served advertising

4. **Data Delay**: Revenue data may have a 24-72 hour delay from actual earnings.

### Best Practices

1. Use monthly aggregation for financial reporting
2. Compare revenue trends over time rather than absolute values
3. Combine with view metrics for RPM analysis
4. Monitor CPM trends by geography and ad type
