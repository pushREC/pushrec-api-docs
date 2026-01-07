---
source: https://developers.google.com/youtube/v3 (synthesized from API specification)
scraped: 2026-01-07
api_provider: Google
discovery_tier: 3
verified: false
category: guides
method: manual
---
 Batch Requests - YouTube Data API v3

## Overview

Batch requests allow you to combine multiple API calls into a single HTTP request, reducing network overhead and improving performance. This is especially useful when you need to perform multiple independent operations.

## Important Limitation

**YouTube Data API v3** has specific batch request limitations:

- The Data API v3 does **NOT** support Google's global batch endpoint (`www.googleapis.com/batch`)
- Batch requests must be sent to the YouTube-specific endpoint
- Not all operations can be batched

## When to Use Batch Requests

**Good use cases:**
- Fetching details for multiple videos
- Updating multiple resources
- Performing multiple independent queries
- Reducing API call overhead

**When NOT to use:**
- Operations that depend on each other
- Single resource operations
- Real-time updates (batching adds latency)
- Operations requiring immediate feedback

## Alternative: Comma-Separated IDs

For read operations, using comma-separated IDs is simpler and more efficient than batch requests.

### Example: Fetching Multiple Videos

```python
# OPTION 1: Comma-separated IDs (RECOMMENDED)
video_ids = ['video1', 'video2', 'video3', 'video4', 'video5']
response = youtube.videos().list(
    part='snippet,statistics',
    id=','.join(video_ids)
).execute()

# Returns all videos in one response
videos = response['items']

# OPTION 2: Individual requests (SLOW)
videos = []
for video_id in video_ids:
    response = youtube.videos().list(
        part='snippet,statistics',
        id=video_id
    ).execute()
    videos.extend(response['items'])

# Option 1 is 5x faster and uses 1/5 the quota!
```

### Supported Resources for Comma-Separated IDs

| Resource | Method | Max IDs | Example |
|----------|--------|---------|---------|
| videos | list | 50 | `id=video1,video2,video3` |
| channels | list | 50 | `id=channel1,channel2` |
| playlists | list | 50 | `id=playlist1,playlist2` |

## Batch Request Format (YouTube Analytics API v2)

The YouTube Analytics API v2 supports batch requests but requires a specific endpoint.

### Endpoint

```
POST https://youtubeanalytics.googleapis.com/batch
```

**DO NOT use:** `https://www.googleapis.com/batch` (not supported)

### Request Structure

```http
POST https://youtubeanalytics.googleapis.com/batch
Content-Type: multipart/mixed; boundary=batch_boundary
Authorization: Bearer ACCESS_TOKEN

--batch_boundary
Content-Type: application/http

GET /v2/reports?ids=channel==MINE&startDate=2024-01-01&endDate=2024-01-31&metrics=views

--batch_boundary
Content-Type: application/http

GET /v2/reports?ids=channel==MINE&startDate=2024-02-01&endDate=2024-02-29&metrics=views

--batch_boundary--
```

### Response Structure

```http
HTTP/1.1 200 OK
Content-Type: multipart/mixed; boundary=batch_response_boundary

--batch_response_boundary
Content-Type: application/http

HTTP/1.1 200 OK
Content-Type: application/json

{
  "kind": "youtubeAnalytics#resultTable",
  "rows": [...]
}

--batch_response_boundary
Content-Type: application/http

HTTP/1.1 200 OK
Content-Type: application/json

{
  "kind": "youtubeAnalytics#resultTable",
  "rows": [...]
}

--batch_response_boundary--
```

## Batch Request Implementation (Python)

### Using Google API Python Client

The Google API Python Client provides helper methods for batch requests.

```python
from googleapiclient.http import BatchHttpRequest

def batch_callback(request_id, response, exception):
    """Callback for batch request completion."""
    if exception is not None:
        print(f"Request {request_id} failed: {exception}")
    else:
        print(f"Request {request_id} succeeded:")
        print(response)

# Create batch request
batch = youtube.new_batch_http_request(callback=batch_callback)

# Add multiple requests to batch
video_ids = ['video1', 'video2', 'video3']
for video_id in video_ids:
    batch.add(
        youtube.videos().list(part='snippet', id=video_id),
        request_id=video_id
    )

# Execute all requests
batch.execute()
```

