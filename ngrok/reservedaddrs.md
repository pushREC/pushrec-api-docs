---
created: 2026-01-09
tags: [type/api-reference, api/reservedaddrs]
api_name: ngrok OpenAPI
category: ReservedAddrs
endpoint_count: 5
---

# ngrok OpenAPI - Reservedaddrs

[[README|Back to Overview]]

---

## POST /reserved_addrs

**Create**

Create a new reserved address.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.ngrok.com/reserved_addrs"
```

---

## GET /reserved_addrs

**List**

List all reserved addresses on this account.


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
  "https://api.ngrok.com/reserved_addrs"
```

---

## DELETE /reserved_addrs/{id}

**Delete**

Delete a reserved address.


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
  "https://api.ngrok.com/reserved_addrs/{id}"
```

---

## GET /reserved_addrs/{id}

**Get**

Get the details of a reserved address.


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
  "https://api.ngrok.com/reserved_addrs/{id}"
```

---

## PATCH /reserved_addrs/{id}

**Update**

Update the attributes of a reserved address.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `id` | path | string | Yes |  |

### Example

```bash
curl -X PATCH \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.ngrok.com/reserved_addrs/{id}"
```

---
