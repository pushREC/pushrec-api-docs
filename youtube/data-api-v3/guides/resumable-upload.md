---
source: https://developers.google.com/youtube/v3/guides/using_resumable_upload_protocol
scraped: 2026-01-07
method: webfetch
api: youtube-data-v3
category: guides
---

# YouTube Resumable Upload Protocol - Complete Guide

## Overview

The resumable upload protocol enables reliable video uploads to YouTube by allowing paused and resumed operations. This is particularly useful for:
- Large files
- Unreliable networks
- Mobile devices

## Step 1: Initiate a Resumable Session

Send a POST request to initiate the upload:

```http
POST /upload/youtube/v3/videos?uploadType=resumable&part=snippet,status,contentDetails HTTP/1.1
Host: www.googleapis.com
Authorization: Bearer AUTH_TOKEN
Content-Length: 278
Content-Type: application/json; charset=UTF-8
X-Upload-Content-Length: 3000000
X-Upload-Content-Type: video/*

{
  "snippet": {
    "title": "My video title",
    "description": "This is a description of my video",
    "tags": ["cool", "video", "more keywords"],
    "categoryId": 22
  },
  "status": {
    "privacyStatus": "public",
    "embeddable": true,
    "license": "youtube"
  }
}
```

### Required Headers

| Header | Description |
|--------|-------------|
| `Authorization` | Bearer token for authentication |
| `Content-Length` | Size of the metadata body in bytes |
| `Content-Type` | Must be `application/json; charset=UTF-8` |
| `X-Upload-Content-Length` | Total file size in bytes |
| `X-Upload-Content-Type` | MIME type (`video/*` or `application/octet-stream`) |

### Video Metadata Fields

**Snippet Fields:**
- `title` - Video title (required)
- `description` - Video description
- `tags` - Array of keyword tags
- `categoryId` - Numeric category ID

**Status Fields:**
- `privacyStatus` - "public", "private", or "unlisted"
- `embeddable` - Boolean, allow embedding
- `license` - "youtube" or "creativeCommon"

## Step 2: Capture the Session URI

The server responds with HTTP 200 and a Location header:

```http
HTTP/1.1 200 OK
Location: https://www.googleapis.com/upload/youtube/v3/videos?uploadType=resumable&upload_id=xa298sd_f&part=snippet,status,contentDetails
Content-Length: 0
```

**Critical:** Save the `Location` header value - this is your upload session URI for all subsequent requests.

## Step 3: Upload the Video File

Send a PUT request with the binary file data:

```http
PUT UPLOAD_URL HTTP/1.1
Authorization: Bearer AUTH_TOKEN
Content-Length: CONTENT_LENGTH
Content-Type: CONTENT_TYPE

BINARY_FILE_DATA
```

### Required Headers

| Header | Description |
|--------|-------------|
| `Authorization` | Bearer token |
| `Content-Length` | File size (must match `X-Upload-Content-Length`) |
| `Content-Type` | MIME type (must match `X-Upload-Content-Type`) |

## Step 4: Handle Upload Completion

### Scenario 1: Successful Upload

**Response:** HTTP 201 (Created)

The response body contains the created video resource with all metadata including the video ID.

### Scenario 2: Resumable Interruption

Occurs when:
- Connection drops (no response received)
- Server returns 500, 502, 503, or 504 status codes

**Action:** Use exponential backoff strategy when resuming after 5xx errors.

### Scenario 3: Permanent Failure

**Response:** 4xx status code OR 5xx code not in [500, 502, 503, 504]

**Expired Session:** Returns 404 - must restart from Step 1.

## Step 4.1: Check Upload Status

Query the current upload status with an empty PUT request:

```http
PUT UPLOAD_URL HTTP/1.1
Authorization: Bearer AUTH_TOKEN
Content-Length: 0
Content-Range: bytes */CONTENT_LENGTH
```

**Note:** The `Content-Range` header uses `*` to indicate you're querying status, not uploading data.

## Step 4.2: Process Status Response

### If Upload Incomplete

**Response:** HTTP 308 (Resume Incomplete)

```http
308 Resume Incomplete
Content-Length: 0
Range: bytes=0-999999
```

**Interpreting the `Range` Header:**
- Indicates successfully uploaded bytes (0-indexed)
- If absent: nothing uploaded yet
- Check for `Retry-After` header to determine when to resume

### If Upload Complete

**Response:** HTTP 200 or 201 with the video resource.

## Step 4.3: Resume the Upload

Send a PUT request with the remaining file content:

