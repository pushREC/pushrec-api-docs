---
source: https://developers.google.com/youtube/analytics/v2/reference/reports/query
scraped: 2026-01-07
api_provider: Google
discovery_tier: 3
verified: false
title: YouTube Analytics API - Reports Query Method
---
 YouTube Analytics API: Reports Query Method

## Overview

The `reports.query` method retrieves YouTube Analytics data for a channel or content owner. This is the primary method for fetching analytics reports through the YouTube Analytics API.

## HTTP Request

```
GET https://youtubeanalytics.googleapis.com/v2/reports
```

## Required Parameters

| Parameter | Type | Description |
|-----------|------|-------------|
| `ids` | string | Identifies the YouTube channel or content owner for which data is being retrieved. For channels use `channel==MINE` or `channel==CHANNEL_ID`. For content owners use `contentOwner==OWNER_NAME`. |
| `startDate` | string | Start date for fetching Analytics data. Format: `YYYY-MM-DD`. |
| `endDate` | string | End date for fetching Analytics data. Format: `YYYY-MM-DD`. |
| `metrics` | string | Comma-separated list of Analytics metrics to retrieve (e.g., `views,estimatedMinutesWatched`). |

## Optional Parameters

| Parameter | Type | Description |
|-----------|------|-------------|
| `dimensions` | string | Comma-separated list of Analytics dimensions (e.g., `day,country`). |
| `filters` | string | List of filters to apply (e.g., `country==US;video==VIDEO_ID`). |
| `sort` | string | Comma-separated list of dimensions or metrics for sorting. Prefix with `-` for descending order. |
| `maxResults` | integer | Maximum number of rows to include in the response. |
| `startIndex` | integer | 1-based index of the first entity to retrieve. |
| `currency` | string | Currency for revenue metrics. Uses ISO 4217 three-letter code (e.g., `USD`, `EUR`). |
| `includeHistoricalChannelData` | boolean | Include data from before channel was linked to content owner. |

## Authorization

Requires OAuth 2.0 authorization with one of the following scopes:

- `https://www.googleapis.com/auth/yt-analytics.readonly` - View YouTube Analytics reports
- `https://www.googleapis.com/auth/yt-analytics-monetary.readonly` - View monetary analytics reports
- `https://www.googleapis.com/auth/youtube` - Manage YouTube account
- `https://www.googleapis.com/auth/youtubepartner` - View and manage YouTube assets

## Response

The response contains an Analytics data object with the following structure:

```json
{
  "kind": "youtubeAnalytics#resultTable",
  "columnHeaders": [
    {
      "name": "string",
      "columnType": "string",
      "dataType": "string"
    }
  ],
  "rows": [
    [ ... ]
  ]
}
```

### Response Fields

| Field | Description |
|-------|-------------|
| `kind` | Resource type identifier: `youtubeAnalytics#resultTable` |
| `columnHeaders` | Array of column header objects describing each column |
| `columnHeaders[].name` | Column name (dimension or metric name) |
| `columnHeaders[].columnType` | Either `DIMENSION` or `METRIC` |
| `columnHeaders[].dataType` | Data type: `STRING`, `INTEGER`, `FLOAT` |
| `rows` | Array of data rows, where each row is an array of values |

## Example Request

```http
GET https://youtubeanalytics.googleapis.com/v2/reports
  ?ids=channel==MINE
  &startDate=2024-01-01
  &endDate=2024-01-31
  &metrics=views,estimatedMinutesWatched,subscribersGained
  &dimensions=day
  &sort=day
```

## Example Response

```json
{
  "kind": "youtubeAnalytics#resultTable",
  "columnHeaders": [
    {"name": "day", "columnType": "DIMENSION", "dataType": "STRING"},
    {"name": "views", "columnType": "METRIC", "dataType": "INTEGER"},
    {"name": "estimatedMinutesWatched", "columnType": "METRIC", "dataType": "FLOAT"},
    {"name": "subscribersGained", "columnType": "METRIC", "dataType": "INTEGER"}
  ],
  "rows": [
    ["2024-01-01", 1500, 2500.5, 25],
    ["2024-01-02", 1800, 3200.0, 32]
  ]
}
```

## Filter Syntax

Filters use the following syntax:
- Equality: `dimension==value`
- Multiple values: `video==VIDEO_ID1,VIDEO_ID2,VIDEO_ID3`
- Multiple filters: `country==US;video==VIDEO_ID` (semicolon separator)

## Sort Syntax

- Ascending: `day` or `views`
- Descending: `-views` or `-estimatedMinutesWatched`
- Multiple sorts: `day,-views`

## Error Handling

Common error responses:

| Error Code | Description |
|------------|-------------|
| 400 | Invalid request parameters |
| 401 | Invalid or expired access token |
| 403 | Insufficient permissions for requested data |
| 404 | Channel or content owner not found |
| 429 | Quota exceeded |

## Quotas

Each API request counts as one unit against your daily quota. View your quota usage in the Google Cloud Console.
