---
source: https://developers.google.com/youtube/v3/guides/implementation/ratings
scraped: 2026-01-07
method: webfetch
api: youtube-data-v3
category: guides
---

# YouTube Data API: Video Ratings Implementation Guide

## Overview

The YouTube Data API v3 enables developers to manage video ratings through three primary operations, all requiring OAuth 2.0 authorization.

## Core Operations

### 1. Rate a Video

Use the `videos.rate` method to submit ratings:

```http
POST https://www.googleapis.com/youtube/v3/videos/rate?
  id=VIDEO_ID&
  rating=like HTTP/1.1
Host: www.googleapis.com
Authorization: Bearer ACCESS_TOKEN
```

#### Rating Values

| Value | Description |
|-------|-------------|
| `like` | Positive rating (thumbs up) |
| `dislike` | Negative rating (thumbs down) |
| `none` | Removes existing rating |

#### Example Requests

**Like a video:**
```http
POST https://www.googleapis.com/youtube/v3/videos/rate?id=dQw4w9WgXcQ&rating=like
Authorization: Bearer ACCESS_TOKEN
```

**Remove rating:**
```http
POST https://www.googleapis.com/youtube/v3/videos/rate?id=dQw4w9WgXcQ&rating=none
Authorization: Bearer ACCESS_TOKEN
```

#### Python Example

```python
def rate_video(youtube, video_id, rating):
    """
    Rate a YouTube video.

    Args:
        youtube: Authorized YouTube API client
        video_id: The video ID to rate
        rating: 'like', 'dislike', or 'none'
    """
    youtube.videos().rate(
        id=video_id,
        rating=rating
    ).execute()
    print(f"Video {video_id} rated as: {rating}")

# Usage
rate_video(youtube, 'dQw4w9WgXcQ', 'like')
```

#### JavaScript Example

```javascript
async function rateVideo(videoId, rating) {
  const response = await fetch(
    `https://www.googleapis.com/youtube/v3/videos/rate?id=${videoId}&rating=${rating}`,
    {
      method: 'POST',
      headers: {
        'Authorization': `Bearer ${accessToken}`
      }
    }
  );

  if (response.ok) {
    console.log(`Video ${videoId} rated as: ${rating}`);
  }
}

// Usage
await rateVideo('dQw4w9WgXcQ', 'like');
```

### 2. Retrieve Current User's Rating

Use `videos.getRating` to check rating status for one or more videos:

```http
GET https://www.googleapis.com/youtube/v3/videos/getRating?
  id=VIDEO_ID1,VIDEO_ID2,VIDEO_ID3
Authorization: Bearer ACCESS_TOKEN
```

#### Response Structure

```json
{
  "kind": "youtube#videoGetRatingResponse",
  "items": [
    {
      "videoId": "dQw4w9WgXcQ",
      "rating": "like"
    },
    {
      "videoId": "9bZkp7q19f0",
      "rating": "none"
    }
  ]
}
```

#### Rating Values in Response

| Value | Description |
|-------|-------------|
| `like` | User liked the video |
| `dislike` | User disliked the video |
| `none` | User has not rated the video |
| `unspecified` | Rating information not available |

#### Python Example

```python
def get_video_ratings(youtube, video_ids):
    """
    Get the authenticated user's rating for specified videos.

    Args:
        youtube: Authorized YouTube API client
        video_ids: List of video IDs or comma-separated string
    """
    if isinstance(video_ids, list):
        video_ids = ','.join(video_ids)

    response = youtube.videos().getRating(
        id=video_ids
    ).execute()

    ratings = {}
    for item in response.get('items', []):
        ratings[item['videoId']] = item['rating']

    return ratings

# Usage
video_ids = ['dQw4w9WgXcQ', '9bZkp7q19f0']
ratings = get_video_ratings(youtube, video_ids)
for video_id, rating in ratings.items():
    print(f"Video {video_id}: {rating}")
```

### 3. List User's Rated Videos

Use `videos.list` with the `myRating` parameter:

```http
GET https://www.googleapis.com/youtube/v3/videos?
  part=snippet,statistics&
  myRating=like&
  maxResults=25
Authorization: Bearer ACCESS_TOKEN
```

#### Parameters

| Parameter | Values | Description |
|-----------|--------|-------------|
| `myRating` | `like` | Returns videos the user liked |
| `myRating` | `dislike` | Returns videos the user disliked |

#### Python Example

```python
def get_liked_videos(youtube, max_results=50):
    """Get videos liked by the authenticated user."""
    videos = []
    next_page_token = None

    while True:
        response = youtube.videos().list(
            part='snippet,statistics',
            myRating='like',
            maxResults=min(50, max_results - len(videos)),
            pageToken=next_page_token
        ).execute()

        videos.extend(response.get('items', []))

        if len(videos) >= max_results:
            break

        next_page_token = response.get('nextPageToken')
        if not next_page_token:
            break

    return videos[:max_results]

# Usage
liked_videos = get_liked_videos(youtube, 100)
for video in liked_videos:
    print(f"Title: {video['snippet']['title']}")
