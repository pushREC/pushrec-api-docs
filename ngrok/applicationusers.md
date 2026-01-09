---
created: 2026-01-09
tags: [type/api-reference, api/applicationusers]
api_name: ngrok OpenAPI
category: ApplicationUsers
endpoint_count: 3
---

# ngrok OpenAPI - Applicationusers

[[README|Back to Overview]]

---

## GET /app/users

**List**

List all application users for this account.


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
  "https://api.ngrok.com/app/users"
```

---

## GET /app/users/{id}

**Get**

Get an application user by ID.


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
  "https://api.ngrok.com/app/users/{id}"
```

---

## DELETE /app/users/{id}

**Delete**

Delete an application user by ID.


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
  "https://api.ngrok.com/app/users/{id}"
```

---
