---
created: 2026-01-08
tags: [type/api-reference, api/redirect-urls]
api_name: Clerk Backend API
category: Redirect URLs
endpoint_count: 4
---

# Clerk Backend API - Redirect Urls

[[README|Back to Overview]]

---

## GET /redirect_urls

**List all redirect URLs**

Lists all whitelisted redirect_urls for the instance

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `` | query | string | No |  |
| `` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.clerk.com/v1/redirect_urls"
```

---

## POST /redirect_urls

**Create a redirect URL**

Create a redirect URL

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.clerk.com/v1/redirect_urls"
```

---

## GET /redirect_urls/{id}

**Retrieve a redirect URL**

Retrieve the details of the redirect URL with the given ID

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `id` | path | string | Yes | The ID of the redirect URL |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.clerk.com/v1/redirect_urls/{id}"
```

---

## DELETE /redirect_urls/{id}

**Delete a redirect URL**

Remove the selected redirect URL from the whitelist of the instance

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `id` | path | string | Yes | The ID of the redirect URL |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.clerk.com/v1/redirect_urls/{id}"
```

---
