---
source: https://developers.google.com/youtube/reporting/v1/reference/rest/v1/jobs/list
scraped: 2026-01-07
api_provider: Google
discovery_tier: 3
verified: false
---
 YouTube Reporting API: jobs.list Method Documentation

## Overview

The `jobs.list` method retrieves scheduled reporting jobs for a YouTube channel or content owner. Each job resource contains an ID needed to fetch generated reports or delete the job.

## HTTP Request

```
GET https://youtubereporting.googleapis.com/v1/jobs
```

## Authorization

All requests require OAuth 2.0 authorization using these scopes:

| Scope | Access Level |
|-------|--------------|
| `https://www.googleapis.com/auth/yt-analytics.readonly` | View YouTube Analytics reports |
| `https://www.googleapis.com/auth/yt-analytics-monetary.readonly` | View monetary reports |

## Query Parameters

| Parameter | Type | Description |
|-----------|------|-------------|
| `onBehalfOfContentOwner` | string | Content owner ID for the request; defaults to the user's channel |
| `pageSize` | number | Requested page size; server selects appropriate default |
| `pageToken` | string | Token for pagination, typically from previous `nextPageToken` |
| `includeSystemManaged` | boolean | Set `true` to include system-managed report jobs (default: `false`) |

## Request Body

Must be empty.

## Response Format

```json
{
  "jobs": [
    {
      "id": "string",
      "name": "string",
      "reportTypeId": "string",
      "createTime": "timestamp",
      "expireTime": "timestamp",
      "systemManaged": boolean
    }
  ],
  "nextPageToken": "string"
}
```

### Response Properties

| Property | Description |
|----------|-------------|
| `jobs[]` | Array of job resources with ID, name, and report type |
| `nextPageToken` | Token for retrieving additional results (omitted if no more pages) |

## Example Request

```bash
curl -X GET \
  'https://youtubereporting.googleapis.com/v1/jobs?includeSystemManaged=true' \
  -H 'Authorization: Bearer YOUR_ACCESS_TOKEN'
```

## Code Examples

### Python

```python
def list_reporting_jobs(youtube_reporting):
    results = youtube_reporting.jobs().list().execute()

    if 'jobs' in results:
        for job in results['jobs']:
            print(f"Job ID: {job['id']}")
            print(f"Report Type: {job['reportTypeId']}")
            print(f"Name: {job['name']}")
    else:
        print('No jobs found')

    return results.get('jobs', [])
```

### Java

```java
JobListResponse jobListResponse = youtubeReporting.jobs().list().execute();
List<Job> jobs = jobListResponse.getJobs();

for (Job job : jobs) {
    System.out.println("Job ID: " + job.getId());
    System.out.println("Report Type ID: " + job.getReportTypeId());
}
```

## Pagination

For accounts with many jobs, use pagination:

```python
def list_all_jobs(youtube_reporting):
    all_jobs = []
    request = youtube_reporting.jobs().list()

    while request:
        response = request.execute()
        all_jobs.extend(response.get('jobs', []))

        # Get next page
        request = youtube_reporting.jobs().list_next(request, response)

    return all_jobs
```

## Common Use Cases

1. **List all jobs**: Retrieve active reporting jobs to check status
2. **Find job by report type**: Filter results to find specific report jobs
3. **Include system-managed**: Set `includeSystemManaged=true` for complete list
4. **Content owner jobs**: Use `onBehalfOfContentOwner` for multi-channel access
