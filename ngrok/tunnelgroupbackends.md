---
created: 2026-01-09
tags: [type/api-reference, api/tunnelgroupbackends]
api_name: ngrok OpenAPI
category: TunnelGroupBackends
endpoint_count: 5
---

# ngrok OpenAPI - Tunnelgroupbackends

[[README|Back to Overview]]

---

## POST /backends/tunnel_group

**Create**

Create a new TunnelGroup backend


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.ngrok.com/backends/tunnel_group"
```

---

## GET /backends/tunnel_group

**List**

List all TunnelGroup backends on this account


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
  "https://api.ngrok.com/backends/tunnel_group"
```

---

## DELETE /backends/tunnel_group/{id}

**Delete**

Delete a TunnelGroup backend by ID.


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
  "https://api.ngrok.com/backends/tunnel_group/{id}"
```

---

## GET /backends/tunnel_group/{id}

**Get**

Get detailed information about a TunnelGroup backend by ID


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
  "https://api.ngrok.com/backends/tunnel_group/{id}"
```

---

## PATCH /backends/tunnel_group/{id}

**Update**

Update TunnelGroup backend by ID


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `id` | path | string | Yes |  |

### Example

```bash
curl -X PATCH \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.ngrok.com/backends/tunnel_group/{id}"
```

---
