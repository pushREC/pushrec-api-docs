---
source: https://developers.google.com/youtube/reporting
scraped: 2026-01-07
api: youtube-reporting
type: getting-started
---

# YouTube Reporting API: Getting Started Guide

## Prerequisites

Before developing with the YouTube Reporting API, you need:

1. **Google Account** - Required to access the Google API Console and request credentials
2. **Google Developers Console Project** - Create a project and obtain authorization credentials
3. **API Enablement** - Enable the YouTube Reporting API in your project's API Console
4. **YouTube Channel or Content Owner Account** - Access to analytics data requires ownership

## Setup Steps

### Step 1: Create a Google Cloud Project

1. Go to the [Google API Console](https://console.developers.google.com/)
2. Create a new project or select an existing one
3. Note your project ID for reference

### Step 2: Enable the YouTube Reporting API

1. Navigate to the API Library in your project
2. Search for "YouTube Reporting API"
3. Click Enable

### Step 3: Configure OAuth 2.0 Credentials

1. Go to Credentials in the API Console
2. Create OAuth 2.0 Client ID
3. Configure the OAuth consent screen
4. Download the client credentials JSON file

### Step 4: Set Up Authorization

The API requires OAuth 2.0 authorization with one of these scopes:

| Scope | Access Level |
|-------|--------------|
| `https://www.googleapis.com/auth/yt-analytics.readonly` | View YouTube Analytics reports |
| `https://www.googleapis.com/auth/yt-analytics-monetary.readonly` | View monetary reports (includes non-monetary) |

## Implementation Workflow

### Step 1: Authenticate

```python
from google.oauth2.credentials import Credentials
from googleapiclient.discovery import build

credentials = Credentials.from_authorized_user_file('token.json')
youtube_reporting = build('youtubereporting', 'v1', credentials=credentials)
```

### Step 2: List Available Report Types

```python
def list_report_types(youtube_reporting):
    results = youtube_reporting.reportTypes().list().execute()

    for report_type in results.get('reportTypes', []):
        print(f"ID: {report_type['id']}")
        print(f"Name: {report_type['name']}")

    return results.get('reportTypes', [])
```

### Step 3: Create a Reporting Job

```python
def create_job(youtube_reporting, report_type_id, name):
    job = youtube_reporting.jobs().create(
        body={
            'name': name,
            'reportTypeId': report_type_id
        }
    ).execute()

    print(f"Created job: {job['id']}")
    return job
```

### Step 4: Wait for Reports

Reports become available within 24 hours of job creation. YouTube generates a new report daily.

### Step 5: List Available Reports

```python
def list_reports(youtube_reporting, job_id):
    results = youtube_reporting.jobs().reports().list(
        jobId=job_id
    ).execute()

    return results.get('reports', [])
```

### Step 6: Download Reports

```python
import requests

def download_report(download_url, access_token, output_file):
    headers = {'Authorization': f'Bearer {access_token}'}
    response = requests.get(download_url, headers=headers)

    with open(output_file, 'wb') as f:
        f.write(response.content)
```

## Quota Information

The Reporting API handles quotas differently from other YouTube APIs:

- **Asynchronous downloads**: Data is retrieved once via batch download
- **No per-query quota**: Unlike real-time APIs, bulk downloads don't incur per-request costs
- **Filter locally**: Applications filter, sort, and query data locally after download

## Data Availability

- **Backfill**: When you create a job, YouTube provides 30 days of historical data
- **Daily reports**: New reports are generated daily covering the previous 24 hours
- **Retention**: Standard reports available for 60 days; backfill reports for 30 days
- **Timing**: Reports are based on Pacific Time (UTC-7 or UTC-8)

## Client Libraries

Google provides official client libraries for:

- **Python**: `google-api-python-client`
- **Java**: `google-api-java-client`
- **PHP**: `google-api-php-client`
- **Node.js**: `googleapis`
- **.NET**: `Google.Apis`
- **Ruby**: `google-api-ruby-client`
- **Go**: `google-api-go-client`

## Best Practices

1. **Store job IDs**: Save job IDs for future report retrieval
2. **Use compression**: Add `Accept-Encoding: gzip` header to reduce bandwidth
3. **Handle pagination**: Use `nextPageToken` for large result sets
4. **Filter by date**: Use `startTimeAtOrAfter` to get specific date ranges
5. **Process locally**: Import CSV data into your database for analysis
6. **Monitor expiration**: Jobs expire if reports aren't downloaded regularly

## Common Report Types to Start

| Report ID | Description |
|-----------|-------------|
| `channel_basic_a3` | Basic channel user activity |
| `channel_traffic_source_a3` | How viewers find your videos |
| `channel_demographics_a1` | Viewer age and gender |
| `channel_device_os_a3` | Device and platform breakdown |