### Advanced Example with Error Handling

```python
from googleapiclient.http import BatchHttpRequest
from googleapiclient.errors import HttpError

class BatchProcessor:
    def __init__(self, youtube_service):
        self.youtube = youtube_service
        self.results = {}
        self.errors = {}

    def callback(self, request_id, response, exception):
        """Store results or errors from batch request."""
        if exception is not None:
            self.errors[request_id] = exception
        else:
            self.results[request_id] = response

    def fetch_multiple_videos(self, video_ids, batch_size=50):
        """Fetch multiple videos using batch requests."""
        # Process in batches of 50 (API limit)
        for i in range(0, len(video_ids), batch_size):
            batch_ids = video_ids[i:i + batch_size]

            # Create batch request
            batch = self.youtube.new_batch_http_request(callback=self.callback)

            for video_id in batch_ids:
                batch.add(
                    self.youtube.videos().list(
                        part='snippet,statistics',
                        id=video_id
                    ),
                    request_id=video_id
                )

            # Execute batch
            try:
                batch.execute()
            except HttpError as e:
                print(f"Batch request failed: {e}")

        return self.results, self.errors

# Usage
processor = BatchProcessor(youtube)
results, errors = processor.fetch_multiple_videos(
    ['video1', 'video2', 'video3', 'video4', 'video5']
)

for video_id, response in results.items():
    video = response['items'][0]
    print(f"{video_id}: {video['snippet']['title']}")

for video_id, error in errors.items():
    print(f"{video_id}: Failed with error {error}")
```

## Batch Updates

Batch requests are particularly useful for updating multiple resources.

### Example: Updating Multiple Videos

```python
def batch_update_videos(video_updates):
    """
    Update multiple videos in a batch.

    Args:
        video_updates: Dict of {video_id: {'title': '...', 'description': '...'}}
    """
    results = {}
    errors = {}

    def callback(request_id, response, exception):
        if exception:
            errors[request_id] = exception
        else:
            results[request_id] = response

    # Create batch
    batch = youtube.new_batch_http_request(callback=callback)

    for video_id, updates in video_updates.items():
        # Fetch current video to get ETag
        current = youtube.videos().list(
            part='snippet',
            id=video_id
        ).execute()

        if not current['items']:
            errors[video_id] = "Video not found"
            continue

        video = current['items'][0]

        # Apply updates
        video['snippet']['title'] = updates.get('title', video['snippet']['title'])
        video['snippet']['description'] = updates.get('description', video['snippet']['description'])

        # Add to batch
        batch.add(
            youtube.videos().update(
                part='snippet',
                body={
                    'id': video_id,
                    'snippet': video['snippet'],
                    'etag': video['etag']
                }
            ),
            request_id=video_id
        )

    # Execute all updates
    batch.execute()

    return results, errors

# Usage
updates = {
    'video1': {'title': 'New Title 1'},
    'video2': {'title': 'New Title 2', 'description': 'New Description 2'},
    'video3': {'description': 'New Description 3'}
}

results, errors = batch_update_videos(updates)
```

## Performance Comparison

### Scenario: Fetch details for 10 videos

**Individual requests:**
```
Request 1: 150ms
Request 2: 150ms
...
Request 10: 150ms
Total: 1,500ms (1.5 seconds)
```

**Comma-separated IDs (recommended):**
```
Request: 200ms
Total: 200ms (0.2 seconds)
Improvement: 87% faster
```

**Batch request:**
```
Request: 300ms
Total: 300ms (0.3 seconds)
Improvement: 80% faster
```

**Winner:** Comma-separated IDs (simpler + fastest)

## Quota Impact

### Individual Requests
```
10 videos × 1 unit = 10 units
```

### Comma-Separated IDs
```
1 request = 1 unit
Savings: 90%
```

### Batch Request
```
1 batch = 1 unit (same as comma-separated)
Savings: 90%
```

## Best Practices

### 1. Prefer Comma-Separated IDs for Reads

