---
created: 2026-01-09
tags: [type/api-reference, api/apikeys]
api_name: ngrok OpenAPI
category: APIKeys
endpoint_count: 5
---

# ngrok OpenAPI - Apikeys

[[README|Back to Overview]]

---

## POST /api_keys

**Create**

Create a new API key. The generated API key can be used to authenticate to the ngrok API.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.ngrok.com/api_keys"
```

---

## GET /api_keys

**List**

List all API keys owned by this account


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `before_id` | query | string | No |  |
| `limit` | query | string | No |  |
| `filter` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.ngrok.com/api_keys"
```

---

## DELETE /api_keys/{id}

**Delete**

Delete an API key by ID


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
  "https://api.ngrok.com/api_keys/{id}"
```

---

## GET /api_keys/{id}

**Get**

Get the details of an API key by ID.


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
  "https://api.ngrok.com/api_keys/{id}"
```

---

## PATCH /api_keys/{id}

**Update**

Update attributes of an API key by ID.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `id` | path | string | Yes |  |

### Example

```bash
curl -X PATCH \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.ngrok.com/api_keys/{id}"
```

---
