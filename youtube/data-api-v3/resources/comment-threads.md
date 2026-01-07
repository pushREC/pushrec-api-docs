---
source: https://developers.google.com/youtube/v3/docs/commentThreads
scraped: 2026-01-07
api_provider: Google
discovery_tier: 3
verified: false
method: webfetch
---
 CommentThreads Resource

## Overview

A `commentThread` resource contains information about a YouTube comment thread, which comprises a top-level comment and replies, if any exist.

**Important Notes:**
- The resource may not include all replies; use `comments.list` with `parentId` parameter to retrieve complete reply sets
- Threads can be public or restricted based on privacy settings

## Available Methods

| Method | Purpose |
|--------|---------|
| `list` | Retrieves comment threads matching request parameters |
| `insert` | Creates new top-level comments (use `comments.insert` for replies) |

## Resource Representation

```json
{
  "kind": "youtube#commentThread",
  "etag": "string",
  "id": "string",
  "snippet": {
    "channelId": "string",
    "videoId": "string",
    "topLevelComment": {
      // comment resource
    },
    "canReply": "boolean",
    "totalReplyCount": "unsigned integer",
    "isPublic": "boolean"
  },
  "replies": {
    "comments": [
      // array of comment resources
    ]
  }
}
```

## Properties

### Core Fields

| Property | Type | Description |
|----------|------|-------------|
| `kind` | string | Always `youtube#commentThread` |
| `etag` | string | Resource version identifier |
| `id` | string | Unique thread identifier |

### Snippet Properties

| Property | Type | Description |
|----------|------|-------------|
| `snippet.channelId` | string | YouTube channel ID associated with the comments |
| `snippet.videoId` | string | YouTube video ID that the comments refer to |
| `snippet.topLevelComment` | object | Comment resource containing the top-level comment |
| `snippet.canReply` | boolean | Whether the current viewer can reply to the thread |
| `snippet.totalReplyCount` | unsigned integer | Total number of replies to the top-level comment |
| `snippet.isPublic` | boolean | Whether the thread is publicly visible |

### Replies Object

| Property | Type | Description |
|----------|------|-------------|
| `replies.comments[]` | array | Array of comment resources representing replies |

## Important Considerations

### Incomplete Replies

The `replies.comments` array may represent only a subset of the total replies indicated by `snippet.totalReplyCount`. To retrieve all replies:

1. Note the `totalReplyCount` value
2. Use `comments.list` with `parentId` set to the top-level comment ID
3. Paginate through results to get all replies

### Top-Level vs Reply Comments

| Action | Method to Use |
|--------|---------------|
| Create top-level comment | `commentThreads.insert` |
| Create reply to comment | `comments.insert` |
| List threads for video | `commentThreads.list` |
| List replies to comment | `comments.list` with `parentId` |

## Authorization Scopes

Most comment thread operations require:
- `https://www.googleapis.com/auth/youtube.force-ssl`