```python
# BEST: Use comma-separated IDs for list operations
video_ids = ['id1', 'id2', 'id3']
response = youtube.videos().list(
    part='snippet',
    id=','.join(video_ids)
).execute()

# ACCEPTABLE: Use batch for mixed operations
batch = youtube.new_batch_http_request()
batch.add(youtube.videos().list(part='snippet', id='id1'))
batch.add(youtube.channels().list(part='snippet', id='ch1'))
batch.execute()
```

### 2. Limit Batch Size

```python
MAX_BATCH_SIZE = 50  # API limit

def process_in_batches(items, batch_size=MAX_BATCH_SIZE):
    """Process items in batches."""
    for i in range(0, len(items), batch_size):
        batch_items = items[i:i + batch_size]
        process_batch(batch_items)
```

### 3. Handle Partial Failures

```python
def safe_batch_execute(batch_requests):
    """Execute batch with partial failure handling."""
    results = []
    errors = []

    def callback(request_id, response, exception):
        if exception:
            errors.append({
                'id': request_id,
                'error': str(exception)
            })
        else:
            results.append({
                'id': request_id,
                'data': response
            })

    batch = youtube.new_batch_http_request(callback=callback)

    for req_id, request in batch_requests.items():
        batch.add(request, request_id=req_id)

    batch.execute()

    return {
        'success': results,
        'failed': errors,
        'total': len(results) + len(errors)
    }
```

### 4. Implement Retry for Failed Items

```python
def batch_with_retry(requests, max_retries=3):
    """Batch execution with retry for failed items."""
    remaining = requests.copy()

    for attempt in range(max_retries):
        results, errors = execute_batch(remaining)

        if not errors:
            return results

        # Retry only failed items
        remaining = {req_id: requests[req_id] for req_id in errors.keys()}
        print(f"Retrying {len(remaining)} failed requests (attempt {attempt + 1})")

        time.sleep(2 ** attempt)  # Exponential backoff

    return results, errors
```

## Common Pitfalls

### 1. Wrong Batch Endpoint

```python
# WRONG: Global batch endpoint (not supported)
batch_url = "https://www.googleapis.com/batch"

# CORRECT: Use comma-separated IDs instead
response = youtube.videos().list(
    part='snippet',
    id=','.join(video_ids)
).execute()

# For Analytics API v2 only:
batch_url = "https://youtubeanalytics.googleapis.com/batch"
```

### 2. Exceeding Batch Size Limit

```python
# WRONG: Trying to batch 100 items
video_ids = [f'id{i}' for i in range(100)]
batch = youtube.new_batch_http_request()
for video_id in video_ids:
    batch.add(youtube.videos().list(part='snippet', id=video_id))
batch.execute()  # May fail or be slow

# CORRECT: Split into multiple batches
for i in range(0, len(video_ids), 50):
    batch_ids = video_ids[i:i+50]
    response = youtube.videos().list(
        part='snippet',
        id=','.join(batch_ids)
    ).execute()
```

### 3. Not Handling Individual Failures

```python
# BAD: Assumes all requests succeed
batch.execute()

# GOOD: Handle individual failures
def callback(request_id, response, exception):
    if exception:
        handle_error(request_id, exception)
    else:
        process_response(request_id, response)

batch = youtube.new_batch_http_request(callback=callback)
```

## Summary

| Operation | Method | Max Items | Quota Cost | Speed |
|-----------|--------|-----------|------------|-------|
| **Individual requests** | Multiple calls | N/A | N × cost | Slowest |
| **Comma-separated IDs** | Single call | 50 | 1 unit | Fastest |
| **Batch request** | Batch call | 50 | 1 unit | Fast |

**Recommendations:**
- ✅ Use **comma-separated IDs** for reading multiple resources of same type
- ✅ Use **batch requests** for mixed operations or updates
- ✅ Always handle partial failures
- ✅ Implement retry logic
- ❌ Don't use global batch endpoint for YouTube APIs
- ❌ Don't batch operations that depend on each other

## Related Documentation

- [Best Practices](best-practices.md)
- [Standard Parameters](standard-parameters.md)
- [Performance Guide](performance.md)
- [Quota Management](../overview/quota-costs.md)
