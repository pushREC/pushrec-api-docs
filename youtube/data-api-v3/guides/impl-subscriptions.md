---
source: https://developers.google.com/youtube/v3/guides/implementation/subscriptions
scraped: 2026-01-07
method: webfetch
api: youtube-data-v3
category: guides
---

# YouTube Data API: Subscriptions Implementation Guide

## Overview

The YouTube Data API v3 provides methods to manage channel subscriptions through three primary operations: retrieving subscriptions, adding new subscriptions, and removing existing ones.

## Retrieve Channel Subscriptions

### Authenticated User's Subscriptions

Use `subscriptions.list` with `mine=true` (requires OAuth 2.0):

```http
GET https://www.googleapis.com/youtube/v3/subscriptions?
  part=snippet,contentDetails&
  mine=true&
  maxResults=50
Authorization: Bearer ACCESS_TOKEN
```

### Other Channel's Subscriptions

Use the `channelId` parameter:

```http
GET https://www.googleapis.com/youtube/v3/subscriptions?
  part=snippet,contentDetails&
  channelId=UC_x5XG1OV2P6uZZ5FSM9Ttw&
  maxResults=50&
  key=YOUR_API_KEY
```

**Note:** The API returns a `403 (Forbidden)` HTTP response code if the specified channel does not publicly expose its subscriptions and the request is not authorized by the channel's owner.

### Python Example

```python
def get_my_subscriptions(youtube, max_results=50):
    """Retrieve authenticated user's subscriptions."""
    subscriptions = []
    next_page_token = None

    while True:
        response = youtube.subscriptions().list(
            part='snippet,contentDetails',
            mine=True,
            maxResults=min(50, max_results - len(subscriptions)),
            pageToken=next_page_token
        ).execute()

        subscriptions.extend(response.get('items', []))

        if len(subscriptions) >= max_results:
            break

        next_page_token = response.get('nextPageToken')
        if not next_page_token:
            break

    return subscriptions[:max_results]

# Usage
subscriptions = get_my_subscriptions(youtube)
for sub in subscriptions:
    print(f"Subscribed to: {sub['snippet']['title']}")
```

## Add a Subscription

Use `subscriptions.insert` with OAuth 2.0:

```http
POST https://www.googleapis.com/youtube/v3/subscriptions?part=snippet HTTP/1.1
Host: www.googleapis.com
Authorization: Bearer ACCESS_TOKEN
Content-Type: application/json

{
  "snippet": {
    "resourceId": {
      "kind": "youtube#channel",
      "channelId": "UC_x5XG1OV2P6uZZ5FSM9Ttw"
    }
  }
}
```

### Request Body Structure

| Field | Required | Description |
|-------|----------|-------------|
| `snippet.resourceId.kind` | Yes | Must be `youtube#channel` |
| `snippet.resourceId.channelId` | Yes | The target channel's unique ID |

### Python Example

```python
def subscribe_to_channel(youtube, channel_id):
    """Subscribe to a YouTube channel."""
    body = {
        'snippet': {
            'resourceId': {
                'kind': 'youtube#channel',
                'channelId': channel_id
            }
        }
    }

    response = youtube.subscriptions().insert(
        part='snippet',
        body=body
    ).execute()

    print(f"Subscribed to: {response['snippet']['title']}")
    return response

# Usage
subscribe_to_channel(youtube, 'UC_x5XG1OV2P6uZZ5FSM9Ttw')
```

### JavaScript Example

```javascript
async function subscribeToChannel(channelId) {
  const response = await fetch(
    'https://www.googleapis.com/youtube/v3/subscriptions?part=snippet',
    {
      method: 'POST',
      headers: {
        'Authorization': `Bearer ${accessToken}`,
        'Content-Type': 'application/json'
      },
      body: JSON.stringify({
        snippet: {
          resourceId: {
            kind: 'youtube#channel',
            channelId: channelId
          }
        }
      })
    }
  );

  const data = await response.json();
  console.log(`Subscribed to: ${data.snippet.title}`);
  return data;
}
```

## Delete a Subscription

Two-step process:

### Step 1: Retrieve Subscription ID

```http
GET https://www.googleapis.com/youtube/v3/subscriptions?
  part=id,snippet&
  mine=true&
  forChannelId=UC_x5XG1OV2P6uZZ5FSM9Ttw
Authorization: Bearer ACCESS_TOKEN
```

### Step 2: Delete the Subscription

```http
DELETE https://www.googleapis.com/youtube/v3/subscriptions?id=SUBSCRIPTION_ID HTTP/1.1
Host: www.googleapis.com
Authorization: Bearer ACCESS_TOKEN
```

### Python Example

```python
def unsubscribe_from_channel(youtube, channel_id):
    """Unsubscribe from a YouTube channel."""
    # First, find the subscription
    response = youtube.subscriptions().list(
        part='id,snippet',
        mine=True,
        forChannelId=channel_id
    ).execute()

    if not response.get('items'):
        print(f"Not subscribed to channel {channel_id}")
        return False

    subscription_id = response['items'][0]['id']
    channel_title = response['items'][0]['snippet']['title']

    # Delete the subscription
    youtube.subscriptions().delete(id=subscription_id).execute()
    print(f"Unsubscribed from: {channel_title}")
    return True

# Usage
unsubscribe_from_channel(youtube, 'UC_x5XG1OV2P6uZZ5FSM9Ttw')
```

