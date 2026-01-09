---
created: 2026-01-09
tags: [type/api-reference, api/serviceusers]
api_name: ngrok OpenAPI
category: ServiceUsers
endpoint_count: 5
---

# ngrok OpenAPI - Serviceusers

[[README|Back to Overview]]

---

## POST /service_users

**Create**

Create a new service user


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.ngrok.com/service_users"
```

---

## GET /service_users

**List**

List all service users in this account.


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
  "https://api.ngrok.com/service_users"
```

---

## DELETE /service_users/{id}

**Delete**

Delete a service user by ID


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
  "https://api.ngrok.com/service_users/{id}"
```

---

## GET /service_users/{id}

**Get**

Get the details of a Bot User by ID.


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
  "https://api.ngrok.com/service_users/{id}"
```

---

## PATCH /service_users/{id}

**Update**

Update attributes of a service user by ID.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `id` | path | string | Yes |  |

### Example

```bash
curl -X PATCH \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.ngrok.com/service_users/{id}"
```

---
