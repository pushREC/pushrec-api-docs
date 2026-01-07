---
source: https://developers.google.com/youtube/analytics/v2/quotas
scraped: 2026-01-07
api: youtube-reporting
type: quotas
---

# YouTube Reporting API - Quota Documentation

## Overview

The YouTube Reporting API handles quotas differently from real-time APIs like the YouTube Analytics API or YouTube Data API.

## Reporting API Quota Model

"Quota usage is not an issue because data is retrieved once and then filtered, sorted, and queried within the application."

The Reporting API uses asynchronous batch downloads rather than direct API requests, which means:

- **No per-query quota costs** for data retrieval
- **Bulk downloads** of complete datasets
- **Local processing** after download

## How It Works

1. **Job Creation**: Creating a reporting job has minimal quota impact
2. **Report Generation**: YouTube generates reports automatically (no quota cost)
3. **Download**: Downloading reports is a simple HTTP GET request
4. **Processing**: All filtering, sorting, and analysis happens locally

## Comparison with Analytics API

| Aspect | Reporting API | Analytics API |
|--------|---------------|---------------|
| Data retrieval | Bulk download | Real-time queries |
| Quota model | Minimal | Per-query cost |
| Data filtering | Local (after download) | Server-side (in query) |
| Best for | Large datasets | Specific queries |

## Rate Limits

While the Reporting API doesn't have traditional quota costs, standard rate limits apply:

- **API calls**: Subject to Google Cloud project rate limits
- **Concurrent downloads**: Limited by HTTP connection constraints
- **File size**: Reports can be large; use compression headers

## Best Practices for Efficient Usage

### Download Optimization

```bash
# Use gzip compression to reduce bandwidth
curl -H "Accept-Encoding: gzip" \
     -H "Authorization: Bearer TOKEN" \
     "DOWNLOAD_URL" -o report.csv.gz
```

### Batch Processing

```python
# Download reports in batches, not individually
def download_all_reports(youtube_reporting, job_id):
    reports = list_all_reports(youtube_reporting, job_id)

    for report in reports:
        download_report(report['downloadUrl'], output_dir)

    # Process all reports locally
    analyze_reports(output_dir)
```

### Date Filtering

```python
# Only download reports you need
reports = youtube_reporting.jobs().reports().list(
    jobId=job_id,
    startTimeAtOrAfter='2025-01-01T00:00:00Z',
    startTimeBefore='2025-01-31T00:00:00Z'
).execute()
```

## Data Retention Limits

| Report Type | Retention Period |
|-------------|------------------|
| Backfill (historical) | 30 days |
| Standard reports | 60 days |
| System-managed | Varies by type |

## Job Expiration

Jobs may expire if:
- Reports haven't been downloaded for an extended period
- The report type has been deprecated

Monitor job expiration with the `expireTime` property.

## Traffic Source Report Limits

**Note (November 2024)**: Traffic Source reports return errors if the product of queried videos multiplied by days exceeds 50,000.

Example limits:
- 500 videos x 100 days = 50,000 (at limit)
- 1000 videos x 50 days = 50,000 (at limit)
- 100 videos x 500 days = 50,000 (at limit)

## YouTube Data API Quota (Reference)

For comparison, the YouTube Data API (separate from Reporting API) has:
- Default quota: 10,000 units per day
- Read operations: ~1 unit
- Write operations: ~50 units
- Search operations: ~100 units

The Reporting API does not use this quota model.
