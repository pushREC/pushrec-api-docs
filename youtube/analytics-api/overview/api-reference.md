---
title: YouTube Analytics and Reporting APIs - API Reference Overview
source: https://developers.google.com/youtube/analytics/v2/reference
api: youtube-analytics
scraped: 2026-01-07
---

# YouTube Analytics and Reporting APIs - Documentation Summary

## Overview

This page introduces Google's two complementary APIs for accessing YouTube Analytics data. Both support channel owners and content owners in retrieving performance metrics, though they differ significantly in approach and capabilities.

## Key APIs

### YouTube Analytics API
- **Purpose**: Real-time targeted queries for custom reports
- **Data Retrieval**: Direct requests specifying dimensions, metrics, and date ranges
- **Filtering**: Built-in support with filter parameters
- **Sorting**: Supported with limited result sets (e.g., max 200 rows for top videos)
- **Aggregation**: Supports weekly and monthly data aggregation

### YouTube Reporting API
- **Purpose**: Bulk data downloads for large predefined datasets
- **Data Retrieval**: Scheduled jobs generating daily reports for asynchronous download
- **Filtering**: Client-side implementation required
- **Processing**: Applications handle sorting and filtering internally
- **Unique Feature**: Access to system-managed ad revenue reports

## Report Types

Both APIs support these report categories:

1. **Video Reports** - User activity metrics for videos
2. **Playlist Reports** - Playlist-specific statistics
3. **Ad Performance Reports** - Impression-based ad metrics (content owners)
4. **Estimated Revenue Reports** - Revenue data (Reporting API only)
5. **Asset Reports** - Metrics for claimed videos (Reporting API only)
6. **System-Managed Reports** - Actual revenue data (Reporting API only)

## Critical Differences

| Feature | Analytics API | Reporting API |
|---------|---------------|---------------|
| **Query Model** | Direct requests | Scheduled jobs |
| **Granularity** | Month/week/day | Daily only |
| **Naming Convention** | camelCase | lowercase_underscores |
| **Quota Costs** | Per-query evaluation | No per-query cost |

## Naming Conventions

The APIs use different identifier formats:

- Analytics: `video`, `adType`, `audienceWatchRatio`
- Reporting: `video_id`, `ad_type`, `audience_retention_percentage`

**Note**: Some conversions exceed simple camelCase-to-underscore transformation (e.g., `video` -> `video_id`).

## Authorization

"All YouTube Analytics and YouTube Reporting API requests must be authorized by the channel or content owner that owns the requested data."

## Data Concepts

- **Dimensions**: Aggregation criteria (date, country, device type)
- **Metrics**: Individual measurements (views, watch time, revenue estimates)
