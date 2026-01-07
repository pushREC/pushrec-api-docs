---
source: https://developers.google.com/youtube/reporting/v1/reference/rest/v1/reportTypes
scraped: 2026-01-07
api: youtube-reporting
type: report-types-resource
---

# ReportTypes Resource Documentation

## Overview

The `reportType` resource identifies a specific report that channels or content owners can retrieve through the YouTube Reporting API. Each resource includes properties defining the report's identifier, name, deprecation status, and whether YouTube automatically generates it.

## Methods

| Method | Endpoint | Description |
|--------|----------|-------------|
| `list` | `GET /v1/reportTypes` | Returns a list of report types that the channel or content owner can retrieve |

## Resource Properties

| Property | Type | Max Length | Description |
|----------|------|------------|-------------|
| `id` | string | 100 chars | Uniquely identifies the report. Identifies the most recent version of each supported report type. |
| `name` | string | 100 chars | The report's display name. |
| `deprecateTime` | timestamp | - | The date and time that the report was or will be deprecated. If you have a job for a deprecated report type, YouTube generates new reports for that job for three months after the deprecation date. |
| `systemManaged` | boolean | - | Indicates whether YouTube automatically generates the report for content owners without requiring a `jobs.create` call. |

## JSON Representation

```json
{
  "id": "string",
  "name": "string",
  "deprecateTime": "timestamp",
  "systemManaged": boolean
}
```

## Available Report Types

### Channel Reports (22 types)

| Report ID | Description |
|-----------|-------------|
| `channel_basic_a3` | Basic user activity |
| `channel_province_a3` | User activity by US state |
| `channel_playback_location_a3` | Playback locations |
| `channel_traffic_source_a3` | Traffic sources |
| `channel_device_os_a3` | Device and OS breakdown |
| `channel_demographics_a1` | Demographics (age, gender) |
| `channel_sharing_service_a2` | Sharing service metrics |
| `channel_annotations_a2` | Annotation performance |
| `channel_cards_a2` | Card metrics |
| `channel_end_screens_a2` | End screen metrics |
| `channel_subtitles_a3` | Subtitle analytics |
| `channel_combined_a3` | Combined multi-dimensional |
| `playlist_basic_a2` | Playlist user activity |
| `playlist_playback_location_a2` | Playlist playback locations |
| `playlist_traffic_source_a2` | Playlist traffic sources |
| `playlist_device_os_a2` | Playlist device/OS |
| `playlist_combined_a2` | Playlist combined |

### Content Owner Reports (40+ types)

All channel reports plus:

| Report ID | Description |
|-----------|-------------|
| `content_owner_basic_a4` | User activity across all channels |
| `content_owner_playback_location_a3` | Playback locations |
| `content_owner_traffic_source_a3` | Traffic sources |
| `content_owner_device_os_a3` | Device and OS |
| `content_owner_demographics_a1` | Demographics |
| `content_owner_ad_rates_a1` | Ad rates and CPM |
| `content_owner_estimated_revenue_a1` | Estimated video revenue |
| `content_owner_asset_estimated_revenue_a1` | Asset revenue |

### System-Managed Reports (5 types)

Automatically generated for content owners:

| Report Type | Description |
|-------------|-------------|
| Ad Revenue (Raw) | Detailed advertising revenue |
| Ad Revenue (Summary) | Aggregated advertising revenue |
| Asset Ad Revenue | Revenue by claimed asset |
| Claims Data | Content claim information |
| Subscription Revenue | Premium and membership revenue |

## reportTypes.list Method

### HTTP Request

```
GET https://youtubereporting.googleapis.com/v1/reportTypes
```

### Authorization

| Scope | Access Level |
|-------|--------------|
| `yt-analytics.readonly` | User activity metrics like view counts and rating counts |
| `yt-analytics-monetary.readonly` | User activity metrics plus estimated revenue and ad performance metrics |

### Query Parameters

| Parameter | Type | Description |
|-----------|------|-------------|
| `onBehalfOfContentOwner` | string | Content owner ID; if omitted, the API assumes the user's own channel |
| `pageSize` | number | Requested page size; server may return fewer items |
| `pageToken` | string | Token for pagination, typically from previous `nextPageToken` |
| `includeSystemManaged` | boolean | When true, includes system-managed reports; defaults to false |

### Response Format

```json
{
  "reportTypes": [
    {
      "id": "string",
      "name": "string",
      "deprecateTime": "timestamp",
      "systemManaged": boolean
    }
  ],
  "nextPageToken": "string"
}
```

## Code Example

```python
def list_report_types(youtube_reporting, include_system_managed=False):
    results = youtube_reporting.reportTypes().list(
        includeSystemManaged=include_system_managed
    ).execute()

    for report_type in results.get('reportTypes', []):
        print(f"ID: {report_type['id']}")
        print(f"Name: {report_type['name']}")

        if 'deprecateTime' in report_type:
            print(f"Deprecated: {report_type['deprecateTime']}")

        if report_type.get('systemManaged'):
            print("System-managed: Yes")

        print("---")

    return results.get('reportTypes', [])
```

## Important Notes

- YouTube automatically generates system-managed reports for eligible content owners
- System-managed reports cannot be scheduled via the `jobs.create` method
- Deprecated reports continue for 3 months after deprecation date
- Report type IDs include version suffixes (e.g., `_a3`, `_a4`)
