---
source: https://developers.google.com/youtube/v3/docs/channelBanners
scraped: 2026-01-07
api_provider: Google
discovery_tier: 3
verified: false
---
 YouTube Data API: ChannelBanners Resource Documentation

## Resource Overview

The `channelBanner` resource provides the URL necessary to establish a newly uploaded image as a channel's banner. This resource plays a crucial role in the channel branding process and works in conjunction with the channels update method.

## Three-Step Banner Update Process

Updating a channel's banner involves these sequential steps:

1. **Upload Image**: Call `channelBanners.insert` to upload binary image data
2. **Extract URL**: Retrieve the `url` property from the API response
3. **Apply Banner**: Use `channels.update` with the URL in `brandingSettings.image.bannerExternalUrl`

## Image Requirements

- **Aspect Ratio**: 16:9
- **Minimum Dimensions**: 2048x1152 pixels
- **Recommended Dimensions**: 2560x1440 pixels

## JSON Resource Representation

```json
{
  "kind": "youtube#channelBannerResource",
  "etag": "etag",
  "url": "string"
}
```

## Resource Properties

| Property | Type | Description |
|----------|------|-------------|
| `kind` | string | Identifies resource type as `youtube#channelBannerResource` |
| `etag` | etag | The resource's ETag value |
| `url` | string | Banner image URL obtained after upload; used in subsequent channel update |

## API Methods

### insert

Uploads a channel banner image to YouTube. Represents the first step in updating a channel's banner image, accepting binary image data with specified dimension requirements.

## Additional Resources

- **Blog**: Latest news available on YouTube blog
- **GitHub**: API code samples and open-source projects
- **Issue Tracker**: Report bugs or request features
- **Stack Overflow**: Community support under youtube-api tag
