---
created: 2026-01-08
tags: [type/api-reference, api/project-groups]
api_name: OpenAI API
category: Project groups
endpoint_count: 3
---

# OpenAI API - Project Groups

[[README|Back to Overview]]

---

## GET /organization/projects/{project_id}/groups

**List project groups**

Lists the groups that have access to a project.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `project_id` | path | string | Yes | The ID of the project to inspect. |
| `limit` | query | integer | No | A limit on the number of project groups to return. |
| `after` | query | string | No | Cursor for pagination. Provide the ID of the last  |
| `order` | query | string | No | Sort order for the returned groups. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/organization/projects/{project_id}/groups"
```

---

## POST /organization/projects/{project_id}/groups

**Add project group**

Grants a group access to a project.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `project_id` | path | string | Yes | The ID of the project to update. |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/organization/projects/{project_id}/groups"
```

---

## DELETE /organization/projects/{project_id}/groups/{group_id}

**Remove project group**

Revokes a group's access to a project.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `project_id` | path | string | Yes | The ID of the project to update. |
| `group_id` | path | string | Yes | The ID of the group to remove from the project. |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/organization/projects/{project_id}/groups/{group_id}"
```

---
