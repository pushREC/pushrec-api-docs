---
source: https://developers.google.com/youtube/v3/guides/push_notifications
scraped: 2026-01-07
api_provider: Google
discovery_tier: 3
verified: false
category: guides
method: webfetch
---
 YouTube Data API: Push Notifications Guide

## Overview

The YouTube Data API v3 leverages PubSubHubbub (WebSub), a server-to-server publish/subscribe protocol for web-accessible resources, enabling efficient push notifications instead of continuous polling.

## Key Benefits

- **Near real-time** event delivery
- **No polling required** - eliminates determining optimal polling intervals
- **Efficient** - no repeatedly fetching unchanged data
- **Reduced quota usage** - fewer API calls needed

## Triggering Events

Your callback server receives Atom feed notifications when channels:
- Upload new videos
- Update video titles
- Modify video descriptions

## Implementation Steps

### Step 1: Set Up Callback Server

Create a server endpoint that can:
1. Handle HTTP GET requests for subscription verification
2. Handle HTTP POST requests for notifications
3. Return appropriate HTTP status codes

#### Python Flask Example

```python
from flask import Flask, request
import hashlib
import hmac

app = Flask(__name__)
SECRET = 'your_secret_key'

@app.route('/youtube-webhook', methods=['GET', 'POST'])
def youtube_webhook():
    if request.method == 'GET':
        # Subscription verification
        return handle_verification(request)
    else:
        # Notification
        return handle_notification(request)

def handle_verification(request):
    """Handle subscription verification challenge."""
    mode = request.args.get('hub.mode')
    topic = request.args.get('hub.topic')
    challenge = request.args.get('hub.challenge')
    lease_seconds = request.args.get('hub.lease_seconds')

    if mode == 'subscribe':
        print(f"Subscription verified for: {topic}")
        print(f"Lease: {lease_seconds} seconds")
        return challenge, 200
    elif mode == 'unsubscribe':
        print(f"Unsubscription verified for: {topic}")
        return challenge, 200

    return 'Invalid request', 400

def handle_notification(request):
    """Handle incoming notification."""
    # Verify signature if using secret
    signature = request.headers.get('X-Hub-Signature')
    if signature:
        expected = 'sha1=' + hmac.new(
            SECRET.encode(),
            request.data,
            hashlib.sha1
        ).hexdigest()

        if not hmac.compare_digest(signature, expected):
            return 'Invalid signature', 403

    # Parse the Atom feed
    content = request.data.decode('utf-8')
    process_notification(content)

    return '', 200

def process_notification(content):
    """Process the notification content."""
    import xml.etree.ElementTree as ET

    root = ET.fromstring(content)

    # Define namespaces
    ns = {
        'atom': 'http://www.w3.org/2005/Atom',
        'yt': 'http://www.youtube.com/xml/schemas/2015'
    }

    for entry in root.findall('atom:entry', ns):
        video_id = entry.find('yt:videoId', ns).text
        channel_id = entry.find('yt:channelId', ns).text
        title = entry.find('atom:title', ns).text
        published = entry.find('atom:published', ns).text

        print(f"New/Updated video: {title}")
        print(f"Video ID: {video_id}")
        print(f"Channel ID: {channel_id}")
        print(f"Published: {published}")

if __name__ == '__main__':
    app.run(port=8080)
```

#### Node.js Express Example

```javascript
const express = require('express');
const crypto = require('crypto');
const xml2js = require('xml2js');

const app = express();
const SECRET = 'your_secret_key';

app.use(express.raw({ type: 'application/atom+xml' }));

app.get('/youtube-webhook', (req, res) => {
  // Subscription verification
  const mode = req.query['hub.mode'];
  const topic = req.query['hub.topic'];
  const challenge = req.query['hub.challenge'];

  if (mode === 'subscribe' || mode === 'unsubscribe') {
    console.log(`${mode} verified for: ${topic}`);
    res.status(200).send(challenge);
  } else {
    res.status(400).send('Invalid request');
  }
});

app.post('/youtube-webhook', (req, res) => {
  // Verify signature
  const signature = req.headers['x-hub-signature'];
  if (signature) {
    const expected = 'sha1=' + crypto
      .createHmac('sha1', SECRET)
      .update(req.body)
      .digest('hex');

    if (signature !== expected) {
      return res.status(403).send('Invalid signature');
    }
  }

  // Parse notification
  const parser = new xml2js.Parser();
  parser.parseString(req.body, (err, result) => {
    if (err) {
      console.error('Parse error:', err);
      return res.status(400).send('Parse error');
    }

    const entry = result.feed.entry?.[0];
    if (entry) {
      const videoId = entry['yt:videoId']?.[0];
      const channelId = entry['yt:channelId']?.[0];
      const title = entry.title?.[0];

      console.log(`New/Updated video: ${title}`);
      console.log(`Video ID: ${videoId}`);
      console.log(`Channel ID: ${channelId}`);
    }

    res.status(200).send('');
  });
});

app.listen(8080, () => {
  console.log('Webhook server running on port 8080');
});
```

### Step 2: Subscribe via Google Hub

Subscribe to channel updates through the PubSubHubbub hub.

