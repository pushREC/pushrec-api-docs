---
source: https://developers.google.com/youtube/reporting/v1/reference/rest/v1/jobs.reports/list
scraped: 2026-01-07
api_provider: Google
discovery_tier: 3
verified: false
---
 YouTube Reporting API: jobs.reports.list Method Documentation

## Overview

The `jobs.reports.list` method retrieves reports generated for a specified reporting job using a GET request to the `jobs/{jobId}/reports` endpoint.

## HTTP Request

```
GET https://youtubereporting.googleapis.com/v1/jobs/{jobId}/reports
```

## Authorization

All requests require OAuth 2.0 authorization with one of these scopes:

| Scope | Access Level |
|-------|--------------|
| `https://www.googleapis.com/auth/yt-analytics.readonly` | Access to user activity metrics like view and rating counts |
| `https://www.googleapis.com/auth/yt-analytics-monetary.readonly` | Access to activity metrics plus revenue and ad performance data |

## Parameters

### Path Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `jobId` | string | Yes | The unique identifier YouTube assigns to the job |

### Query Parameters

| Parameter | Type | Description |
|-----------|------|-------------|
| `createdAfter` | timestamp | Returns only reports created after this RFC3339 UTC date |
| `onBehalfOfContentOwner` | string | Content owner ID; if omitted, uses authenticated user's channel |
| `pageSize` | number | Maximum results per page; server selects default if unspecified |
| `pageToken` | string | Token for retrieving subsequent result pages |
| `startTimeAtOrAfter` | timestamp | Filters by report data start date (RFC3339 format) |
| `startTimeBefore` | timestamp | Filters by report data start date ceiling (RFC3339 format) |

## Request Body

Must be empty.

## Response Format

```json
{
  "reports": [
    {
      "id": "string",
      "jobId": "string",
      "startTime": "string",
      "endTime": "string",
      "downloadUrl": "string",
      "createTime": "string",
      "jobExpireTime": "string"
    }
  ],
  "nextPageToken": "string"
}
```

### Response Properties

| Property | Description |
|----------|-------------|
| `reports[]` | List of report resources for the specified job |
| `nextPageToken` | Token for accessing additional result pages; omitted if no more results exist |

## Example Request

```bash
curl -X GET \
  'https://youtubereporting.googleapis.com/v1/jobs/abc123/reports?startTimeAtOrAfter=2025-01-01T00:00:00Z' \
  -H 'Authorization: Bearer YOUR_ACCESS_TOKEN'
```

## Code Examples

### Python

```python
def list_reports_for_job(youtube_reporting, job_id, start_date=None):
    request_params = {'jobId': job_id}

    if start_date:
        request_params['startTimeAtOrAfter'] = start_date

    results = youtube_reporting.jobs().reports().list(
        **request_params
    ).execute()

    reports = results.get('reports', [])

    for report in reports:
        print(f"Report ID: {report['id']}")
        print(f"Period: {report['startTime']} to {report['endTime']}")
        print(f"Download URL: {report['downloadUrl']}")
        print("---")

    return reports
```

### Java

```java
ReportListResponse reportListResponse = youtubeReporting
    .jobs()
    .reports()
    .list(jobId)
    .execute();

List<Report> reports = reportListResponse.getReports();

for (Report report : reports) {
    System.out.println("Report ID: " + report.getId());
    System.out.println("Start Time: " + report.getStartTime());
    System.out.println("Download URL: " + report.getDownloadUrl());
}
```

### Complete Workflow

```python
def download_all_reports(youtube_reporting, job_id, output_dir):
    import os
    import requests

    # List all reports
    reports = []
    request = youtube_reporting.jobs().reports().list(jobId=job_id)

    while request:
        response = request.execute()
        reports.extend(response.get('reports', []))
        request = youtube_reporting.jobs().reports().list_next(request, response)

    # Download each report
    for report in reports:
        filename = f"report_{report['startTime'][:10]}.csv"
        filepath = os.path.join(output_dir, filename)

        # Download using the downloadUrl
        download_report(report['downloadUrl'], filepath)

    return len(reports)
```

## Error Handling

| Code | Status | Description |
|------|--------|-------------|
| 404 | Not Found | The specified job doesn't exist |
| 403 | Forbidden | Not authorized to access reports for this job |

## Time Filtering Examples

### Reports from last 7 days

```python
from datetime import datetime, timedelta

seven_days_ago = (datetime.utcnow() - timedelta(days=7)).strftime('%Y-%m-%dT%H:%M:%SZ')

reports = youtube_reporting.jobs().reports().list(
    jobId=job_id,
    startTimeAtOrAfter=seven_days_ago
).execute()
```

### Reports for specific date range

```python
reports = youtube_reporting.jobs().reports().list(
    jobId=job_id,
    startTimeAtOrAfter='2025-01-01T00:00:00Z',
    startTimeBefore='2025-01-31T00:00:00Z'
).execute()
```
