---
created: 2026-01-09
tags: [type/api-reference, api/certificateauthorities]
api_name: ngrok OpenAPI
category: CertificateAuthorities
endpoint_count: 5
---

# ngrok OpenAPI - Certificateauthorities

[[README|Back to Overview]]

---

## POST /certificate_authorities

**Create**

Upload a new Certificate Authority


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.ngrok.com/certificate_authorities"
```

---

## GET /certificate_authorities

**List**

List all Certificate Authority on this account


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
  "https://api.ngrok.com/certificate_authorities"
```

---

## DELETE /certificate_authorities/{id}

**Delete**

Delete a Certificate Authority


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
  "https://api.ngrok.com/certificate_authorities/{id}"
```

---

## GET /certificate_authorities/{id}

**Get**

Get detailed information about a certificate authority


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
  "https://api.ngrok.com/certificate_authorities/{id}"
```

---

## PATCH /certificate_authorities/{id}

**Update**

Update attributes of a Certificate Authority by ID


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `id` | path | string | Yes |  |

### Example

```bash
curl -X PATCH \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.ngrok.com/certificate_authorities/{id}"
```

---
