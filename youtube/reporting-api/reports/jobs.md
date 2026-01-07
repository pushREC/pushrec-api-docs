---
source: https://developers.google.com/youtube/reporting/v1/reference/rest/v1/jobs
scraped: 2026-01-07
api: youtube-reporting
type: jobs-resource
---

# YouTube Reporting API - Jobs Resource Documentation

## Overview

A **job** resource represents a scheduled reporting task within YouTube's API. "A reporting job identifies a specific report that YouTube generates each day for a particular channel or content owner."

## Available Methods

The API supports four primary operations on job resources:

| Method | Endpoint | Purpose |
|--------|----------|---------|
| **create** | `POST /v1/jobs` | Establishes a new reporting job; reports become available within 24 hours |
| **delete** | `DELETE /v1/jobs/{jobId}` | Removes an existing reporting job |
| **get** | `GET /v1/jobs/{jobId}` | Retrieves details about a specific scheduled job |
| **list** | `GET /v1/jobs` | Displays all jobs for a channel or content owner |

## Resource Properties

The job resource contains these fields:

| Property | Type | Description |
|----------|------|-------------|
| `id` | string | Unique identifier, max 40 characters |
| `reportTypeId` | string | References the report type being generated |
| `name` | string | YouTube-generated descriptive label, max 100 characters |
| `createTime` | timestamp | RFC3339 UTC format, microsecond precision |
| `expireTime` | timestamp | When job stops generating reports |
| `systemManaged` | boolean | Indicates if YouTube automatically manages the job |

## JSON Representation

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

## Key Characteristics

### System-Managed Jobs

The `systemManaged` property is `true` if the job generates system-managed reports. System-managed jobs:
- Cannot be modified or deleted by content owners
- Are automatically created by YouTube for eligible accounts
- Generate specialized reports (e.g., actual revenue data)

### Job Expiration

The `expireTime` property appears when:
- Reports generated for the job have not been downloaded for a prolonged period of time
- The report type has been deprecated

After expiration, YouTube stops generating new reports for the job.

## Workflow

1. **Create Job**: Use `jobs.create()` with a report type ID
2. **Wait for Reports**: YouTube generates reports within 24 hours
3. **List Reports**: Use `jobs.reports.list()` to find available reports
4. **Download**: Use the `downloadUrl` from report metadata
5. **Optionally Delete**: Use `jobs.delete()` when reports are no longer needed

## Authorization

All job operations require OAuth 2.0 authorization with one of:
- `https://www.googleapis.com/auth/yt-analytics.readonly`
- `https://www.googleapis.com/auth/yt-analytics-monetary.readonly`