#### Subscription Request

```http
POST https://pubsubhubbub.appspot.com/subscribe HTTP/1.1
Content-Type: application/x-www-form-urlencoded

hub.mode=subscribe&
hub.topic=https://www.youtube.com/xml/feeds/videos.xml?channel_id=CHANNEL_ID&
hub.callback=https://your-server.com/youtube-webhook&
hub.verify=async&
hub.secret=your_secret_key&
hub.lease_seconds=432000
```

#### Parameters

| Parameter | Required | Description |
|-----------|----------|-------------|
| `hub.mode` | Yes | `subscribe` or `unsubscribe` |
| `hub.topic` | Yes | YouTube feed URL |
| `hub.callback` | Yes | Your webhook endpoint URL |
| `hub.verify` | No | `sync` or `async` (default: async) |
| `hub.secret` | No | Secret for HMAC signature verification |
| `hub.lease_seconds` | No | Subscription duration (default: 432000 = 5 days) |

#### Topic URL Format

```
https://www.youtube.com/xml/feeds/videos.xml?channel_id=CHANNEL_ID
```

Replace `CHANNEL_ID` with the target channel's ID.

#### Python Subscription Example

```python
import requests

def subscribe_to_channel(channel_id, callback_url, secret=None):
    """Subscribe to a YouTube channel's feed."""
    hub_url = 'https://pubsubhubbub.appspot.com/subscribe'
    topic_url = f'https://www.youtube.com/xml/feeds/videos.xml?channel_id={channel_id}'

    data = {
        'hub.mode': 'subscribe',
        'hub.topic': topic_url,
        'hub.callback': callback_url,
        'hub.verify': 'async'
    }

    if secret:
        data['hub.secret'] = secret

    response = requests.post(hub_url, data=data)

    if response.status_code == 202:
        print(f"Subscription request accepted for channel: {channel_id}")
        return True
    else:
        print(f"Subscription failed: {response.status_code} - {response.text}")
        return False

def unsubscribe_from_channel(channel_id, callback_url):
    """Unsubscribe from a YouTube channel's feed."""
    hub_url = 'https://pubsubhubbub.appspot.com/subscribe'
    topic_url = f'https://www.youtube.com/xml/feeds/videos.xml?channel_id={channel_id}'

    data = {
        'hub.mode': 'unsubscribe',
        'hub.topic': topic_url,
        'hub.callback': callback_url,
        'hub.verify': 'async'
    }

    response = requests.post(hub_url, data=data)

    if response.status_code == 202:
        print(f"Unsubscription request accepted for channel: {channel_id}")
        return True
    else:
        print(f"Unsubscription failed: {response.status_code}")
        return False

# Usage
subscribe_to_channel(
    'UC_x5XG1OV2P6uZZ5FSM9Ttw',
    'https://your-server.com/youtube-webhook',
    'your_secret_key'
)
```

### Step 3: Handle Notifications

Notifications arrive as Atom XML feeds.

#### Notification Payload Format

```xml
<?xml version="1.0" encoding="UTF-8"?>
<feed xmlns:yt="http://www.youtube.com/xml/schemas/2015"
      xmlns="http://www.w3.org/2005/Atom">
  <link rel="hub" href="https://pubsubhubbub.appspot.com"/>
  <link rel="self" href="https://www.youtube.com/xml/feeds/videos.xml?channel_id=CHANNEL_ID"/>
  <title>YouTube video feed</title>
  <updated>2024-01-15T10:00:00+00:00</updated>
  <entry>
    <id>yt:video:VIDEO_ID</id>
    <yt:videoId>VIDEO_ID</yt:videoId>
    <yt:channelId>CHANNEL_ID</yt:channelId>
    <title>Video Title</title>
    <link rel="alternate" href="https://www.youtube.com/watch?v=VIDEO_ID"/>
    <author>
      <name>Channel Name</name>
      <uri>https://www.youtube.com/channel/CHANNEL_ID</uri>
    </author>
    <published>2024-01-15T10:00:00+00:00</published>
    <updated>2024-01-15T10:00:00+00:00</updated>
  </entry>
</feed>
```

#### Key Elements

| Element | Description |
|---------|-------------|
| `<yt:videoId>` | The video's unique identifier |
| `<yt:channelId>` | The channel's unique identifier |
| `<title>` | Video title |
| `<published>` | Original publish timestamp |
| `<updated>` | Last update timestamp |
| `<link rel="alternate">` | Video URL |

## Complete Notification Handler

