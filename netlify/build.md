---
created: 2026-01-09
tags: [type/api-reference, api/build]
api_name: Netlify's API documentation
category: build
endpoint_count: 5
---

# Netlify's API documentation - Build

[[README|Back to Overview]]

---

## GET /sites/{site_id}/builds

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.netlify.com/api/v1/sites/{site_id}/builds"
```

---

## POST /sites/{site_id}/builds

Runs a build for a site. The build will be scheduled to run at the first opportunity, but it might not start immediately if insufficient account build capacity is available.

Files for build can be uploaded as a zipped site using one of these methods:
1. Set Content-Type to 'application/zip' and send the zip file as the raw request body
2. Set Content-Type to 'multipart/form-data' and include the zip file in the 'zip' field


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `branch` | query | string | No | If no branch is specified, it is treated as a prod |
| `clear_cache` | query | boolean | No | Whether to clear the build cache before building |
| `image` | query | string | No | The build image tag to use for the build |
| `template_id` | query | string | No | The build template to use for the build |
| `title` | query | string | No | The title of the build |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.netlify.com/api/v1/sites/{site_id}/builds"
```

---

## GET /builds/{build_id}

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.netlify.com/api/v1/builds/{build_id}"
```

---

## POST /builds/{build_id}/start

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.netlify.com/api/v1/builds/{build_id}/start"
```

---

## GET /{account_id}/builds/status

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.netlify.com/api/v1/{account_id}/builds/status"
```

---
