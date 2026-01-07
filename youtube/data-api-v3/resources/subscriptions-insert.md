---
source: https://developers.google.com/youtube/v3/docs/subscriptions/insert
scraped: 2026-01-07
api_provider: Google
discovery_tier: 3
verified: false
method: webfetch
---
 Subscriptions: insert

Adds a subscription for the authenticated user's channel.

## HTTP Request

```
POST https://www.googleapis.com/youtube/v3/subscriptions
```

## Quota Cost

**50 units** per call

## Authorization

Required scopes (at least one):
- `https://www.googleapis.com/auth/youtube`
- `https://www.googleapis.com/auth/youtube.force-ssl`
- `https://www.googleapis.com/auth/youtubepartner`

## Parameters

### Required Parameters

| Parameter | Type | Description |
|-----------|------|-------------|
| `part` | string | Identifies properties for the write operation and API response. Supported values: `contentDetails`, `id`, `snippet`, `subscriberSnippet` |

## Request Body

Provide a subscription resource with:

### Required Properties

| Property | Type | Description |
|----------|------|-------------|
| `snippet.resourceId` | object | Identifies the channel to subscribe to |
| `snippet.resourceId.kind` | string | Must be `youtube#channel` |
| `snippet.resourceId.channelId` | string | Channel ID to subscribe to |

## Response

Returns a subscription resource on success.

## Error Codes

| HTTP Status | Error Code | Description |
|-------------|------------|-------------|
| 400 | `subscriptionDuplicate` | Subscription already exists |
| 400 | `subscriptionForbidden` | Maximum subscriptions reached or self-subscription attempted |
| 400 | `publisherRequired` | Must use `snippet.resourceId` to identify target channel |
| 404 | `publisherNotFound` | Specified resource (channel) cannot be found |

## Example Request

```
POST https://www.googleapis.com/youtube/v3/subscriptions?part=snippet
Content-Type: application/json

{
  "snippet": {
    "resourceId": {
      "kind": "youtube#channel",
      "channelId": "CHANNEL_ID_TO_SUBSCRIBE_TO"
    }
  }
}
```

## Response Example

```json
{
  "kind": "youtube#subscription",
  "etag": "...",
  "id": "NEW_SUBSCRIPTION_ID",
  "snippet": {
    "publishedAt": "2026-01-07T...",
    "title": "Channel Name",
    "description": "Channel description...",
    "resourceId": {
      "kind": "youtube#channel",
      "channelId": "CHANNEL_ID_TO_SUBSCRIBE_TO"
    },
    "channelId": "YOUR_CHANNEL_ID",
    "thumbnails": {
      "default": { "url": "https://..." },
      "medium": { "url": "https://..." },
      "high": { "url": "https://..." }
    }
  }
}
```

## Notes

- You cannot subscribe to your own channel (results in `subscriptionForbidden` error)
- There is a maximum number of subscriptions per account
- Duplicate subscriptions return a `subscriptionDuplicate` error
- The authenticated user becomes the subscriber
