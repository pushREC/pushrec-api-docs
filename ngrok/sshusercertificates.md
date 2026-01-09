---
created: 2026-01-09
tags: [type/api-reference, api/sshusercertificates]
api_name: ngrok OpenAPI
category: SSHUserCertificates
endpoint_count: 5
---

# ngrok OpenAPI - Sshusercertificates

[[README|Back to Overview]]

---

## POST /ssh_user_certificates

**Create**

Create a new SSH User Certificate


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.ngrok.com/ssh_user_certificates"
```

---

## GET /ssh_user_certificates

**List**

List all SSH User Certificates issued on this account


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
  "https://api.ngrok.com/ssh_user_certificates"
```

---

## DELETE /ssh_user_certificates/{id}

**Delete**

Delete an SSH User Certificate


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
  "https://api.ngrok.com/ssh_user_certificates/{id}"
```

---

## GET /ssh_user_certificates/{id}

**Get**

Get detailed information about an SSH User Certificate


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
  "https://api.ngrok.com/ssh_user_certificates/{id}"
```

---

## PATCH /ssh_user_certificates/{id}

**Update**

Update an SSH User Certificate


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `id` | path | string | Yes |  |

### Example

```bash
curl -X PATCH \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.ngrok.com/ssh_user_certificates/{id}"
```

---