```python
import xml.etree.ElementTree as ET
from dataclasses import dataclass
from datetime import datetime
from typing import Optional, List

@dataclass
class VideoNotification:
    video_id: str
    channel_id: str
    title: str
    published: datetime
    updated: datetime
    video_url: str
    channel_name: str
    channel_url: str

class YouTubeNotificationParser:
    NAMESPACES = {
        'atom': 'http://www.w3.org/2005/Atom',
        'yt': 'http://www.youtube.com/xml/schemas/2015'
    }

    @classmethod
    def parse(cls, xml_content: str) -> List[VideoNotification]:
        """Parse Atom feed and extract video notifications."""
        root = ET.fromstring(xml_content)
        notifications = []

        for entry in root.findall('atom:entry', cls.NAMESPACES):
            notification = cls._parse_entry(entry)
            if notification:
                notifications.append(notification)

        return notifications

    @classmethod
    def _parse_entry(cls, entry) -> Optional[VideoNotification]:
        """Parse a single entry element."""
        try:
            video_id = entry.find('yt:videoId', cls.NAMESPACES).text
            channel_id = entry.find('yt:channelId', cls.NAMESPACES).text
            title = entry.find('atom:title', cls.NAMESPACES).text

            published_str = entry.find('atom:published', cls.NAMESPACES).text
            updated_str = entry.find('atom:updated', cls.NAMESPACES).text

            link = entry.find("atom:link[@rel='alternate']", cls.NAMESPACES)
            video_url = link.get('href') if link is not None else f'https://www.youtube.com/watch?v={video_id}'

            author = entry.find('atom:author', cls.NAMESPACES)
            channel_name = author.find('atom:name', cls.NAMESPACES).text if author is not None else ''
            channel_uri = author.find('atom:uri', cls.NAMESPACES)
            channel_url = channel_uri.text if channel_uri is not None else f'https://www.youtube.com/channel/{channel_id}'

            return VideoNotification(
                video_id=video_id,
                channel_id=channel_id,
                title=title,
                published=datetime.fromisoformat(published_str.replace('+00:00', '+0000')),
                updated=datetime.fromisoformat(updated_str.replace('+00:00', '+0000')),
                video_url=video_url,
                channel_name=channel_name,
                channel_url=channel_url
            )
        except Exception as e:
            print(f"Error parsing entry: {e}")
            return None

# Usage
def handle_notification(xml_content: str):
    notifications = YouTubeNotificationParser.parse(xml_content)

    for notification in notifications:
        print(f"Video: {notification.title}")
        print(f"Video ID: {notification.video_id}")
        print(f"Channel: {notification.channel_name}")
        print(f"Published: {notification.published}")
        print(f"URL: {notification.video_url}")
        print('---')
```

## Subscription Management

### Track Active Subscriptions

```python
import json
from datetime import datetime, timedelta

class SubscriptionManager:
    def __init__(self, storage_file='subscriptions.json'):
        self.storage_file = storage_file
        self.subscriptions = self._load()

    def _load(self):
        try:
            with open(self.storage_file, 'r') as f:
                return json.load(f)
        except FileNotFoundError:
            return {}

    def _save(self):
        with open(self.storage_file, 'w') as f:
            json.dump(self.subscriptions, f, indent=2)

    def add(self, channel_id, lease_seconds=432000):
        """Record a subscription."""
        expires = datetime.utcnow() + timedelta(seconds=lease_seconds)
        self.subscriptions[channel_id] = {
            'subscribed_at': datetime.utcnow().isoformat(),
            'expires_at': expires.isoformat(),
            'lease_seconds': lease_seconds
        }
        self._save()

    def remove(self, channel_id):
        """Remove a subscription."""
        if channel_id in self.subscriptions:
            del self.subscriptions[channel_id]
            self._save()

    def get_expiring(self, within_hours=24):
        """Get subscriptions expiring within the specified hours."""
        threshold = datetime.utcnow() + timedelta(hours=within_hours)
        expiring = []

        for channel_id, info in self.subscriptions.items():
            expires = datetime.fromisoformat(info['expires_at'])
            if expires < threshold:
                expiring.append(channel_id)

        return expiring

    def renew_all_expiring(self, callback_url, secret=None, within_hours=24):
        """Renew all subscriptions expiring soon."""
        expiring = self.get_expiring(within_hours)

        for channel_id in expiring:
            if subscribe_to_channel(channel_id, callback_url, secret):
                lease = self.subscriptions[channel_id]['lease_seconds']
                self.add(channel_id, lease)

        return expiring
```

## Best Practices

1. **Use HTTPS** for your callback URL
2. **Implement signature verification** using hub.secret
3. **Respond quickly** - Return 2xx status within seconds
4. **Handle duplicates** - Same notification may be sent multiple times
5. **Renew subscriptions** before they expire (lease_seconds)
6. **Process asynchronously** - Don't block the webhook response
7. **Log all notifications** for debugging and auditing

## Troubleshooting

### Common Issues

| Issue | Solution |
|-------|----------|
| Verification fails | Ensure callback URL is publicly accessible |
| No notifications | Check subscription status; renew if expired |
| Invalid signature | Verify secret matches on both ends |
| Parsing errors | Validate XML structure; check namespaces |

### Testing Subscriptions

Use the PubSubHubbub hub's subscription status endpoint:

```
https://pubsubhubbub.appspot.com/subscription-details?
  hub.callback=YOUR_CALLBACK_URL&
  hub.topic=TOPIC_URL
```

## Quota Considerations

Push notifications don't consume YouTube API quota. However, if you make API calls based on notifications (e.g., fetching full video details), those calls will use quota.

Recommended approach:
1. Receive notification
2. Extract video ID from feed
3. Use `videos.list` to get full details (1 quota unit)
