---
created: 2026-01-08
tags: [type/api-reference, api/group-organization-role-assignments]
api_name: OpenAI API
category: Group organization role assignments
endpoint_count: 3
---

# OpenAI API - Group Organization Role Assignments

[[README|Back to Overview]]

---

## GET /organization/groups/{group_id}/roles

**List group organization role assignments**

Lists the organization roles assigned to a group within the organization.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `group_id` | path | string | Yes | The ID of the group whose organization role assign |
| `limit` | query | integer | No | A limit on the number of organization role assignm |
| `after` | query | string | No | Cursor for pagination. Provide the value from the  |
| `order` | query | string | No | Sort order for the returned organization roles. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/organization/groups/{group_id}/roles"
```

---

## POST /organization/groups/{group_id}/roles

**Assign organization role to group**

Assigns an organization role to a group within the organization.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `group_id` | path | string | Yes | The ID of the group that should receive the organi |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/organization/groups/{group_id}/roles"
```

---

## DELETE /organization/groups/{group_id}/roles/{role_id}

**Unassign organization role from group**

Unassigns an organization role from a group within the organization.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `group_id` | path | string | Yes | The ID of the group to modify. |
| `role_id` | path | string | Yes | The ID of the organization role to remove from the |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/organization/groups/{group_id}/roles/{role_id}"
```

---
