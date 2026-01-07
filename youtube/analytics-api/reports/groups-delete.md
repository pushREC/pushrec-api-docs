---
source: https://developers.google.com/youtube/analytics/v2/reference/groups/delete
scraped: 2026-01-07
api_provider: Google
discovery_tier: 3
verified: false
title: YouTube Analytics API - Groups Delete Method
---
 YouTube Analytics API: Groups Delete Method

## Overview

Deletes a group.

## HTTP Request

```
DELETE https://youtubeanalytics.googleapis.com/v2/groups
```

## Parameters

### Required Parameters

| Parameter | Type | Description |
|-----------|------|-------------|
| `id` | string | The ID of the group to delete. |

### Optional Parameters

| Parameter | Type | Description |
|-----------|------|-------------|
| `onBehalfOfContentOwner` | string | Content owner ID for deleting a group on behalf of a content owner. |

## Authorization

Requires OAuth 2.0 authorization with one of the following scopes:

- `https://www.googleapis.com/auth/youtube`
- `https://www.googleapis.com/auth/youtubepartner`

## Response

If successful, this method returns an empty response body with HTTP status code 204 (No Content).

## Example Request

```http
DELETE https://youtubeanalytics.googleapis.com/v2/groups?id=GROUP_ID
Authorization: Bearer ACCESS_TOKEN
```

## Example Response

```
HTTP/1.1 204 No Content
```

## Notes

- Deleting a group also removes all group items associated with that group
- This action cannot be undone
- You must be the owner of the group or have appropriate content owner permissions
- Historical analytics data queried using the group filter will no longer be available after deletion

## Error Responses

| Error Code | Description |
|------------|-------------|
| 400 | Invalid request (e.g., missing `id` parameter) |
| 401 | Invalid or expired access token |
| 403 | Insufficient permissions or not the group owner |
| 404 | Group with specified ID not found |

## Best Practices

Before deleting a group:
1. Verify you have the correct group ID
2. Export any analytics data you need that uses this group as a filter
3. Consider updating the group instead if you only need to change its contents
