---
created: 2026-01-09
tags: [type/api-reference, api/edgestcp]
api_name: ngrok OpenAPI
category: EdgesTCP
endpoint_count: 5
---

# ngrok OpenAPI - Edgestcp

[[README|Back to Overview]]

---

## POST /edges/tcp

**Create**

Create a TCP Edge


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.ngrok.com/edges/tcp"
```

---

## GET /edges/tcp

**List**

Returns a list of all TCP Edges on this account


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
  "https://api.ngrok.com/edges/tcp"
```

---

## GET /edges/tcp/{id}

**Get**

Get a TCP Edge by ID


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
  "https://api.ngrok.com/edges/tcp/{id}"
```

---

## PATCH /edges/tcp/{id}

**Update**

Updates a TCP Edge by ID. If a module is not specified in the update, it will not be modified. However, each module configuration that is specified will completely replace the existing value. There is no way to delete an existing module via this API, instead use the delete module API.


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
  "https://api.ngrok.com/edges/tcp/{id}"
```

---

## DELETE /edges/tcp/{id}

**Delete**

Delete a TCP Edge by ID


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
  "https://api.ngrok.com/edges/tcp/{id}"
```

---
