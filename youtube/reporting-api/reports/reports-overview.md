---
source: https://developers.google.com/youtube/reporting/v1/reports
scraped: 2026-01-07
api_provider: Google
discovery_tier: 3
verified: false
---
 YouTube Reporting API - Bulk Data Reports Overview

## Core Functionality

The YouTube Reporting API enables retrieval of predefined reports containing comprehensive YouTube Analytics data for channels or content owners. Reports are delivered as CSV files covering 24-hour periods, with daily updates and 30-60 day accessibility windows depending on report type.

## Report Structure

### Dimensions (Aggregation Criteria)

Each row of data has a unique combination of dimension values that functions as the primary key:

- `day` - 24-hour Pacific time period
- `channel` - Channel identifier
- `video` - Video identifier
- `liveOrOnDemand` - Content type
- `subscribedStatus` - Viewer subscription status
- `country` - Geographic location (country level)
- `province` - Geographic location (state/province level)
- `ageGroup` - Viewer age range
- `gender` - Viewer gender
- `trafficSourceType` - How viewers found the content
- `trafficSourceDetail` - Specific referral source

### Metrics (Measurements)

- **User activity**: views, likes, dislikes, comments, averageViewDuration
- **Ad performance and revenue data**
- **Subscriber metrics**: subscribersGained, subscribersLost
- **YouTube Premium subscription revenue**

## Report Types

### Channel Reports
Basic user activity and performance data for individual channels.

### Content Owner Reports
Aggregated data across multiple channels and associated properties.

### System-Managed Reports
Automatically generated reports for content owners, including:
- Financial data
- Ads revenue
- Subscriptions
- Premium revenue

## Implementation Process

The six-step retrieval workflow:

1. **Obtain OAuth 2.0 credentials** - Set up authentication
2. **Identify report type** - Call `reportTypes.list()` to see available reports
3. **Create job** - Use `jobs.create()` to schedule report generation
4. **Retrieve job ID** - Store the job identifier for future requests
5. **Get download URL** - Call `jobs.reports.list()` to get report metadata
6. **Download CSV** - HTTP GET request to the download URL

## Key Characteristics

### Data Timing
- Reports contain data for unique 24-hour periods (PST)
- YouTube generates reports even for zero-data days (header only)
- Reports are typically available within 24 hours of job creation

### Data Retention
- Historical reports (30-day backfill) remain accessible for 30 days
- Standard reports remain accessible for 60 days
- Backfill data replaces previous datasets automatically

## Privacy Protections

Certain dimension values are anonymized when associated metrics fall below privacy thresholds:
- Geographic values may show `ZZ` instead of actual country/region
- Other dimensions may show `NULL` values
- This protects viewer anonymity while maintaining data utility

## Download Optimization

To reduce bandwidth consumption, requests may include the `Accept-Encoding: gzip` header. This enables compression, though applications require additional CPU resources for decompression.

## CSV Format

Reports are delivered as CSV files with:
- Header row containing dimension and metric names
- Data rows with values corresponding to headers
- UTF-8 encoding
- Underscore naming convention (e.g., `video_id`, `watch_time_minutes`)
