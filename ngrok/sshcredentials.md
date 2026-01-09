---
created: 2026-01-09
tags: [type/api-reference, api/sshcredentials]
api_name: ngrok OpenAPI
category: SSHCredentials
endpoint_count: 5
---

# ngrok OpenAPI - Sshcredentials

[[README|Back to Overview]]

---

## POST /ssh_credentials

**Create**

Create a new ssh_credential from an uploaded public SSH key. This ssh credential can be used to start new tunnels via ngrok's SSH gateway.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.ngrok.com/ssh_credentials"
```

---

## GET /ssh_credentials

**List**

List all ssh credentials on this account


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
  "https://api.ngrok.com/ssh_credentials"
```

---

## DELETE /ssh_credentials/{id}

**Delete**

Delete an ssh_credential by ID


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
  "https://api.ngrok.com/ssh_credentials/{id}"
```

---

## GET /ssh_credentials/{id}

**Get**

Get detailed information about an ssh_credential


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
  "https://api.ngrok.com/ssh_credentials/{id}"
```

---

## PATCH /ssh_credentials/{id}

**Update**

Update attributes of an ssh_credential by ID


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `id` | path | string | Yes |  |

### Example

```bash
curl -X PATCH \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.ngrok.com/ssh_credentials/{id}"
```

---
