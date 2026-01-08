---
created: 2026-01-08
tags: [type/api-reference, api/edge-cache]
api_name: Vercel API
category: edge-cache
endpoint_count: 4
---

# Vercel API - Edge-Cache

[[README|Back to Overview]]

---

## POST /v1/edge-cache/invalidate-by-tags

**Invalidate by tag**

Marks a cache tag as stale, causing cache entries associated with that tag to be revalidated in the background on the next request.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `projectIdOrName` | query | string | Yes |  |
| `teamId` | query | string | No | The Team identifier to perform the request on beha |
| `slug` | query | string | No | The Team slug to perform the request on behalf of. |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.vercel.com/v1/edge-cache/invalidate-by-tags"
```

---

## POST /v1/edge-cache/dangerously-delete-by-tags

**Dangerously delete by tag**

Marks a cache tag as deleted, causing cache entries associated with that tag to be revalidated in the foreground on the next request. Use this method with caution because one tag can be associated with many paths and deleting the cache can cause many concurrent requests to the origin leading to cache stampede problem. A good use case for deleting the cache is when the origin has also been deleted, for example it returns a 404 or 410 status code.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `projectIdOrName` | query | string | Yes |  |
| `teamId` | query | string | No | The Team identifier to perform the request on beha |
| `slug` | query | string | No | The Team slug to perform the request on behalf of. |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.vercel.com/v1/edge-cache/dangerously-delete-by-tags"
```

---

## POST /v1/edge-cache/invalidate-by-src-images

**Invalidate by source image**

Marks a source image as stale, causing its corresponding transformed images to be revalidated in the background on the next request.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `projectIdOrName` | query | string | Yes |  |
| `teamId` | query | string | No | The Team identifier to perform the request on beha |
| `slug` | query | string | No | The Team slug to perform the request on behalf of. |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.vercel.com/v1/edge-cache/invalidate-by-src-images"
```

---

## POST /v1/edge-cache/dangerously-delete-by-src-images

**Dangerously delete by source image**

Marks a source image as deleted, causing cache entries associated with that source image to be revalidated in the foreground on the next request. Use this method with caution because one source image can be associated with many paths and deleting the cache can cause many concurrent requests to the origin leading to cache stampede problem. A good use case for deleting the cache is when the origin has also been deleted, for example it returns a 404 or 410 status code.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `projectIdOrName` | query | string | Yes |  |
| `teamId` | query | string | No | The Team identifier to perform the request on beha |
| `slug` | query | string | No | The Team slug to perform the request on behalf of. |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.vercel.com/v1/edge-cache/dangerously-delete-by-src-images"
```

---
