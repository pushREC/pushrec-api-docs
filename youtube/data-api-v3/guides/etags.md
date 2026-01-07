---
source: https://developers.google.com/youtube/v3 (synthesized from API specification)
scraped: 2026-01-07
api_provider: Google
discovery_tier: 3
verified: false
category: guides
method: manual
---
 ETags and Conditional Requests - YouTube Data API v3

## Overview

ETags (Entity Tags) are HTTP headers that enable efficient caching and prevent concurrent update conflicts. The YouTube Data API v3 returns ETags with all resource responses and supports conditional requests using ETag values.

## What are ETags?

An ETag is a unique identifier assigned to a specific version of a resource. When the resource changes, its ETag changes.

**Example response with ETag:**
```json
{
  "kind": "youtube#video",
  "etag": "xi7QvDXeCDaBHsXx9TqHKGbEtJo",
  "id": "VIDEO_ID",
  "snippet": {
    "title": "Example Video",
    "description": "Video description"
  }
}
```

## Use Cases

### 1. Efficient Caching (GET Requests)

Reduce bandwidth and improve performance by caching resources locally.

**Workflow:**

**Initial request:**
```http
GET /youtube/v3/videos?part=snippet&id=VIDEO_ID
Authorization: Bearer ACCESS_TOKEN
```

**Response:**
```http
HTTP/1.1 200 OK
ETag: "xi7QvDXeCDaBHsXx9TqHKGbEtJo"
Content-Type: application/json

{
  "etag": "xi7QvDXeCDaBHsXx9TqHKGbEtJo",
  "items": [...]
}
```

**Cache the response with its ETag.**

**Subsequent request (conditional GET):**
```http
GET /youtube/v3/videos?part=snippet&id=VIDEO_ID
Authorization: Bearer ACCESS_TOKEN
If-None-Match: "xi7QvDXeCDaBHsXx9TqHKGbEtJo"
```

**Response if unchanged:**
```http
HTTP/1.1 304 Not Modified
ETag: "xi7QvDXeCDaBHsXx9TqHKGbEtJo"
```

**Response if changed:**
```http
HTTP/1.1 200 OK
ETag: "newETagValue123"
Content-Type: application/json

{
  "etag": "newETagValue123",
  "items": [...]
}
```

### 2. Preventing Concurrent Updates (PUT/DELETE Requests)

Prevent overwriting changes made by other clients (optimistic locking).

**Scenario:** Two clients retrieve the same video, then both attempt to update it.

**Client A and B both fetch the video:**
```http
GET /youtube/v3/videos?part=snippet&id=VIDEO_ID
```

**Response (both receive same ETag):**
```json
{
  "etag": "originalETag123",
  "id": "VIDEO_ID",
  "snippet": {
    "title": "Original Title",
    "description": "Original description"
  }
}
```

**Client A updates first (with If-Match):**
```http
PUT /youtube/v3/videos?part=snippet
Authorization: Bearer ACCESS_TOKEN
If-Match: "originalETag123"
Content-Type: application/json

{
  "id": "VIDEO_ID",
  "snippet": {
    "title": "Title Updated by Client A",
    "description": "Original description"
  }
}
```

**Response (success):**
```http
HTTP/1.1 200 OK
ETag: "newETag456"

{
  "etag": "newETag456",
  "id": "VIDEO_ID",
  "snippet": {
    "title": "Title Updated by Client A",
    "description": "Original description"
  }
}
```

**Client B updates next (with old ETag):**
```http
PUT /youtube/v3/videos?part=snippet
Authorization: Bearer ACCESS_TOKEN
If-Match: "originalETag123"
Content-Type: application/json

{
  "id": "VIDEO_ID",
  "snippet": {
    "title": "Title Updated by Client B",
    "description": "New description"
  }
}
```

**Response (conflict):**
```http
HTTP/1.1 412 Precondition Failed
Content-Type: application/json

{
  "error": {
    "code": 412,
    "message": "Precondition Failed",
    "errors": [
      {
        "domain": "global",
        "reason": "conditionNotMet",
        "message": "Precondition Failed"
      }
    ]
  }
}
```

**Client B must now:**
1. Fetch the latest version (with new ETag)
2. Review changes made by Client A
3. Merge or reapply their changes
4. Submit update with new ETag

## HTTP Headers

### If-None-Match (for GET requests)

**Purpose:** Return resource only if it has changed

**Syntax:**
```http
If-None-Match: "etagValue"
```

