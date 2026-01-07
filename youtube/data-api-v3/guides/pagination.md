---
source: https://developers.google.com/youtube/v3/guides/implementation/pagination
scraped: 2026-01-07
method: webfetch
api: youtube-data-v3
category: guides
---

# YouTube Data API Pagination Guide

## Overview

The YouTube Data API implements pagination through the `maxResults` parameter and page tokens. Almost all of the API's `list` methods (`videos.list`, `playlists.list`, `search.list`, etc.) support pagination.

## Core Concepts

### maxResults Parameter

The `maxResults` parameter determines how many items appear in each response page.

| Method | Default | Maximum |
|--------|---------|---------|
| `search.list` | 5 | 50 |
| `videos.list` | 5 | 50 |
| `playlists.list` | 5 | 50 |
| `playlistItems.list` | 5 | 50 |
| `channels.list` | 5 | 50 |
| `subscriptions.list` | 5 | 50 |
| `comments.list` | 20 | 100 |
| `commentThreads.list` | 20 | 100 |

### Page Tokens

When additional results exist beyond the current page, the API response includes:
- `nextPageToken` - Token to retrieve the next page of results
- `prevPageToken` - Token to retrieve the previous page of results

Not all responses include both tokens:
- First page: Only `nextPageToken` (no previous page exists)
- Last page: Only `prevPageToken` (no next page exists)
- Middle pages: Both tokens present

## Basic Pagination Pattern

### Step 1: Initial Request

```http
GET https://www.googleapis.com/youtube/v3/search?
  part=snippet&
  q=skateboarding&
  type=video&
  maxResults=10&
  key=YOUR_API_KEY
```

### Step 2: Response with Page Token

```json
{
  "kind": "youtube#searchListResponse",
  "nextPageToken": "CAUQAA",
  "pageInfo": {
    "totalResults": 1000000,
    "resultsPerPage": 10
  },
  "items": [...]
}
```

### Step 3: Request Next Page

```http
GET https://www.googleapis.com/youtube/v3/search?
  part=snippet&
  q=skateboarding&
  type=video&
  maxResults=10&
  pageToken=CAUQAA&
  key=YOUR_API_KEY
```

## Implementation Examples

### Python

```python
import googleapiclient.discovery

def get_all_results(youtube, query):
    """Retrieve all search results using pagination."""
    all_items = []
    next_page_token = None

    while True:
        request = youtube.search().list(
            part='snippet',
            q=query,
            type='video',
            maxResults=50,
            pageToken=next_page_token
        )
        response = request.execute()

        all_items.extend(response.get('items', []))

        next_page_token = response.get('nextPageToken')
        if not next_page_token:
            break

    return all_items

# Usage
youtube = googleapiclient.discovery.build('youtube', 'v3', developerKey='YOUR_API_KEY')
results = get_all_results(youtube, 'skateboarding')
print(f'Total results: {len(results)}')
```

### JavaScript

```javascript
async function getAllResults(query) {
  const items = [];
  let nextPageToken = null;

  do {
    const params = {
      part: 'snippet',
      q: query,
      type: 'video',
      maxResults: 50,
      key: 'YOUR_API_KEY'
    };

    if (nextPageToken) {
      params.pageToken = nextPageToken;
    }

    const response = await fetch(
      `https://www.googleapis.com/youtube/v3/search?${new URLSearchParams(params)}`
    );
    const data = await response.json();

    items.push(...data.items);
    nextPageToken = data.nextPageToken;

  } while (nextPageToken);

  return items;
}

// Usage
getAllResults('skateboarding').then(results => {
  console.log(`Total results: ${results.length}`);
});
```

### PHP

```php
<?php
function getAllResults($youtube, $query) {
    $items = [];
    $pageToken = null;

    do {
        $params = [
            'q' => $query,
            'type' => 'video',
            'maxResults' => 50
        ];

        if ($pageToken) {
            $params['pageToken'] = $pageToken;
        }

        $response = $youtube->search->listSearch('snippet', $params);

        $items = array_merge($items, $response->getItems());
        $pageToken = $response->getNextPageToken();

    } while ($pageToken);

    return $items;
}
?>
```

## Response Structure

### pageInfo Object

Every paginated response includes a `pageInfo` object:

```json
{
  "pageInfo": {
    "totalResults": 1000000,
    "resultsPerPage": 10
  }
}
```

| Field | Description |
|-------|-------------|
| `totalResults` | Total number of results matching the query |
| `resultsPerPage` | Number of results in the current response |

**Note:** `totalResults` is an approximation and may not be exact for large result sets.

## Best Practices

### 1. Use Maximum Page Size

Request the maximum allowed `maxResults` to minimize API calls:

```http
GET /youtube/v3/search?maxResults=50&...
```

### 2. Implement Rate Limiting

Add delays between requests to avoid hitting quota limits:

```python
import time

