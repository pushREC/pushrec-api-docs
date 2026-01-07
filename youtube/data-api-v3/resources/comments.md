---
source: https://developers.google.com/youtube/v3/docs/comments
scraped: 2026-01-07
api_provider: Google
discovery_tier: 3
verified: false
method: webfetch
---
 Comments Resource

## Overview

The Comments resource represents individual YouTube comments about videos or channels. Comments can be top-level or replies. Top-level comments are created via `commentThreads.insert`.

**Note:** The `markAsSpam` method is no longer supported.

## Available Methods

| Method | Purpose |
|--------|---------|
| `list` | Returns a list of comments that match the API request parameters |
| `insert` | Creates reply comments (note: use `commentThreads.insert` for top-level) |
| `update` | Modifies existing comments |
| `delete` | Removes comments |
| `setModerationStatus` | Sets moderation status; requires channel/video owner authorization |

## Resource Representation

```json
{
  "kind": "youtube#comment",
  "etag": "string",
  "id": "string",
  "snippet": {
    "authorDisplayName": "string",
    "authorProfileImageUrl": "string",
    "authorChannelUrl": "string",
    "authorChannelId": {
      "value": "string"
    },
    "channelId": "string",
    "textDisplay": "string",
    "textOriginal": "string",
    "parentId": "string",
    "canRate": "boolean",
    "viewerRating": "string",
    "likeCount": "unsigned integer",
    "moderationStatus": "string",
    "publishedAt": "datetime",
    "updatedAt": "datetime"
  }
}
```

## Properties

### Core Fields

| Property | Type | Description |
|----------|------|-------------|
| `kind` | string | Always `youtube#comment` |
| `etag` | string | Resource version identifier |
| `id` | string | Unique comment identifier |

### Snippet Properties

| Property | Type | Description |
|----------|------|-------------|
| `snippet.authorDisplayName` | string | Display name of comment author |
| `snippet.authorProfileImageUrl` | string | URL of author's profile image |
| `snippet.authorChannelUrl` | string | URL of author's YouTube channel |
| `snippet.authorChannelId.value` | string | Comment author's channel ID |
| `snippet.channelId` | string | YouTube channel associated with the comment |
| `snippet.textDisplay` | string | Comment text (may differ from original; replaces video links with titles) |
| `snippet.textOriginal` | string | Original raw text; only returned to comment author |
| `snippet.parentId` | string | Set only if comment is a reply; contains parent comment ID |
| `snippet.canRate` | boolean | Whether current viewer can rate the comment |
| `snippet.viewerRating` | string | Viewer's rating: `like` or `none` |
| `snippet.likeCount` | unsigned integer | Total positive ratings (likes) |
| `snippet.moderationStatus` | string | Moderation status (owner-only visibility) |
| `snippet.publishedAt` | datetime | ISO 8601 timestamp when comment was published |
| `snippet.updatedAt` | datetime | ISO 8601 timestamp when comment was last updated |

### Moderation Status Values

| Value | Description |
|-------|-------------|
| `heldForReview` | Awaiting moderator review |
| `likelySpam` | Flagged as likely spam |
| `published` | Approved and publicly visible |
| `rejected` | Rejected by moderator, not visible |

### Viewer Rating Values

| Value | Description |
|-------|-------------|
| `like` | Viewer has liked the comment |
| `none` | Viewer has not rated the comment |

## Important Notes

- The `moderationStatus` property only appears if authorized by channel/video owner
- `textDisplay` may be modified (e.g., video titles replacing links)
- `textOriginal` is only returned when the authenticated user is the comment author
- Top-level comments must be created using `commentThreads.insert`
- The `insert` method only creates reply comments

## Authorization Scopes

Most comment operations require:
- `https://www.googleapis.com/auth/youtube.force-ssl`
