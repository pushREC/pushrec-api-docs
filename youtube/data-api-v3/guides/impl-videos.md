---
source: https://developers.google.com/youtube/v3/guides/implementation/videos
scraped: 2026-01-07
api_provider: Google
discovery_tier: 3
verified: false
category: guides
method: webfetch
---
 YouTube Data API: Videos Implementation Guide

## Overview

The YouTube Data API v3 enables developers to retrieve, upload, update, and delete videos through various resource methods. Operations modifying user content require OAuth 2.0 authorization.

## Key Operations

### 1. Retrieve Channel's Uploaded Videos

This process requires two steps:

**Step 1:** Call `channels.list` with `part=contentDetails` to get the uploads playlist ID

```http
GET https://www.googleapis.com/youtube/v3/channels?
  part=contentDetails&
  mine=true&
  key=YOUR_API_KEY
```

Response includes:
```json
{
  "items": [{
    "contentDetails": {
      "relatedPlaylists": {
        "uploads": "UU_x5XG1OV2P6uZZ5FSM9Ttw"
      }
    }
  }]
}
```

**Step 2:** Use `playlistItems.list` with the retrieved playlist ID

```http
GET https://www.googleapis.com/youtube/v3/playlistItems?
  part=snippet&
  playlistId=UU_x5XG1OV2P6uZZ5FSM9Ttw&
  maxResults=50&
  key=YOUR_API_KEY
```

#### Channel Identification Methods

| Parameter | Use Case | Example |
|-----------|----------|---------|
| `mine=true` | Current authenticated user | Requires OAuth 2.0 |
| `forUsername` | Known YouTube username | `forUsername=Google` |
| `id` | Known channel ID | `id=UC_x5XG1OV2P6uZZ5FSM9Ttw` |

### 2. Retrieve Most Popular Videos

Call `videos.list` with `chart=mostPopular`:

```http
GET https://www.googleapis.com/youtube/v3/videos?
  part=snippet,statistics&
  chart=mostPopular&
  regionCode=US&
  maxResults=25&
  key=YOUR_API_KEY
```

#### Optional Filters

| Parameter | Description | Example |
|-----------|-------------|---------|
| `regionCode` | ISO 3166-1 alpha-2 country code | `regionCode=US` |
| `videoCategoryId` | Specific video category | `videoCategoryId=10` (Music) |

### 3. Upload Videos

Use the `videos.insert` method with resumable upload:

```http
POST /upload/youtube/v3/videos?
  uploadType=resumable&
  part=snippet,status HTTP/1.1
Host: www.googleapis.com
Authorization: Bearer ACCESS_TOKEN
Content-Type: application/json

{
  "snippet": {
    "title": "My Video Title",
    "description": "Video description",
    "tags": ["tag1", "tag2"],
    "categoryId": "22"
  },
  "status": {
    "privacyStatus": "private",
    "embeddable": true,
    "license": "youtube"
  }
}
```

#### Python Example

```python
import googleapiclient.discovery
from googleapiclient.http import MediaFileUpload

def upload_video(youtube, file_path, title, description, category_id, privacy):
    body = {
        'snippet': {
            'title': title,
            'description': description,
            'categoryId': category_id
        },
        'status': {
            'privacyStatus': privacy
        }
    }

    media = MediaFileUpload(
        file_path,
        chunksize=-1,
        resumable=True
    )

    request = youtube.videos().insert(
        part='snippet,status',
        body=body,
        media_body=media
    )

    response = None
    while response is None:
        status, response = request.next_chunk()
        if status:
            print(f'Upload {int(status.progress() * 100)}% complete')

    return response

# Usage
youtube = googleapiclient.discovery.build('youtube', 'v3', credentials=credentials)
video = upload_video(
    youtube,
    'video.mp4',
    'My Video',
    'Description here',
    '22',
    'private'
)
print(f'Video uploaded: {video["id"]}')
```

### 4. Check Upload/Processing Status

After uploading via `videos.insert`, check processing status:

```http
GET https://www.googleapis.com/youtube/v3/videos?
  part=processingDetails&
  id=VIDEO_ID&
  key=YOUR_API_KEY
```

Response:
```json
{
  "items": [{
    "processingDetails": {
      "processingStatus": "processing",
      "processingProgress": {
        "partsTotal": 1000,
        "partsProcessed": 500
      }
    }
  }]
}
```

#### Processing Status Values

| Status | Description |
|--------|-------------|
| `processing` | Video is currently being processed |
| `succeeded` | Processing complete, video available |
| `failed` | Processing failed |
| `terminated` | Processing was terminated |

#### Polling Example

```python
import time

def wait_for_processing(youtube, video_id, timeout=600):
    start_time = time.time()

    while time.time() - start_time < timeout:
        response = youtube.videos().list(
            part='processingDetails',
            id=video_id
        ).execute()

        if not response.get('items'):
            raise Exception('Video not found')

        status = response['items'][0]['processingDetails']['processingStatus']

        if status == 'succeeded':
            return True
        elif status == 'failed':
            raise Exception('Video processing failed')
        elif status == 'terminated':
            raise Exception('Video processing terminated')

        print(f'Processing status: {status}')
        time.sleep(10)

    raise Exception('Processing timeout')
```

### 5. Update Videos

Use `videos.update` method with the appropriate `part` parameter:

```http
PUT https://www.googleapis.com/youtube/v3/videos?part=snippet HTTP/1.1
Host: www.googleapis.com
Authorization: Bearer ACCESS_TOKEN
Content-Type: application/json

{
  "id": "VIDEO_ID",
  "snippet": {
    "title": "Updated Title",
    "description": "Updated description",
    "categoryId": "22",
    "tags": ["updated", "tags"]
  }
}
```

