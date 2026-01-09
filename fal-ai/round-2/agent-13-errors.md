---
source: '[unknown - agent-13-errors.md]'
scraped: 2025-12-29
api_provider: FAL.ai
discovery_tier: 3
verified: false
---
 FAL.ai Error Codes & Troubleshooting - Complete Reference

> **Research Agent:** Round 2 - Gap-Filling
> **Topic:** Error Codes, HTTP Status Codes, Troubleshooting
> **Created:** 2025-12-29
> **Words:** ~6,000
> **Status:** Complete

---

## Executive Summary

This documentation provides a complete reference for all FAL.ai error codes, HTTP status codes, error handling patterns, and troubleshooting strategies. Understanding these errors is critical for building robust SaaS applications on FAL.ai infrastructure.

---

## Table of Contents

1. [Error Response Architecture](#1-error-response-architecture)
2. [HTTP Status Codes](#2-http-status-codes)
3. [Validation Errors](#3-validation-errors)
4. [Queue and Async Errors](#4-queue-and-async-errors)
5. [Rate Limiting](#5-rate-limiting)
6. [Model-Specific Errors](#6-model-specific-errors)
7. [Media Processing Errors](#7-media-processing-errors)
8. [Authentication Errors](#8-authentication-errors)
9. [Webhook Errors](#9-webhook-errors)
10. [Error Handling Examples](#10-error-handling-examples)
11. [Troubleshooting Guide](#11-troubleshooting-guide)

---

## Related Documentation

- [[agent-01-core-api#authentication|Core API Authentication]]
- [[agent-06-streaming-queues#queue-system|Queue System]]
- [[agent-08-billing-usage#billing|Billing & Usage]]
- [[agent-14-enterprise#support|Enterprise Support]]

---

## 1. Error Response Architecture

### Standard Error Response Format

FAL.ai returns structured error responses with three components:

1. **HTTP Status Code:** General category (422, 500, 504, etc.)
2. **Headers:** Including `X-Fal-Retryable` for retry decisions
3. **JSON Body:** Contains `detail` array with Error objects

### Error Object Structure

```json
{
  "detail": [
    {
      "type": "sequence_too_long",
      "msg": "Sequence should have at most 4 items",
      "loc": ["body", "controlnet_images"],
      "url": "https://docs.fal.ai/errors/#sequence_too_long",
      "ctx": { "max_length": 4 },
      "input": ["img1.jpg", "img2.jpg", "img3.jpg", "img4.jpg", "img5.jpg"]
    }
  ]
}
```

| Field | Type | Description |
|-------|------|-------------|
| `type` | string | Unique error identifier for machine processing |
| `msg` | string | Human-readable message for display |
| `loc` | array | Location path (e.g., `["body", "image_url"]`) |
| `url` | string | Documentation URL for developers |
| `ctx` | object | Context (e.g., `max_length`, `min_height`) |
| `input` | any | Value that caused the error |

### X-Fal-Retryable Header

- `true`: Transient error, may succeed on retry
- `false`: Permanent error, retry will not help

**Always check this header before implementing retry logic.**

---

## 2. HTTP Status Codes

### Client Errors (4xx)

#### 400 Bad Request

**Description:** Malformed request or invalid syntax.

**Retryable:** No

```json
{
  "detail": [
    {
      "loc": ["body"],
      "msg": "JSON decode error",
      "type": "json_invalid"
    }
  ]
}
```

**Solution:** Validate JSON syntax before sending.

---

#### 401 Unauthorized

**Description:** Missing or invalid authentication.

**Retryable:** No

**Solutions:**
1. Use format: `Authorization: Key YOUR_API_KEY` (not Bearer)
2. Generate new key from [fal.ai/dashboard/keys](https://fal.ai/dashboard/keys)
3. Verify key hasn't expired

---

#### 403 Forbidden

**Description:** Valid credentials but insufficient permissions.

**Retryable:** No

**Solutions:**
1. Verify API key scope (API vs Admin)
2. Some Platform APIs require Admin scope

---

#### 404 Not Found

**Description:** Endpoint or resource doesn't exist.

**Retryable:** No

**Common Causes:**
- Invalid endpoint URL
- Invalid model ID
- Expired file URL (7-day retention)

---

#### 422 Unprocessable Entity

**Description:** Syntactically correct but semantic errors.

**Retryable:** No

**Billing Note:** 422 errors **are still billed** (user error).

```json
{
  "detail": [
    {
      "loc": ["body", "prompt"],
      "msg": "Sequence should have at most 1000 characters",
      "type": "sequence_too_long",
      "ctx": { "max_length": 1000 }
    }
  ]
}
```

---

#### 429 Too Many Requests

**Description:** Rate limit exceeded.

**Rate Limit:** 2 concurrent tasks per user

**Retryable:** Yes (after waiting)

**Headers:**
- `Retry-After`: Seconds to wait

```json
{
  "detail": [
    {
      "msg": "Rate limit exceeded. Maximum 2 concurrent requests allowed.",
      "type": "rate_limit_exceeded"
    }
  ]
}
```

---

### Server Errors (5xx)

#### 500 Internal Server Error

**Type:** `internal_server_error`

**Retryable:** Check `X-Fal-Retryable` header

**Billing Note:** Server-side failures (5xx) are **not charged**.

---

#### 502 Bad Gateway

**Description:** Invalid response from upstream server.

**Retryable:** Usually yes

**Solution:** Retry after short delay.

---

#### 503 Service Unavailable

**Type:** `downstream_service_unavailable`

**Retryable:** Check header

```json
{
  "detail": [
    {
      "msg": "Downstream service error",
      "type": "downstream_service_error"
    }
  ]
}
```

---

#### 504 Gateway Timeout

**Type:** `generation_timeout`

**Retryable:** Check header

```json
{
  "detail": [
    {
      "msg": "Generation timeout",
      "type": "generation_timeout"
    }
  ]
}
```

**Solutions:**
1. Use queue API for long operations
2. Reduce input complexity

---

## 3. Validation Errors

### Sequence Too Long

**Type:** `sequence_too_long`

```json
{
  "loc": ["body", "controlnet_images"],
  "msg": "Sequence should have at most 4 items",
  "type": "sequence_too_long",
  "ctx": { "max_length": 4 }
}
```

---

### One Of Error

**Type:** `one_of`

```json
{
  "loc": ["body", "aspect_ratio"],
  "msg": "Input should be one of: '16:9', '9:16', '1:1', '4:3'",
  "type": "one_of",
  "ctx": { "expected": ["16:9", "9:16", "1:1", "4:3"] },
  "input": "3:2"
}
```

---

### Image Validation Errors

#### Image Too Large

**Type:** `image_too_large`

```json
{
  "msg": "Image too large",
  "type": "image_too_large",
  "ctx": { "max_height": 1024, "max_width": 1024 }
}
```

#### Image Too Small

**Type:** `image_too_small`

```json
{
  "msg": "Image too small",
  "type": "image_too_small",
  "ctx": { "min_height": 256, "min_width": 256 }
}
```

#### Image Load Error

**Type:** `image_load_error`

**Supported Formats:** `.jpg`, `.jpeg`, `.png`, `.webp`

**Solutions:**
1. Verify image is not corrupted
2. Ensure URL is publicly accessible
3. Use fal.ai storage: `fal.storage.upload(file)`

#### File Download Error

**Type:** `file_download_error`

**Solutions:**
1. Verify URL is public (no auth required)
2. Test URL in browser
3. Use fal.ai storage upload

---

### Archive Validation Errors

#### Invalid Archive

**Type:** `invalid_archive`

**Supported:** `.zip`, `.tar.gz`

#### Too Few Files

**Type:** `too_few_files`

```json
{
  "type": "too_few_files",
  "ctx": { "min_count": 10, "found_count": 3 }
}
```

#### Too Many Files

**Type:** `too_many_files`

```json
{
  "type": "too_many_files",
  "ctx": { "max_count": 100, "found_count": 150 }
}
```

---

## 4. Queue and Async Errors

### Queue Status Values

| Status | Description |
|--------|-------------|
| `IN_QUEUE` | Waiting to be processed |
| `IN_PROGRESS` | Currently processing |
| `COMPLETED` | Finished successfully |
| `ERROR` | Failed with error |

### Queue Response Structure

**Initial Submission:**
```json
{
  "request_id": "80e732af-660e-45cd-bd63-580e4f2a94cc",
  "response_url": "https://queue.fal.run/.../response",
  "status_url": "https://queue.fal.run/.../status",
  "cancel_url": "https://queue.fal.run/.../cancel"
}
```

**Error Status:**
```json
{
  "request_id": "80e732af-660e-45cd-bd63-580e4f2a94cc",
  "status": "ERROR",
  "error": "Invalid status code: 422",
  "payload": { "detail": [...] }
}
```

### Enable Debug Logs

Add `logs=1` query parameter:

```bash
curl "https://queue.fal.run/.../status?logs=1" \
  -H "Authorization: Key YOUR_API_KEY"
```

### Cancel Queue Requests

```bash
curl -X PUT "https://queue.fal.run/.../cancel" \
  -H "Authorization: Key YOUR_API_KEY"
```

---

## 5. Rate Limiting

### Rate Limit Details

| Limit Type | Value |
|------------|-------|
| Concurrent Tasks | 2 per user |
| Enterprise | Custom limits |

### Exponential Backoff

1. First retry: 1 second
2. Second retry: 2 seconds
3. Third retry: 4 seconds
4. Continue doubling up to 60 seconds
5. Add random jitter (0-1 second)

---

## 6. Model-Specific Errors

### Content Policy Violation

**Type:** `content_policy_violation`

```json
{
  "msg": "Content flagged by content checker.",
  "type": "content_policy_violation"
}
```

**Violations Include:**
- NSFW content
- Hate speech
- Extreme violence
- Self-harm content
- Misinformation
- IP infringement

---

### Face Detection Error

**Type:** `face_detection_error`

```json
{
  "msg": "Could not detect face in the image",
  "type": "face_detection_error"
}
```

**Solutions:**
1. Lower `face_id_det_size` (640 → 320 or 128)
2. Use clearer, well-lit image
3. Ensure face is not obscured

---

### Downstream Service Error

**Type:** `downstream_service_error`

**Status:** 503

**Note:** Partner APIs have no availability guarantee.

---

## 7. Media Processing Errors

### Audio Duration Errors

#### Audio Too Short

**Type:** `audio_duration_too_short`

```json
{
  "type": "audio_duration_too_short",
  "ctx": { "min_duration": 5, "provided_duration": 2 }
}
```

#### Audio Too Long

**Type:** `audio_duration_too_long`

```json
{
  "type": "audio_duration_too_long",
  "ctx": { "max_duration": 60, "provided_duration": 90 }
}
```

---

### Video Duration Errors

#### Video Too Short

**Type:** `video_duration_too_short`

#### Video Too Long

**Type:** `video_duration_too_long`

---

### Model-Specific Requirements

| Model | Audio Duration | Max Size |
|-------|---------------|----------|
| Sync Lipsync | Max 15 sec | - |
| Kling LipSync | 2-60 sec | 5MB |
| Wan 2.6 | 3-30 sec | 15MB |

---

## 8. Authentication Errors

### Header Format

```
Authorization: Key YOUR_API_KEY
```

### API Key Scopes

| Scope | Access Level |
|-------|--------------|
| API | Standard access |
| Admin | Full access including team management |

### Common Authentication Errors

**Invalid Token:**
- Verify format: `Key YOUR_API_KEY`
- Check for whitespace
- Generate new key if needed

**Authentication Required:**
- Include Authorization header
- Verify model ID is correct

---

## 9. Webhook Errors

### Webhook Configuration

```bash
curl -X POST "https://queue.fal.run/fal-ai/fast-sdxl" \
  -H "Authorization: Key YOUR_API_KEY" \
  -d '{
    "prompt": "...",
    "webhook_url": "https://your-server.com/webhook"
  }'
```

### Webhook Payload

**Success:**
```json
{
  "request_id": "80e732af...",
  "status": "OK",
  "payload": { "images": [...] }
}
```

**Error:**
```json
{
  "request_id": "80e732af...",
  "status": "ERROR",
  "error": "Invalid status code: 422",
  "payload": { "detail": [...] }
}
```

### Signature Verification

**Header:** `X-Fal-Webhook-Signature`

**JWKS:** `https://rest.alpha.fal.ai/.well-known/jwks.json`

**Algorithm:** ED25519

---

## 10. Error Handling Examples

### JavaScript

```javascript
import { fal } from "@fal-ai/client";

async function generateImage(prompt) {
  try {
    const result = await fal.subscribe("fal-ai/flux/dev", {
      input: { prompt },
      logs: true,
    });
    return result;
  } catch (error) {
    if (error.body?.detail) {
      for (const err of error.body.detail) {
        switch (err.type) {
          case 'content_policy_violation':
            throw new Error('Content violates usage policies');
          case 'rate_limit_exceeded':
            await sleep(getRetryDelay());
            return generateImage(prompt);
          case 'image_load_error':
            throw new Error('Failed to load image');
          default:
            throw new Error(err.msg);
        }
      }
    }
    throw error;
  }
}

function getRetryDelay(attempt = 1) {
  const baseDelay = 1000;
  const maxDelay = 60000;
  const jitter = Math.random() * 1000;
  return Math.min(baseDelay * Math.pow(2, attempt) + jitter, maxDelay);
}
```

### Python

```python
import fal_client
from httpx import HTTPStatusError
import time
import random

def generate_image(prompt: str, max_retries: int = 3):
    for attempt in range(max_retries):
        try:
            result = fal_client.subscribe(
                "fal-ai/flux/dev",
                arguments={"prompt": prompt},
                with_logs=True,
            )
            return result

        except HTTPStatusError as e:
            if e.response.status_code == 429:
                delay = get_retry_delay(attempt)
                time.sleep(delay)
                continue
            elif e.response.status_code >= 500:
                if e.response.headers.get('X-Fal-Retryable') == 'true':
                    time.sleep(get_retry_delay(attempt))
                    continue
            raise

    raise Exception(f"Max retries ({max_retries}) exceeded")

def get_retry_delay(attempt: int) -> float:
    base_delay = 1.0
    max_delay = 60.0
    jitter = random.uniform(0, 1)
    return min(base_delay * (2 ** attempt) + jitter, max_delay)
```

### cURL

```bash
# Submit to queue
RESPONSE=$(curl -s -X POST "https://queue.fal.run/fal-ai/flux/dev" \
  -H "Authorization: Key $FAL_KEY" \
  -d '{"prompt": "a sunset"}')

REQUEST_ID=$(echo $RESPONSE | jq -r '.request_id')

# Poll status with logs
while true; do
  STATUS=$(curl -s ".../status?logs=1" -H "Authorization: Key $FAL_KEY")
  CURRENT=$(echo $STATUS | jq -r '.status')

  if [ "$CURRENT" = "COMPLETED" ]; then
    break
  elif [ "$CURRENT" = "ERROR" ]; then
    echo "Error: $(echo $STATUS | jq -r '.error')"
    exit 1
  fi
  sleep 2
done
```

---

## 11. Troubleshooting Guide

### Common Issues

#### "JSON decode error" with 422

**Causes:** Newlines, special characters in JSON

**Solutions:**
1. Validate JSON before sending
2. Escape special characters
3. Remove newlines in prompts

---

#### Authentication fails with valid key

**Causes:** Wrong format, whitespace

**Solutions:**
1. Use `Authorization: Key YOUR_API_KEY`
2. Trim whitespace
3. Generate new key

---

#### Rate limit with low volume

**Causes:** Concurrent limit (2 per user)

**Solutions:**
1. Wait for previous requests
2. Implement client-side queuing
3. Use webhooks instead of polling

---

#### "Image load error"

**Causes:** URL not accessible

**Solutions:**
1. Test URL in incognito browser
2. Use fal.ai storage upload
3. Check for auth requirements

---

#### Face detection fails

**Causes:** Face too small/unclear

**Solutions:**
1. Lower `face_id_det_size` to 320 or 128
2. Use clearer image
3. Disable if optional

---

#### Request timeout (504)

**Causes:** Complex generation

**Solutions:**
1. Use queue API
2. Reduce complexity
3. Check `X-Fal-Retryable`

---

### Pre-Request Checklist

- [ ] API key valid with correct scope
- [ ] JSON properly formatted
- [ ] Required parameters present
- [ ] Image URLs publicly accessible
- [ ] Image dimensions meet requirements
- [ ] File formats supported
- [ ] Duration limits met
- [ ] Content complies with policies

---

## Appendix: Complete Error Type Reference

| Error Type | HTTP | Retryable | Description |
|------------|------|-----------|-------------|
| `internal_server_error` | 500 | Maybe | Unexpected server issue |
| `generation_timeout` | 504 | Maybe | Time limit exceeded |
| `downstream_service_error` | 503 | Maybe | Third-party unavailable |
| `rate_limit_exceeded` | 429 | Yes | Rate limits exceeded |
| `content_policy_violation` | 422 | No | Safety system flagged |
| `image_load_error` | 422 | No | Failed to load image |
| `image_too_large` | 422 | No | Dimensions too large |
| `image_too_small` | 422 | No | Dimensions too small |
| `unsupported_image_format` | 422 | No | Format not supported |
| `file_download_error` | 422 | No | URL download failed |
| `face_detection_error` | 422 | No | No face detected |
| `sequence_too_long` | 422 | No | Max length exceeded |
| `one_of` | 422 | No | Invalid value |
| `invalid_archive` | 422 | No | Archive corrupted |
| `too_few_files` | 422 | No | Insufficient files |
| `too_many_files` | 422 | No | Excess files |
| `audio_duration_too_short` | 422 | No | Audio too short |
| `audio_duration_too_long` | 422 | No | Audio too long |
| `video_duration_too_short` | 422 | No | Video too short |
| `video_duration_too_long` | 422 | No | Video too long |

---

## Support

| Channel | Contact |
|---------|---------|
| Email | support@fal.ai |
| Discord | FAL.ai Discord |
| GitHub | github.com/fal-ai/fal/issues |

---

## Sources

- [FAL.ai Error Reference](https://docs.fal.ai/model-apis/errors)
- [FAL.ai FAQ](https://docs.fal.ai/model-apis/faq)
- [Queue API](https://docs.fal.ai/model-apis/model-endpoints/queue)
- [Webhooks API](https://docs.fal.ai/model-apis/model-endpoints/webhooks)
- [Authentication](https://docs.fal.ai/platform-apis/authentication)
