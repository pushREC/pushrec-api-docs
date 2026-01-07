---
source: https://developers.google.com/youtube/v3/docs/subscriptions/list
scraped: 2026-01-07
api_provider: Google
discovery_tier: 3
verified: false
method: webfetch
---
 Subscriptions: list

Retrieves subscription resources matching specified API request criteria.

## HTTP Request

```
GET https://www.googleapis.com/youtube/v3/subscriptions
```

## Quota Cost

**1 unit** per call

## Parameters

### Required Parameters

| Parameter | Type | Description |
|-----------|------|-------------|
| `part` | string | Specifies comma-separated subscription resource properties to include. Values: `contentDetails`, `id`, `snippet`, `subscriberSnippet` |

### Filter Parameters (Choose One)

| Parameter | Type | Description |
|-----------|------|-------------|
| `channelId` | string | Returns subscriptions for a specific YouTube channel |
| `id` | string | Comma-separated list of subscription IDs to retrieve |
| `mine` | boolean | Set to `true` to retrieve authenticated user's subscriptions (requires authorization) |
| `myRecentSubscribers` | boolean | Retrieves user's subscribers in reverse chronological order (requires authorization; limited results) |
| `mySubscribers` | boolean | Retrieves user's subscribers in no particular order (requires authorization; limited results) |

### Optional Parameters

| Parameter | Type | Description |
|-----------|------|-------------|
| `forChannelId` | string | Comma-separated channel IDs to filter subscriptions |
| `maxResults` | unsigned integer | Maximum items returned (0-50, default: 5) |
| `onBehalfOfContentOwner` | string | YouTube CMS user acting for content owner (partners only) |
| `onBehalfOfContentOwnerChannel` | string | Channel ID for video operations (partners only) |
| `order` | string | Sort method: `alphabetical`, `relevance`, or `unread` |
| `pageToken` | string | Specific result page identifier |

## Request Body

No request body required.

## Response

### Response Structure

```json
{
  "kind": "youtube#subscriptionListResponse",
  "etag": "string",
  "nextPageToken": "string",
  "prevPageToken": "string",
  "pageInfo": {
    "totalResults": "integer",
    "resultsPerPage": "integer"
  },
  "items": [
    // subscription resources
  ]
}
```

### Response Properties

| Property | Type | Description |
|----------|------|-------------|
| `kind` | string | Always `youtube#subscriptionListResponse` |
| `etag` | string | Resource version identifier |
| `nextPageToken` | string | Token for next page of results |
| `prevPageToken` | string | Token for previous page of results |
| `pageInfo.totalResults` | integer | Total number of results |
| `pageInfo.resultsPerPage` | integer | Number of results per page |
| `items[]` | array | List of subscription resources |

## Order Values

| Value | Description |
|-------|-------------|
| `alphabetical` | Sort subscriptions alphabetically by title |
| `relevance` | Sort by relevance (default for some filters) |
| `unread` | Sort by unread activity count |

## Error Codes

| HTTP Status | Error Code | Description |
|-------------|------------|-------------|
| 403 | `accountClosed` | Subscriber account is closed |
| 403 | `accountSuspended` | Subscriber account is suspended |
| 403 | `subscriptionForbidden` | Requester lacks access permissions |
| 404 | `subscriberNotFound` | Subscriber cannot be located |

## Example Requests

### Get My Subscriptions

```
GET https://www.googleapis.com/youtube/v3/subscriptions?part=snippet,contentDetails&mine=true&maxResults=25
```

### Get Subscriptions for a Channel

```
GET https://www.googleapis.com/youtube/v3/subscriptions?part=snippet&channelId=CHANNEL_ID
```

### Check if Subscribed to Specific Channels

```
GET https://www.googleapis.com/youtube/v3/subscriptions?part=snippet&mine=true&forChannelId=CHANNEL_ID_1,CHANNEL_ID_2
```

### Get My Recent Subscribers

```
GET https://www.googleapis.com/youtube/v3/subscriptions?part=subscriberSnippet&myRecentSubscribers=true
```

### Get Subscriptions by ID

```
GET https://www.googleapis.com/youtube/v3/subscriptions?part=snippet&id=SUBSCRIPTION_ID_1,SUBSCRIPTION_ID_2
```

## Notes

- `mine`, `myRecentSubscribers`, and `mySubscribers` require user authorization
- `myRecentSubscribers` and `mySubscribers` return limited results and may not include all subscribers
- The `forChannelId` parameter can be used with `mine=true` to check subscription status
