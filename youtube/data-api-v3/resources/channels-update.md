---
source: https://developers.google.com/youtube/v3/docs/channels/update
scraped: 2026-01-07
method: webfetch
api: youtube-data-v3
resource: channels
method_name: update
---

# YouTube Data API v3 - Channels: Update Documentation

## Overview

This API endpoint enables updating a channel's metadata. The method specifically supports modifications to `brandingSettings`, `invideoPromotion`, and `localizations` objects and their child properties.

## HTTP Request

```
PUT https://www.googleapis.com/youtube/v3/channels
```

## Quota Impact

A call to this method has a quota cost of **50 units**.

## Authorization

This endpoint requires one of the following OAuth 2.0 scopes:

- `https://www.googleapis.com/auth/youtubepartner`
- `https://www.googleapis.com/auth/youtube`
- `https://www.googleapis.com/auth/youtube.force-ssl`

## Parameters

### Required Parameters

**`part`** (string)

This parameter serves dual purposes: it identifies properties the write operation will set and specifies which properties appear in the API response. Permissible values include `brandingSettings`, `invideoPromotion`, or `localizations`. Only one part type may be updated per request. Note that this method overrides the existing values for all of the mutable properties that are contained in the part that the parameter value specifies.

### Optional Parameters

**`onBehalfOfContentOwner`** (string)

For authorized requests only. The `onBehalfOfContentOwner` parameter indicates that the authenticated user is acting on behalf of the content owner specified in the parameter value. This facilitates multi-channel management without separate authentication credentials per channel.

## Request Body

Provide a `channel` resource with the following requirements:

### Required Properties
- `id` - Channel identifier

### Settable Properties
- `brandingSettings.channel.country`
- `brandingSettings.channel.description`
- `brandingSettings.channel.defaultLanguage`
- `brandingSettings.channel.keywords`
- `brandingSettings.channel.trackingAnalyticsAccountId`
- `brandingSettings.channel.unsubscribedTrailer`
- `localizations.(key)`
- `localizations.(key).title`
- `localizations.(key).description`
- `status.selfDeclaredMadeForKids`

**Important:** Omitted properties with existing values will be deleted.

## Response

Successful responses return a `channel` resource in the response body.

## Error Codes

| HTTP Status | Error Type | Description |
|------------|-----------|-------------|
| 400 | `brandingValidationError` | Validation failure in `brandingSettings` object; retrieve existing settings via `channels.list` |
| 400 | `channelTitleUpdateForbidden` | Title cannot be changed; must match current value or omit entirely |
| 400 | `defaultLanguageNotSetError` | Default language required when updating localizations |
| 400 | `invalidBrandingOption` | Specified branding setting does not exist |
| 400 | `invalidCustomMessage` | Invalid custom message metadata |
| 400 | `invalidDuration` | Invalid duration or position type in video promotion |
| 400 | `invalidRecentlyUploadedBy` | Invalid channel ID for promotional content |
| 400 | `invalidTimingOffset` | Invalid timing offset in promotion settings |
| 400 | `invalidTimingType` | Invalid timing method for promotion display |
| 400 | `localizationValidationError` | Validation failure in localizations object |
| 400 | `tooManyPromotedItems` | Promotional item limit exceeded |
| 400 | `requiredItemIdType` | Item type missing in promotion settings |
| 400 | `requiredItemId` | Item ID missing in promotion settings |
| 400 | `requiredTimingOffset` | Timing offset required for promotion display |
| 400 | `requiredTimingType` | Timing method required for promotion display |
| 400 | `requiredTiming` | Timing required for each promotional item |
| 400 | `requiredVideoId` | Video ID required to identify promoted item |
| 400 | `requiredWebsiteUrl` | Website URL required in promotion settings |
| 403 | `channelForbidden` | Specified channel lacks support or improper authorization |
| 403 | `promotedVideoNotAllowed` | Channel cannot be updated |
| 403 | `websiteLinkNotAllowed` | Website URL rejected |
| 404 | `channelNotFound` | Channel ID not found or lacks branding options |
| 404 | `unknownChannelId` | Channel ID or promotional channel ID not found |
| 404 | `unknownVideoId` | Promoted video ID not found |

## Features

The API supports marking channels or videos as "made for kids." Resources now include properties identifying this status.
