---
source: https://developers.google.com/youtube/v3/guides/implementation/comments
scraped: 2026-01-07
api_provider: Google
discovery_tier: 3
verified: false
category: guides
method: webfetch
---
 YouTube Data API: Comments Implementation Guide

## Overview

The YouTube Data API v3 provides comprehensive comment management capabilities including retrieving, posting, replying, moderating, and deleting comments.

**Note:** `comments.markAsSpam` is no longer supported.

## Retrieving Comments

### Comments for a Video

Use `commentThreads.list` with the `videoId` parameter:

```http
GET https://www.googleapis.com/youtube/v3/commentThreads?
  part=snippet,replies&
  videoId=VIDEO_ID&
  maxResults=100&
  key=YOUR_API_KEY
```

#### Part Options

| Part | Description |
|------|-------------|
| `snippet` | Top-level comment only |
| `snippet,replies` | Top-level comment with replies |

### Comments for a Channel

Two options:

**Channel-specific comments only:**
```http
GET https://www.googleapis.com/youtube/v3/commentThreads?
  part=snippet&
  channelId=CHANNEL_ID&
  key=YOUR_API_KEY
```

**All comments related to channel (including video comments):**
```http
GET https://www.googleapis.com/youtube/v3/commentThreads?
  part=snippet&
  allThreadsRelatedToChannelId=CHANNEL_ID&
  key=YOUR_API_KEY
```

### Python Example

```python
def get_video_comments(youtube, video_id, max_results=100):
    """Retrieve comments for a video."""
    comments = []
    next_page_token = None

    while len(comments) < max_results:
        response = youtube.commentThreads().list(
            part='snippet,replies',
            videoId=video_id,
            maxResults=min(100, max_results - len(comments)),
            pageToken=next_page_token,
            textFormat='plainText'
        ).execute()

        for item in response.get('items', []):
            # Top-level comment
            top_comment = item['snippet']['topLevelComment']
            comments.append({
                'id': top_comment['id'],
                'author': top_comment['snippet']['authorDisplayName'],
                'text': top_comment['snippet']['textDisplay'],
                'likes': top_comment['snippet']['likeCount'],
                'published': top_comment['snippet']['publishedAt'],
                'replies': []
            })

            # Replies
            if 'replies' in item:
                for reply in item['replies']['comments']:
                    comments[-1]['replies'].append({
                        'id': reply['id'],
                        'author': reply['snippet']['authorDisplayName'],
                        'text': reply['snippet']['textDisplay'],
                        'likes': reply['snippet']['likeCount'],
                        'published': reply['snippet']['publishedAt']
                    })

        next_page_token = response.get('nextPageToken')
        if not next_page_token:
            break

    return comments[:max_results]
```

## Adding Comments

### Post a Top-Level Comment

Use `commentThreads.insert` with OAuth 2.0:

```http
POST https://www.googleapis.com/youtube/v3/commentThreads?part=snippet HTTP/1.1
Host: www.googleapis.com
Authorization: Bearer ACCESS_TOKEN
Content-Type: application/json

{
  "snippet": {
    "channelId": "CHANNEL_ID",
    "videoId": "VIDEO_ID",
    "topLevelComment": {
      "snippet": {
        "textOriginal": "This is my comment text!"
      }
    }
  }
}
```

#### Python Example

```python
def post_comment(youtube, video_id, channel_id, text):
    """Post a top-level comment on a video."""
    body = {
        'snippet': {
            'channelId': channel_id,
            'videoId': video_id,
            'topLevelComment': {
                'snippet': {
                    'textOriginal': text
                }
            }
        }
    }

    response = youtube.commentThreads().insert(
        part='snippet',
        body=body
    ).execute()

    return response

# Usage
comment = post_comment(
    youtube,
    'VIDEO_ID',
    'CHANNEL_ID',
    'Great video! Thanks for sharing.'
)
print(f"Posted comment: {comment['id']}")
```

### Post a Reply to a Comment

Use `comments.insert` with OAuth 2.0:

```http
POST https://www.googleapis.com/youtube/v3/comments?part=snippet HTTP/1.1
Host: www.googleapis.com
Authorization: Bearer ACCESS_TOKEN
Content-Type: application/json

{
  "snippet": {
    "parentId": "COMMENT_THREAD_ID",
    "textOriginal": "This is my reply!"
  }
}
```

#### Python Example

```python
def reply_to_comment(youtube, parent_id, text):
    """Reply to an existing comment."""
    body = {
        'snippet': {
            'parentId': parent_id,
            'textOriginal': text
        }
    }

    response = youtube.comments().insert(
        part='snippet',
        body=body
    ).execute()

    return response

# Usage
reply = reply_to_comment(
    youtube,
    'COMMENT_THREAD_ID',
    'Thanks for your feedback!'
)
```

## Updating Comments

Use `comments.update` to modify comment text:

