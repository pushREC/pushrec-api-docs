---
created: 2026-01-09
tags: [type/api-reference, api/reserveddomains]
api_name: ngrok OpenAPI
category: ReservedDomains
endpoint_count: 7
---

# ngrok OpenAPI - Reserveddomains

[[README|Back to Overview]]

---

## POST /reserved_domains

**Create**

Create a new reserved domain.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.ngrok.com/reserved_domains"
```

---

## GET /reserved_domains

**List**

List all reserved domains on this account.


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
  "https://api.ngrok.com/reserved_domains"
```

---

## DELETE /reserved_domains/{id}

**Delete**

Delete a reserved domain.


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
  "https://api.ngrok.com/reserved_domains/{id}"
```

---

## GET /reserved_domains/{id}

**Get**

Get the details of a reserved domain.


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
  "https://api.ngrok.com/reserved_domains/{id}"
```

---

## PATCH /reserved_domains/{id}

**Update**

Update the attributes of a reserved domain.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `id` | path | string | Yes |  |

### Example

```bash
curl -X PATCH \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.ngrok.com/reserved_domains/{id}"
```

---

## DELETE /reserved_domains/{id}/certificate

**DeleteCertificate**

Detach the certificate attached to a reserved domain.


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
  "https://api.ngrok.com/reserved_domains/{id}/certificate"
```

---

## DELETE /reserved_domains/{id}/certificate_management_policy

**DeleteCertificateManagementPolicy**

Detach the certificate management policy attached to a reserved domain.


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
  "https://api.ngrok.com/reserved_domains/{id}/certificate_management_policy"
```

---
