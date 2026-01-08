---
created: 2026-01-08
tags: [type/api-reference, api/project-group-role-assignments]
api_name: OpenAI API
category: Project group role assignments
endpoint_count: 3
---

# OpenAI API - Project Group Role Assignments

[[README|Back to Overview]]

---

## GET /projects/{project_id}/groups/{group_id}/roles

**List project group role assignments**

Lists the project roles assigned to a group within a project.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `project_id` | path | string | Yes | The ID of the project to inspect. |
| `group_id` | path | string | Yes | The ID of the group to inspect. |
| `limit` | query | integer | No | A limit on the number of project role assignments  |
| `after` | query | string | No | Cursor for pagination. Provide the value from the  |
| `order` | query | string | No | Sort order for the returned project roles. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/projects/{project_id}/groups/{group_id}/roles"
```

---

## POST /projects/{project_id}/groups/{group_id}/roles

**Assign project role to group**

Assigns a project role to a group within a project.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `project_id` | path | string | Yes | The ID of the project to update. |
| `group_id` | path | string | Yes | The ID of the group that should receive the projec |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/projects/{project_id}/groups/{group_id}/roles"
```

---

## DELETE /projects/{project_id}/groups/{group_id}/roles/{role_id}

**Unassign project role from group**

Unassigns a project role from a group within a project.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `project_id` | path | string | Yes | The ID of the project to modify. |
| `group_id` | path | string | Yes | The ID of the group whose project role assignment  |
| `role_id` | path | string | Yes | The ID of the project role to remove from the grou |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/projects/{project_id}/groups/{group_id}/roles/{role_id}"
```

---
