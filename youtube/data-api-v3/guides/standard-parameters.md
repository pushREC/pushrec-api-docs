---
source: https://developers.google.com/youtube/v3 (synthesized from API specification)
scraped: 2026-01-07
api_provider: Google
discovery_tier: 3
verified: false
category: guides
method: manual
---
 Standard Query Parameters - YouTube Data API v3

## Overview

The YouTube Data API v3 supports standard query parameters that work across all API methods. These parameters control authentication, response format, error handling, and performance optimization.

## Authentication Parameters

### access_token

OAuth 2.0 access token for authenticated requests.

**Usage:**
```
GET https://www.googleapis.com/youtube/v3/channels?part=snippet&mine=true&access_token=YOUR_ACCESS_TOKEN
```

**Alternative:** Include in HTTP header (recommended):
```
Authorization: Bearer YOUR_ACCESS_TOKEN
```

### key

API key for unauthenticated requests (read-only operations).

**Usage:**
```
GET https://www.googleapis.com/youtube/v3/videos?part=snippet&id=VIDEO_ID&key=YOUR_API_KEY
```

**When to use:**
- Public data retrieval (videos, channels, playlists)
- Search operations
- Read-only operations not requiring user authentication

**When NOT to use:**
- Operations requiring user authorization (uploads, updates, deletes)
- Operations on private content
- User-specific data (subscriptions, playlists)

## Response Control Parameters

### fields

Selector specifying which fields to include in the response (partial response).

**Syntax:** Comma-separated list using dot notation

**Examples:**

**Basic field selection:**
```
GET https://www.googleapis.com/youtube/v3/videos?part=snippet&id=VIDEO_ID&fields=items(id,snippet/title)
```

Response:
```json
{
  "items": [
    {
      "id": "VIDEO_ID",
      "snippet": {
        "title": "Video Title"
      }
    }
  ]
}
```

**Multiple nested fields:**
```
fields=items(id,snippet(title,description,publishedAt),statistics(viewCount,likeCount))
```

**Wildcard usage:**
```
fields=items(id,snippet/*)  // All snippet fields
fields=items/*              // All item fields
```

**Benefits:**
- Reduced bandwidth usage
- Faster response times
- Lower quota costs for some operations
- Improved client-side parsing performance

### prettyPrint

Returns response with line breaks and indentation for readability.

**Values:** `true` (default) | `false`

**Usage:**
```
GET https://www.googleapis.com/youtube/v3/videos?part=snippet&id=VIDEO_ID&prettyPrint=false
```

**Production tip:** Set to `false` in production to reduce response size by ~20-30%.

### quotaUser

Arbitrary string to track API usage per user/client.

**Usage:**
```
GET https://www.googleapis.com/youtube/v3/videos?part=snippet&id=VIDEO_ID&quotaUser=user123
```

**Use cases:**
- Track quota usage per user
- Implement per-user rate limiting
- Monitor API usage by client segment

## Callback Parameters

### callback

JSONP callback function name for cross-domain requests.

**Usage:**
```
GET https://www.googleapis.com/youtube/v3/videos?part=snippet&id=VIDEO_ID&callback=handleResponse
```

**Response format:**
```javascript
handleResponse({
  "kind": "youtube#videoListResponse",
  "items": [...]
});
```

**Note:** Modern applications should use CORS instead of JSONP.

### alt

Alternative response format.

**Values:** `json` (default) | `media`

**Usage:**
- `alt=json`: Standard JSON response (default)
- `alt=media`: Returns media content directly (for download operations)

**Example (caption download):**
```
GET https://www.googleapis.com/youtube/v3/captions/CAPTION_ID?alt=media
```

## Conditional Request Parameters

### ifNoneMatch

ETag value for conditional GET requests.

**Usage:**
```
GET https://www.googleapis.com/youtube/v3/videos?part=snippet&id=VIDEO_ID
If-None-Match: "ETAG_VALUE"
```

**Response:**
- **304 Not Modified**: Resource unchanged, use cached version
- **200 OK**: Resource modified, returns new data with new ETag

### ifMatch

ETag value for conditional PUT/DELETE requests.

**Usage:**
```
PUT https://www.googleapis.com/youtube/v3/videos?part=snippet
If-Match: "ETAG_VALUE"

{
  "id": "VIDEO_ID",
  "snippet": {...}
}
```

**Response:**
- **200 OK**: Update succeeded, resource matched ETag
- **412 Precondition Failed**: Resource changed since ETag was retrieved

**Use case:** Prevent overwriting changes made by other clients.

