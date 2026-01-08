---
created: 2026-01-08
tags: [type/api-reference, api/artifacts]
api_name: Vercel API
category: artifacts
endpoint_count: 6
---

# Vercel API - Artifacts

[[README|Back to Overview]]

---

## POST /v8/artifacts/events

**Record an artifacts cache usage event**

Records an artifacts cache usage event. The body of this request is an array of cache usage events. The supported event types are `HIT` and `MISS`. The source is either `LOCAL` the cache event was on the users filesystem cache or `REMOTE` if the cache event is for a remote cache. When the event is a `HIT` the request also accepts a number `duration` which is the time taken to generate the artifact in the cache.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `x-artifact-client-ci` | header | string | No | The continuous integration or delivery environment |
| `x-artifact-client-interactive` | header | integer | No | 1 if the client is an interactive shell. Otherwise |
| `teamId` | query | string | No | The Team identifier to perform the request on beha |
| `slug` | query | string | No | The Team slug to perform the request on behalf of. |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.vercel.com/v8/artifacts/events"
```

---

## GET /v8/artifacts/status

**Get status of Remote Caching for this principal**

Check the status of Remote Caching for this principal. Returns a JSON-encoded status indicating if Remote Caching is enabled, disabled, or disabled due to usage limits.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `teamId` | query | string | No | The Team identifier to perform the request on beha |
| `slug` | query | string | No | The Team slug to perform the request on behalf of. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.vercel.com/v8/artifacts/status"
```

---

## PUT /v8/artifacts/{hash}

**Upload a cache artifact**

Uploads a cache artifact identified by the `hash` specified on the path. The cache artifact can then be downloaded with the provided `hash`.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Content-Length` | header | number | Yes | The artifact size in bytes |
| `x-artifact-duration` | header | number | No | The time taken to generate the uploaded artifact i |
| `x-artifact-client-ci` | header | string | No | The continuous integration or delivery environment |
| `x-artifact-client-interactive` | header | integer | No | 1 if the client is an interactive shell. Otherwise |
| `x-artifact-tag` | header | string | No | The base64 encoded tag for this artifact. The valu |
| `hash` | path | string | Yes | The artifact hash |
| `teamId` | query | string | No | The Team identifier to perform the request on beha |
| `slug` | query | string | No | The Team slug to perform the request on behalf of. |

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.vercel.com/v8/artifacts/{hash}"
```

---

## GET /v8/artifacts/{hash}

**Download a cache artifact**

Downloads a cache artifact indentified by its `hash` specified on the request path. The artifact is downloaded as an octet-stream. The client should verify the content-length header and response body.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `x-artifact-client-ci` | header | string | No | The continuous integration or delivery environment |
| `x-artifact-client-interactive` | header | integer | No | 1 if the client is an interactive shell. Otherwise |
| `hash` | path | string | Yes | The artifact hash |
| `teamId` | query | string | No | The Team identifier to perform the request on beha |
| `slug` | query | string | No | The Team slug to perform the request on behalf of. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.vercel.com/v8/artifacts/{hash}"
```

---

## HEAD /v8/artifacts/{hash}

**Check if a cache artifact exists**

Check that a cache artifact with the given `hash` exists. This request returns response headers only and is equivalent to a `GET` request to this endpoint where the response contains no body.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `hash` | path | string | Yes | The artifact hash |
| `teamId` | query | string | No | The Team identifier to perform the request on beha |
| `slug` | query | string | No | The Team slug to perform the request on behalf of. |

### Example

```bash
curl -X HEAD \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.vercel.com/v8/artifacts/{hash}"
```

---

## POST /v8/artifacts

**Query information about an artifact**

Query information about an array of artifacts.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `teamId` | query | string | No | The Team identifier to perform the request on beha |
| `slug` | query | string | No | The Team slug to perform the request on behalf of. |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.vercel.com/v8/artifacts"
```

---
