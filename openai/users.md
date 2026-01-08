---
created: 2026-01-08
tags: [type/api-reference, api/users]
api_name: OpenAI API
category: Users
endpoint_count: 4
---

# OpenAI API - Users

[[README|Back to Overview]]

---

## GET /organization/users

**List users**

Lists all of the users in the organization.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `limit` | query | integer | No | A limit on the number of objects to be returned. L |
| `after` | query | string | No | A cursor for use in pagination. `after` is an obje |
| `emails` | query | array | No | Filter by the email address of users. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/organization/users"
```

---

## GET /organization/users/{user_id}

**Retrieve user**

Retrieves a user by their identifier.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `user_id` | path | string | Yes | The ID of the user. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/organization/users/{user_id}"
```

---

## POST /organization/users/{user_id}

**Modify user**

Modifies a user's role in the organization.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `user_id` | path | string | Yes | The ID of the user. |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/organization/users/{user_id}"
```

---

## DELETE /organization/users/{user_id}

**Delete user**

Deletes a user from the organization.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `user_id` | path | string | Yes | The ID of the user. |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/organization/users/{user_id}"
```

---
