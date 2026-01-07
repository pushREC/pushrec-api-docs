---
source: https://developers.google.com/youtube/v3/docs/channelSections/delete
scraped: 2026-01-07
api: YouTube Data API v3
resource: ChannelSections
method: delete
---

# YouTube Data API: ChannelSections delete

## Method Overview

The ChannelSections delete endpoint removes a channel section from a YouTube channel. This operation is permanent and cannot be undone.

**Quota Cost:** 50 units per request

## HTTP Request

```
DELETE https://www.googleapis.com/youtube/v3/channelSections
```

## Authorization

This endpoint requires one of these OAuth 2.0 scopes:

- `https://www.googleapis.com/auth/youtubepartner`
- `https://www.googleapis.com/auth/youtube`
- `https://www.googleapis.com/auth/youtube.force-ssl`

## Parameters

### Required Parameters

| Parameter | Type | Description |
|-----------|------|-------------|
| `id` | string | The `id` parameter specifies the ID that uniquely identifies the channel section being deleted. |

### Optional Parameters

| Parameter | Type | Description |
|-----------|------|-------------|
| `onBehalfOfContentOwner` | string | Indicates authorization credentials for a YouTube CMS user acting on behalf of content owner. This parameter is intended exclusively for YouTube content partners. Enables single authentication for multiple channels. |

## Request Body

No request body is required for this method.

## Response

Success returns a channelSection resource object.

## Error Responses

| HTTP Status | Error Type | Description |
|-------------|-----------|-------------|
| 400 | `notEditable` | This channel section cannot be deleted |
| 400 | `idInvalid` | Invalid channel section ID provided |
| 400 | `idRequired` | ID parameter must be specified |
| 403 | `channelSectionForbidden` | Request is not properly authenticated or not supported for this channel |
| 404 | `channelNotFound` | Channel does not exist |
| 404 | `channelSectionNotFound` | Channel section you are trying to update cannot be found |
