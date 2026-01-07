---
source: https://developers.google.com/youtube/v3/docs/subscriptions/delete
scraped: 2026-01-07
method: webfetch
api: youtube-data-v3
resource: subscriptions
method_name: delete
---

# Subscriptions: delete

Removes a YouTube subscription resource.

## HTTP Request

```
DELETE https://www.googleapis.com/youtube/v3/subscriptions
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
| `id` | string | The YouTube subscription ID for the resource that is being deleted |

## Request Body

No request body required.

## Response

Successful deletion returns: **HTTP 204 (No Content)**

No response body is returned.

## Error Codes

| HTTP Status | Error Code | Description |
|-------------|------------|-------------|
| 403 | `subscriptionForbidden` | The request is not properly authenticated or not supported for this channel |
| 404 | `subscriptionNotFound` | The subscription that you are trying to delete cannot be found. Check the value of the request's `id` parameter to ensure that it is correct. |

## Example Request

```
DELETE https://www.googleapis.com/youtube/v3/subscriptions?id=SUBSCRIPTION_ID
```

## Finding the Subscription ID

To delete a subscription, you first need to find its ID. You can do this by:

1. Use `subscriptions.list` with `mine=true` to get your subscriptions
2. Use `subscriptions.list` with `forChannelId` parameter to find a specific subscription
3. The subscription ID is returned in the `id` field of subscription resources

### Example: Find Subscription ID for a Channel

```
GET https://www.googleapis.com/youtube/v3/subscriptions?part=id&mine=true&forChannelId=TARGET_CHANNEL_ID
```

This returns the subscription resource with the ID you need to delete.

## Notes

- Only the authenticated user can delete their own subscriptions
- The subscription ID is different from the channel ID
- Deletion is immediate and permanent
- After deletion, you can re-subscribe using `subscriptions.insert`
