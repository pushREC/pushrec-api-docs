---
source: https://developers.google.com/youtube/reporting/v1/reference/rest/v1/jobs.reports
scraped: 2026-01-07
api_provider: Google
discovery_tier: 3
verified: false
---
 YouTube Reporting API: jobs.reports Resource Documentation

## Overview

The `report` resource represents a specific instance of a generated report, identifying the data period and download location.

## Methods

| Method | Endpoint | Purpose |
|--------|----------|---------|
| `get` | `GET /v1/jobs/{jobId}/reports/{reportId}` | Retrieves the metadata for a specific report |
| `list` | `GET /v1/jobs/{jobId}/reports` | Lists reports that have been generated for the specified reporting job |

## Resource Properties

The report resource JSON structure contains these fields:

| Property | Type | Description |
|----------|------|-------------|
| `id` | string | The ID that YouTube assigns to uniquely identify the report. Each report associates with a single job. |
| `jobId` | string | The ID of the job that created this report. |
| `startTime` | timestamp | Report period beginning, formatted as RFC3339 UTC "Zulu" format. |
| `endTime` | timestamp | Report period conclusion, exclusive value in RFC3339 UTC format. |
| `createTime` | timestamp | The date and time that the report was created, in RFC3339 UTC format. |
| `jobExpireTime` | timestamp | When the associated job expires. The value marks the date after which YouTube will no longer generate new reports. |
| `downloadUrl` | string | The URL from which the report can be downloaded, maximum 1000 characters. |

## JSON Representation

```json
{
  "id": "string",
  "jobId": "string",
  "startTime": "timestamp",
  "endTime": "timestamp",
  "createTime": "timestamp",
  "jobExpireTime": "timestamp",
  "downloadUrl": "string"
}
```

## Download Process

### Basic Download

Use the `downloadUrl` with an HTTP GET request and authorization header:

```bash
curl -X GET \
  'DOWNLOAD_URL_FROM_REPORT' \
  -H 'Authorization: Bearer YOUR_ACCESS_TOKEN' \
  -o report.csv
```

### Compressed Download

To reduce bandwidth consumption, include the `Accept-Encoding: gzip` header:

```bash
curl -X GET \
  'DOWNLOAD_URL_FROM_REPORT' \
  -H 'Authorization: Bearer YOUR_ACCESS_TOKEN' \
  -H 'Accept-Encoding: gzip' \
  -o report.csv.gz
```

This enables compression, though applications require additional CPU resources for decompression.

## Code Examples

### Python - List Reports

```python
def list_reports(youtube_reporting, job_id):
    results = youtube_reporting.jobs().reports().list(
        jobId=job_id
    ).execute()

    if 'reports' in results:
        for report in results['reports']:
            print(f"Report ID: {report['id']}")
            print(f"Start Time: {report['startTime']}")
            print(f"End Time: {report['endTime']}")
            print(f"Download URL: {report['downloadUrl']}")
            print("---")

    return results.get('reports', [])
```

### Python - Download Report

```python
import requests

def download_report(download_url, access_token, output_file):
    headers = {
        'Authorization': f'Bearer {access_token}',
        'Accept-Encoding': 'gzip'
    }

    response = requests.get(download_url, headers=headers, stream=True)

    with open(output_file, 'wb') as f:
        for chunk in response.iter_content(chunk_size=8192):
            f.write(chunk)

    print(f"Report downloaded to: {output_file}")
```

## Time Range Filtering

When listing reports, filter by time range:

| Parameter | Description |
|-----------|-------------|
| `startTimeAtOrAfter` | Only reports with start time at or after this timestamp |
| `startTimeBefore` | Only reports with start time before this timestamp |
| `createdAfter` | Only reports created after this timestamp |

## Authorization

Report retrieval requires an HTTP GET request with the `Authorization` header set using your OAuth 2.0 token:

- `https://www.googleapis.com/auth/yt-analytics.readonly`
- `https://www.googleapis.com/auth/yt-analytics-monetary.readonly`