```http
PUT https://www.googleapis.com/youtube/v3/comments?part=snippet HTTP/1.1
Host: www.googleapis.com
Authorization: Bearer ACCESS_TOKEN
Content-Type: application/json

{
  "id": "COMMENT_ID",
  "snippet": {
    "textOriginal": "Updated comment text"
  }
}
```

**Important:** Request must be authorized by the comment's author.

#### Python Example

```python
def update_comment(youtube, comment_id, new_text):
    """Update an existing comment."""
    body = {
        'id': comment_id,
        'snippet': {
            'textOriginal': new_text
        }
    }

    response = youtube.comments().update(
        part='snippet',
        body=body
    ).execute()

    return response
```

## Comment Moderation

### Retrieve Pending Comments

Get comments held for review:

```http
GET https://www.googleapis.com/youtube/v3/commentThreads?
  part=snippet&
  allThreadsRelatedToChannelId=CHANNEL_ID&
  moderationStatus=heldForReview
Authorization: Bearer ACCESS_TOKEN
```

### Moderation Status Values

| Status | Description |
|--------|-------------|
| `heldForReview` | Awaiting moderation |
| `published` | Approved and visible |
| `rejected` | Rejected, not visible |
| `likelySpam` | Flagged as potential spam |

### Update Moderation Status

Use `comments.setModerationStatus`:

```http
POST https://www.googleapis.com/youtube/v3/comments/setModerationStatus?
  id=COMMENT_ID&
  moderationStatus=published
Authorization: Bearer ACCESS_TOKEN
```

#### Optional: Ban Author

When rejecting, optionally ban the author from future comments:

```http
POST https://www.googleapis.com/youtube/v3/comments/setModerationStatus?
  id=COMMENT_ID&
  moderationStatus=rejected&
  banAuthor=true
Authorization: Bearer ACCESS_TOKEN
```

**Important:** Once published or rejected, moderation status cannot revert to held status.

#### Python Moderation Example

```python
def moderate_comments(youtube, channel_id):
    """Review and moderate pending comments."""
    # Get comments held for review
    response = youtube.commentThreads().list(
        part='snippet',
        allThreadsRelatedToChannelId=channel_id,
        moderationStatus='heldForReview',
        maxResults=100
    ).execute()

    for item in response.get('items', []):
        comment = item['snippet']['topLevelComment']
        comment_id = comment['id']
        text = comment['snippet']['textDisplay']
        author = comment['snippet']['authorDisplayName']

        print(f"Comment by {author}: {text}")

        # Decision logic (example: approve all)
        youtube.comments().setModerationStatus(
            id=comment_id,
            moderationStatus='published'
        ).execute()
        print(f"Approved comment {comment_id}")

def reject_and_ban(youtube, comment_id):
    """Reject a comment and ban the author."""
    youtube.comments().setModerationStatus(
        id=comment_id,
        moderationStatus='rejected',
        banAuthor=True
    ).execute()
```

## Deleting Comments

### Step 1: Retrieve Comment and Verify Authorization

```python
def get_comment_author(youtube, comment_id):
    """Get comment details to verify ownership."""
    response = youtube.comments().list(
        part='snippet',
        id=comment_id
    ).execute()

    if response.get('items'):
        return response['items'][0]['snippet']['authorChannelId']['value']
    return None
```

### Step 2: Delete the Comment

```http
DELETE https://www.googleapis.com/youtube/v3/comments?id=COMMENT_ID HTTP/1.1
Host: www.googleapis.com
Authorization: Bearer ACCESS_TOKEN
```

#### Python Example

```python
def delete_comment(youtube, comment_id, my_channel_id):
    """Delete a comment (must be comment author)."""
    # Verify ownership
    author_channel = get_comment_author(youtube, comment_id)

    if author_channel != my_channel_id:
        raise Exception("Cannot delete comment - not the author")

    youtube.comments().delete(id=comment_id).execute()
    print(f"Deleted comment {comment_id}")
```

## Complete Comment Manager Example

