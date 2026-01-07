---
source: https://developers.google.com/youtube/v3/guides/implementation/playlists
scraped: 2026-01-07
method: webfetch
api: youtube-data-v3
category: guides
---

# YouTube Data API: Playlists Implementation Guide

## Overview

The YouTube Data API v3 enables developers to retrieve, create, update, and delete playlists through various resource methods. Operations require OAuth 2.0 authorization for modifications.

## Retrieving Playlists

### Current User's Playlists

Call `playlists.list` with `mine=true` (requires OAuth 2.0):

```http
GET https://www.googleapis.com/youtube/v3/playlists?
  part=snippet,contentDetails&
  mine=true&
  maxResults=25
Authorization: Bearer ACCESS_TOKEN
```

### Specific User's Playlists

Two-step process:

**Step 1:** Get channel ID from username

```http
GET https://www.googleapis.com/youtube/v3/channels?
  part=id&
  forUsername=GoogleDevelopers&
  key=YOUR_API_KEY
```

**Step 2:** Get playlists by channel ID

```http
GET https://www.googleapis.com/youtube/v3/playlists?
  part=snippet,contentDetails&
  channelId=UC_x5XG1OV2P6uZZ5FSM9Ttw&
  maxResults=25&
  key=YOUR_API_KEY
```

### Specific Playlist Information

Use `playlists.list` with comma-separated playlist IDs:

```http
GET https://www.googleapis.com/youtube/v3/playlists?
  part=snippet,contentDetails&
  id=PLIivdWyY5sqJxnwJhe3etaK57n6GuPFz2,PLIivdWyY5sqLQ3Pu9zfxUUz1mV3iXHwBU&
  key=YOUR_API_KEY
```

Response includes `contentDetails.itemCount` for video counts.

## Creating Playlists

Use `playlists.insert` with OAuth 2.0:

```http
POST https://www.googleapis.com/youtube/v3/playlists?part=snippet,status HTTP/1.1
Host: www.googleapis.com
Authorization: Bearer ACCESS_TOKEN
Content-Type: application/json

{
  "snippet": {
    "title": "New playlist",
    "description": "New playlist description",
    "tags": ["sample", "playlist"],
    "defaultLanguage": "en"
  },
  "status": {
    "privacyStatus": "private"
  }
}
```

### Enable Podcast Functionality

```json
{
  "snippet": {
    "title": "My Podcast Playlist"
  },
  "status": {
    "privacyStatus": "public",
    "podcastStatus": "enabled"
  }
}
```

### Python Example

```python
def create_playlist(youtube, title, description, privacy='private'):
    body = {
        'snippet': {
            'title': title,
            'description': description
        },
        'status': {
            'privacyStatus': privacy
        }
    }

    response = youtube.playlists().insert(
        part='snippet,status',
        body=body
    ).execute()

    return response

# Usage
playlist = create_playlist(
    youtube,
    'My New Playlist',
    'A collection of my favorite videos',
    'public'
)
print(f'Created playlist: {playlist["id"]}')
```

## Updating Playlists

Call `playlists.update` with OAuth 2.0:

```http
PUT https://www.googleapis.com/youtube/v3/playlists?part=snippet,status HTTP/1.1
Host: www.googleapis.com
Authorization: Bearer ACCESS_TOKEN
Content-Type: application/json

{
  "id": "PLAYLIST_ID",
  "snippet": {
    "title": "Updated playlist title",
    "description": "Updated description",
    "tags": ["updated", "tags"]
  },
  "status": {
    "privacyStatus": "public"
  }
}
```

### Important Requirements

- Request body must include the `snippet` part
- The `snippet.title` property is **mandatory**
- Previously set `description` and `tags` must be respecified or they'll be deleted

### Python Example

```python
def update_playlist(youtube, playlist_id, title, description, privacy):
    # First retrieve current playlist data
    response = youtube.playlists().list(
        part='snippet,status',
        id=playlist_id
    ).execute()

    if not response.get('items'):
        raise Exception('Playlist not found')

    playlist = response['items'][0]

    # Update fields
    playlist['snippet']['title'] = title
    playlist['snippet']['description'] = description
    playlist['status']['privacyStatus'] = privacy

    # Send update
    update_response = youtube.playlists().update(
        part='snippet,status',
        body=playlist
    ).execute()

    return update_response
```

## Deleting Playlists

Two-step process:

**Step 1:** Retrieve playlist ID

```http
GET https://www.googleapis.com/youtube/v3/playlists?
  part=id&
  mine=true
Authorization: Bearer ACCESS_TOKEN
```

**Step 2:** Delete the playlist

```http
DELETE https://www.googleapis.com/youtube/v3/playlists?id=PLAYLIST_ID HTTP/1.1
Host: www.googleapis.com
Authorization: Bearer ACCESS_TOKEN
```

### Python Example

```python
def delete_playlist(youtube, playlist_id):
    youtube.playlists().delete(id=playlist_id).execute()
    print(f'Deleted playlist: {playlist_id}')
```

## Playlist Items Management

### Adding Items to Playlists

Use `playlistItems.insert` with OAuth 2.0:

```http
POST https://www.googleapis.com/youtube/v3/playlistItems?part=snippet HTTP/1.1
Host: www.googleapis.com
Authorization: Bearer ACCESS_TOKEN
Content-Type: application/json

{
  "snippet": {
    "playlistId": "PLAYLIST_ID",
    "resourceId": {
      "kind": "youtube#video",
      "videoId": "VIDEO_ID"
    }
  }
}
```

### Add at Specific Position

```json
{
  "snippet": {
    "playlistId": "PLAYLIST_ID",
    "position": 0,
    "resourceId": {
      "kind": "youtube#video",
      "videoId": "VIDEO_ID"
    }
  }
}
```

