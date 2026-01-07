---
source: https://developers.google.com/youtube/v3/code_samples
scraped: 2026-01-07
method: bright_data
api: youtube-data-v3
category: samples
---

# YouTube Data API (v3) Code Samples

## Overview

This page provides access to code examples for the YouTube Data API and YouTube Live Streaming API across multiple programming languages.

## Interactive Code Samples

The platform offers an interactive experience where developers can select API resources and methods to explore common use cases. The "APIs Explorer widget" allows you to:

- View sample parameter values for specific use cases
- Access working code examples in Java, JavaScript, PHP, and Python
- Modify parameters and see the code update in real-time

## Standalone Code Snippets by Language

### Apps Script
Available samples include:
- Add a channel subscription (`subscriptions.insert`)
- Retrieve current user's uploads (`channels.list`)
- Search for videos by keyword (`search.list`)
- Update a video (`videos.update`)

### Go
Available samples include:
- Authorize a request (any authorization-required method)
- Retrieve current user's uploads (`playlistItems.list`)
- Search for videos by keyword (`search.list`)
- Upload a video (`videos.insert`)

### .NET
Available samples include:
- Create a playlist (`playlists.insert`)
- Retrieve current user's uploaded videos (`channels.list`, `playlistItems.list`)
- Search for videos by keyword (`search.list`)
- Upload a video (`videos.insert`)

### Ruby
Available samples include:
- Authorize a request (any authorization-required method)
- Create a channel subscription (`subscriptions.insert`)
- Retrieve current user's uploads (`channels.list`, `playlistItems.list`)
- Search for videos by keyword (`search.list`)
- Upload a video (`videos.insert`)

### Java
Common samples include:
- Search for videos (`search.list`)
- Upload videos (`videos.insert`)
- Manage playlists (`playlists.insert`, `playlistItems.insert`)
- Channel management (`channels.list`, `channels.update`)

### JavaScript
Common samples include:
- Search functionality (`search.list`)
- Video metadata retrieval (`videos.list`)
- Channel information (`channels.list`)
- Playlist management (`playlists.list`, `playlistItems.list`)

### PHP
Common samples include:
- Authentication and authorization
- Video uploads (`videos.insert`)
- Search queries (`search.list`)
- Channel data retrieval (`channels.list`)

### Python
Common samples include:
- OAuth 2.0 authorization flow
- Search for videos (`search.list`)
- Upload videos (`videos.insert`)
- Manage subscriptions (`subscriptions.list`, `subscriptions.insert`)
- Channel management (`channels.list`)

## Additional Resources

- Additional Ruby samples are available via the Google API Ruby client repository on GitHub
- Python samples available at github.com/youtube/api-samples
- Full code repositories for each language at github.com/youtube/api-samples

## Example: Python Search Request

```python
from googleapiclient.discovery import build

# Build the YouTube API client
youtube = build('youtube', 'v3', developerKey='YOUR_API_KEY')

# Execute a search request
request = youtube.search().list(
    part='snippet',
    q='surfing',
    type='video',
    maxResults=10
)
response = request.execute()

# Process results
for item in response['items']:
    print(item['snippet']['title'])
```

## Example: JavaScript Video List

```javascript
gapi.client.youtube.videos.list({
    part: 'snippet,statistics',
    id: 'VIDEO_ID'
}).then(function(response) {
    console.log(response.result.items[0].snippet.title);
});
```