## Localization Parameters

### hl

Interface language for text returned by the API.

**Format:** ISO 639-1 two-letter language code

**Usage:**
```
GET https://www.googleapis.com/youtube/v3/videos?part=snippet&id=VIDEO_ID&hl=de
```

**Affects:**
- Error messages
- Category names
- Region names
- Language names

**Supported languages:** en, de, es, fr, it, ja, ko, pt, ru, zh-CN, zh-TW, and more

### regionCode

Returns search results relevant to a specific region.

**Format:** ISO 3166-1 alpha-2 country code

**Usage:**
```
GET https://www.googleapis.com/youtube/v3/search?part=snippet&q=music&regionCode=US
```

**Affects:**
- Search result rankings
- Video availability
- Trending videos
- Chart results

## Performance Parameters

### maxResults

Maximum number of items to return in a single response.

**Range:** 0-50 (default: 5)

**Usage:**
```
GET https://www.googleapis.com/youtube/v3/search?part=snippet&q=cats&maxResults=25
```

**Best practices:**
- Use smaller values (10-25) for better performance
- Use pagination with `pageToken` for large result sets
- Don't retrieve more results than you'll display

### pageToken

Token for retrieving additional pages of results.

**Usage:**
```
// First request
GET https://www.googleapis.com/youtube/v3/search?part=snippet&q=cats&maxResults=25

// Response contains nextPageToken
{
  "nextPageToken": "CAUQAA",
  "items": [...]
}

// Next page request
GET https://www.googleapis.com/youtube/v3/search?part=snippet&q=cats&maxResults=25&pageToken=CAUQAA
```

**Token types:**
- `nextPageToken`: Get next page of results
- `prevPageToken`: Get previous page of results

**Important:** Tokens expire after 24 hours.

## Parameter Combination Examples

### Authenticated search with pagination
```
GET https://www.googleapis.com/youtube/v3/search?part=snippet&q=tutorial&maxResults=20&regionCode=US&hl=en&access_token=TOKEN
```

### Partial response with caching
```
GET https://www.googleapis.com/youtube/v3/videos?part=snippet,statistics&id=VIDEO_ID&fields=items(id,snippet/title,statistics/viewCount)&key=API_KEY
If-None-Match: "ETAG_VALUE"
```

### Optimized production request
```
GET https://www.googleapis.com/youtube/v3/channels?part=snippet&mine=true&fields=items(id,snippet(title,thumbnails/default))&prettyPrint=false&access_token=TOKEN
```

## Common Pitfalls

### 1. Using both key and access_token
```
// WRONG: Don't use both
?key=API_KEY&access_token=TOKEN

// CORRECT: Use one or the other
?access_token=TOKEN  // For authenticated requests
?key=API_KEY         // For unauthenticated requests
```

### 2. Not URL-encoding parameters
```
// WRONG
?q=cats and dogs

// CORRECT
?q=cats%20and%20dogs
```

### 3. Forgetting prettyPrint in production
```
// DEVELOPMENT
?prettyPrint=true  // Easy to read, larger size

// PRODUCTION
?prettyPrint=false  // Smaller size, faster transfer
```

### 4. Invalid fields syntax
```
// WRONG
?fields=snippet.title,snippet.description

// CORRECT
?fields=items(snippet(title,description))
```

## Parameter Reference Table

| Parameter | Type | Required | Description | Example |
|-----------|------|----------|-------------|---------|
| `access_token` | string | Conditional* | OAuth 2.0 token | `?access_token=ya29...` |
| `key` | string | Conditional* | API key | `?key=AIzaSy...` |
| `fields` | string | No | Partial response selector | `?fields=items/id` |
| `prettyPrint` | boolean | No | Format response | `?prettyPrint=false` |
| `quotaUser` | string | No | Quota user identifier | `?quotaUser=user123` |
| `callback` | string | No | JSONP callback | `?callback=handleResponse` |
| `alt` | string | No | Response format | `?alt=media` |
| `hl` | string | No | Interface language | `?hl=de` |
| `regionCode` | string | No | Region for results | `?regionCode=US` |
| `maxResults` | integer | No | Results per page (0-50) | `?maxResults=25` |
| `pageToken` | string | No | Pagination token | `?pageToken=CAUQAA` |

*One of `access_token` or `key` is required for all requests

## Related Documentation

- [Partial Responses Guide](partial-responses.md)
- [ETags Guide](etags.md)
- [Pagination Guide](pagination.md)
- [Quota Management](../overview/quota-costs.md)
- [Authentication](auth-server-side.md)
