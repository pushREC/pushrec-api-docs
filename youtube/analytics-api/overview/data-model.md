---
title: YouTube Analytics API - Data Model
source: https://developers.google.com/youtube/analytics/data_model
api: youtube-analytics
scraped: 2026-01-07
---

# YouTube Analytics API - Data Model Documentation

## Overview

The YouTube Analytics API enables creation of custom reports containing YouTube Analytics data for both channels and content owners. Reports organize data using two fundamental concepts:

**Dimensions** aggregate data by common criteria (e.g., dates, countries). Each report row contains a unique dimension combination, which determines how metric values are calculated.

**Metrics** represent individual measurements related to user activity, ad performance, or estimated revenue—including views, likes, and watch time.

## Core Report Parameters

The `reports.query` method uses five key parameters:

- **startDate/endDate**: Define the reporting period. Responses include data through the last day where all queried metrics are available.
- **metrics**: Specify measurements to include (views, likes, estimated revenue, etc.)
- **dimensions**: Explain how metrics will be grouped in results
- **filters**: Restrict data by specific criteria (country, video, device type)

### Filter Capabilities

Filters support multiple values for video, playlist, and channel dimensions. When a filtered dimension also appears in the dimensions parameter, returned metrics are grouped by that dimension.

## Report Examples

A device type report might use:
- Dimensions: `deviceType` or `day,deviceType`
- Metrics: `views,estimatedMinutesWatched`
- Filters: operating system, country, or specific videos

## Data Limitations

### Deleted Items & Aggregation

"YouTube Analytics API responses do not contain metric breakdowns for deleted items." Aggregate reports still include deleted content metrics, but per-item breakdowns exclude them. This can create discrepancies between aggregate and detailed reports.

### Data Anonymization Thresholds

Limited data may appear when:
- Videos/channels have low traffic during the period
- Selected filters don't meet minimum thresholds

Affected data types include demographics, geography (except revenue metrics), and traffic sources.

## Best Practices

- Use response header rows to determine column ordering—don't assume metric sequence
- Refresh resource metadata from YouTube Data API every 30 days per developer policies

## Quota Management

Each API request counts as one unit against your quota, visible in the Google API Console's Quotas panel.