**Behavior:**
- **ETag matches:** Returns `304 Not Modified` (use cached version)
- **ETag differs:** Returns `200 OK` with new resource and new ETag

**Example:**
```http
GET /youtube/v3/channels?part=snippet&mine=true
Authorization: Bearer ACCESS_TOKEN
If-None-Match: "cachedETagValue"
```

### If-Match (for PUT/DELETE requests)

**Purpose:** Perform operation only if resource hasn't changed

**Syntax:**
```http
If-Match: "etagValue"
```

**Behavior:**
- **ETag matches:** Performs operation, returns new ETag
- **ETag differs:** Returns `412 Precondition Failed`

**Example:**
```http
PUT /youtube/v3/videos?part=snippet
Authorization: Bearer ACCESS_TOKEN
If-Match: "currentEtagValue"
Content-Type: application/json

{...}
```

## Implementation Patterns

### Pattern 1: Simple Caching

```python
import requests

class YouTubeClient:
    def __init__(self, api_key):
        self.api_key = api_key
        self.cache = {}  # {url: {"etag": "...", "data": {...}}}

    def get_video(self, video_id):
        url = f"https://www.googleapis.com/youtube/v3/videos?part=snippet&id={video_id}&key={self.api_key}"

        headers = {}
        if url in self.cache:
            headers["If-None-Match"] = self.cache[url]["etag"]

        response = requests.get(url, headers=headers)

        if response.status_code == 304:
            # Not modified, use cache
            return self.cache[url]["data"]

        elif response.status_code == 200:
            # Resource changed or first fetch
            data = response.json()
            self.cache[url] = {
                "etag": data.get("etag"),
                "data": data
            }
            return data

        else:
            response.raise_for_status()
```

### Pattern 2: Safe Updates with Retry

```python
def update_video_with_retry(video_id, updates, max_retries=3):
    """Safely update video with ETag checking and retry logic."""

    for attempt in range(max_retries):
        # Fetch current version
        current = get_video(video_id)
        etag = current["etag"]

        # Apply updates
        video_data = {
            "id": video_id,
            "snippet": {**current["snippet"], **updates}
        }

        # Attempt update with ETag
        headers = {
            "Authorization": f"Bearer {access_token}",
            "If-Match": etag,
            "Content-Type": "application/json"
        }

        response = requests.put(
            f"https://www.googleapis.com/youtube/v3/videos?part=snippet",
            headers=headers,
            json=video_data
        )

        if response.status_code == 200:
            return response.json()  # Success

        elif response.status_code == 412:
            # Precondition failed, retry
            print(f"Conflict detected, retry {attempt + 1}/{max_retries}")
            continue

        else:
            response.raise_for_status()

    raise Exception("Max retries exceeded for video update")
```

### Pattern 3: Conditional Fetch with Fallback

```javascript
async function fetchVideoWithCache(videoId, cachedETag) {
  const url = `https://www.googleapis.com/youtube/v3/videos?part=snippet&id=${videoId}&key=${API_KEY}`;

  const headers = {};
  if (cachedETag) {
    headers['If-None-Match'] = cachedETag;
  }

  const response = await fetch(url, { headers });

  if (response.status === 304) {
    // Not modified - use cache
    return getCachedVideo(videoId);
  }

  if (response.status === 200) {
    const data = await response.json();

    // Cache with new ETag
    cacheVideo(videoId, data, data.etag);

    return data;
  }

  throw new Error(`Unexpected status: ${response.status}`);
}
```

## ETag Formats

YouTube API ETags are quoted strings:
```
"xi7QvDXeCDaBHsXx9TqHKGbEtJo"
```

**Important:** Include quotes in the `If-Match` and `If-None-Match` headers.

## Best Practices

### 1. Always Use ETags for Updates

```python
# BAD: Update without ETag check
def update_video_unsafe(video_id, updates):
    # Risk: May overwrite concurrent changes
    response = requests.put(url, json=updates)
    return response.json()

# GOOD: Update with ETag check
def update_video_safe(video_id, updates):
    current = get_video(video_id)
    etag = current["etag"]

    headers = {"If-Match": etag}
    response = requests.put(url, headers=headers, json=updates)

    if response.status_code == 412:
        # Handle conflict
        raise ConflictError("Resource changed, please retry")

    return response.json()
```

### 2. Implement Cache Expiry

ETags are valid indefinitely, but implement cache expiry for freshness:

```python
import time

