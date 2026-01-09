---
created: 2026-01-09
tags: [type/api-reference, api/iprestrictions]
api_name: ngrok OpenAPI
category: IPRestrictions
endpoint_count: 5
---

# ngrok OpenAPI - Iprestrictions

[[README|Back to Overview]]

---

## POST /ip_restrictions

**Create**

Create a new IP restriction


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.ngrok.com/ip_restrictions"
```

---

## GET /ip_restrictions

**List**

List all IP restrictions on this account


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
  "https://api.ngrok.com/ip_restrictions"
```

---

## DELETE /ip_restrictions/{id}

**Delete**

Delete an IP restriction


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
  "https://api.ngrok.com/ip_restrictions/{id}"
```

---

## GET /ip_restrictions/{id}

**Get**

Get detailed information about an IP restriction


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
  "https://api.ngrok.com/ip_restrictions/{id}"
```

---

## PATCH /ip_restrictions/{id}

**Update**

Update attributes of an IP restriction by ID


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `id` | path | string | Yes |  |

### Example

```bash
curl -X PATCH \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.ngrok.com/ip_restrictions/{id}"
```

---
