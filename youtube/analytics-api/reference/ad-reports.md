---
source: https://developers.google.com/youtube/analytics/ad_reports
scraped: 2026-01-07
api_provider: Google
discovery_tier: 3
verified: false
title: YouTube Analytics API - Ad Reports
---
 YouTube Analytics API: Ad Reports Documentation

## Overview

Ad performance reports provide impression-based metrics for ads that ran during video playbacks. These metrics account for each ad impression, and each video playback can yield multiple impressions.

**Available For**: Content owners only (available through both Analytics and Reporting APIs)

## Authorization Requirements

Ad reports require the `yt-analytics-monetary.readonly` OAuth scope:

```
https://www.googleapis.com/auth/yt-analytics-monetary.readonly
```

## Ad Performance Metrics

### Primary Metrics

| Metric | Analytics API | Reporting API | Description |
|--------|---------------|---------------|-------------|
| Ad Impressions | `adImpressions` | `ad_impressions` | Total verified ad impression count |
| CPM | `cpm` | `estimated_cpm` | Gross revenue per 1,000 impressions |
| Estimated Ad Revenue | `estimatedAdRevenue` | `estimated_partner_ad_revenue` | Net revenue from Google-sold ads |
| Gross Revenue | `grossRevenue` | `estimated_youtube_ad_revenue` | Gross revenue from all ad sources |
| Playback-Based CPM | `playbackBasedCpm` | `estimated_playback_based_cpm` | Revenue per 1,000 monetized playbacks |
| Monetized Playbacks | `monetizedPlaybacks` | `estimated_monetized_playbacks` | Playbacks with at least one ad |

### Understanding Impression vs Playback Metrics

**Impression-based metrics** (`adImpressions`, `cpm`):
- Count each individual ad shown
- Multiple impressions possible per video playback
- Best for measuring ad delivery volume

**Playback-based metrics** (`monetizedPlaybacks`, `playbackBasedCpm`):
- Count video playbacks that showed at least one ad
- One playback = one count regardless of ads shown
- Best for measuring monetization rate

## Ad Types (adType Dimension)

The `adType` dimension categorizes advertisements:

### Auction Ads
- `auctionBumperInstream` - 6-second non-skippable bumper ads (auction)
- `auctionDisplay` - Display/overlay ads (auction)
- `auctionInstream` - Standard in-stream ads (auction)
- `auctionTrueviewInslate` - TrueView in-slate ads (auction)
- `auctionTrueviewInstream` - Skippable TrueView in-stream ads (auction)
- `auctionUnknown` - Other auction ad types

### Reserved Ads
- `reservedBumperInstream` - 6-second bumper ads (reserved)
- `reservedClickToPlay` - Click-to-play ads (reserved)
- `reservedDisplay` - Display ads (reserved)
- `reservedInstream` - In-stream ads (reserved)
- `reservedMasthead` - YouTube homepage masthead ads
- `reservedUnknown` - Other reserved ad types

### Other
- `unknown` - Unclassified ad types

## Ad Performance Reports

### Basic Ad Performance

```http
GET https://youtubeanalytics.googleapis.com/v2/reports
  ?ids=contentOwner==OWNER_ID
  &startDate=2024-01-01
  &endDate=2024-01-31
  &dimensions=adType
  &metrics=grossRevenue,adImpressions,cpm
```

### Daily Ad Performance

```http
GET https://youtubeanalytics.googleapis.com/v2/reports
  ?ids=contentOwner==OWNER_ID
  &startDate=2024-01-01
  &endDate=2024-01-31
  &dimensions=day,adType
  &metrics=grossRevenue,adImpressions,cpm
  &sort=day
```

### Ad Performance by Country

```http
GET https://youtubeanalytics.googleapis.com/v2/reports
  ?ids=contentOwner==OWNER_ID
  &startDate=2024-01-01
  &endDate=2024-01-31
  &dimensions=country,adType
  &metrics=grossRevenue,adImpressions,cpm
  &filters=country==US
```

### Ad Performance by Video

```http
GET https://youtubeanalytics.googleapis.com/v2/reports
  ?ids=contentOwner==OWNER_ID
  &startDate=2024-01-01
  &endDate=2024-01-31
  &dimensions=video,adType
  &metrics=grossRevenue,adImpressions
  &filters=video==VIDEO_ID
```

### Top Videos by Ad Revenue

```http
GET https://youtubeanalytics.googleapis.com/v2/reports
  ?ids=contentOwner==OWNER_ID
  &startDate=2024-01-01
  &endDate=2024-01-31
  &dimensions=video
  &metrics=grossRevenue,adImpressions,cpm
  &sort=-grossRevenue
  &maxResults=10
```

## Channel Ad Reports

For channel owners (limited compared to content owners):

```http
GET https://youtubeanalytics.googleapis.com/v2/reports
  ?ids=channel==MINE
  &startDate=2024-01-01
  &endDate=2024-01-31
  &dimensions=adType
  &metrics=grossRevenue,adImpressions,cpm
```

**Note**: Channel ad reports may have limited metrics compared to content owner reports.

## Content Owner Filters

### Self-Uploaded Content
```
filters=uploaderType==self
```

### Claimed Third-Party Content
```
filters=claimedStatus==claimed
```

### Combined Filter
```
filters=uploaderType==thirdParty;claimedStatus==claimed
```

## System-Managed Ad Revenue Reports

Available through the YouTube Reporting API only, system-managed reports provide:
- **Actual revenue data** (not estimated)
- Asset and video-level earnings
- Available for content owners with Creator Studio access

## Sample Response

```json
{
  "kind": "youtubeAnalytics#resultTable",
  "columnHeaders": [
    {"name": "adType", "columnType": "DIMENSION", "dataType": "STRING"},
    {"name": "grossRevenue", "columnType": "METRIC", "dataType": "FLOAT"},
    {"name": "adImpressions", "columnType": "METRIC", "dataType": "INTEGER"},
    {"name": "cpm", "columnType": "METRIC", "dataType": "FLOAT"}
  ],
  "rows": [
    ["auctionTrueviewInstream", 15234.50, 2500000, 6.09],
    ["auctionDisplay", 8765.25, 5000000, 1.75],
    ["auctionBumperInstream", 5432.10, 1800000, 3.02],
    ["reservedInstream", 3210.75, 500000, 6.42]
  ]
}
```

## Important Notes

1. **Multiple Impressions**: A single video playback can generate multiple ad impressions (pre-roll, mid-roll, post-roll, display)

2. **Revenue Timing**: Ad revenue is estimated and subject to month-end adjustment

3. **Excluded Revenue**:
   - Partner-sold advertising not included
   - Partner-served advertising not included

4. **CPM Calculation**: `cpm = (grossRevenue / adImpressions) * 1000`

5. **Monetization Eligibility**: Not all videos or playbacks are monetized; ad serving depends on multiple factors

## Best Practices

1. **Compare ad types**: Analyze which ad formats generate the most revenue
2. **Monitor CPM trends**: Track CPM changes over time and by geography
3. **Optimize ad placement**: Use data to inform mid-roll placement decisions
4. **Geographic analysis**: Different regions have different CPM rates
5. **Content strategy**: Identify which content types attract higher-value ads
