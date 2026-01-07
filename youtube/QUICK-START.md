---
created: 2026-01-07
type: quick-reference
---

# YouTube API Quick Start Guide

> **New to YouTube APIs?** Start here for a 10-minute path to your first working integration.

## ⚡ 5-Step Quick Start

### Step 1: Choose Your Authentication (2 min)

| Your App Type | Use This Guide |
|---------------|----------------|
| Web app (server-side) | [auth-server-side.md](data-api-v3/guides/auth-server-side.md) |
| JavaScript web app | [auth-client-web.md](data-api-v3/guides/auth-client-web.md) |
| Mobile/desktop app | [auth-installed-apps.md](data-api-v3/guides/auth-installed-apps.md) |
| TV/limited input device | [auth-devices.md](data-api-v3/guides/auth-devices.md) |
| Public data only (no auth) | Use API key - see [standard-parameters.md](data-api-v3/guides/standard-parameters.md) |

### Step 2: Get API Credentials (3 min)

1. Go to [Google Cloud Console](https://console.cloud.google.com/)
2. Create a new project
3. Enable **YouTube Data API v3**
4. Create credentials:
   - **API Key** for public data
   - **OAuth 2.0 Client ID** for user data
5. Save your credentials securely

### Step 3: Make Your First API Call (2 min)

**Fetch video details (public, no auth required):**

```bash
curl "https://www.googleapis.com/youtube/v3/videos?part=snippet&id=VIDEO_ID&key=YOUR_API_KEY"
```

**Python example:**
```python
import requests

API_KEY = "your_api_key"
video_id = "dQw4w9WgXcQ"  # Example video

response = requests.get(
    "https://www.googleapis.com/youtube/v3/videos",
    params={
        "part": "snippet,statistics",
        "id": video_id,
        "key": API_KEY
    }
)

video = response.json()["items"][0]
print(f"Title: {video['snippet']['title']}")
print(f"Views: {video['statistics']['viewCount']}")
```

### Step 4: Optimize Your Request (2 min)

Apply these best practices immediately:

```python
# ✅ GOOD: Only request what you need
response = requests.get(
    "https://www.googleapis.com/youtube/v3/videos",
    params={
        "part": "snippet,statistics",  # Only needed parts
        "id": video_id,
        "fields": "items(id,snippet(title,publishedAt),statistics/viewCount)",  # Specific fields
        "prettyPrint": "false",  # Smaller response
        "key": API_KEY
    }
)

# ❌ BAD: Requesting everything
response = requests.get(
    "https://www.googleapis.com/youtube/v3/videos",
    params={
        "part": "snippet,contentDetails,statistics,status,player,topicDetails",
        "id": video_id,
        "key": API_KEY
    }
)
```

See [performance.md](data-api-v3/guides/performance.md) for optimization details.

### Step 5: Handle Errors (1 min)

```python
try:
    response = requests.get(url, params=params)
    response.raise_for_status()
    data = response.json()

except requests.exceptions.HTTPError as e:
    if e.response.status_code == 403:
        print("Quota exceeded or forbidden")
    elif e.response.status_code == 404:
        print("Resource not found")
    else:
        print(f"Error: {e}")
```

See [errors.md](data-api-v3/overview/errors.md) for complete error handling.

---

## 📚 Essential Reading Order

**Day 1: Core Concepts** (30 min)
1. [best-practices.md](data-api-v3/guides/best-practices.md) - Production patterns
2. [standard-parameters.md](data-api-v3/guides/standard-parameters.md) - Query parameters
3. [quota-costs.md](data-api-v3/overview/quota-costs.md) - Quota management

**Day 2: Performance** (30 min)
4. [performance.md](data-api-v3/guides/performance.md) - Optimization techniques
5. [etags.md](data-api-v3/guides/etags.md) - Caching
6. [partial-responses.md](data-api-v3/guides/partial-responses.md) - Fields parameter

**Day 3: Your Use Case** (1 hour)
7. Pick one:
   - [uploading-video.md](data-api-v3/guides/uploading-video.md) - Upload videos
   - [impl-playlists.md](data-api-v3/guides/impl-playlists.md) - Manage playlists
   - [impl-comments.md](data-api-v3/guides/impl-comments.md) - Comment moderation
   - [getting-started.md](data-api-v3/live-streaming/getting-started.md) - Live streaming
   - [reports-query.md](analytics-api/reference/reports-query.md) - Analytics

---

## 🎯 Common Use Cases

### Upload a Video

```python
# Complete guide: data-api-v3/guides/uploading-video.md

from googleapiclient.discovery import build
from googleapiclient.http import MediaFileUpload

youtube = build('youtube', 'v3', credentials=credentials)

body = {
    'snippet': {
        'title': 'My Video Title',
        'description': 'Video description',
        'tags': ['tag1', 'tag2'],
        'categoryId': '22'
    },
    'status': {
        'privacyStatus': 'private'
    }
}

media = MediaFileUpload('video.mp4', chunksize=-1, resumable=True)

request = youtube.videos().insert(
    part='snippet,status',
    body=body,
    media_body=media
)

response = request.execute()
print(f"Video uploaded: https://youtube.com/watch?v={response['id']}")
```

### Search Videos

```python
# Complete guide: data-api-v3/guides/impl-search.md

response = youtube.search().list(
    q='python tutorial',
    part='snippet',
    type='video',
    maxResults=25,
    order='relevance'
).execute()

for item in response['items']:
    print(f"{item['snippet']['title']} - {item['id']['videoId']}")
```

### Get Channel Analytics

```python
# Complete guide: analytics-api/reference/reports-query.md

from googleapiclient.discovery import build

analytics = build('youtubeAnalytics', 'v2', credentials=credentials)

response = analytics.reports().query(
    ids='channel==MINE',
    startDate='2024-01-01',
    endDate='2024-01-31',
    metrics='views,estimatedMinutesWatched,averageViewDuration',
    dimensions='day'
).execute()

for row in response['rows']:
    print(f"Date: {row[0]}, Views: {row[1]}, Watch time: {row[2]} min")
```

### Moderate Comments

```python
# Complete guide: data-api-v3/guides/impl-comments.md

# List comments
comments = youtube.commentThreads().list(
    part='snippet',
    videoId='VIDEO_ID',
    maxResults=100
).execute()

# Mark as spam
youtube.comments().markAsSpam(
    id='COMMENT_ID'
).execute()

# Set moderation status
youtube.comments().setModerationStatus(
    id='COMMENT_ID',
    moderationStatus='rejected'
).execute()
```

---

## 💡 Production Checklist

Before launching your app, ensure you have:

**Performance** ✅
- [ ] Using `fields` parameter for partial responses
- [ ] Requesting only needed `part` values
- [ ] Implementing caching with ETags
- [ ] Batching requests where possible
- [ ] Setting `prettyPrint=false` in production

**Quota Management** ✅
- [ ] Tracking daily quota usage
- [ ] Using cheaper alternatives (playlistItems vs search)
- [ ] Implementing exponential backoff
- [ ] Handling quota exceeded errors

**Security** ✅
- [ ] API keys stored in environment variables
- [ ] OAuth tokens refreshed automatically
- [ ] HTTPS used for all requests
- [ ] User credentials never exposed

**Compliance** ✅
- [ ] YouTube branding displayed
- [ ] Privacy settings respected
- [ ] Required functionality implemented (delete, edit for uploads)
- [ ] Developer policies followed

See [best-practices.md](data-api-v3/guides/best-practices.md) for complete checklist.

---

## 🔗 Quick Reference Links

**API Basics**
- [README.md](README.md) - Master guide
- [best-practices.md](data-api-v3/guides/best-practices.md) - Start here
- [standard-parameters.md](data-api-v3/guides/standard-parameters.md) - All parameters

**Performance**
- [performance.md](data-api-v3/guides/performance.md) - Optimization
- [etags.md](data-api-v3/guides/etags.md) - Caching
- [batch-requests.md](data-api-v3/guides/batch-requests.md) - Batching

**Implementation**
- [videos-guide.md](data-api-v3/guides/videos-guide.md) - Video operations
- [uploading-video.md](data-api-v3/guides/uploading-video.md) - Upload guide
- [impl-comments.md](data-api-v3/guides/impl-comments.md) - Comments

**Resources**
- [videos.md](data-api-v3/resources/videos.md) - Videos API
- [channels.md](data-api-v3/resources/channels.md) - Channels API
- [search.md](data-api-v3/resources/search.md) - Search API

**Compliance**
- [developer-policies.md](data-api-v3/compliance/developer-policies.md) - Policies
- [minimum-functionality.md](data-api-v3/compliance/minimum-functionality.md) - Requirements
- [branding-guidelines.md](data-api-v3/compliance/branding-guidelines.md) - Branding

---

## ❓ Need Help?

**Where do I find...?**
- All API parameters → [standard-parameters.md](data-api-v3/guides/standard-parameters.md)
- Error codes → [errors.md](data-api-v3/overview/errors.md)
- Quota costs → [quota-costs.md](data-api-v3/overview/quota-costs.md)
- Code examples → Each resource/guide has examples
- Live streaming → [live-streaming/](data-api-v3/live-streaming/)
- Analytics → [analytics-api/](analytics-api/)

**Common Questions:**
- "How do I reduce quota usage?" → [performance.md](data-api-v3/guides/performance.md)
- "How do I handle rate limits?" → [best-practices.md](data-api-v3/guides/best-practices.md#error-handling)
- "How do I cache responses?" → [etags.md](data-api-v3/guides/etags.md)
- "How do I batch requests?" → [batch-requests.md](data-api-v3/guides/batch-requests.md)

---

**Next:** Read [best-practices.md](data-api-v3/guides/best-practices.md) for production patterns.
