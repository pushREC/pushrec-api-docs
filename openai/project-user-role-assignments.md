---
created: 2026-01-08
tags: [type/api-reference, api/project-user-role-assignments]
api_name: OpenAI API
category: Project user role assignments
endpoint_count: 3
---

# OpenAI API - Project User Role Assignments

[[README|Back to Overview]]

---

## GET /projects/{project_id}/users/{user_id}/roles

**List project user role assignments**

Lists the project roles assigned to a user within a project.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `project_id` | path | string | Yes | The ID of the project to inspect. |
| `user_id` | path | string | Yes | The ID of the user to inspect. |
| `limit` | query | integer | No | A limit on the number of project role assignments  |
| `after` | query | string | No | Cursor for pagination. Provide the value from the  |
| `order` | query | string | No | Sort order for the returned project roles. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/projects/{project_id}/users/{user_id}/roles"
```

---

## POST /projects/{project_id}/users/{user_id}/roles

**Assign project role to user**

Assigns a project role to a user within a project.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `project_id` | path | string | Yes | The ID of the project to update. |
| `user_id` | path | string | Yes | The ID of the user that should receive the project |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/projects/{project_id}/users/{user_id}/roles"
```

---

## DELETE /projects/{project_id}/users/{user_id}/roles/{role_id}

**Unassign project role from user**

Unassigns a project role from a user within a project.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `project_id` | path | string | Yes | The ID of the project to modify. |
| `user_id` | path | string | Yes | The ID of the user whose project role assignment s |
| `role_id` | path | string | Yes | The ID of the project role to remove from the user |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/projects/{project_id}/users/{user_id}/roles/{role_id}"
```

---
