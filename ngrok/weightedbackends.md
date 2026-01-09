---
created: 2026-01-09
tags: [type/api-reference, api/weightedbackends]
api_name: ngrok OpenAPI
category: WeightedBackends
endpoint_count: 5
---

# ngrok OpenAPI - Weightedbackends

[[README|Back to Overview]]

---

## POST /backends/weighted

**Create**

Create a new Weighted backend


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.ngrok.com/backends/weighted"
```

---

## GET /backends/weighted

**List**

List all Weighted backends on this account


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
  "https://api.ngrok.com/backends/weighted"
```

---

## DELETE /backends/weighted/{id}

**Delete**

Delete a Weighted backend by ID.


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
  "https://api.ngrok.com/backends/weighted/{id}"
```

---

## GET /backends/weighted/{id}

**Get**

Get detailed information about a Weighted backend by ID


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
  "https://api.ngrok.com/backends/weighted/{id}"
```

---

## PATCH /backends/weighted/{id}

**Update**

Update Weighted backend by ID


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `id` | path | string | Yes |  |

### Example

```bash
curl -X PATCH \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.ngrok.com/backends/weighted/{id}"
```

---
