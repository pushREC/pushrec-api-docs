---
created: 2026-01-09
tags: [type/api-reference, api/secrets]
api_name: ngrok OpenAPI
category: Secrets
endpoint_count: 5
---

# ngrok OpenAPI - Secrets

[[README|Back to Overview]]

---

## POST /vault_secrets

**Create**

Create a new Secret


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.ngrok.com/vault_secrets"
```

---

## GET /vault_secrets

**List**

List all Secrets owned by account


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
  "https://api.ngrok.com/vault_secrets"
```

---

## PATCH /vault_secrets/{id}

**Update**

Update an existing Secret by ID


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `id` | path | string | Yes | identifier for Secret
 |

### Example

```bash
curl -X PATCH \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.ngrok.com/vault_secrets/{id}"
```

---

## DELETE /vault_secrets/{id}

**Delete**

Delete a Secret


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
  "https://api.ngrok.com/vault_secrets/{id}"
```

---

## GET /vault_secrets/{id}

**Get**

Get a Secret by ID


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
  "https://api.ngrok.com/vault_secrets/{id}"
```

---
