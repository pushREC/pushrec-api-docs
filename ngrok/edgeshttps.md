---
created: 2026-01-09
tags: [type/api-reference, api/edgeshttps]
api_name: ngrok OpenAPI
category: EdgesHTTPS
endpoint_count: 5
---

# ngrok OpenAPI - Edgeshttps

[[README|Back to Overview]]

---

## POST /edges/https

**Create**

Create an HTTPS Edge


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.ngrok.com/edges/https"
```

---

## GET /edges/https

**List**

Returns a list of all HTTPS Edges on this account


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
  "https://api.ngrok.com/edges/https"
```

---

## GET /edges/https/{id}

**Get**

Get an HTTPS Edge by ID


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
  "https://api.ngrok.com/edges/https/{id}"
```

---

## PATCH /edges/https/{id}

**Update**

Updates an HTTPS Edge by ID. If a module is not specified in the update, it will not be modified. However, each module configuration that is specified will completely replace the existing value. There is no way to delete an existing module via this API, instead use the delete module API.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `id` | path | string | Yes | unique identifier of this edge
 |

### Example

```bash
curl -X PATCH \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.ngrok.com/edges/https/{id}"
```

---

## DELETE /edges/https/{id}

**Delete**

Delete an HTTPS Edge by ID


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
  "https://api.ngrok.com/edges/https/{id}"
```

---
