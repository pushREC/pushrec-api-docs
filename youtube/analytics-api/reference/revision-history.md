---
title: YouTube Analytics API - Revision History
source: https://developers.google.com/youtube/analytics/revision_history
api: youtube-analytics
scraped: 2026-01-07
---

# YouTube Analytics and Reporting APIs - Revision History

## Overview

This document chronicles API changes and documentation updates for both the YouTube Reporting API (Bulk Reports) and YouTube Analytics API (Targeted Queries).

## Recent Major Changes

### September 22, 2025
The deprecation of reports was delayed from September 30 to October 31, 2025. Previous report versions supporting Shorts viewcount changes remain available, except Claims reports v1.0 and v1.1, which still deprecate September 30.

### June 24, 2025
New report versions implemented Shorts viewcount changes:
- Reports with views incremented versions (e.g., `a2` to `a3`)
- For Shorts, views now count starts/replays without minimum watch time
- New `engaged_views` column reflects previous methodology
- Effective June 30, 2025

### April 24, 2025
Targeted Queries API updated for Shorts viewcount changes. The new `engagedViews` metric reflects previous counting methodology alongside updated `views`.

### April 22, 2025
The `isCurated` dimension deprecated for channel reports and content owner playlist reports as of December 31, 2024.

### March 26, 2025
YouTube changed Shorts view counting methodology. New metric `engagedViews` preserves previous calculation. Updates rolled out April 30 (Targeted Queries) and June 30 (Bulk Reports).

### March 3, 2025
Daily Claims (Version 1.0) report deprecated for partners, discontinued April 30, 2025.

### November 15, 2024
Traffic Source reports now return errors when product of queried videos x date range days exceeds 50,000.

## Key Historical Updates

### May 6, 2024
Three new channel reports introduced:
- User activity by DMA
- Concurrent viewers
- Member Cancellations (with new dimension `membershipsCancellationSurveyReason`)

### April 7, 2024
Content owner playlist reports align with channel playlist updates. The `isCurated` dimension support extends through December 31, 2024.

### January 19, 2024
Channel playlist reports deprecated `isCurated` dimension (effective June 30, 2024). New in-playlist metrics introduced:
- `playlistAverageViewDuration`
- `playlistEstimatedMinutesWatched`
- `playlistSaves`
- `playlistViews`

### December 15, 2016
Seven deprecated channel reports and seven content owner reports removed from documentation.

### April 26, 2018
YouTube Analytics API v2 launched with significant changes:
- Base URL changed to `https://youtubeanalytics.googleapis.com/v2`
- Parameter names converted from hyphens to camelCase
- v1 deprecated until October 31, 2018

### September 24, 2015
YouTube Reporting API introduced for bulk data access alongside Targeted Queries API.

## Deprecated Features Timeline

| Feature | Deprecation Date | Replacement |
|---------|------------------|-------------|
| `earnings` metric | August 10, 2017 | `estimatedRevenue` |
| `7DayTotals`/`30DayTotals` dimensions | April 15, 2020 | Use `day` dimension |
| v1 Analytics API | October 31, 2018 | v2 API |
| `isCurated` dimension (channels) | June 30, 2024 | New in-playlist metrics |
| `isCurated` dimension (content owners) | December 31, 2024 | New in-playlist metrics |

## Traffic Source Updates

Recent additions include:

| Traffic Source | Date Added |
|----------------|------------|
| Podcasts | August 2022 |
| Live Redirects | February 2022 |
| Shorts viewing | September 2020 |
| End screens | August 2016 |
| Hashtags | - |
| Sound pages | - |
| Product pages | - |

## Shorts View Count Changes (2025)

### Before Change
- Views counted when user watched for a minimum duration
- Applied to both regular videos and Shorts

### After Change (Effective 2025)
- **Shorts**: Views count on start/replay without minimum watch time
- **Regular videos**: No change to counting methodology
- New `engagedViews` metric provides previous counting methodology

### Migration Timeline
1. **March 26, 2025**: Announcement
2. **April 30, 2025**: Targeted Queries API updated
3. **June 30, 2025**: Bulk Reports updated
4. **October 31, 2025**: Old report versions deprecated

## Version History Summary

### API Versions

| Version | Status | End of Life |
|---------|--------|-------------|
| v1 | Deprecated | October 31, 2018 |
| v2 | Current | Active |

### Base URLs

- **v1 (deprecated)**: `https://www.googleapis.com/youtube/analytics/v1`
- **v2 (current)**: `https://youtubeanalytics.googleapis.com/v2`

## Subscribe to Changes

RSS feed available for revision history updates at:
```
/static/youtube/analytics/feeds/analytics-api-revision-history.xml
```

## Best Practices for API Updates

1. **Monitor revision history**: Subscribe to RSS feed for updates
2. **Plan for deprecations**: Allow 6+ months for migration
3. **Test with new metrics**: When new metrics are added, integrate them gradually
4. **Update dependencies**: Keep client libraries current
5. **Review dimension changes**: Check for deprecated dimensions in your queries
