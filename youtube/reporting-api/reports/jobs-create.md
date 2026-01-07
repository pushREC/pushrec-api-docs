---
source: https://developers.google.com/youtube/reporting/v1/reference/rest/v1/jobs/create
scraped: 2026-01-07
api_provider: Google
discovery_tier: 3
verified: false
---
 YouTube Reporting API - jobs.create Method Documentation

## Overview

The `jobs.create` method establishes daily reporting jobs for YouTube Analytics. "By creating a reporting job, you are instructing YouTube to generate that report on a daily basis."

## HTTP Request

```
POST https://youtubereporting.googleapis.com/v1/jobs
```

## Authorization Requirements

Two OAuth 2.0 scopes are supported:

| Scope | Access Level |
|-------|--------------|
| `https://www.googleapis.com/auth/yt-analytics.readonly` | View counts and rating data |
| `https://www.googleapis.com/auth/yt-analytics-monetary.readonly` | Revenue and ad performance metrics |

## Parameters

### Query Parameters

| Parameter | Type | Description |
|-----------|------|-------------|
| `onBehalfOfContentOwner` | string | Optional. The content owner ID; if omitted, the API assumes the user's own channel |

### Request Body

The Job resource requires two properties:

```json
{
  "name": "string",
  "reportTypeId": "string"
}
```

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `name` | string | Yes | A descriptive name for the job |
| `reportTypeId` | string | Yes | The report type identifier (from `reportTypes.list()`) |

## Response Format

Successful requests return a Job resource:

```json
{
  "id": "string",
  "name": "string",
  "reportTypeId": "string",
  "createTime": "timestamp"
}
```

## Error Responses

| Code | Status | Description |
|------|--------|-------------|
| 400 | Bad Request | Missing required fields, invalid reportTypeId, or deprecated report type |
| 403 | Forbidden | Attempting to create system-managed reports |
| 409 | Conflict | Job already exists for this report type |

## Example Request

```bash
curl -X POST \
  'https://youtubereporting.googleapis.com/v1/jobs' \
  -H 'Authorization: Bearer YOUR_ACCESS_TOKEN' \
  -H 'Content-Type: application/json' \
  -d '{
    "name": "My Channel Basic Report",
    "reportTypeId": "channel_basic_a3"
  }'
```

## Code Examples

### Python

```python
def create_reporting_job(youtube_reporting, report_type_id, name):
    reporting_job = youtube_reporting.jobs().create(
        body={
            'name': name,
            'reportTypeId': report_type_id
        }
    ).execute()

    print(f"Created job: {reporting_job['id']}")
    print(f"Name: {reporting_job['name']}")
    print(f"Report Type: {reporting_job['reportTypeId']}")

    return reporting_job
```

### Java

```java
Job job = new Job();
job.setName("My Channel Basic Report");
job.setReportTypeId("channel_basic_a3");

Job createdJob = youtubeReporting.jobs().create(job).execute();
System.out.println("Created job ID: " + createdJob.getId());
```

## Complete Workflow

```python
def setup_reporting_job(youtube_reporting, desired_report_type):
    # Step 1: List available report types
    report_types = youtube_reporting.reportTypes().list().execute()

    # Step 2: Find the desired report type
    target_type = None
    for rt in report_types.get('reportTypes', []):
        if rt['id'] == desired_report_type:
            target_type = rt
            break

    if not target_type:
        raise ValueError(f"Report type {desired_report_type} not found")

    # Step 3: Create the job
    job = youtube_reporting.jobs().create(
        body={
            'name': f"Job for {target_type['name']}",
            'reportTypeId': target_type['id']
        }
    ).execute()

    return job
```

## Important Notes

- Reports become available within 24 hours of job creation
- Only one job per report type is allowed per channel/content owner
- System-managed reports cannot be created via this method
- Deprecated report types cannot be used for new jobs
- Historical data (30-day backfill) is generated automatically
