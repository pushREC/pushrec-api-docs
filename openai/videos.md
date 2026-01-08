---
created: 2026-01-08
tags: [type/api-reference, api/videos]
api_name: OpenAI API
category: Videos
endpoint_count: 6
---

# OpenAI API - Videos

[[README|Back to Overview]]

---

## POST /videos

**Create video**

Create a video

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/videos"
```

---

## GET /videos

**List videos**

List videos

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `limit` | query | integer | No | Number of items to retrieve |
| `order` | query | string | No | Sort order of results by timestamp. Use `asc` for  |
| `after` | query | string | No | Identifier for the last item from the previous pag |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/videos"
```

---

## GET /videos/{video_id}

**Retrieve video**

Retrieve a video

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `video_id` | path | string | Yes | The identifier of the video to retrieve. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/videos/{video_id}"
```

---

## DELETE /videos/{video_id}

**Delete video**

Delete a video

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `video_id` | path | string | Yes | The identifier of the video to delete. |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/videos/{video_id}"
```

---

## GET /videos/{video_id}/content

**Retrieve video content**

Download video content

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `video_id` | path | string | Yes | The identifier of the video whose media to downloa |
| `variant` | query | string | No | Which downloadable asset to return. Defaults to th |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/videos/{video_id}/content"
```

---

## POST /videos/{video_id}/remix

**Remix video**

Create a video remix

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `video_id` | path | string | Yes | The identifier of the completed video to remix. |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/videos/{video_id}/remix"
```

---
