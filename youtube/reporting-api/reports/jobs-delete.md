---
source: https://developers.google.com/youtube/reporting/v1/reference/rest/v1/jobs/delete
scraped: 2026-01-07
api_provider: Google
discovery_tier: 3
verified: false
---
 YouTube Reporting API: jobs.delete Method Documentation

## Overview

The `jobs.delete` method removes a reporting job from the YouTube Reporting API system.

## HTTP Request

```
DELETE https://youtubereporting.googleapis.com/v1/jobs/{jobId}
```

## Authorization

Requests require OAuth 2.0 authentication using one of these scopes:

| Scope | Description |
|-------|-------------|
| `https://www.googleapis.com/auth/yt-analytics.readonly` | View YouTube Analytics reports for your YouTube content |
| `https://www.googleapis.com/auth/yt-analytics-monetary.readonly` | View YouTube Analytics monetary reports |

## Parameters

### Path Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `jobId` | string | Yes | The ID that YouTube uses to uniquely identify the job that is being deleted |

### Query Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `onBehalfOfContentOwner` | string | No | The ID of the content owner for whom the API request is being made |

## Request Body

Must be empty.

## Response

Upon successful deletion, the response body will be empty (HTTP 204 No Content).

## Example Request

```bash
curl -X DELETE \
  'https://youtubereporting.googleapis.com/v1/jobs/abc123xyz' \
  -H 'Authorization: Bearer YOUR_ACCESS_TOKEN'
```

## Code Examples

### Python

```python
def delete_reporting_job(youtube_reporting, job_id):
    try:
        youtube_reporting.jobs().delete(jobId=job_id).execute()
        print(f"Successfully deleted job: {job_id}")
        return True
    except Exception as e:
        print(f"Error deleting job: {e}")
        return False
```

### Java

```java
try {
    youtubeReporting.jobs().delete(jobId).execute();
    System.out.println("Job deleted successfully: " + jobId);
} catch (GoogleJsonResponseException e) {
    System.err.println("Error deleting job: " + e.getMessage());
}
```

## Error Responses

| Code | Status | Description |
|------|--------|-------------|
| 404 | Not Found | The specified job does not exist |
| 403 | Forbidden | Cannot delete system-managed jobs or unauthorized access |

## Important Notes

### System-Managed Jobs

System-managed jobs cannot be deleted. Attempting to delete a system-managed job will result in a 403 Forbidden error.

### Effect of Deletion

When a job is deleted:
- YouTube stops generating new reports for that job
- Previously generated reports may still be accessible for a limited time
- The job ID becomes invalid for future requests

### Recreating Jobs

After deleting a job, you can create a new job for the same report type:
- The new job will have a different ID
- Historical backfill will be regenerated
- Reports will be available within 24 hours

## Best Practices

1. **Verify before deleting**: Use `jobs.get()` to confirm the job details before deletion
2. **Download reports first**: Ensure all needed reports are downloaded before deleting
3. **Check system-managed status**: Verify `systemManaged` is not true before attempting deletion
