---
source: https://developers.google.com/youtube/reporting/v1/reports/content_owner_reports
scraped: 2026-01-07
api_provider: Google
discovery_tier: 3
verified: false
---
 YouTube Content Owner Reports Documentation

## Overview

The YouTube Reporting API provides content owners comprehensive analytics through bulk data reports covering video performance, playlist metrics, ad rates, and revenue data.

## Report Categories

### Video Reports

Track user activity across all content owner videos with these key report types:

#### User Activity (`content_owner_basic_a4`)

Provides user activity statistics related to a content owner's channels including:
- Views and watch time
- Engagement metrics
- Annotation/card performance

#### Playback Locations (`content_owner_playback_location_a3`)

Measures where videos play:
- YouTube homepage
- Embedded sites
- Channel pages
- Search results

#### Traffic Sources (`content_owner_traffic_source_a3`)

Identifies how viewers discover videos:
- YouTube search
- Related videos
- Browse features
- External referrals
- Advertising

#### Device & OS (`content_owner_device_os_a3`)

Segments viewing by:
- Device type (mobile, desktop, TV, tablet)
- Operating system

#### Demographics (`content_owner_demographics_a1`)

Shows viewer distribution by:
- Age group
- Gender

### Asset-Specific Reports

Track individual element performance:
- **Annotations**: Display and interaction metrics
- **Cards**: Impression and click data
- **End Screens**: Post-video element performance
- **Subtitles**: Caption language analytics

### Playlist Reports

Mirror video reports but focus on playlist-specific interactions:
- Playlist starts
- Playlist saves
- In-playlist viewing patterns

### Ad & Revenue Reports

#### Ad Rates (`content_owner_ad_rates_a1`)

- CPM (cost per thousand impressions)
- Total impressions
- Estimated YouTube ad revenue

#### Estimated Video Revenue (`content_owner_estimated_revenue_a1`)

Total earnings from:
- Ads
- Non-advertising sources (e.g., YouTube Premium)

#### Estimated Asset Revenue (`content_owner_asset_estimated_revenue_a1`)

Earnings tied to specific claimed assets.

## Key Metrics

### User Activity Metrics
- Views
- Watch time
- Engagement rates
- Comments
- Shares
- Subscriber changes

### Annotation/Card Metrics
- Impressions
- Clicks
- Click-through rates

### Revenue Metrics
- Estimated partner revenue
- Estimated ad revenue
- YouTube Premium revenue

## Report ID Summary

| Category | Report ID |
|----------|-----------|
| Basic User Activity | `content_owner_basic_a4` |
| Playback Locations | `content_owner_playback_location_a3` |
| Traffic Sources | `content_owner_traffic_source_a3` |
| Device/OS | `content_owner_device_os_a3` |
| Demographics | `content_owner_demographics_a1` |
| Ad Rates | `content_owner_ad_rates_a1` |
| Estimated Revenue | `content_owner_estimated_revenue_a1` |
| Asset Revenue | `content_owner_asset_estimated_revenue_a1` |

## Access Requirements

- OAuth 2.0 authentication required
- Content owner must have appropriate YouTube Partner Program access
- Revenue reports require `yt-analytics-monetary.readonly` scope
- Reports retrieved via `reportTypes.list` method using provided report IDs

## Content Owner-Specific Dimensions

| Dimension | Values | Description |
|-----------|--------|-------------|
| `claimed_status` | `claimed` | Only includes claimed content |
| `uploader_type` | `self`, `thirdParty` | Distinguishes own uploads from claimed third-party content |