def get_paginated_results(youtube, query, delay=0.1):
    next_page_token = None

    while True:
        response = youtube.search().list(
            part='snippet',
            q=query,
            maxResults=50,
            pageToken=next_page_token
        ).execute()

        yield response.get('items', [])

        next_page_token = response.get('nextPageToken')
        if not next_page_token:
            break

        time.sleep(delay)  # Rate limiting
```

### 3. Handle Missing Tokens Gracefully

```python
def process_results(response):
    items = response.get('items', [])

    # Process items...

    # Check for more pages
    next_token = response.get('nextPageToken')
    prev_token = response.get('prevPageToken')

    return {
        'items': items,
        'hasNextPage': next_token is not None,
        'hasPrevPage': prev_token is not None,
        'nextPageToken': next_token,
        'prevPageToken': prev_token
    }
```

### 4. Limit Total Results

Avoid fetching unlimited results to control quota usage:

```python
def get_limited_results(youtube, query, max_items=500):
    all_items = []
    next_page_token = None

    while len(all_items) < max_items:
        remaining = max_items - len(all_items)
        page_size = min(50, remaining)

        response = youtube.search().list(
            part='snippet',
            q=query,
            maxResults=page_size,
            pageToken=next_page_token
        ).execute()

        all_items.extend(response.get('items', []))

        next_page_token = response.get('nextPageToken')
        if not next_page_token:
            break

    return all_items[:max_items]
```

## Common Patterns

### Bidirectional Navigation

```javascript
class PaginatedResults {
  constructor() {
    this.pages = [];
    this.currentPageIndex = 0;
  }

  async loadPage(pageToken = null) {
    const response = await fetchResults(pageToken);

    this.pages[this.currentPageIndex] = {
      items: response.items,
      nextToken: response.nextPageToken,
      prevToken: response.prevPageToken
    };

    return response.items;
  }

  async nextPage() {
    const currentPage = this.pages[this.currentPageIndex];
    if (!currentPage?.nextToken) return null;

    this.currentPageIndex++;
    return this.loadPage(currentPage.nextToken);
  }

  async prevPage() {
    const currentPage = this.pages[this.currentPageIndex];
    if (!currentPage?.prevToken) return null;

    this.currentPageIndex--;
    return this.loadPage(currentPage.prevToken);
  }
}
```

### Streaming Results Generator

```python
def stream_results(youtube, query):
    """Generator that yields results one at a time."""
    next_page_token = None

    while True:
        response = youtube.search().list(
            part='snippet',
            q=query,
            maxResults=50,
            pageToken=next_page_token
        ).execute()

        for item in response.get('items', []):
            yield item

        next_page_token = response.get('nextPageToken')
        if not next_page_token:
            break

# Usage
for video in stream_results(youtube, 'skateboarding'):
    print(video['snippet']['title'])
```

## Quota Considerations

Each paginated request counts against your API quota:

| Method | Quota Cost |
|--------|-----------|
| `search.list` | 100 units |
| `videos.list` | 1 unit |
| `playlists.list` | 1 unit |
| `playlistItems.list` | 1 unit |
| `channels.list` | 1 unit |

**Optimization tip:** When possible, use `videos.list` with specific video IDs rather than `search.list` to reduce quota consumption.

## Error Handling

### Invalid Page Token

```json
{
  "error": {
    "code": 400,
    "message": "Invalid pageToken.",
    "errors": [{
      "reason": "invalidPageToken"
    }]
  }
}
```

**Solution:** Start pagination from the beginning without a page token.

### Expired Page Token

Page tokens may expire after some time. If you receive an error, restart pagination from the first page.
