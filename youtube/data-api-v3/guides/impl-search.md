---
source: https://developers.google.com/youtube/v3/guides/implementation/search
scraped: 2026-01-07
api_provider: Google
discovery_tier: 3
verified: false
category: guides
method: webfetch
---
 YouTube Data API: Search Implementation Guide

## Overview

The `search.list` method serves as the foundation for all search requests in the YouTube Data API v3. It allows you to search for videos, channels, and playlists matching specified criteria.

## Basic Search Request

```http
GET https://www.googleapis.com/youtube/v3/search?
  part=snippet&
  q=surfing&
  type=video&
  key=YOUR_API_KEY
```

## Search Types

Filter results by content type using the `type` parameter:

| Type | Description |
|------|-------------|
| `video` | Returns video content |
| `playlist` | Returns playlist collections |
| `channel` | Returns channel profiles |

You can specify multiple types:
```
type=video,channel,playlist
```

## Key Parameters

### Query Parameters

| Parameter | Description | Example |
|-----------|-------------|---------|
| `q` | Search query term | `q=surfing` |
| `part` | Resource properties to return | `part=snippet` |
| `type` | Content type filter | `type=video` |
| `maxResults` | Maximum results (1-50) | `maxResults=25` |

### Refinement Parameters

| Parameter | Description | Values |
|-----------|-------------|--------|
| `order` | Result ordering | `date`, `rating`, `relevance`, `title`, `videoCount`, `viewCount` |
| `videoDefinition` | Video quality filter | `any`, `high`, `standard` |
| `videoDuration` | Duration filter | `any`, `long`, `medium`, `short` |
| `videoType` | Video type filter | `any`, `episode`, `movie` |
| `relevanceLanguage` | Language preference | ISO 639-1 code (e.g., `en`, `fr`) |

### Developer-Specific Parameter

| Parameter | Description |
|-----------|-------------|
| `forDeveloper` | Restrict to videos uploaded via developer's app |

## Search Examples

### Video Search by Popularity

```http
GET https://www.googleapis.com/youtube/v3/search?
  part=snippet&
  q=skateboarding&
  type=video&
  videoDefinition=high&
  order=viewCount&
  maxResults=25&
  key=YOUR_API_KEY
```

### Channel Search

```http
GET https://www.googleapis.com/youtube/v3/search?
  part=snippet&
  q=cooking&
  type=channel&
  maxResults=10&
  key=YOUR_API_KEY
```

### Playlist Search

```http
GET https://www.googleapis.com/youtube/v3/search?
  part=snippet&
  q=workout playlist&
  type=playlist&
  maxResults=10&
  key=YOUR_API_KEY
```

### Language-Specific Search

```http
GET https://www.googleapis.com/youtube/v3/search?
  part=snippet&
  q=actualités&
  type=video&
  relevanceLanguage=fr&
  maxResults=25&
  key=YOUR_API_KEY
```

### HD Videos Only

```http
GET https://www.googleapis.com/youtube/v3/search?
  part=snippet&
  q=nature documentary&
  type=video&
  videoDefinition=high&
  maxResults=25&
  key=YOUR_API_KEY
```

## Video-Specific Filters

These filters only apply when `type=video`:

### Duration Filters

| Value | Description |
|-------|-------------|
| `short` | Less than 4 minutes |
| `medium` | 4-20 minutes |
| `long` | More than 20 minutes |

```http
GET https://www.googleapis.com/youtube/v3/search?
  part=snippet&
  q=tutorial&
  type=video&
  videoDuration=medium&
  key=YOUR_API_KEY
```

### License Filters

| Value | Description |
|-------|-------------|
| `any` | Any license |
| `creativeCommon` | Creative Commons license |
| `youtube` | Standard YouTube license |

```http
GET https://www.googleapis.com/youtube/v3/search?
  part=snippet&
  q=background music&
  type=video&
  videoLicense=creativeCommon&
  key=YOUR_API_KEY
```

### Caption Filters

| Value | Description |
|-------|-------------|
| `any` | Any caption status |
| `closedCaption` | Has closed captions |
| `none` | No captions |

### Embeddable Filter

```http
GET https://www.googleapis.com/youtube/v3/search?
  part=snippet&
  q=presentation&
  type=video&
  videoEmbeddable=true&
  key=YOUR_API_KEY
```

### Syndicated Filter

Filter videos that can be played outside YouTube:

```http
GET https://www.googleapis.com/youtube/v3/search?
  part=snippet&
  q=music&
  type=video&
  videoSyndicated=true&
  key=YOUR_API_KEY
```

## Location-Based Search

Search for videos near a geographic location:

```http
GET https://www.googleapis.com/youtube/v3/search?
  part=snippet&
  q=surf&
  type=video&
  location=37.42307,-122.08427&
  locationRadius=100km&
  key=YOUR_API_KEY
```

| Parameter | Description |
|-----------|-------------|
| `location` | Latitude,longitude coordinates |
| `locationRadius` | Search radius (e.g., `100km`, `50mi`) |

## Date Filters

### Published After

