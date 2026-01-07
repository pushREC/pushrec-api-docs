---
source: https://developers.google.com/youtube/v3/docs/channelBanners/insert
scraped: 2026-01-07
api_provider: Google
discovery_tier: 3
verified: false
method: insert
---
 YouTube Data API - ChannelBanners: insert

## Overview

This endpoint enables uploading a channel banner image to YouTube as the initial step in a three-step process for updating channel branding. The method handles binary image data submission and returns a URL needed for subsequent channel configuration.

## Method Description

Uploads a channel banner image to YouTube. This method represents the first two steps in a three-step process to update the banner image for a channel.

The complete workflow involves:

1. Uploading binary image data via this endpoint
2. Extracting the `url` property from the API response
3. Using that URL with `channels.update` to set `brandingSettings.image.bannerExternalUrl`

## HTTP Request

```
POST https://www.googleapis.com/upload/youtube/v3/channelBanners/insert
```

## Image Constraints

- **Aspect Ratio:** 16:9
- **Minimum Resolution:** 2048x1152 pixels
- **Recommended Resolution:** 2560x1440 pixels
- **Maximum File Size:** 6MB
- **Accepted MIME Types:** `image/jpeg`, `image/png`, `application/octet-stream`

## Authorization

This request requires one of these OAuth 2.0 scopes:

- `https://www.googleapis.com/auth/youtube.upload`
- `https://www.googleapis.com/auth/youtube`
- `https://www.googleapis.com/auth/youtube.force-ssl`

## Parameters

### Optional Query Parameters

| Parameter | Type | Description |
|-----------|------|-------------|
| `onBehalfOfContentOwner` | string | For authorized requests only. Identifies a YouTube CMS user acting on behalf of a content owner. Enables managing multiple channels after single authentication. |

## Request Body

Do not provide a request body when calling this method. The image content is transmitted as the HTTP request body in media upload format.

## Response

Returns a `channelBanner` resource containing the upload details, including the `url` property required for the subsequent `channels.update` call.

## Quota Impact

A call to this method consumes **50 quota units**.

## Error Responses

| Error | Detail | Description |
|-------|--------|-------------|
| 400 | `bannerAlbumFull` | Channel Art album exceeds capacity; remove images from Google Photos albums |
| 400 | `mediaBodyRequired` | Request missing image content |