## Retrieve Channel Subscribers

Call `subscriptions.list` with `mySubscribers=true` (requires OAuth 2.0):

```http
GET https://www.googleapis.com/youtube/v3/subscriptions?
  part=snippet,subscriberSnippet&
  mySubscribers=true&
  maxResults=50
Authorization: Bearer ACCESS_TOKEN
```

### Python Example

```python
def get_my_subscribers(youtube, max_results=50):
    """Retrieve channels subscribed to the authenticated user."""
    subscribers = []
    next_page_token = None

    while True:
        response = youtube.subscriptions().list(
            part='snippet,subscriberSnippet',
            mySubscribers=True,
            maxResults=min(50, max_results - len(subscribers)),
            pageToken=next_page_token
        ).execute()

        subscribers.extend(response.get('items', []))

        if len(subscribers) >= max_results:
            break

        next_page_token = response.get('nextPageToken')
        if not next_page_token:
            break

    return subscribers[:max_results]
```

## Subscription Resource Structure

```json
{
  "kind": "youtube#subscription",
  "id": "SUBSCRIPTION_ID",
  "snippet": {
    "publishedAt": "2024-01-15T10:00:00Z",
    "title": "Channel Name",
    "description": "Channel description",
    "resourceId": {
      "kind": "youtube#channel",
      "channelId": "UC_x5XG1OV2P6uZZ5FSM9Ttw"
    },
    "channelId": "SUBSCRIBER_CHANNEL_ID",
    "thumbnails": {
      "default": {
        "url": "https://yt3.ggpht.com/..."
      }
    }
  },
  "contentDetails": {
    "totalItemCount": 150,
    "newItemCount": 5,
    "activityType": "all"
  },
  "subscriberSnippet": {
    "title": "Subscriber Name",
    "description": "Subscriber description",
    "channelId": "SUBSCRIBER_CHANNEL_ID",
    "thumbnails": {
      "default": {
        "url": "https://yt3.ggpht.com/..."
      }
    }
  }
}
```

## Resource Parts

| Part | Description |
|------|-------------|
| `id` | Subscription identifier |
| `snippet` | Basic details (title, description, thumbnails) |
| `contentDetails` | New item count, total item count |
| `subscriberSnippet` | Details about the subscriber (for mySubscribers requests) |

## Filtering Options

### forChannelId

Filter subscriptions to specific channels:

```http
GET https://www.googleapis.com/youtube/v3/subscriptions?
  part=snippet&
  mine=true&
  forChannelId=UC_x5XG1OV2P6uZZ5FSM9Ttw,UCVHFbqXqoYvEWM1Ddxl0QKg
Authorization: Bearer ACCESS_TOKEN
```

### Order

Sort subscription results:

| Value | Description |
|-------|-------------|
| `alphabetical` | Sort alphabetically by title |
| `relevance` | Sort by relevance (default) |
| `unread` | Sort by activity, most active first |

```http
GET https://www.googleapis.com/youtube/v3/subscriptions?
  part=snippet&
  mine=true&
  order=alphabetical
Authorization: Bearer ACCESS_TOKEN
```

## Check if Subscribed

```python
def is_subscribed(youtube, channel_id):
    """Check if authenticated user is subscribed to a channel."""
    response = youtube.subscriptions().list(
        part='id',
        mine=True,
        forChannelId=channel_id
    ).execute()

    return len(response.get('items', [])) > 0

# Usage
if is_subscribed(youtube, 'UC_x5XG1OV2P6uZZ5FSM9Ttw'):
    print("Already subscribed")
else:
    print("Not subscribed")
```

## Error Handling

### Common Errors

| Error Code | Description | Solution |
|------------|-------------|----------|
| 403 | Channel subscriptions not public | Must be channel owner to view |
| 400 | subscriptionDuplicate | Already subscribed to channel |
| 404 | subscriptionNotFound | Subscription doesn't exist |
| 403 | subscriptionForbidden | Cannot subscribe (blocked, etc.) |

### Python Error Handling Example

```python
from googleapiclient.errors import HttpError

def safe_subscribe(youtube, channel_id):
    try:
        return subscribe_to_channel(youtube, channel_id)
    except HttpError as e:
        if e.resp.status == 400:
            error_reason = e.error_details[0].get('reason', '')
            if error_reason == 'subscriptionDuplicate':
                print("Already subscribed to this channel")
                return None
        raise
```

## Quota Costs

| Operation | Quota Cost |
|-----------|-----------|
| `subscriptions.list` | 1 unit |
| `subscriptions.insert` | 50 units |
| `subscriptions.delete` | 50 units |

## Authorization Requirements

| Operation | Scope Required |
|-----------|---------------|
| List own subscriptions (`mine=true`) | `youtube.readonly` or `youtube` |
| List subscribers (`mySubscribers=true`) | `youtube.readonly` or `youtube` |
| Add subscription | `youtube` or `youtube.force-ssl` |
| Delete subscription | `youtube` or `youtube.force-ssl` |
| List public subscriptions | API key only (no OAuth) |

## Best Practices

1. **Check before subscribing** to avoid duplicate subscription errors
2. **Use pagination** when retrieving large subscription lists
3. **Cache subscription status** to reduce API calls
4. **Handle privacy settings** - not all channels expose subscriptions publicly
5. **Use forChannelId filter** when checking subscription status for specific channels
