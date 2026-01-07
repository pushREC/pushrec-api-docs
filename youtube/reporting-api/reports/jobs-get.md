---
source: https://developers.google.com/youtube/reporting/v1/reference/rest/v1/jobs/get
scraped: 2026-01-07
api: youtube-reporting
type: jobs-get
---

# YouTube Reporting API: jobs.get Method Documentation

## Overview

The `jobs.get` endpoint retrieves details about a specific reporting job scheduled for a channel or content owner.

## HTTP Request

```
GET https://youtubereporting.googleapis.com/v1/jobs/{jobId}
```

## Authorization Requirements

Two scope options are available:

| Scope | Description |
|-------|-------------|
| `https://www.googleapis.com/auth/yt-analytics.readonly` | View YouTube Analytics reports for your YouTube content |
| `https://www.googleapis.com/auth/yt-analytics-monetary.readonly` | View YouTube Analytics monetary reports |

## Parameters

### Path Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `jobId` | string | Yes | The ID that YouTube uses to uniquely identify the job being retrieved |

### Query Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `onBehalfOfContentOwner` | string | No | Specifies the content owner ID; if omitted, defaults to the authenticated user's channel |

### Request Body

Must be empty for this endpoint.

## Response

A successful request returns a Job resource object:

```json
{
  "id": "string",
  "reportTypeId": "string",
  "name": "string",
  "createTime": "timestamp",
  "expireTime": "timestamp",
  "systemManaged": boolean
}
```

### Response Properties

| Property | Type | Description |
|----------|------|-------------|
| `id` | string | Unique job identifier |
| `reportTypeId` | string | The report type this job generates |
| `name` | string | Descriptive name for the job |
| `createTime` | timestamp | When the job was created (RFC3339 UTC) |
| `expireTime` | timestamp | When the job will expire (if applicable) |
| `systemManaged` | boolean | Whether YouTube automatically manages this job |

## Example Request

```bash
curl -X GET \
  'https://youtubereporting.googleapis.com/v1/jobs/abc123xyz' \
  -H 'Authorization: Bearer YOUR_ACCESS_TOKEN'
```

## Code Examples

### Python

```python
def get_job_details(youtube_reporting, job_id):
    job = youtube_reporting.jobs().get(jobId=job_id).execute()

    print(f"Job ID: {job['id']}")
    print(f"Report Type: {job['reportTypeId']}")
    print(f"Name: {job['name']}")
    print(f"Created: {job['createTime']}")

    if 'expireTime' in job:
        print(f"Expires: {job['expireTime']}")

    if job.get('systemManaged'):
        print("This is a system-managed job")

    return job
```

### Java

```java
Job job = youtubeReporting.jobs().get(jobId).execute();

System.out.println("Job ID: " + job.getId());
System.out.println("Report Type ID: " + job.getReportTypeId());
System.out.println("Name: " + job.getName());
System.out.println("Created: " + job.getCreateTime());
```

## Error Responses

| Code | Status | Description |
|------|--------|-------------|
| 404 | Not Found | The specified job does not exist |
| 403 | Forbidden | Not authorized to access this job |

## Key Notes

- All requests require OAuth 2.0 authorization
- The request body must remain empty
- The endpoint is read-only (GET method)
- Content owner requests require the `onBehalfOfContentOwner` parameter
- System-managed jobs will have `systemManaged: true`
