---
created: 2026-01-09
tags: [type/api-reference, api/edgeshttpsroutes]
api_name: ngrok OpenAPI
category: EdgesHTTPSRoutes
endpoint_count: 4
---

# ngrok OpenAPI - Edgeshttpsroutes

[[README|Back to Overview]]

---

## POST /edges/https/{edge_id}/routes

**Create**

Create an HTTPS Edge Route


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `edge_id` | path | string | Yes | unique identifier of this edge
 |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.ngrok.com/edges/https/{edge_id}/routes"
```

---

## GET /edges/https/{edge_id}/routes/{id}

**Get**

Get an HTTPS Edge Route by ID


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `edge_id` | path | string | Yes | unique identifier of this edge
 |
| `id` | path | string | Yes | unique identifier of this edge route
 |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.ngrok.com/edges/https/{edge_id}/routes/{id}"
```

---

## PATCH /edges/https/{edge_id}/routes/{id}

**Update**

Updates an HTTPS Edge Route by ID. If a module is not specified in the update, it will not be modified. However, each module configuration that is specified will completely replace the existing value. There is no way to delete an existing module via this API, instead use the delete module API.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `edge_id` | path | string | Yes | unique identifier of this edge
 |
| `id` | path | string | Yes | unique identifier of this edge route
 |

### Example

```bash
curl -X PATCH \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.ngrok.com/edges/https/{edge_id}/routes/{id}"
```

---

## DELETE /edges/https/{edge_id}/routes/{id}

**Delete**

Delete an HTTPS Edge Route by ID


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `edge_id` | path | string | Yes | unique identifier of this edge
 |
| `id` | path | string | Yes | unique identifier of this edge route
 |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.ngrok.com/edges/https/{edge_id}/routes/{id}"
```

---
