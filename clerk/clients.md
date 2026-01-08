---
created: 2026-01-08
tags: [type/api-reference, api/clients]
api_name: Clerk Backend API
category: Clients
endpoint_count: 3
---

# Clerk Backend API - Clients

[[README|Back to Overview]]

---

## GET /clients

**List all clients**

Returns a list of all clients. The clients are returned sorted by creation date,
with the newest clients appearing first.
Warning: the endpoint is being deprecated and will be removed in future versions.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `` | query | string | No |  |
| `` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.clerk.com/v1/clients"
```

---

## POST /clients/verify

**Verify a client**

Verifies the client in the provided token

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.clerk.com/v1/clients/verify"
```

---

## GET /clients/{client_id}

**Get a client**

Returns the details of a client.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `client_id` | path | string | Yes | Client ID. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.clerk.com/v1/clients/{client_id}"
```

---
