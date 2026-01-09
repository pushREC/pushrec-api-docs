---
created: 2026-01-09
tags: [type/api-reference, api/tlscertificates]
api_name: ngrok OpenAPI
category: TLSCertificates
endpoint_count: 5
---

# ngrok OpenAPI - Tlscertificates

[[README|Back to Overview]]

---

## POST /tls_certificates

**Create**

Upload a new TLS certificate


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.ngrok.com/tls_certificates"
```

---

## GET /tls_certificates

**List**

List all TLS certificates on this account


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
  "https://api.ngrok.com/tls_certificates"
```

---

## DELETE /tls_certificates/{id}

**Delete**

Delete a TLS certificate


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
  "https://api.ngrok.com/tls_certificates/{id}"
```

---

## GET /tls_certificates/{id}

**Get**

Get detailed information about a TLS certificate


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
  "https://api.ngrok.com/tls_certificates/{id}"
```

---

## PATCH /tls_certificates/{id}

**Update**

Update attributes of a TLS Certificate by ID


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `id` | path | string | Yes |  |

### Example

```bash
curl -X PATCH \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.ngrok.com/tls_certificates/{id}"
```

---