```http
GET https://www.googleapis.com/youtube/v3/search?
  part=snippet&
  q=news&
  type=video&
  publishedAfter=2024-01-01T00:00:00Z&
  key=YOUR_API_KEY
```

### Published Before

```http
GET https://www.googleapis.com/youtube/v3/search?
  part=snippet&
  q=classic music&
  type=video&
  publishedBefore=2020-01-01T00:00:00Z&
  key=YOUR_API_KEY
```

## Channel-Specific Search

Search within a specific channel:

```http
GET https://www.googleapis.com/youtube/v3/search?
  part=snippet&
  channelId=UC_x5XG1OV2P6uZZ5FSM9Ttw&
  q=android&
  type=video&
  key=YOUR_API_KEY
```

## Safe Search

Filter inappropriate content:

| Value | Description |
|-------|-------------|
| `moderate` | Some filtering (default) |
| `none` | No filtering |
| `strict` | Strict filtering |

```http
GET https://www.googleapis.com/youtube/v3/search?
  part=snippet&
  q=kids songs&
  type=video&
  safeSearch=strict&
  key=YOUR_API_KEY
```

## Code Examples

### Python

```python
import googleapiclient.discovery

def search_videos(youtube, query, max_results=25, **kwargs):
    """Search for YouTube videos."""
    request = youtube.search().list(
        part='snippet',
        q=query,
        type='video',
        maxResults=max_results,
        **kwargs
    )
    return request.execute()

# Usage
youtube = googleapiclient.discovery.build('youtube', 'v3', developerKey='YOUR_API_KEY')

# Basic search
results = search_videos(youtube, 'python tutorial')

# Advanced search with filters
results = search_videos(
    youtube,
    'cooking',
    order='viewCount',
    videoDefinition='high',
    videoDuration='medium'
)

for item in results.get('items', []):
    print(f"Title: {item['snippet']['title']}")
    print(f"Video ID: {item['id']['videoId']}")
    print(f"Channel: {item['snippet']['channelTitle']}")
    print('---')
```

### JavaScript

```javascript
async function searchVideos(query, options = {}) {
  const params = new URLSearchParams({
    part: 'snippet',
    q: query,
    type: 'video',
    maxResults: options.maxResults || 25,
    key: 'YOUR_API_KEY',
    ...options
  });

  const response = await fetch(
    `https://www.googleapis.com/youtube/v3/search?${params}`
  );
  return response.json();
}

// Usage
const results = await searchVideos('javascript tutorial', {
  order: 'relevance',
  videoDefinition: 'high'
});

results.items.forEach(item => {
  console.log(`Title: ${item.snippet.title}`);
  console.log(`Video ID: ${item.id.videoId}`);
});
```

### PHP

```php
<?php
function searchVideos($youtube, $query, $options = []) {
    $params = array_merge([
        'q' => $query,
        'type' => 'video',
        'maxResults' => 25
    ], $options);

    return $youtube->search->listSearch('snippet', $params);
}

// Usage
$results = searchVideos($youtube, 'php tutorial', [
    'order' => 'viewCount',
    'videoDefinition' => 'high'
]);

foreach ($results->getItems() as $item) {
    echo "Title: " . $item->getSnippet()->getTitle() . "\n";
    echo "Video ID: " . $item->getId()->getVideoId() . "\n";
}
?>
```

## Response Structure

```json
{
  "kind": "youtube#searchListResponse",
  "nextPageToken": "CAUQAA",
  "regionCode": "US",
  "pageInfo": {
    "totalResults": 1000000,
    "resultsPerPage": 25
  },
  "items": [
    {
      "kind": "youtube#searchResult",
      "id": {
        "kind": "youtube#video",
        "videoId": "VIDEO_ID"
      },
      "snippet": {
        "publishedAt": "2024-01-15T10:00:00Z",
        "channelId": "CHANNEL_ID",
        "title": "Video Title",
        "description": "Video description...",
        "thumbnails": {
          "default": {
            "url": "https://i.ytimg.com/vi/VIDEO_ID/default.jpg"
          },
          "medium": {
            "url": "https://i.ytimg.com/vi/VIDEO_ID/mqdefault.jpg"
          },
          "high": {
            "url": "https://i.ytimg.com/vi/VIDEO_ID/hqdefault.jpg"
          }
        },
        "channelTitle": "Channel Name",
        "liveBroadcastContent": "none"
      }
    }
  ]
}
```

## ID Types by Search Result

| Type | ID Object |
|------|-----------|
| Video | `id.videoId` |
| Channel | `id.channelId` |
| Playlist | `id.playlistId` |

## Quota Cost

**Important:** The `search.list` method costs **100 quota units** per request.

To minimize quota usage:
1. Use specific filters to reduce result count
2. Cache search results when appropriate
3. Use `videos.list` with specific IDs when you know what you need

## Best Practices

1. **Use appropriate `maxResults`** - Request only what you need
2. **Apply filters** - More specific searches are more efficient
3. **Use regionCode** - Get relevant results for your users' location
4. **Implement pagination** - Use `nextPageToken` for additional results
5. **Cache results** - Reduce API calls for common searches
6. **Consider relevanceLanguage** - Improve results for non-English users
