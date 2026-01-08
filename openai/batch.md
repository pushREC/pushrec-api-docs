---
created: 2026-01-08
tags: [type/api-reference, api/batch]
api_name: OpenAI API
category: Batch
endpoint_count: 4
---

# OpenAI API - Batch

[[README|Back to Overview]]

---

## POST /batches

**Create batch**

Creates and executes a batch from an uploaded file of requests

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/batches"
```

---

## GET /batches

**List batch**

List your organization's batches.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `after` | query | string | No | A cursor for use in pagination. `after` is an obje |
| `limit` | query | integer | No | A limit on the number of objects to be returned. L |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/batches"
```

---

## GET /batches/{batch_id}

**Retrieve batch**

Retrieves a batch.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `batch_id` | path | string | Yes | The ID of the batch to retrieve. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/batches/{batch_id}"
```

---

## POST /batches/{batch_id}/cancel

**Cancel batch**

Cancels an in-progress batch. The batch will be in status `cancelling` for up to 10 minutes, before changing to `cancelled`, where it will have partial results (if any) available in the output file.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `batch_id` | path | string | Yes | The ID of the batch to cancel. |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/batches/{batch_id}/cancel"
```

---