#### Update Recording Details

```json
{
  "id": "VIDEO_ID",
  "recordingDetails": {
    "location": {
      "latitude": 42.3464,
      "longitude": -71.0975
    },
    "recordingDate": "2013-10-30T23:15:00.000Z"
  }
}
```

#### Python Example

```python
def update_video(youtube, video_id, title, description):
    # First retrieve current video data
    response = youtube.videos().list(
        part='snippet',
        id=video_id
    ).execute()

    if not response.get('items'):
        raise Exception('Video not found')

    video = response['items'][0]
    video['snippet']['title'] = title
    video['snippet']['description'] = description

    # Update the video
    update_response = youtube.videos().update(
        part='snippet',
        body=video
    ).execute()

    return update_response
```

### 6. Upload Custom Thumbnail

Use the `thumbnails.set` method:

```http
POST /upload/youtube/v3/thumbnails/set?videoId=VIDEO_ID HTTP/1.1
Host: www.googleapis.com
Authorization: Bearer ACCESS_TOKEN
Content-Type: image/jpeg
Content-Length: FILE_SIZE

[BINARY IMAGE DATA]
```

#### Requirements

- Image format: JPEG, GIF, or PNG
- Maximum file size: 2MB
- Recommended resolution: 1280x720 pixels
- Minimum width: 640 pixels
- Aspect ratio: 16:9

#### Python Example

```python
from googleapiclient.http import MediaFileUpload

def set_thumbnail(youtube, video_id, thumbnail_file):
    request = youtube.thumbnails().set(
        videoId=video_id,
        media_body=MediaFileUpload(thumbnail_file)
    )
    return request.execute()
```

### 7. Delete Videos

Call `videos.delete` with the video ID:

```http
DELETE https://www.googleapis.com/youtube/v3/videos?id=VIDEO_ID HTTP/1.1
Host: www.googleapis.com
Authorization: Bearer ACCESS_TOKEN
```

**Note:** Only video owners can delete their content. Requires OAuth 2.0 authorization.

#### Python Example

```python
def delete_video(youtube, video_id):
    youtube.videos().delete(id=video_id).execute()
    print(f'Video {video_id} deleted')
```

### 8. Report Abusive Videos

Two-step process:

**Step 1:** Retrieve abuse reason IDs

```http
GET https://www.googleapis.com/youtube/v3/videoAbuseReportReasons?
  part=snippet&
  key=YOUR_API_KEY
```

**Step 2:** Submit the abuse report

```http
POST https://www.googleapis.com/youtube/v3/videos/reportAbuse HTTP/1.1
Host: www.googleapis.com
Authorization: Bearer ACCESS_TOKEN
Content-Type: application/json

{
  "videoId": "VIDEO_ID",
  "reasonId": "S",
  "secondaryReasonId": "28",
  "comments": "Detailed description of the issue.",
  "language": "en"
}
```

## Video Resource Structure

### Common Parts

| Part | Description | Quota Cost |
|------|-------------|-----------|
| `snippet` | Basic details (title, description, thumbnails) | 2 |
| `contentDetails` | Duration, definition, captions | 2 |
| `statistics` | Views, likes, comments count | 2 |
| `status` | Privacy, upload status, license | 2 |
| `player` | Embed HTML | 0 |
| `recordingDetails` | Location, recording date | 2 |
| `processingDetails` | Processing status | 2 |
| `suggestions` | Upload suggestions | 2 |

### Example Response

```json
{
  "kind": "youtube#video",
  "id": "VIDEO_ID",
  "snippet": {
    "publishedAt": "2024-01-15T10:00:00Z",
    "channelId": "CHANNEL_ID",
    "title": "Video Title",
    "description": "Video description",
    "thumbnails": {
      "default": {
        "url": "https://i.ytimg.com/vi/VIDEO_ID/default.jpg",
        "width": 120,
        "height": 90
      },
      "medium": {
        "url": "https://i.ytimg.com/vi/VIDEO_ID/mqdefault.jpg",
        "width": 320,
        "height": 180
      },
      "high": {
        "url": "https://i.ytimg.com/vi/VIDEO_ID/hqdefault.jpg",
        "width": 480,
        "height": 360
      }
    },
    "channelTitle": "Channel Name",
    "categoryId": "22",
    "tags": ["tag1", "tag2"]
  },
  "contentDetails": {
    "duration": "PT5M30S",
    "dimension": "2d",
    "definition": "hd",
    "caption": "false",
    "licensedContent": true
  },
  "statistics": {
    "viewCount": "1000000",
    "likeCount": "50000",
    "commentCount": "5000"
  },
  "status": {
    "uploadStatus": "processed",
    "privacyStatus": "public",
    "license": "youtube",
    "embeddable": true,
    "publicStatsViewable": true
  }
}
```

## Quota Costs

| Operation | Quota Cost |
|-----------|-----------|
| `videos.list` | 1 unit |
| `videos.insert` | 1600 units |
| `videos.update` | 50 units |
| `videos.delete` | 50 units |
| `videos.rate` | 50 units |
| `videos.getRating` | 1 unit |
| `videos.reportAbuse` | 50 units |
| `thumbnails.set` | 50 units |

## Authorization Scopes

| Scope | Required For |
|-------|--------------|
| `youtube` | Full account access |
| `youtube.upload` | Upload videos |
| `youtube.force-ssl` | Rate, update, delete videos |
| `youtube.readonly` | Read-only access |
