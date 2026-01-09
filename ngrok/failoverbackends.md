---
created: 2026-01-09
tags: [type/api-reference, api/failoverbackends]
api_name: ngrok OpenAPI
category: FailoverBackends
endpoint_count: 5
---

# ngrok OpenAPI - Failoverbackends

[[README|Back to Overview]]

---

## POST /backends/failover

**Create**

Create a new Failover backend


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.ngrok.com/backends/failover"
```

---

## GET /backends/failover

**List**

List all Failover backends on this account


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
  "https://api.ngrok.com/backends/failover"
```

---

## DELETE /backends/failover/{id}

**Delete**

Delete a Failover backend by ID.


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
  "https://api.ngrok.com/backends/failover/{id}"
```

---

## GET /backends/failover/{id}

**Get**

Get detailed information about a Failover backend by ID


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
  "https://api.ngrok.com/backends/failover/{id}"
```

---

## PATCH /backends/failover/{id}

**Update**

Update Failover backend by ID


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `id` | path | string | Yes |  |

### Example

```bash
curl -X PATCH \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.ngrok.com/backends/failover/{id}"
```

---