cache = {
    "url": {
        "etag": "etagValue",
        "data": {...},
        "timestamp": 1609459200  # Unix timestamp
    }
}

MAX_CACHE_AGE = 3600  # 1 hour

def get_cached_or_fetch(url):
    if url in cache:
        age = time.time() - cache[url]["timestamp"]
        if age < MAX_CACHE_AGE:
            # Cache fresh, use conditional request
            etag = cache[url]["etag"]
        else:
            # Cache stale, fetch unconditionally
            etag = None
    else:
        etag = None

    return fetch_with_etag(url, etag)
```

### 3. Handle 412 Gracefully

```python
def safe_update(resource_id, updates):
    try:
        return update_with_etag(resource_id, updates)
    except PreconditionFailedError:
        # Log conflict
        logger.warning(f"Update conflict for {resource_id}")

        # Option 1: Retry with latest version
        return update_with_retry(resource_id, updates)

        # Option 2: Notify user
        raise ConflictError("Resource modified by another client. Please refresh and try again.")

        # Option 3: Merge changes (advanced)
        return merge_and_update(resource_id, updates)
```

### 4. Store ETags with Cached Data

```python
# BAD: Separate ETag storage
etag_cache = {"video1": "etag1"}
data_cache = {"video1": {...}}

# GOOD: Store together
cache = {
    "video1": {
        "etag": "etag1",
        "data": {...},
        "timestamp": 1609459200
    }
}
```

## Performance Benefits

### Bandwidth Savings

**Without ETags (repeated fetches):**
```
Request 1: 200 OK → 5 KB
Request 2: 200 OK → 5 KB
Request 3: 200 OK → 5 KB
Total: 15 KB
```

**With ETags (conditional requests):**
```
Request 1: 200 OK → 5 KB
Request 2: 304 Not Modified → 0.2 KB
Request 3: 304 Not Modified → 0.2 KB
Total: 5.4 KB (64% reduction)
```

### Quota Savings

Some API operations may consume fewer quota units when returning `304 Not Modified` vs. `200 OK`. Check current quota documentation for specifics.

## Common Pitfalls

### 1. Not Including Quotes

```python
# WRONG
headers = {"If-Match": etag}  # etag = xi7QvDXeCDaBHsXx9TqHKGbEtJo

# CORRECT
headers = {"If-Match": f'"{etag}"'}  # "xi7QvDXeCDaBHsXx9TqHKGbEtJo"

# BEST: ETag from API already includes quotes
headers = {"If-Match": data["etag"]}  # Already quoted
```

### 2. Using ETag for GET, Ignoring for PUT

```python
# INCONSISTENT
def get_video(video_id):
    # Uses ETag caching ✓
    headers = {"If-None-Match": cached_etag}
    return requests.get(url, headers=headers)

def update_video(video_id, updates):
    # Doesn't use ETag checking ✗
    return requests.put(url, json=updates)

# CONSISTENT
def update_video(video_id, updates):
    # Use ETag to prevent conflicts ✓
    current = get_video(video_id)
    headers = {"If-Match": current["etag"]}
    return requests.put(url, headers=headers, json=updates)
```

### 3. Not Handling 412 Errors

```python
# BAD: Unhandled 412 crashes application
response = requests.put(url, headers={"If-Match": etag}, json=data)
return response.json()  # Raises exception on 412

# GOOD: Handle 412 gracefully
response = requests.put(url, headers={"If-Match": etag}, json=data)
if response.status_code == 412:
    logger.warning("Update conflict detected")
    # Implement retry or user notification
    raise ConflictError("Resource was modified, please retry")
return response.json()
```

## Summary

| Scenario | Header | Success Response | Conflict Response |
|----------|--------|------------------|-------------------|
| **Conditional GET** | `If-None-Match: "etag"` | 304 Not Modified | 200 OK (new data) |
| **Safe UPDATE** | `If-Match: "etag"` | 200 OK (updated) | 412 Precondition Failed |
| **Safe DELETE** | `If-Match: "etag"` | 204 No Content | 412 Precondition Failed |

**Key Takeaways:**
- Always use ETags for PUT/DELETE operations
- Implement caching with conditional GET requests
- Handle 412 errors gracefully with retry logic
- Store ETags with cached data
- Include quotes in ETag headers

## Related Documentation

- [Standard Parameters](standard-parameters.md)
- [Error Handling](../overview/errors.md)
- [Best Practices](best-practices.md)
- [Videos.update](../resources/videos-update.md)
