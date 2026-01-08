# Bright Data YouTube Scrapers Reference

> **Last Updated:** 2026-01-08
> **Total YouTube Records Available:** 3.9+ billion

## Overview

Bright Data offers 10 specialized YouTube scrapers through their Web Scraper API. Each scraper has a unique `dataset_id` that you specify when making API requests.

## Available YouTube Scrapers

### 1. Video Posts by URL

Extract detailed video data from specific YouTube URLs.

**Use Case:** Get metadata for known videos
**Input:** Video URLs

```json
[
  {"url": "https://www.youtube.com/watch?v=VIDEO_ID"}
]
```

**Output Fields:**
- `url` - Video URL
- `title` - Video title
- `creator` - Channel name
- `creator_url` - Channel URL
- `video_length` - Duration in seconds
- `views` - View count
- `likes` - Like count
- `upload_date` - Publication date
- `description` - Video description
- `thumbnail` - Thumbnail URL

---

### 2. Video Search by Keyword

Search YouTube and extract video results.

**Use Case:** Find videos matching search terms
**Input:** Keywords

```json
[
  {"keyword": "machine learning tutorial"}
]
```

---

### 3. Videos by Channel URL

Get all videos from a specific YouTube channel.

**Use Case:** Scrape entire channel catalog
**Input:** Channel URLs

```json
[
  {"url": "https://www.youtube.com/@ChannelHandle"}
]
```

---

### 4. Videos with Filter Parameters

Filter videos by various parameters (views, date, duration, etc.).

**Use Case:** Find videos matching specific criteria
**Input:** Filter parameters

---

### 5. Videos by Hashtags

Find videos tagged with specific hashtags.

**Use Case:** Topic-based video discovery
**Input:** Hashtags

```json
[
  {"hashtag": "#python"}
]
```

---

### 6. Videos from Explore Pages

Extract trending and recommended videos.

**Use Case:** Discover trending content
**Input:** Explore page type

---

### 7. Videos by Podcast URL

Extract podcast episode data from YouTube.

**Use Case:** Podcast content extraction
**Input:** Podcast URLs

---

### 8. Channel Profiles

Extract channel metadata and statistics.

**Use Case:** Channel analytics
**Input:** Channel URLs

```json
[
  {"url": "https://www.youtube.com/@ChannelHandle"}
]
```

**Output Fields:**
- `url` - Channel URL
- `handle` - Channel handle (@username)
- `name` - Channel name
- `subscriber_count` - Subscriber count
- `video_count` - Total videos
- `view_count` - Total channel views
- `profile_image` - Avatar URL
- `banner_image` - Banner URL
- `description` - Channel description
- `created_date` - Channel creation date
- `country` - Channel country

---

### 9. Profiles by Keyword Search

Find channels matching search keywords.

**Use Case:** Discover channels in a niche
**Input:** Keywords

```json
[
  {"keyword": "tech reviews"}
]
```

---

### 10. Comments on Videos

Extract comments from YouTube videos.

**Use Case:** Sentiment analysis, engagement research
**Input:** Video URLs

```json
[
  {"url": "https://www.youtube.com/watch?v=VIDEO_ID"}
]
```

**Output Fields:**
- `comment_text` - Comment content
- `username` - Commenter username
- `likes` - Comment likes
- `replies` - Reply count
- `timestamp` - Comment date
- `is_reply` - Boolean if reply to another comment
- `parent_comment_id` - Parent comment reference

---

## Dataset Statistics

| Dataset | Records Available | Description |
|---------|------------------|-------------|
| YouTube Videos | 3.8 billion | URL, title, creator, length, likes, views |
| YouTube Profiles | 177.1 million | Handle, banner, profile pic, subscribers |
| YouTube Comments | 17.3 million | Text, likes, replies, username, timestamps |

---

## Finding Dataset IDs

To get the exact `dataset_id` for each scraper:

1. **Via Web Interface:**
   - Visit https://brightdata.com/cp/scrapers/browse
   - Search for "YouTube"
   - Select your desired scraper
   - The dataset_id appears in the API request builder

2. **Via API (if available):**
   ```bash
   curl "https://api.brightdata.com/datasets/list" \
     -H "Authorization: Bearer $API_TOKEN"
   ```

3. **Common Naming Pattern:**
   Dataset IDs typically follow: `gd_youtube_[type]`
   - `gd_youtube_video` - Videos
   - `gd_youtube_channel` - Channels
   - `gd_youtube_comments` - Comments

---

## Example Requests

### Scrape Video Data

```bash
curl -X POST "https://api.brightdata.com/datasets/v3/trigger?dataset_id=gd_youtube_video&format=json" \
  -H "Authorization: Bearer $API_TOKEN" \
  -H "Content-Type: application/json" \
  -d '[
    {"url": "https://www.youtube.com/watch?v=dQw4w9WgXcQ"},
    {"url": "https://www.youtube.com/watch?v=9bZkp7q19f0"}
  ]'
```

### Scrape Channel Profile

```bash
curl -X POST "https://api.brightdata.com/datasets/v3/trigger?dataset_id=gd_youtube_channel&format=json" \
  -H "Authorization: Bearer $API_TOKEN" \
  -H "Content-Type: application/json" \
  -d '[
    {"url": "https://www.youtube.com/@MrBeast"}
  ]'
```

### Search Videos by Keyword

```bash
curl -X POST "https://api.brightdata.com/datasets/v3/trigger?dataset_id=gd_youtube_search&format=json" \
  -H "Authorization: Bearer $API_TOKEN" \
  -H "Content-Type: application/json" \
  -d '[
    {"keyword": "claude ai tutorial"}
  ]'
```

---

## Limitations

- **Transcripts:** Native transcript extraction not explicitly documented. May require video processing after download.
- **Live streams:** Current stream data may have limited availability
- **Private videos:** Cannot access private or unlisted videos
- **Deleted content:** Removed videos return errors

---

## Transcript Extraction Note

YouTube transcripts are not directly available through the standard YouTube scrapers. Options:

1. **Post-processing:** Download video, use speech-to-text
2. **YouTube Data API:** Use official API for captions (requires video owner permission)
3. **Third-party services:** youtube-transcript-api (Python) for public captions
4. **Custom scraper:** Request via Bright Data Managed Services