```python
class CommentManager:
    def __init__(self, youtube, channel_id):
        self.youtube = youtube
        self.channel_id = channel_id

    def get_comments(self, video_id, max_results=100):
        """Get comments for a video."""
        comments = []
        next_page_token = None

        while len(comments) < max_results:
            response = self.youtube.commentThreads().list(
                part='snippet,replies',
                videoId=video_id,
                maxResults=min(100, max_results - len(comments)),
                pageToken=next_page_token
            ).execute()

            comments.extend(response.get('items', []))
            next_page_token = response.get('nextPageToken')

            if not next_page_token:
                break

        return comments[:max_results]

    def post_comment(self, video_id, text):
        """Post a new comment."""
        body = {
            'snippet': {
                'channelId': self.channel_id,
                'videoId': video_id,
                'topLevelComment': {
                    'snippet': {
                        'textOriginal': text
                    }
                }
            }
        }

        return self.youtube.commentThreads().insert(
            part='snippet',
            body=body
        ).execute()

    def reply(self, parent_id, text):
        """Reply to a comment."""
        body = {
            'snippet': {
                'parentId': parent_id,
                'textOriginal': text
            }
        }

        return self.youtube.comments().insert(
            part='snippet',
            body=body
        ).execute()

    def update(self, comment_id, new_text):
        """Update a comment."""
        body = {
            'id': comment_id,
            'snippet': {
                'textOriginal': new_text
            }
        }

        return self.youtube.comments().update(
            part='snippet',
            body=body
        ).execute()

    def delete(self, comment_id):
        """Delete a comment."""
        self.youtube.comments().delete(id=comment_id).execute()

    def get_pending(self):
        """Get comments awaiting moderation."""
        return self.youtube.commentThreads().list(
            part='snippet',
            allThreadsRelatedToChannelId=self.channel_id,
            moderationStatus='heldForReview',
            maxResults=100
        ).execute()

    def approve(self, comment_id):
        """Approve a comment."""
        self.youtube.comments().setModerationStatus(
            id=comment_id,
            moderationStatus='published'
        ).execute()

    def reject(self, comment_id, ban_author=False):
        """Reject a comment."""
        self.youtube.comments().setModerationStatus(
            id=comment_id,
            moderationStatus='rejected',
            banAuthor=ban_author
        ).execute()

# Usage
manager = CommentManager(youtube, 'MY_CHANNEL_ID')

# Get comments
comments = manager.get_comments('VIDEO_ID')

# Post a comment
new_comment = manager.post_comment('VIDEO_ID', 'Great video!')

# Reply to a comment
reply = manager.reply('COMMENT_THREAD_ID', 'Thanks!')

# Moderate pending comments
pending = manager.get_pending()
for item in pending.get('items', []):
    comment_id = item['snippet']['topLevelComment']['id']
    manager.approve(comment_id)
```

## Comment Resource Structure

### Comment Thread

```json
{
  "kind": "youtube#commentThread",
  "id": "THREAD_ID",
  "snippet": {
    "channelId": "CHANNEL_ID",
    "videoId": "VIDEO_ID",
    "topLevelComment": {
      "kind": "youtube#comment",
      "id": "COMMENT_ID",
      "snippet": {
        "channelId": "CHANNEL_ID",
        "videoId": "VIDEO_ID",
        "textDisplay": "Comment text with formatting",
        "textOriginal": "Comment text original",
        "authorDisplayName": "User Name",
        "authorProfileImageUrl": "https://...",
        "authorChannelUrl": "https://...",
        "authorChannelId": {
          "value": "AUTHOR_CHANNEL_ID"
        },
        "canRate": true,
        "viewerRating": "none",
        "likeCount": 10,
        "publishedAt": "2024-01-15T10:00:00Z",
        "updatedAt": "2024-01-15T10:00:00Z"
      }
    },
    "canReply": true,
    "totalReplyCount": 5,
    "isPublic": true
  },
  "replies": {
    "comments": [...]
  }
}
```

## Quota Costs

| Operation | Quota Cost |
|-----------|-----------|
| `commentThreads.list` | 1 unit |
| `commentThreads.insert` | 50 units |
| `comments.list` | 1 unit |
| `comments.insert` | 50 units |
| `comments.update` | 50 units |
| `comments.delete` | 50 units |
| `comments.setModerationStatus` | 50 units |

## Authorization Requirements

| Operation | Scope Required |
|-----------|---------------|
| Read comments | API key or `youtube.readonly` |
| Post/reply | `youtube.force-ssl` |
| Update own comments | `youtube.force-ssl` |
| Delete own comments | `youtube.force-ssl` |
| Moderate comments | `youtube.force-ssl` |

## Error Handling

### Common Errors

| Error | Description | Solution |
|-------|-------------|----------|
| 403 | Comments disabled | Video has comments disabled |
| 403 | Forbidden | Not authorized to modify comment |
| 404 | Comment not found | Invalid comment ID |
| 400 | Invalid request | Check request body format |

### Python Error Handling

```python
from googleapiclient.errors import HttpError

def safe_post_comment(youtube, video_id, channel_id, text):
    try:
        return post_comment(youtube, video_id, channel_id, text)
    except HttpError as e:
        if e.resp.status == 403:
            error = e.error_details[0] if e.error_details else {}
            reason = error.get('reason', '')
            if reason == 'commentsDisabled':
                print("Comments are disabled on this video")
            else:
                print(f"Permission denied: {reason}")
        else:
            print(f"Error: {e}")
        return None
```

## Best Practices

1. **Use textFormat parameter** - Choose 'plainText' or 'html' based on your needs
2. **Paginate through results** - Use nextPageToken for large comment sets
3. **Respect moderation** - Don't auto-approve all comments without review
4. **Handle disabled comments** - Check for 403 errors gracefully
5. **Rate limit requests** - Implement delays between batch operations