```

## Alternative Approach: Likes Playlist

Users can retrieve liked videos via `playlistItems.list` using the likes playlist:

### Step 1: Get Likes Playlist ID

```http
GET https://www.googleapis.com/youtube/v3/channels?
  part=contentDetails&
  mine=true
Authorization: Bearer ACCESS_TOKEN
```

Response includes:
```json
{
  "items": [{
    "contentDetails": {
      "relatedPlaylists": {
        "likes": "LL",
        "uploads": "UU..."
      }
    }
  }]
}
```

### Step 2: Get Playlist Items

```http
GET https://www.googleapis.com/youtube/v3/playlistItems?
  part=snippet&
  playlistId=LL&
  maxResults=50
Authorization: Bearer ACCESS_TOKEN
```

### Python Example

```python
def get_likes_from_playlist(youtube, max_results=50):
    """Get liked videos from the likes playlist."""
    # Get the likes playlist ID
    channels_response = youtube.channels().list(
        part='contentDetails',
        mine=True
    ).execute()

    likes_playlist_id = channels_response['items'][0]['contentDetails']['relatedPlaylists']['likes']

    # Get videos from the playlist
    videos = []
    next_page_token = None

    while True:
        response = youtube.playlistItems().list(
            part='snippet',
            playlistId=likes_playlist_id,
            maxResults=min(50, max_results - len(videos)),
            pageToken=next_page_token
        ).execute()

        videos.extend(response.get('items', []))

        if len(videos) >= max_results:
            break

        next_page_token = response.get('nextPageToken')
        if not next_page_token:
            break

    return videos[:max_results]
```

## Complete Rating Manager Example

```python
class VideoRatingManager:
    def __init__(self, youtube):
        self.youtube = youtube

    def like(self, video_id):
        """Like a video."""
        self.youtube.videos().rate(id=video_id, rating='like').execute()
        return True

    def dislike(self, video_id):
        """Dislike a video."""
        self.youtube.videos().rate(id=video_id, rating='dislike').execute()
        return True

    def remove_rating(self, video_id):
        """Remove rating from a video."""
        self.youtube.videos().rate(id=video_id, rating='none').execute()
        return True

    def get_rating(self, video_id):
        """Get current rating for a video."""
        response = self.youtube.videos().getRating(id=video_id).execute()
        if response.get('items'):
            return response['items'][0]['rating']
        return None

    def get_ratings(self, video_ids):
        """Get ratings for multiple videos."""
        if isinstance(video_ids, list):
            video_ids = ','.join(video_ids)

        response = self.youtube.videos().getRating(id=video_ids).execute()
        return {item['videoId']: item['rating'] for item in response.get('items', [])}

    def get_liked_videos(self, max_results=50):
        """Get all liked videos."""
        return self._get_rated_videos('like', max_results)

    def get_disliked_videos(self, max_results=50):
        """Get all disliked videos."""
        return self._get_rated_videos('dislike', max_results)

    def _get_rated_videos(self, rating_type, max_results):
        videos = []
        next_page_token = None

        while len(videos) < max_results:
            response = self.youtube.videos().list(
                part='snippet,statistics',
                myRating=rating_type,
                maxResults=min(50, max_results - len(videos)),
                pageToken=next_page_token
            ).execute()

            videos.extend(response.get('items', []))
            next_page_token = response.get('nextPageToken')

            if not next_page_token:
                break

        return videos[:max_results]

# Usage
manager = VideoRatingManager(youtube)

# Rate a video
manager.like('dQw4w9WgXcQ')

# Check rating
rating = manager.get_rating('dQw4w9WgXcQ')
print(f"Rating: {rating}")

# Get all liked videos
liked = manager.get_liked_videos(100)
print(f"Liked {len(liked)} videos")
```

## Quota Costs

| Operation | Quota Cost |
|-----------|-----------|
| `videos.rate` | 50 units |
| `videos.getRating` | 1 unit |
| `videos.list` (with myRating) | 1 unit |

## Authorization Requirements

All rating operations require OAuth 2.0 authorization with one of these scopes:

| Scope | Permissions |
|-------|-------------|
| `youtube` | Full account access |
| `youtube.force-ssl` | Rate videos, manage account |

## Error Handling

### Common Errors

| Error | Description | Solution |
|-------|-------------|----------|
| 403 | Forbidden | Check OAuth scope |
| 404 | Video not found | Verify video ID |
| 400 | Invalid rating | Use 'like', 'dislike', or 'none' |

### Python Error Handling

```python
from googleapiclient.errors import HttpError

def safe_rate_video(youtube, video_id, rating):
    try:
        youtube.videos().rate(id=video_id, rating=rating).execute()
        return True
    except HttpError as e:
        if e.resp.status == 404:
            print(f"Video {video_id} not found")
        elif e.resp.status == 403:
            print("Permission denied - check OAuth scope")
        else:
            print(f"Error: {e}")
        return False
```

## Best Practices

1. **Check current rating before changing** - Avoid unnecessary API calls
2. **Batch rating checks** - Use comma-separated video IDs in `getRating`
3. **Cache ratings locally** - Reduce quota usage
4. **Handle rate limits** - Implement exponential backoff
5. **Use appropriate scope** - `youtube.force-ssl` is sufficient for rating operations
