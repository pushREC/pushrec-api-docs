---
created: 2026-01-09
tags: [type/api-reference, api/sshhostcertificates]
api_name: ngrok OpenAPI
category: SSHHostCertificates
endpoint_count: 5
---

# ngrok OpenAPI - Sshhostcertificates

[[README|Back to Overview]]

---

## POST /ssh_host_certificates

**Create**

Create a new SSH Host Certificate


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.ngrok.com/ssh_host_certificates"
```

---

## GET /ssh_host_certificates

**List**

List all SSH Host Certificates issued on this account


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
  "https://api.ngrok.com/ssh_host_certificates"
```

---

## DELETE /ssh_host_certificates/{id}

**Delete**

Delete an SSH Host Certificate


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
  "https://api.ngrok.com/ssh_host_certificates/{id}"
```

---

## GET /ssh_host_certificates/{id}

**Get**

Get detailed information about an SSH Host Certificate


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
  "https://api.ngrok.com/ssh_host_certificates/{id}"
```

---

## PATCH /ssh_host_certificates/{id}

**Update**

Update an SSH Host Certificate


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `id` | path | string | Yes |  |

### Example

```bash
curl -X PATCH \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.ngrok.com/ssh_host_certificates/{id}"
```

---
