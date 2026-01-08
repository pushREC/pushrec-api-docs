---
created: 2026-01-08
tags: [type/api-reference, api/user-organization-role-assignments]
api_name: OpenAI API
category: User organization role assignments
endpoint_count: 3
---

# OpenAI API - User Organization Role Assignments

[[README|Back to Overview]]

---

## GET /organization/users/{user_id}/roles

**List user organization role assignments**

Lists the organization roles assigned to a user within the organization.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `user_id` | path | string | Yes | The ID of the user to inspect. |
| `limit` | query | integer | No | A limit on the number of organization role assignm |
| `after` | query | string | No | Cursor for pagination. Provide the value from the  |
| `order` | query | string | No | Sort order for the returned organization roles. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/organization/users/{user_id}/roles"
```

---

## POST /organization/users/{user_id}/roles

**Assign organization role to user**

Assigns an organization role to a user within the organization.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `user_id` | path | string | Yes | The ID of the user that should receive the organiz |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/organization/users/{user_id}/roles"
```

---

## DELETE /organization/users/{user_id}/roles/{role_id}

**Unassign organization role from user**

Unassigns an organization role from a user within the organization.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `user_id` | path | string | Yes | The ID of the user to modify. |
| `role_id` | path | string | Yes | The ID of the organization role to remove from the |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/organization/users/{user_id}/roles/{role_id}"
```

---
