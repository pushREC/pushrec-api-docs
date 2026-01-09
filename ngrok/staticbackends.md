---
created: 2026-01-09
tags: [type/api-reference, api/staticbackends]
api_name: ngrok OpenAPI
category: StaticBackends
endpoint_count: 5
---

# ngrok OpenAPI - Staticbackends

[[README|Back to Overview]]

---

## POST /backends/static

**Create**

Create a new static backend


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.ngrok.com/backends/static"
```

---

## GET /backends/static

**List**

List all static backends on this account


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `before_id` | query | string | No |  |
| `limit` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.ngrok.com/backends/static"
```

---

## DELETE /backends/static/{id}

**Delete**

Delete a static backend by ID.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `id` | path | string | Yes | a resource identifier
 |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.ngrok.com/backends/static/{id}"
```

---

## GET /backends/static/{id}

**Get**

Get detailed information about a static backend by ID


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `id` | path | string | Yes | a resource identifier
 |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.ngrok.com/backends/static/{id}"
```

---

## PATCH /backends/static/{id}

**Update**

Update static backend by ID


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `id` | path | string | Yes |  |

### Example

```bash
curl -X PATCH \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.ngrok.com/backends/static/{id}"
```

---
