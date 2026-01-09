---
created: 2026-01-09
tags: [type/api-reference, api/sshcertificateauthorities]
api_name: ngrok OpenAPI
category: SSHCertificateAuthorities
endpoint_count: 5
---

# ngrok OpenAPI - Sshcertificateauthorities

[[README|Back to Overview]]

---

## POST /ssh_certificate_authorities

**Create**

Create a new SSH Certificate Authority


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.ngrok.com/ssh_certificate_authorities"
```

---

## GET /ssh_certificate_authorities

**List**

List all SSH Certificate Authorities on this account


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
  "https://api.ngrok.com/ssh_certificate_authorities"
```

---

## DELETE /ssh_certificate_authorities/{id}

**Delete**

Delete an SSH Certificate Authority


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
  "https://api.ngrok.com/ssh_certificate_authorities/{id}"
```

---

## GET /ssh_certificate_authorities/{id}

**Get**

Get detailed information about an SSH Certificate Authority


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
  "https://api.ngrok.com/ssh_certificate_authorities/{id}"
```

---

## PATCH /ssh_certificate_authorities/{id}

**Update**

Update an SSH Certificate Authority


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `id` | path | string | Yes |  |

### Example

```bash
curl -X PATCH \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.ngrok.com/ssh_certificate_authorities/{id}"
```

---