### Python Example

```python
def add_video_to_playlist(youtube, playlist_id, video_id, position=None):
    body = {
        'snippet': {
            'playlistId': playlist_id,
            'resourceId': {
                'kind': 'youtube#video',
                'videoId': video_id
            }
        }
    }

    if position is not None:
        body['snippet']['position'] = position

    response = youtube.playlistItems().insert(
        part='snippet',
        body=body
    ).execute()

    return response
```

### Retrieving Playlist Items

```http
GET https://www.googleapis.com/youtube/v3/playlistItems?
  part=snippet,contentDetails&
  playlistId=PLAYLIST_ID&
  maxResults=50&
  key=YOUR_API_KEY
```

### Updating Playlist Items

Change item position:

```http
PUT https://www.googleapis.com/youtube/v3/playlistItems?part=snippet HTTP/1.1
Host: www.googleapis.com
Authorization: Bearer ACCESS_TOKEN
Content-Type: application/json

{
  "id": "PLAYLIST_ITEM_ID",
  "snippet": {
    "playlistId": "PLAYLIST_ID",
    "resourceId": {
      "kind": "youtube#video",
      "videoId": "VIDEO_ID"
    },
    "position": 0
  }
}
```

**Note:** Position values use zero-based indexing (0 = first position).

### Python Example - Reorder Items

```python
def move_to_top(youtube, playlist_id, playlist_item_id, video_id):
    body = {
        'id': playlist_item_id,
        'snippet': {
            'playlistId': playlist_id,
            'resourceId': {
                'kind': 'youtube#video',
                'videoId': video_id
            },
            'position': 0
        }
    }

    response = youtube.playlistItems().update(
        part='snippet',
        body=body
    ).execute()

    return response
```

### Removing Playlist Items

**Important:** The playlist item ID is different from the video ID.

```http
DELETE https://www.googleapis.com/youtube/v3/playlistItems?id=PLAYLIST_ITEM_ID HTTP/1.1
Host: www.googleapis.com
Authorization: Bearer ACCESS_TOKEN
```

### Python Example

```python
def remove_from_playlist(youtube, playlist_item_id):
    youtube.playlistItems().delete(id=playlist_item_id).execute()
    print(f'Removed item: {playlist_item_id}')

def remove_video_from_playlist(youtube, playlist_id, video_id):
    # First find the playlist item ID
    response = youtube.playlistItems().list(
        part='id,snippet',
        playlistId=playlist_id,
        maxResults=50
    ).execute()

    for item in response.get('items', []):
        if item['snippet']['resourceId']['videoId'] == video_id:
            youtube.playlistItems().delete(id=item['id']).execute()
            print(f'Removed video {video_id} from playlist')
            return

    print('Video not found in playlist')
```

## Playlist Images

### Adding Images

```http
POST /upload/youtube/v3/playlistImages?playlistId=PLAYLIST_ID HTTP/1.1
Host: www.googleapis.com
Authorization: Bearer ACCESS_TOKEN
Content-Type: image/jpeg

[BINARY IMAGE DATA]
```

### Retrieving Images

```http
GET https://www.googleapis.com/youtube/v3/playlistImages?
  playlistId=PLAYLIST_ID&
  part=id,snippet
Authorization: Bearer ACCESS_TOKEN
```

### Removing Images

Three-step process:

1. Get playlist: `playlists.list`
2. Get image ID: `playlistImages.list`
3. Delete: `playlistImages.delete?id=IMAGE_ID`

## Playlist Resource Structure

```json
{
  "kind": "youtube#playlist",
  "id": "PLAYLIST_ID",
  "snippet": {
    "publishedAt": "2024-01-15T10:00:00Z",
    "channelId": "CHANNEL_ID",
    "title": "Playlist Title",
    "description": "Playlist description",
    "thumbnails": {
      "default": {
        "url": "https://i.ytimg.com/vi/VIDEO_ID/default.jpg",
        "width": 120,
        "height": 90
      }
    },
    "channelTitle": "Channel Name",
    "defaultLanguage": "en",
    "localized": {
      "title": "Playlist Title",
      "description": "Playlist description"
    }
  },
  "status": {
    "privacyStatus": "public",
    "podcastStatus": "disabled"
  },
  "contentDetails": {
    "itemCount": 25
  }
}
```

## Privacy Status Options

| Status | Description |
|--------|-------------|
| `public` | Visible to everyone |
| `private` | Only visible to owner |
| `unlisted` | Accessible via direct link |

## Quota Costs

| Operation | Quota Cost |
|-----------|-----------|
| `playlists.list` | 1 unit |
| `playlists.insert` | 50 units |
| `playlists.update` | 50 units |
| `playlists.delete` | 50 units |
| `playlistItems.list` | 1 unit |
| `playlistItems.insert` | 50 units |
| `playlistItems.update` | 50 units |
| `playlistItems.delete` | 50 units |
| `playlistImages.list` | 1 unit |
| `playlistImages.insert` | 50 units |
| `playlistImages.update` | 50 units |
| `playlistImages.delete` | 50 units |

## Authorization Requirements

OAuth 2.0 authorization is mandatory for:
- Retrieving authenticated user's playlists (`mine=true`)
- All playlist creation, update, and deletion operations
- All playlist items operations (insert, update, delete)
- Playlist image management operations

## Key Technical Notes

- Playlist item IDs differ from video IDs
- Position values for playlist items use zero-based indexing
- When updating playlists, all existing optional properties must be respecified
- Maximum playlist size: 5,000 videos
- Media upload operations cannot be tested in the APIs Explorer
