# Bright Data Web Scraper API - Endpoints Reference

> **Last Updated:** 2026-01-08
> **Base URL:** `https://api.brightdata.com`

## Authentication

All endpoints require Bearer token authentication:

```
Authorization: Bearer YOUR_API_KEY
Content-Type: application/json
```

Get your API key from: https://brightdata.com/cp/api_tokens

---

## Data Collection APIs

### 1. Trigger Async Request

Trigger a data collection job for batch processing.

```http
POST /datasets/v3/trigger
```

**Query Parameters:**

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `dataset_id` | string | Yes | The dataset/scraper identifier |
| `format` | string | No | Output format: `json`, `ndjson`, `jsonl`, `csv` |
| `notify` | boolean | No | Enable webhook notifications |
| `endpoint` | string | No | Webhook URL for delivery |
| `include_errors` | boolean | No | Include error reporting |
| `custom_output_fields` | string | No | Filter fields (pipe-separated) |
| `type` | string | No | `discover_new` for discovery-based collection |
| `discover_by` | string | No | Discovery method: `keyword`, `best_sellers_url`, `category_url`, `location` |

**Request Body:**

```json
[
  {
    "url": "https://www.youtube.com/watch?v=VIDEO_ID_1"
  },
  {
    "url": "https://www.youtube.com/watch?v=VIDEO_ID_2"
  }
]
```

**Response (200 OK):**

```json
{
  "snapshot_id": "s_m4x7enmven8djfqak"
}
```

**Example:**

```bash
curl -X POST "https://api.brightdata.com/datasets/v3/trigger?dataset_id=gd_youtube_video&format=json" \
  -H "Authorization: Bearer $BRIGHTDATA_API_TOKEN" \
  -H "Content-Type: application/json" \
  -d '[{"url": "https://www.youtube.com/watch?v=dQw4w9WgXcQ"}]'
```

---

### 2. Sync Request

Fetch data in real-time (synchronous mode).

```http
POST /datasets/v3/scrape
```

**Query Parameters:**

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `dataset_id` | string | Yes | The dataset/scraper identifier |
| `format` | string | No | Output format |

**Request Body:** Same as async request.

**Response:** Direct data payload (not snapshot_id).

**Notes:**
- Times out after ~1 minute
- Best for small, immediate requests
- For large jobs, use async `/trigger` endpoint

---

## Management APIs

### 3. Monitor Progress

Check the status of an async collection job.

```http
GET /datasets/v3/progress/{snapshot_id}
```

**Path Parameters:**

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `snapshot_id` | string | Yes | The ID returned from trigger request |

**Response (200 OK):**

```json
{
  "snapshot_id": "s_m4x7enmven8djfqak",
  "dataset_id": "gd_youtube_video",
  "status": "running"
}
```

**Status Values:**

| Status | Description |
|--------|-------------|
| `running` | Collection in progress |
| `ready` | Collection complete, results available |
| `failed` | Collection failed |

**Example:**

```bash
curl "https://api.brightdata.com/datasets/v3/progress/s_m4x7enmven8djfqak" \
  -H "Authorization: Bearer $BRIGHTDATA_API_TOKEN"
```

---

## Delivery APIs

### 4. Download Snapshot

Download the collected data after job completion.

```http
GET /datasets/v3/snapshot/{snapshot_id}
```

**Path Parameters:**

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `snapshot_id` | string | Yes | The snapshot ID |

**Response:** Data in the format specified during trigger (JSON, CSV, etc.)

**Example:**

```bash
curl "https://api.brightdata.com/datasets/v3/snapshot/s_m4x7enmven8djfqak" \
  -H "Authorization: Bearer $BRIGHTDATA_API_TOKEN" \
  -o results.json
```

---

### 5. Deliver to Storage

Deliver snapshot to external storage.

```http
POST /datasets/v3/deliver/{snapshot_id}
```

**Path Parameters:**

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `snapshot_id` | string | Yes | The snapshot ID |

**Request Body:** Storage credentials and destination configuration.

---

## Complete Workflow Example

```bash
#!/bin/bash
API_TOKEN="your_api_token"
DATASET_ID="gd_youtube_video"

# 1. Trigger collection
RESPONSE=$(curl -s -X POST \
  "https://api.brightdata.com/datasets/v3/trigger?dataset_id=$DATASET_ID&format=json" \
  -H "Authorization: Bearer $API_TOKEN" \
  -H "Content-Type: application/json" \
  -d '[{"url": "https://www.youtube.com/watch?v=dQw4w9WgXcQ"}]')

SNAPSHOT_ID=$(echo $RESPONSE | jq -r '.snapshot_id')
echo "Snapshot ID: $SNAPSHOT_ID"

# 2. Poll for completion
while true; do
  STATUS=$(curl -s \
    "https://api.brightdata.com/datasets/v3/progress/$SNAPSHOT_ID" \
    -H "Authorization: Bearer $API_TOKEN" | jq -r '.status')

  echo "Status: $STATUS"

  if [ "$STATUS" = "ready" ]; then
    break
  elif [ "$STATUS" = "failed" ]; then
    echo "Collection failed!"
    exit 1
  fi

  sleep 5
done

# 3. Download results
curl -s \
  "https://api.brightdata.com/datasets/v3/snapshot/$SNAPSHOT_ID" \
  -H "Authorization: Bearer $API_TOKEN" \
  -o results.json

echo "Results saved to results.json"
```

---

## Error Handling

| HTTP Code | Description |
|-----------|-------------|
| 200 | Success |
| 400 | Bad request - invalid parameters |
| 401 | Unauthorized - invalid API key |
| 404 | Not found - invalid snapshot_id or dataset_id |
| 429 | Rate limited |
| 500 | Server error |

---

## Webhook Notifications

When `notify=true` and `endpoint` is set, webhooks deliver:

```json
{
  "snapshot_id": "s_m4x7enmven8djfqak",
  "status": "ready",
  "result_url": "https://api.brightdata.com/datasets/v3/snapshot/s_m4x7enmven8djfqak"
}
```
