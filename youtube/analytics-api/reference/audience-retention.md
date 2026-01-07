---
source: https://developers.google.com/youtube/analytics/audience_retention
scraped: 2026-01-07
api_provider: Google
discovery_tier: 3
verified: false
title: YouTube Analytics API - Audience Retention
---
 YouTube Analytics API: Audience Retention

## Overview

Audience retention reports measure a video's ability to retain its audience throughout playback. These reports provide insights into which parts of a video viewers watch, rewatch, or skip.

## Key Concepts

### Retention Ratio

The audience retention data shows what percentage of viewers are watching at each point in the video relative to the total number of views.

### 100 Data Points

Audience retention data is divided into 100 equal segments across the video duration, regardless of video length. Each segment is identified by the `elapsedVideoTimeRatio` dimension.

## Required Dimension

**elapsedVideoTimeRatio**: A ratio value from 0.01 to 1.0 representing the position in the video:
- 0.01 = 1% through the video
- 0.50 = 50% through the video (midpoint)
- 1.0 = 100% (end of video)

## Available Metrics

### audienceWatchRatio

"The absolute ratio of viewers watching the video at the given point in the video" compared to total views.

- Values can exceed 1.0 when viewers rewatch segments
- Value of 1.5 means 150% of viewers watched that segment (some rewatched)
- Value of 0.3 means only 30% of viewers reached that point

### relativeRetentionPerformance

Comparative metric showing how well your video retains viewers compared to similar-length YouTube videos.

- Scale: 0 to 1
- 0.5 = median performance (average retention for videos of similar length)
- Above 0.5 = better than average retention
- Below 0.5 = worse than average retention

### startedWatching

Count of viewers who started watching at this segment.

- High values at the beginning indicate most viewers start from the start
- Spikes later in the video indicate viewers skipping ahead or using timestamps

### stoppedWatching

Count of viewers who stopped watching at this segment.

- High values indicate drop-off points
- Useful for identifying where viewers lose interest

### totalSegmentImpressions

Total number of times this segment was viewed, including rewatches.

- Higher than view count for rewatched segments
- Useful for identifying highly engaging portions

## Report Constraints

### Single Video Only

Audience retention reports only support filtering by a single video ID. You cannot use comma-separated video IDs.

**Valid:**
```
filters=video==VIDEO_ID
```

**Invalid:**
```
filters=video==VIDEO_ID1,VIDEO_ID2
```

### Optional Filter: audienceType

Filter by how viewers discovered the video (available since September 25, 2013):

- `ORGANIC` - Natural discovery (search, browse, suggested)
- `AD_INSTREAM` - In-stream advertisement views
- `AD_INDISPLAY` - Display advertisement views

## Sample Request

```http
GET https://youtubeanalytics.googleapis.com/v2/reports
  ?ids=channel==MINE
  &startDate=2024-01-01
  &endDate=2024-01-31
  &dimensions=elapsedVideoTimeRatio
  &metrics=audienceWatchRatio,relativeRetentionPerformance
  &filters=video==VIDEO_ID
  &sort=elapsedVideoTimeRatio
```

## Sample Response

```json
{
  "kind": "youtubeAnalytics#resultTable",
  "columnHeaders": [
    {"name": "elapsedVideoTimeRatio", "columnType": "DIMENSION", "dataType": "FLOAT"},
    {"name": "audienceWatchRatio", "columnType": "METRIC", "dataType": "FLOAT"},
    {"name": "relativeRetentionPerformance", "columnType": "METRIC", "dataType": "FLOAT"}
  ],
  "rows": [
    [0.01, 1.0, 0.52],
    [0.02, 0.95, 0.51],
    [0.03, 0.92, 0.50],
    [0.10, 0.75, 0.48],
    [0.25, 0.60, 0.45],
    [0.50, 0.45, 0.42],
    [0.75, 0.35, 0.40],
    [1.0, 0.25, 0.38]
  ]
}
```

## Interpreting Results

### Healthy Retention Pattern

- Gradual decline from start to end
- No sudden drop-offs
- relativeRetentionPerformance stays near or above 0.5

### Problem Indicators

- **Sharp early drop-off**: First 10% shows steep decline (misleading thumbnail/title)
- **Mid-video cliff**: Sudden drop at specific point (boring segment, off-topic content)
- **Below 0.5 relative performance**: Video underperforming compared to similar videos

### Positive Indicators

- **High rewatch segments**: audienceWatchRatio > 1.0 (engaging content worth rewatching)
- **Flat retention curve**: Viewers staying through to the end
- **Above 0.5 relative performance**: Video outperforming similar videos

## Use Cases

1. **Identify engaging moments**: High audienceWatchRatio or totalSegmentImpressions
2. **Find drop-off points**: High stoppedWatching values
3. **Optimize video length**: Where does retention plateau?
4. **Compare performance**: Use relativeRetentionPerformance for benchmarking
5. **Improve intros**: Analyze early retention to optimize opening hooks