```http
PUT UPLOAD_URL HTTP/1.1
Authorization: Bearer AUTH_TOKEN
Content-Length: REMAINING_CONTENT_LENGTH
Content-Range: bytes FIRST_BYTE-LAST_BYTE/TOTAL_CONTENT_LENGTH

PARTIAL_BINARY_FILE_DATA
```

### Content-Range Header Format

```
Content-Range: bytes FIRST_BYTE-LAST_BYTE/TOTAL_CONTENT_LENGTH
```

| Component | Description |
|-----------|-------------|
| `FIRST_BYTE` | Starting byte position (0-indexed) |
| `LAST_BYTE` | Ending byte position (0-indexed) |
| `TOTAL_CONTENT_LENGTH` | Total file size |

### Critical Rules

1. `FIRST_BYTE` must be one index higher than the previous `Range` header's last value
2. `LAST_BYTE` is the 0-based index of the final byte being uploaded
3. `TOTAL_CONTENT_LENGTH` must match the original upload size
4. Upload must be continuous - no gaps or overlaps allowed

### Resume Example

If the status check returned:
```
Range: bytes=0-999999
```

The next upload should start at byte 1000000:
```http
PUT UPLOAD_URL HTTP/1.1
Authorization: Bearer AUTH_TOKEN
Content-Length: 2000000
Content-Range: bytes 1000000-2999999/3000000

{bytes 1000000-2999999}
```

## Chunked Upload Option

Break files into segments for progress tracking:

```http
PUT UPLOAD_URL HTTP/1.1
Authorization: Bearer AUTH_TOKEN
Content-Length: 524288
Content-Type: video/*
Content-Range: bytes 0-524287/2000000

{bytes 0-524287}
```

### Chunk Size Requirements

| Requirement | Value |
|-------------|-------|
| Minimum chunk size | 256 KB |
| Must be multiple of | 256 KB (262,144 bytes) |
| Exception | Final chunk can be any size |
| All chunks except last | Must be identical size |

**Example Valid Chunk Size:** 524,288 bytes = 256 KB x 2

### Chunked Upload Response

| Chunk | Response |
|-------|----------|
| Non-final chunks | HTTP 308 (Resume Incomplete) |
| Final chunk | HTTP 201 (Created) |

### Chunked Upload Flow

1. Upload first chunk
2. Receive 308 response with `Range` header
3. Use `Range` upper value to determine next chunk start
4. Repeat until entire file transfers
5. Final chunk returns 201 with video resource

### If a Chunk Request Fails

1. Check upload status (Step 4.1)
2. Resume from the last confirmed byte (Step 4.3)

## Best Practices

| Practice | Reason |
|----------|--------|
| Start uploads immediately | Session URIs have finite lifetime |
| Resume promptly after interruption | Avoid session expiration |
| Always verify status before resuming | Don't assume partial receipt |
| Use larger chunks | More efficient than small ones |
| Query status between chunks | Can do so without interruption |

## Exponential Backoff Strategy

For 5xx errors, implement exponential backoff:

```python
import random
import time

MAX_RETRIES = 10
RETRIABLE_STATUS_CODES = [500, 502, 503, 504]

retry = 0
while retry < MAX_RETRIES:
    try:
        # Attempt upload
        response = upload_chunk()
        if response.status_code not in RETRIABLE_STATUS_CODES:
            break
    except Exception as e:
        pass

    retry += 1
    max_sleep = 2 ** retry
    sleep_seconds = random.random() * max_sleep
    time.sleep(sleep_seconds)
```

## Error Response Codes

| Code | Meaning | Action |
|------|---------|--------|
| 200/201 | Success | Upload complete |
| 308 | Resume Incomplete | Continue uploading |
| 400 | Bad Request | Fix request and retry |
| 401 | Unauthorized | Refresh access token |
| 403 | Forbidden | Check permissions/quota |
| 404 | Not Found | Session expired; restart |
| 500 | Server Error | Retry with backoff |
| 502 | Bad Gateway | Retry with backoff |
| 503 | Service Unavailable | Retry with backoff |
| 504 | Gateway Timeout | Retry with backoff |

## Complete Upload Flow Diagram

```
1. POST /upload/youtube/v3/videos?uploadType=resumable
   → Receive session URI in Location header

2. PUT {session_uri}
   → Upload file data

3. If interrupted:
   a. PUT {session_uri} with Content-Range: bytes */total
      → Check status
   b. Parse Range header from 308 response
   c. PUT {session_uri} with remaining bytes
      → Resume upload

4. On success (201):
   → Video resource returned with video ID
```

## Session URI Lifetime

- Session URIs are valid for a limited time
- Exact duration is not publicly documented
- Best practice: complete uploads as quickly as possible
- If session expires (404), must restart from Step 1
