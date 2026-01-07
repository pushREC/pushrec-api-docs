---
source: https://developers.google.com/youtube/v3/docs/comments/setModerationStatus
scraped: 2026-01-07
api_provider: Google
discovery_tier: 3
verified: false
method: webfetch
---
 Comments: setModerationStatus

Updates the moderation status of one or more comments. The API request requires authorization from the channel or video owner associated with the comments being moderated.

## HTTP Request

```
POST https://www.googleapis.com/youtube/v3/comments/setModerationStatus
```

## Quota Cost

**50 units** per API call

## Authorization

Required scope:
- `https://www.googleapis.com/auth/youtube.force-ssl`

## Parameters

### Required Parameters

| Parameter | Type | Description |
|-----------|------|-------------|
| `id` | string | Comma-separated list of comment IDs whose moderation status you're updating |
| `moderationStatus` | string | New moderation status to apply |

### Moderation Status Values

| Value | Description |
|-------|-------------|
| `heldForReview` | Comment is awaiting moderator review |
| `published` | Comment is approved for public display |
| `rejected` | Comment is unfit for display; also hides replies |

### Optional Parameters

| Parameter | Type | Description |
|-----------|------|-------------|
| `banAuthor` | boolean | When set to `true`, automatically rejects future comments from the comment author. Only valid when `moderationStatus` is `rejected`. |

## Request Body

No request body required.

## Response

Successful request returns: **HTTP 204 (No Content)**

No response body is returned.

## Error Codes

| HTTP Status | Error Code | Description |
|-------------|------------|-------------|
| 400 | `banWithoutReject` | Cannot use `banAuthor` unless `moderationStatus` is `rejected` |
| 400 | `operationNotSupported` | Non-Google+ comments have limited moderation capabilities |
| 400 | `processingFailure` | Server failed processing; typically indicates invalid input |
| 403 | `forbidden` | Insufficient permissions to modify comment status |
| 404 | `commentNotFound` | One or more specified comment IDs don't exist |

## Example Requests

### Publish a Comment

```
POST https://www.googleapis.com/youtube/v3/comments/setModerationStatus?id=COMMENT_ID&moderationStatus=published
```

### Reject a Comment

```
POST https://www.googleapis.com/youtube/v3/comments/setModerationStatus?id=COMMENT_ID&moderationStatus=rejected
```

### Reject and Ban Author

```
POST https://www.googleapis.com/youtube/v3/comments/setModerationStatus?id=COMMENT_ID&moderationStatus=rejected&banAuthor=true
```

### Moderate Multiple Comments

```
POST https://www.googleapis.com/youtube/v3/comments/setModerationStatus?id=COMMENT_ID_1,COMMENT_ID_2,COMMENT_ID_3&moderationStatus=published
```

## Notes

- Only the channel owner or video owner can moderate comments
- When rejecting a comment, its replies are also hidden
- The `banAuthor` parameter only works with `rejected` status
- Moderation changes may take a few moments to propagate
