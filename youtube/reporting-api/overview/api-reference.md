---
source: https://developers.google.com/youtube/reporting/v1/reference/rest
scraped: 2026-01-07
api_provider: Google
discovery_tier: 3
verified: false
---
 YouTube Reporting API REST Reference

## Base URL

```
https://youtubereporting.googleapis.com
```

## Resources and Methods

### Jobs

Manage reporting jobs that generate YouTube Analytics data.

| Method | Endpoint | Description |
|--------|----------|-------------|
| create | `POST /v1/jobs` | Creates a reporting job. By creating a reporting job, you are instructing YouTube to generate that report on a daily basis. |
| list | `GET /v1/jobs` | Retrieves scheduled reporting jobs; each includes an `id` property for identifying the job |
| get | `GET /v1/jobs/{jobId}` | Obtains information about a specific scheduled reporting job |
| delete | `DELETE /v1/jobs/{jobId}` | Removes a reporting job |

### Jobs.Reports

Retrieve generated reports from jobs.

| Method | Endpoint | Description |
|--------|----------|-------------|
| list | `GET /v1/jobs/{jobId}/reports` | Lists reports that have been generated for the specified reporting job |
| get | `GET /v1/jobs/{jobId}/reports/{reportId}` | Retrieves metadata for a specific report |

### ReportTypes

Discover available report options.

| Method | Endpoint | Description |
|--------|----------|-------------|
| list | `GET /v1/reportTypes` | Returns a list of report types that the channel or content owner can retrieve |

## Authorization Scopes

- `https://www.googleapis.com/auth/yt-analytics.readonly` - User activity metrics access
- `https://www.googleapis.com/auth/yt-analytics-monetary.readonly` - Revenue and ad performance data

## Common Query Parameters

| Parameter | Type | Description |
|-----------|------|-------------|
| `onBehalfOfContentOwner` | string | Content owner ID; if omitted, uses authenticated user's channel |
| `pageSize` | number | Maximum results per page |
| `pageToken` | string | Token for pagination |
| `includeSystemManaged` | boolean | Include system-managed reports (default: false) |

## Response Format

All successful responses return JSON objects. Paginated responses include a `nextPageToken` field for retrieving additional results.

## Error Responses

| Code | Status | Description |
|------|--------|-------------|
| 400 | Bad Request | Missing required fields, invalid parameters |
| 403 | Forbidden | Insufficient permissions |
| 404 | Not Found | Resource doesn't exist |
| 409 | Conflict | Resource already exists |
